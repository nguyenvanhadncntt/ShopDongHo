using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo.Controls
{
    public partial class TatCaSP : System.Web.UI.UserControl
    {
        static PagedDataSource p = new PagedDataSource();
        public static int intSTT;
        public static int trang_thu = 0;
        DataRow objDR;
        DataTable objDT;
        protected void Page_Load(object sender, EventArgs e)
        {
            if(!IsPostBack)
            loadPage();
            
            if ((DataTable)Session["Cart"] == null) MakeCart();
        }

     protected void kick_Click(object sender, EventArgs e)
        {
            if (Session["quyen"] == null || (int)Session["quyen"] == 0)
                WebMsgBox.Show("Bạn hãy đăng nhập để mua hàng");
            else
            {
                Button x = (Button)sender;
                KetNoi kn = new KetNoi();
                objDR = kn.DR("Select * from SANPHAM where MaSP='" + x.CommandArgument.ToString()+"'");
                //Response.Write(x.CommandArgument.ToString());
                themhangvaogio(objDR);
                Session["Cart"] = objDT;
                
                Session["tonggia"] = ""+Tongtien();
            }
        }

        void MakeCart()
        {
            objDT = new DataTable();
            objDT.Columns.Add("TenSP", System.Type.GetType("System.String"));
            objDT.Columns.Add("ANHSP", System.Type.GetType("System.String"));
            objDT.Columns.Add("DONGIA", System.Type.GetType("System.Double"));
            objDT.Columns.Add("SOLUONGSP", System.Type.GetType("System.Int32"));
            objDT.Columns.Add("THANHTIEN", System.Type.GetType("System.Double"));
            objDT.Columns.Add("MaSP", System.Type.GetType("System.String"));
            Session["Cart"] = objDT;
        }

        void themhangvaogio(DataRow x)
        {
           
            objDT = (DataTable)Session["Cart"];

            bool themmoi = true;
            for (int i = 0; i < objDT.Rows.Count; i++)
                if ((String)objDT.Rows[i]["TenSP"] == (String)x["TenSP"])
                {
                    if ((((Int32)x["SOLUONG"]) - (Int32)objDT.Rows[i]["SOLUONGSP"]).ToString() != "0")
                    {
                        objDT.Rows[i]["SOLUONGSP"] = (Int32)objDT.Rows[i]["SOLUONGSP"] + 1;
                        objDT.Rows[i]["THANHTIEN"] = (Int32)objDT.Rows[i]["SOLUONGSP"] * (Double)objDT.Rows[i]["DONGIA"];
                        themmoi = false;
                    }
                    else Response.Redirect("~/Thongbao.aspx");
                }
            if (themmoi == true)
            {
                if (((Int32)x["SOLUONG"]).ToString() != "0")
                {
                    objDR = objDT.NewRow();
                    objDR["TenSP"] = (String)x["TenSP"];
                    objDR["ANHSP"] = (String)x["ANHSP"];
                    objDR["DONGIA"] = (Double)x["DONGIA"];
                    objDR["SOLUONGSP"] = 1;
                    objDR["THANHTIEN"] = (Double)x["DONGIA"];
                    objDR["MaSP"] = (String)x["MaSP"];
                    objDT.Rows.Add(objDR);
                }
                else Response.Redirect("~/Thongbaosoluong.aspx");
            }
            Session["Cart"] = objDT;
           
            //Session["tonggia"] = Tongtien();

        }

        Double Tongtien()
        {
            Double s = 0;
            objDT = (DataTable)Session["Cart"];
            for (int i = 0; i < objDT.Rows.Count; i++)
                s += (Double)objDT.Rows[i]["THANHTIEN"];
            Session["sl"] = int.Parse(objDT.Rows.Count.ToString());
           
            return s;
        }
        public void loadPage()
        {
            KetNoi kn = new KetNoi();
            DataTable dt = kn.loadDT("select * from SANPHAM s join NHOMHANG n on s.MaNH=n.MANH");
            p.DataSource = dt.DefaultView;
            p.PageSize = 15;
            p.CurrentPageIndex = trang_thu;
            p.AllowPaging = true;
            btnTrangDau.Enabled = true;
            btnTruoc.Enabled = true;
            btnSau.Enabled = true;
            btnTrangCuoi.Enabled = true;
            if (p.IsFirstPage == true)//neu la dau.
            {
                btnTrangDau.Enabled = false;//neu la trang dau thi hai nut mo di.
                btnTruoc.Enabled = false;
                btnSau.Enabled = true;//Hai nut sau sang len. b
                btnTrangCuoi.Enabled = true;
            }
            if (p.IsLastPage == true)//neu la cuoi 
            {
                btnTrangDau.Enabled = true;//nguoc lai 
                btnTruoc.Enabled = true;
                btnSau.Enabled = false;
                btnTrangCuoi.Enabled = false;
            }
            lbPhanTrang.Text = (trang_thu + 1) + " / " + p.PageCount;
            DataList1.DataSource = p;
            DataList1.DataBind();

        }


        protected void btnTrangDau_Click(object sender, EventArgs e)
        {
            trang_thu = 0;
            loadPage();
        }

        protected void btnTruoc_Click(object sender, EventArgs e)
        {
            trang_thu--; loadPage();
        }

        protected void btnSau_Click(object sender, EventArgs e)
        {
            trang_thu++; loadPage();
        }

        protected void btnTrangCuoi_Click(object sender, EventArgs e)
        {
            //p.PageCount la trang cuoi cung;
            trang_thu = p.PageCount - 1;
            loadPage();
        }
    }
}