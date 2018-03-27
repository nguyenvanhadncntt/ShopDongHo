using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo.Controls
{
    public partial class PhanQuyen : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
          
                if (Session["quyen"] == null || (int)Session["quyen"] == 0)
                {
                    MultiViewAcount.ActiveViewIndex = 0;
                }
           else if((int)Session["quyen"] == 2)
            {
                User(avarta,lb_ht);
                MultiViewAcount.ActiveViewIndex = 1;
            }else
            {
                User(avarta0, lb_ht0);
                MultiViewAcount.ActiveViewIndex = 2;
            }
        }

     


        protected void btn_dn_Click(object sender, EventArgs e)
        {
            if (tb_tk.Text.Trim() == "" || tb_mk.Text.Trim() == "")
            {
                lb_tb.Text = "Bạn hãy nhập đầy đủ Email và mật khẩu để đăng nhập";
            }
            else
            {
                KetNoi kn = new KetNoi();
               // SqlDataReader read = null;
                try
                {
                    SqlDataReader read = kn.dangnhap(tb_tk.Text.Trim(), tb_mk.Text.Trim());
                    if (read == null)
                    {
                        lb_tb.Text = "Đăng nhập thất bại hãy xem lại email hoặc mật khẩu";
                    }
                    else
                    {
                        Session["quyen"] = int.Parse(read["Quyen"].ToString());
                        Session["ten"] = read["HoTen"].ToString();
                        Session["email"] = tb_tk.Text.Trim();
                        Session["gioitinh"] = int.Parse(read["GioiTinh"].ToString());
                        Session["diachi"] = read["DiaChi"].ToString();
                        Session["matkhau"] = tb_mk.Text.Trim();
                        Session["sdt"]= read["SoDT"].ToString();
                        Session["image"] = read["image"].ToString();
                        Response.Redirect("LoginSuccess.aspx");
                    }
                }
                catch (Exception exc)
                {
                    lb_tb.Text = exc.StackTrace;
                }
                //finally
                //{
                //    //read.Close();
                //}
            }
        }
        public void User(Image img,Label lb)
        {
            img.ImageUrl = "~/imageUser/" + (String)Session["image"];
            lb.Text = (String)Session["ten"];
        }

       
        protected void btn_dk_Click(object sender, EventArgs e)
        {
            Response.Redirect("~/DangKy.aspx");
        }
    }
}