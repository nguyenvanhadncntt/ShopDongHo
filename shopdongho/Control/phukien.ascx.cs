using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Control_phukien : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string phukien = "";
        object[] obj = new object[0];
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("hienthidongho2", obj);
        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DataRow dr = ds.Tables[0].Rows[i];
            phukien += "<div class='ddsmoothmenu-v'>" + "<ul>" + "<li>" + "<a href='HienThiNhomHang.aspx?tennh=" + dr["TENNH"].ToString() + "'>" + "%%......" + dr["TENNH"].ToString() + "</a>" + "</li>" + "</ul>" + "</div>";
            Session["tennhomhang"] = dr["TENNH"].ToString();
        }

        if (ds.Tables[0].Rows.Count == 0)
            phukien = "Updating...";
        lbl_phukien.Text = phukien;
    }
}