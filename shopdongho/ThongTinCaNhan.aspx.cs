using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class ThongTinCaNhan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                KetNoi kn = new KetNoi();
                DataTable dt = kn.loadDT("select dbo.Soluonghangmua('" + Session["email"].ToString() + "') as soluong");
                DataTable dt1 = kn.loadDT("select dbo.Sotiendamuahang('" + Session["email"].ToString() + "') as sotien ");
                avatar.ImageUrl = "~/imageUser/" + (String)Session["image"];
                lb_ten.Text = (String)Session["ten"];
                lb_email.Text = (String)Session["email"];
                lb_dc.Text = (String)Session["diachi"];
                lb_gt.Text = "" + Session["gioitinh"].ToString();
                lb_sdt.Text = (String)Session["sdt"];
                if (dt.Rows[0]["soluong"].ToString() == "")
                {
                    lb_slspdm.Text = "0";
                }
                else
                {
                    lb_slspdm.Text = dt.Rows[0]["soluong"].ToString();
                }

                if (dt1.Rows[0]["sotien"].ToString() == "")
                {
                    lb_sotien.Text = "0";
                }
                else
                {
                    lb_sotien.Text = dt1.Rows[0]["sotien"].ToString();
                }
            }catch(Exception ex)
            {
                Response.Write(ex.StackTrace);
            }
        }

        protected void btn_infor_Click(object sender, EventArgs e)
        {
            Response.Redirect("CapNhapThongTinCaNhan.aspx");
        }
    }
}