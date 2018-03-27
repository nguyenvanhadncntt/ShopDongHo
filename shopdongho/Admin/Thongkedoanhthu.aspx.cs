using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Admin_Thongkedoanhthu : System.Web.UI.Page
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
            Hienthihoadon();
    }
    protected void bt_doanhthu_Click(object sender, EventArgs e)
    {
        laydhthang();
        Panel1.Visible = false;
        Panel2.Visible = true;       
        object[] objq = new object[1];
        objq[0] = Convert.ToInt32(drp_thang.SelectedValue);
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("laydoanhthuthang", objq);
        if (ds.Tables[0].Rows.Count > 0)
        {
            SupportDb.BindFromDataSetToCombo(ds, drp_a, "DOANHTHU", "DOANHTHU");
        }
        lbl_1.Text = "Doanh thu tháng ";
        lbl_2.Text = drp_thang.SelectedValue.ToString();
        lbl_5.Text = "là:";
        lbl_3.Text = drp_a.SelectedValue;
        lbl_4.Text = "vnđ";
    }
    private void laydhthang()
    {
        object[] obj0 = new object[1];
        obj0[0] = Convert.ToInt32(drp_thang.SelectedValue);
        Session["dhthang"] = Convert.ToInt32(drp_thang.SelectedValue);
        DataSet ds1 = new DataSet();
        ds1 = SupportDb.ReturnDataSet("layhoadontrongthang", obj0);
        grv_ctdh.DataSource = ds1;
        grv_ctdh.DataBind();
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_chitietdh.PageIndex = e.NewPageIndex;
        Hienthihoadon();
    }
    private void Hienthihoadon()
    {
        object[] objtt = new object[0];
        DataSet dsa = new DataSet();
        dsa = SupportDb.ReturnDataSet("hienthichitietdonhang", objtt);
        grv_chitietdh.DataSource = dsa;
        grv_chitietdh.DataBind();
    }
    protected void grv_ctdh_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_ctdh.PageIndex = e.NewPageIndex;
        object[] obj02 = new object[1];
        obj02[0] = Session["dhthang"];        
        DataSet ds11 = new DataSet();
        ds11 = SupportDb.ReturnDataSet("layhoadontrongthang", obj02);
        grv_ctdh.DataSource = ds11;
        grv_ctdh.DataBind();
    }
    protected void bt_tatca_Click(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        lbl_1.Text = "";
        lbl_2.Text = "";
        lbl_5.Text = "";
        lbl_3.Text = "";
        lbl_4.Text = "";
    }
    protected void bt_tatca_Click1(object sender, EventArgs e)
    {
        Panel1.Visible = true;
        Panel2.Visible = false;
        lbl_1.Text = "";
        lbl_2.Text = "";
        lbl_5.Text = "";
        lbl_3.Text = "";
        lbl_4.Text = "";
    }
}