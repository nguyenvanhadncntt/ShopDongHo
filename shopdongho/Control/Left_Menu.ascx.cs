using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Control_Left_Menu : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string menuleft = "";
        object[] obj = new object[0];
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("hienthidongho1", obj);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DataRow dr = ds.Tables[0].Rows[i];
            menuleft += "<div class='ddsmoothmenu-v'>" + "<ul>" + "<li>" + "<a href='HienThiNhomHang.aspx?tennh=" + dr["TENNH"].ToString() + "'>" + "%%......"  + dr["TENNH"].ToString() + "</a>" + "</li>" + "</ul>" + "</div>";
            Session["tennhomhang"] = dr["TENNH"].ToString();
        }
       
        if (ds.Tables[0].Rows.Count == 0)
            menuleft = "Updating...";
        lblMenuleft.Text = menuleft;
    }
}