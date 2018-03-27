using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class Giohang : System.Web.UI.Page
    {
        public int i = 1;
        DataTable objDT;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
                Hienthi();

        }
        void Hienthi()
        {
            objDT = (DataTable)Session["Cart"];
            dgcart.DataSource = objDT;
            dgcart.DataBind();
            Label1.Text = Tongtien().ToString() + "VNĐ";
            Session["tonggia"] = Label1.Text;
        }
        Double Tongtien()
        {
            Double s = 0;
            objDT = (DataTable)Session["Cart"];
            for (int i = 0; i < objDT.Rows.Count; i++)
                s += (Double)objDT.Rows[i]["THANHTIEN"];
            Session["sl"] = Convert.ToInt32(objDT.Rows.Count.ToString());
            return s;
        }
        protected void Button1_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/all.aspx");
            
        }
        protected void dgcart_DeleteCommand(object source, DataGridCommandEventArgs e)
        {
            DataTable objDT = (DataTable)Session["Cart"];
            objDT.Rows[e.Item.ItemIndex].Delete();
            Session["Cart"] = objDT;
            Hienthi();
        }
        protected void dgcart_EditCommand(object source, DataGridCommandEventArgs e)
        {
            dgcart.EditItemIndex = e.Item.ItemIndex;
            Hienthi();
        }

        protected void dgcart_UpdateCommand(object source, DataGridCommandEventArgs e)
        {
            TextBox x = (TextBox)e.Item.Cells[4].Controls[0];
            Int32 sl = Int32.Parse(x.Text);
            int maso = (int)e.Item.ItemIndex;
            DataTable objDT = (DataTable)Session["Cart"];
            objDT.Rows[maso]["SOLUONGSP"] = sl;
            objDT.Rows[maso]["THANHTIEN"] = sl * (Double)objDT.Rows[maso]["DONGIA"];
            dgcart.EditItemIndex = -1;
            Session["Cart"] = objDT;
           // Response.Write((String)objDT.Rows[maso]["MaSP"]);
            Hienthi();
           
        }
        protected void bt_dathang_Click(object sender, EventArgs e)
        {
            Response.Redirect("DatHang.aspx");
        }
    }
}