using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class Master_all : System.Web.UI.MasterPage
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            lb_sl.Text = ""+Session["sl"].ToString();
            lb_tongtien.Text =""+Session["tonggia"].ToString();
        }

        protected void Button1_Click(object sender, EventArgs e)
        {
            if (tk.Text.Trim() != "")
            {
                Response.Redirect("TimKiem.aspx?tensp=" + tk.Text.Trim());
            }
        }

        protected void ImageButton1_Click(object sender, ImageClickEventArgs e)
        {
            if ((int)Session["quyen"] == 0)
            {
                WebMsgBox.Show("Bạn phải đăng nhập để mua hàng");
            }else
            Response.Redirect("Giohang.aspx");
        }
    }
}