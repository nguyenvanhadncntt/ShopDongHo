using System;
using System.Collections.Generic;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class ChiTietSP : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
                getRead((String)Request.QueryString["msp"]);            
        }
        public void getRead(String masp)
        {
            KetNoi kn = new KetNoi();
            SqlDataReader read=null;
            try
            {
               
                read = kn.getReader("select * from SANPHAM s join NHOMHANG n on s.MaNH=n.MANH where MaSP='" + masp + "'");
                if (read.HasRows)
                {
                    read.Read();
                    lb_tensp.Text = (String)read["TenSP"];
                    lb_sl.Text = ""+(int)read["SOLUONG"];
                    lb_ct.Text = read["CHITIET"].ToString() ;
                    img.ImageUrl =read["ANHSP"].ToString();
                    hpk_th.Text = read["TENNH"].ToString();
                    lb_dg.Text = read["DONGIA"].ToString() + "VNĐ";
                    hpk_th.NavigateUrl = "ThuongHieu.aspx?mn=" + read["MANH"];

                }
                else
                {
                    error.Text = "Khong co thong tin san pham";
                }
            }
            catch(Exception e)
            {
                error.Text = e.StackTrace;
            }
            finally
            {
                kn.close();
                read.Close();
            }
        }

        protected void kick_Click(object sender, EventArgs e)
        {
            if (Session["quyen"] == null || (int)Session["quyen"] == 0)
            {

                WebMsgBox.Show("Bạn hãy đăng nhập để mua hàng");
            }
        }

        protected void kick_Click1(object sender, EventArgs e)
        {
            if ((int)Session["quyen"] == 0)
            {
                WebMsgBox.Show("Bạn hãy đăng nhập để mua hàng");
            }
        }
    }
}