using System;
using System.Collections.Generic;
using System.IO;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class CapNhapThongTinCaNhan : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                tb_ten.Text = (String)Session["ten"];
                tb_dc.Text = (String)Session["diachi"];
                tb_gt.Text = "" + Session["gioitinh"].ToString();
                tb_sdt.Text = (String)Session["sdt"];
            }

        }

        protected void btn_cn_Click(object sender, EventArgs e)
        {
            if(tb_ten.Text.Trim()==""|| tb_dc.Text.Trim() == ""|| tb_gt.Text.Trim() == "" || tb_sdt.Text.Trim() == "")
            {
              
                lb_tb.Text = "Bạn hãy nhập đầy đủ để cập nhật thông tin";
            }else
            {
                try
               {
                    KetNoi kn = new KetNoi();
                    if (fu.HasFile)
                    {
                        String s = fu.FileName;
                        String duoi = Path.GetExtension(s);
                        if (duoi == ".png" || duoi == ".gif" || duoi == ".jpg" || duoi == ".jpeg" || duoi == ".bmp")
                        {
                            kn.updateInformation((String)Session["email"], tb_ten.Text.Trim(), int.Parse(tb_gt.Text.Trim()), tb_dc.Text.Trim(), tb_sdt.Text.Trim(), s);
                            fu.SaveAs(MapPath("~/imageUser/") + s);
                            Session["image"] = s;
                            Session["ten"] = tb_ten.Text.Trim();
                            Session["diachi"] = tb_dc.Text.Trim();
                            Session["gioitinh"] = int.Parse(tb_gt.Text.Trim());
                            Session["sdt"] = tb_sdt.Text.Trim();
                            lb_tb.Text = "Bạn đã cập nhật thông tin thành công";
                        }else
                        {
                            lb_tb.Text = "Định dạng file ảnh không đúng";
                        }
                    }
                    else
                    {
                        kn.updateInformation((String)Session["email"],tb_ten.Text.Trim(), int.Parse(tb_gt.Text.Trim()), tb_dc.Text.Trim(), tb_sdt.Text.Trim(), (String)Session["image"]);
                        Session["ten"] = tb_ten.Text.Trim();
                        Session["diachi"] = tb_dc.Text.Trim();
                        Session["gioitinh"] = tb_gt.Text.Trim();
                        Session["sdt"] = tb_sdt.Text.Trim();
                        lb_tb.Text = "Bạn đã cập nhật thông tin thành công";
                    }
                }
                catch(Exception ex)
                {
                    lb_tb.Text = ex.StackTrace;
                }
            }
        }
    }
}