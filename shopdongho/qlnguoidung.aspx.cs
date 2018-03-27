using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ThuVien;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class qlnguoidung : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["quyen"].ToString() != "1")
             lbl_xinchao.Text = "Xin chào: " + Session["hoten"].ToString();
              
        
        else 
           
        {
            Response.Redirect("~/Dangnhap.aspx"); 
        }
    }
}