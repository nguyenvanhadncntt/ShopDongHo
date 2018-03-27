using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ThuVien;
public partial class Thanhtoan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {       
        if (Session["quyen"].ToString() != "2")
        {
            Response.Redirect("~/Dangnhap.aspx");
        }
        else
        {
            lbl_xinchao.Text = "Xin chào: " + Session["hoten"].ToString();
        }       
       
    }

    protected void bt_tieptuc_Click(object sender, EventArgs e)
    {
        if ((rbtienmat.Checked == false) && (rbquabuudien.Checked == false) && (rbchuyenkhoan.Checked == false) && (rbnganluong.Checked == false))
        {
           lbl_thongbao.Text = "Vui lòng chọn phương thức thanh toán!";

        }
        else
        {            
                if (rbquabuudien.Checked == true)
                {
                    Session["pttt"] = rbquabuudien.Text;                    
                    rbchuyenkhoan.Enabled = false;
                    rbnganluong.Enabled = false;
                    rbtienmat.Enabled = false;
                }
                else
                {
                    if (rbchuyenkhoan.Checked == true)
                    {
                        Session["pttt"] = rbchuyenkhoan.Text;                                            
                        rbnganluong.Enabled = false;
                        rbquabuudien.Enabled = false;
                        rbtienmat.Enabled = false;
                    }
                    else
                    {
                        if (rbnganluong.Checked == true)
                        {
                            Session["pttt"] = rbnganluong.Text;
                            rbchuyenkhoan.Enabled = false;
                            rbquabuudien.Enabled = false;
                            rbtienmat.Enabled = false;
                        }

                        else
                        {
                            Session["pttt"] = rbtienmat.Text;
                            rbchuyenkhoan.Enabled = false;
                            rbquabuudien.Enabled = false;
                            rbnganluong.Enabled = false;
                        }
                    }                    
                }            
            Session["vc"] = drp_ptvc.SelectedItem;           
            Response.Redirect("~/Dathang.aspx");
        }
    }
}