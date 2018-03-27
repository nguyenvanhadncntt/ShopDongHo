using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Admin_Thongkehangcon : System.Web.UI.Page
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
            Hienthihangcon();
    }
    private void Hienthihangcon()
    {
        object[] obj0 = new object[0];
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("thongkehangcontheonhom", obj0);
        grv_hangcon.DataSource = ds;
        grv_hangcon.DataBind();
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_hangcon.PageIndex = e.NewPageIndex;
        Hienthihangcon();
    }
    protected void bt_sua_Click(object sender, EventArgs e)
    {
        Panel2.Visible = true;
        Hienthichitiethangcon();
        Panel1.Visible = false;
        bt_tatca.Visible = true;
        
    }
   
    private void Hienthichitiethangcon()
    {
        foreach (GridViewRow row in grv_hangcon.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                string tennh = (grv_hangcon.DataKeys[row.RowIndex].Value).ToString();
                object[] obj11 = new object[1];
                obj11[0] = tennh;
                DataSet dshc = new DataSet();
                dshc = SupportDb.ReturnDataSet("thongkechitiethangcon", obj11);
                grv_chitiethangcon.DataSource = dshc;
                grv_chitiethangcon.DataBind();
            }
        }
    }
    protected void grv_chitiethangcon_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_chitiethangcon.PageIndex = e.NewPageIndex;
        Hienthichitiethangcon();
    }
}