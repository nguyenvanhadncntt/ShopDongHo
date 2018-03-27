using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Admin_Thongkesoluongbanduoc : System.Web.UI.Page
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
            Hienthisoluongban();
    }
    private void Hienthisoluongban()
    {
        object[] objtt = new object[0];
        DataSet dssl = new DataSet();
        dssl = SupportDb.ReturnDataSet("thongkesoluonghangban", objtt);
        grv_slban.DataSource = dssl;
        grv_slban.DataBind();
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_slban.PageIndex = e.NewPageIndex;
        Hienthisoluongban();
    }
    protected void bt_doanhthu_Click(object sender, EventArgs e)
    {
        soluongbantheothang();
        Panel1.Visible = false;
        Panel2.Visible = true;        
        object[] objq = new object[1];
        objq[0] = Convert.ToInt32(drp_thang.SelectedValue);
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("thongketongsobanduoc", objq);
        if (ds.Tables[0].Rows.Count > 0)
        {
            SupportDb.BindFromDataSetToCombo(ds, drp_a, "TONGSOLUONG", "TONGSOLUONG");
        }
        lbl_1.Text = "Tổng số lượng bán được trong tháng ";
        lbl_2.Text = drp_thang.SelectedValue.ToString();
        lbl_5.Text = "là:";
        lbl_3.Text = drp_a.SelectedValue;
        lbl_4.Text = "Sản phẩm";
    }
    private void soluongbantheothang()
    {
        object[] objk = new object[1];
        objk[0] = Convert.ToInt32(drp_thang.SelectedValue);
        Session["slthang"] = Convert.ToInt32(drp_thang.SelectedValue);
        DataSet ds1 = new DataSet();
        ds1 = SupportDb.ReturnDataSet("thongkesoluongbanduoc", objk);
        grv_slbantheothang.DataSource = ds1;
        grv_slbantheothang.DataBind();
    }
    protected void grv_slbantheothang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_slbantheothang.PageIndex = e.NewPageIndex;
        soluongbantheothang();
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
}