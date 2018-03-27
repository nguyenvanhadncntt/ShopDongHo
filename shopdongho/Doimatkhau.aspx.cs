using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class DoiMatKhau : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                
                lb_ma.Text = RandomString(10, false);
            }
        }

        public string RandomString(int size, bool lowerCase)
        {
            StringBuilder sb = new StringBuilder();
            char c;
            Random rand = new Random();
            for (int i = 0; i < size; i++)
            {
                c = Convert.ToChar(Convert.ToInt32(rand.Next(65, 87)));
                sb.Append(c);
            }
            if (lowerCase)
                return sb.ToString().ToLower();
            return sb.ToString();

        }
        protected void btn_xn_Click(object sender, EventArgs e)
        {
            if(txt_mkcu.Text.Trim() == Session["matkhau"].ToString())
            {
                if (lb_ma.Text == txt_maxn.Text.Trim())
                {
                    KetNoi kn = new KetNoi();
                    kn.doimk(txt_mkmoi.Text.Trim(),Session["email"].ToString());
                    Session["matkhau"] = txt_mkmoi.Text.Trim();
                    error.Text = "Bạn đã đổi mật khẩu thành công";
                }else
                {
                    error.Text = "Mã kiểm tra không đúng";
                }
            }else
            {
                error.Text = "Mật khẩu cũ không hợp lệ";
            }
        }
    }
}