using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
public partial class Admin_chitietdonhang : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Session["quyen"].ToString() != "1")
            Response.Redirect("~/Dangnhap.aspx");
        else
        {
            lbl_xinchao.Text = "Xin chào: " + Session["hoten"].ToString();
        }
        if (!IsPostBack)
            Hienthichitietdh();
    }
    private void Hienthichitietdh()
    {
        object[] obj3 = new object[1];
        obj3[0] = Convert.ToInt32(Session["madh1"]);
        DataSet dsctdh = new DataSet();
        dsctdh = SupportDb.ReturnDataSet("hienthichitietdonhang2", obj3);
        grv_chitietdh.DataSource = dsctdh;
        grv_chitietdh.DataBind();
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_chitietdh.PageIndex = e.NewPageIndex;
        Hienthichitietdh();
    }
}