using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ThuVien;
using System.Configuration;

public partial class Control_HienThiSanPham : System.Web.UI.UserControl
{
    string connectString = ConfigurationSettings.AppSettings["constr"];
    SqlConnection sqlcon;
    SqlDataAdapter adapter;
    ASP.global_asax m = new ASP.global_asax();
    DataTable objDT;
    DataRow objDR;
    protected void Page_Load(object sender, EventArgs e)
    {
        Phantrang();       
        Session["sl"] = "";
        Session["TenNH"] = "";
        if (!IsPostBack)
        {
            string str = (string)Session["TenNH"];
            if (str == "")
            {
                Phantrang();
            }
            else
            {
                objDT = new DataTable();
                sqlcon = new SqlConnection(connectString);
                adapter = new SqlDataAdapter("hienthisptheonhom N'" + str + "'", sqlcon);
                adapter.Fill(objDT);
                CollectionPager1.PageSize = 8;
                CollectionPager1.DataSource = objDT.DefaultView;
                CollectionPager1.BindToControl = DataList1;
                DataList1.DataSource = CollectionPager1.DataSourcePaged;
            }
            
        }
               
        if ((DataTable)Session["Cart"] == null) MakeCart();

    }
    private void Phantrang()
    {
        objDT = new DataTable();
        sqlcon = new SqlConnection(connectString);
        adapter = new SqlDataAdapter("hienthisanpham", sqlcon);
        adapter.Fill(objDT);
        CollectionPager1.PageSize = 8; 
        CollectionPager1.DataSource = objDT.DefaultView;
        CollectionPager1.BindToControl = DataList1;
        DataList1.DataSource = CollectionPager1.DataSourcePaged;
    }
   
    protected void DataList1_ItemCommand(object source, DataListCommandEventArgs e)
    {      
        
        if (e.CommandName.Equals("lnkbtnNH"))
        {
            Session["TenNH"] = e.CommandArgument.ToString();
            if ((string)Session["TenNH"] == "")
            {
                Phantrang();
            }
            else
            {
                objDT = new DataTable();
                sqlcon = new SqlConnection(connectString);
                adapter = new SqlDataAdapter("hienthisptheonhom N'" + Session["TenNH"] + "'", sqlcon);
                adapter.Fill(objDT);
                CollectionPager1.PageSize = 8;
                CollectionPager1.DataSource = objDT.DefaultView;
                CollectionPager1.BindToControl = DataList1;
                DataList1.DataSource = CollectionPager1.DataSourcePaged;
            }
        }
    }
   
    void MakeCart()
    {
        objDT = new DataTable();
        objDT.Columns.Add("TENSP", System.Type.GetType("System.String"));
        objDT.Columns.Add("ANHSP", System.Type.GetType("System.String"));       
        objDT.Columns.Add("DONGIA", System.Type.GetType("System.Double"));
        objDT.Columns.Add("SOLUONGSP", System.Type.GetType("System.Int32"));
        objDT.Columns.Add("THANHTIEN", System.Type.GetType("System.Double"));        
        objDT.Columns.Add("MASP", System.Type.GetType("System.Int32"));        
        Session["Cart"] = objDT;
    }
    void themhangvaogio(DataRow x)
    {
        objDT = (DataTable)Session["Cart"];
        bool themmoi = true;
        for (int i = 0; i < objDT.Rows.Count; i++)
            if ((String)objDT.Rows[i]["TENSP"] == (String)x["TENSP"])
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
                objDR["TENSP"] = (String)x["TENSP"];
                objDR["ANHSP"] = (String)x["ANHSP"];
                objDR["DONGIA"] = (Double)x["DONGIA"];
                objDR["SOLUONGSP"] = 1;
                objDR["THANHTIEN"] = (Double)x["DONGIA"];
                objDR["MASP"] = (Int32)x["MASP"];
                objDT.Rows.Add(objDR);
            }
            else Response.Redirect("~/Thongbaosoluong.aspx");
        }
        Session["Cart"] = objDT;
    }
    protected void btMua_Click(object sender, EventArgs e)
    {
              
            Button x = (Button)sender;           
            objDR = m.DR("select * from SANPHAM where MASP = " + x.CommandArgument.ToString());
            themhangvaogio(objDR);
            string url = "Giohang.aspx";
            Response.Redirect(url);       
    }
    protected void bt_chitiet_Click(object sender, EventArgs e)
    {
             Button b = (Button)sender;
            DataRow x = m.DR("select * from SANPHAM where MASP = " + b.CommandArgument.ToString());
            Session["DR"] = x;
            Response.Redirect("Chitietsp.aspx");
        
    }
}