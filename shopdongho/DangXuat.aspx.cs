using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class DangXuat : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            Session["quyen"] = 0;
            Session["ten"] = "";
            Session["email"] = "";
            Session["gioitinh"] = -1;
            Session["diachi"] = "";
            Session["matkhau"] = "";
            Session["sdt"] = "";
            Session["image"] = "";
            Response.Redirect("TrangChu.aspx");
        }
    }
}