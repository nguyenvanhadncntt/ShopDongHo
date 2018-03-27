using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ThuVien;

public partial class Capnhatthongtincanhan : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["quyen"].ToString() != "1")
            lbl_xinchao.Text = "Xin chào: " + Session["hoten"].ToString();

        else       
        {
            Response.Redirect("~/Dangnhap.aspx");
        }
       
        txt_hoten.Text = Session["hoten"].ToString();
        txt_diachi.Text = Session["diachi"].ToString();
        txt_sdt.Text = Session["sdt"].ToString();
        txt_email.Text = Session["email"].ToString();       
    }
    protected void bt_capnhat_Click(object sender, EventArgs e)
    {
        object[] objcn = new object[4];
        objcn[0] = Convert.ToInt32(Session["manguoidung"]);
        //obj[0] = txt_hoten.Text;
        objcn[1] =  txt_diachi.Text;
        objcn[2] = txt_sdt.Text;
        objcn[3] = txt_email.Text;
        SupportDb.ExecuteProcdure("capnhatnguoidung", objcn);
        lbl_thongbao.Text = "Thành công!";   
        txt_hoten.Text = "";
        txt_diachi.Text = "";
        txt_sdt.Text ="";
        txt_email.Text = "";
    }   
    protected void txt_hoten_TextChanged(object sender, EventArgs e)
    {
        
    }
}