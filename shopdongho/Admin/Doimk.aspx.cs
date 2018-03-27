using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ThuVien;

public partial class Admin_Xoamk : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["quyen"].ToString() != "2")
            lbl_xinchao.Text = "Xin chào: " + Session["hoten"].ToString();
        else      
        {
            Response.Redirect("~/Dangnhap.aspx");
        }
    }
    protected void bt_capnhat_Click(object sender, EventArgs e)
    {
        if (txt_mkmoi.Text.Length >= 6)
        {
            try
            {
                DataSet dsNd = new DataSet();
                object[] obj = new object[2];
                obj[0] = Session["taikhoan"].ToString();
                obj[1] = md5.hmweb_Encrypt("thuy", txt_mkcu.Text);             
                dsNd = SupportDb.ReturnDataSet("kiemtramatkhau", obj);
                if (dsNd.Tables[0].Rows.Count > 0)
                {                   
                    obj[0] = Session["taikhoan"].ToString();
                    obj[1] = md5.hmweb_Encrypt("thuy", txt_mkmoi.Text);
                    SupportDb.ExecuteProcdure("capnhatmatkhau", obj);
                    lbl_thanhcong.Text = "Cập nhật Thành công!";
                    txt_mkcu.Text = "";
                    txt_mkmoi.Text = "";
                    txt_ktramkmoi.Text = "";
                }
            }
            catch
            {
                lbl_thanhcong.Text = "Đã xảy ra lỗi trong quá trình đổi mật khẩu!";
            }
        }
        else
        {
            lbl_thanhcong.Text = "Mật khẩu mới của bạn quá ngắn (< 6 kí tự)";
        }
    }
}