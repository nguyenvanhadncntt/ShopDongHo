using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class DangKy : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void fuKhachHang_Load(object sender, EventArgs e)
        {

        }

        protected void btnDangky_Click(object sender, EventArgs e)
        {
            if (txtDiaChi.Text.Trim() == "" || txtEmail.Text.Trim() == "" || txtXacNhanMK.Text.Trim() == "" || txtMatKhau.Text.Trim() == "" || txtTenKH.Text.Trim() == "" || txtSDT.Text.Trim() == "" || !fuKhachHang.HasFiles)
            {
                lb_tb.Text = "Bạn hãy nhập đầy đủ thông tin để đăng kí tài khoản";
            }
            else
            {
                try
                {
                    KetNoi kn = new KetNoi();
                    if (kn.checkEmailExist(txtEmail.Text.Trim()))
                    {
                        lb_email.Text = "Email đã tồn tại";
                    }
                    else if (txtXacNhanMK.Text.Trim() != txtMatKhau.Text.Trim())
                    {
                        lb_xnmk.Text = "Xác nhận mật khẩu không đúng";
                    }
                    else
                    {
                        String s = fuKhachHang.FileName;
                        String duoi = Path.GetExtension(s);
                        if (duoi == ".png" || duoi == ".gif" || duoi == ".jpg" || duoi == ".jpeg" || duoi == ".bmp")
                        {
                            kn.dangKy(txtEmail.Text.Trim(), txtTenKH.Text.Trim(), int.Parse(ddlGioiTinh.SelectedValue.ToString()), txtDiaChi.Text.Trim(), txtMatKhau.Text.Trim(), txtSDT.Text.Trim(), 2, s);
                            fuKhachHang.SaveAs(MapPath("~/imageUser/") + s);
                            lb_tb.Text = "Bạn đã đăng ký thành công,hãy đăng nhập để mua hàng";
                        }
                    }
                }
                catch (Exception ex)
                {
                    lb_tb.Text = ex.StackTrace;
                }
            }
        }
    }
}
        
    