using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ThuVien;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class Admin_Quantri : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["quyen"].ToString() != "2")
            lbl_xinchao.Text = "Xin chào: " + Session["hoten"].ToString();
            
        else
         //if (Session["quyen"].ToString()=="Admin")
        {
            Response.Redirect("~/Dangnhap.aspx");
        }
    }
}