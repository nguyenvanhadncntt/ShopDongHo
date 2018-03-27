using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Admin_Quanlysanpham : System.Web.UI.Page
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
            Hienthisanpham();
        object[] objlh = new object[0];
        DataSet dsnh = new DataSet();
        dsnh = SupportDb.ReturnDataSet("hienthinhomhang", objlh);
        if (dsnh.Tables[0].Rows.Count > 0)
        {
            SupportDb.BindFromDataSetToCombo(dsnh, drp_nhomhang, "MANH", "TENNH");
        }
        object[] objlh1 = new object[0];
        DataSet dsnh1 = new DataSet();
        dsnh1 = SupportDb.ReturnDataSet("hienthinhomhang", objlh1);
        if (dsnh1.Tables[0].Rows.Count > 0)
        {
            SupportDb.BindFromDataSetToCombo(dsnh1, drp_manh, "MANH", "TENNH");
        }
    }
    private void Hienthisanpham()
    {
        object[] obj0 = new object[0];
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("laytatcasp", obj0);
        grv_sanpham.DataSource = ds;
        grv_sanpham.DataBind();
    }
    protected void btDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_sanpham.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int masp = Convert.ToInt32(grv_sanpham.DataKeys[row.RowIndex].Value);
                object[] obj1 = new object[1];
                obj1[0] = masp;
                SupportDb.ExecuteProcdure("xoasanpham", obj1);
                lbl_thongbao.Text = "Xóa thành công !";
            }
        }
        Hienthisanpham();
    }
    protected void bt_sua_Click(object sender, EventArgs e)
    {      
        string tensp = "";
        string manhomhang = "";      
        string soluong = "";
        string chitiet = "";
        string dongia = "";
        foreach (GridViewRow row in grv_sanpham.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int masanpham = Convert.ToInt32(grv_sanpham.DataKeys[row.RowIndex].Value);
                Session["masanpham"] = masanpham;
                object[] obj3 = new object[1];
                obj3[0] = masanpham;
                DataSet dssp = new DataSet();
                dssp = SupportDb.ReturnDataSet("timsanphamtheoma", obj3);
                for (int i = 0; i < dssp.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = dssp.Tables[0].Rows[i];                  
                    tensp = dr["TENSP"].ToString();
                    manhomhang = dr["MANH"].ToString();                   
                    soluong = dr["SOLUONG"].ToString();
                    chitiet = dr["CHITIET"].ToString();
                    dongia = dr["DONGIA"].ToString();
                }
            }
        }
        txt_tensp.Text = tensp;
        drp_nhomhang.SelectedValue = manhomhang;
        txt_soluong.Text = soluong;
        txt_chitiet.Text = chitiet;
        txt_dongia.Text = dongia;        
        bt_capnhat.Visible = true;
        lbl_thongbao.Text = "";
        ful_anhsp.Enabled = false;
        bt_them.Enabled = false;
        Hienthisanpham();
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_sanpham.PageIndex = e.NewPageIndex;
        Hienthisanpham();
    }
    protected void bt_them_Click(object sender, EventArgs e)
    {
        string strpath = "../images/sanpham/";
        ful_anhsp.SaveAs(Server.MapPath("../images/sanpham/") + ful_anhsp.FileName);
        object[] obj1 = new object[6];
        obj1[0] = txt_tensp.Text;
        obj1[1] = drp_nhomhang.SelectedValue;
        obj1[2] = strpath.Substring(3) + ful_anhsp.FileName;
        obj1[3] = txt_soluong.Text;
        obj1[4] = txt_chitiet.Text;
        obj1[5] = txt_dongia.Text;
        SupportDb.ExecuteProcdure("themsanpham", obj1);
        lbl_thongbao.Text = "Thêm thành công !";        
        Hienthisanpham();
    }
    protected void bt_capnhat_Click(object sender, EventArgs e)
    {
        object[] obj4 = new object[6];
        obj4[0] = Session["masanpham"];
        obj4[1] = txt_tensp.Text;
        obj4[2] = Convert.ToInt32(drp_nhomhang.SelectedValue);
        obj4[3] = Convert.ToInt32(txt_soluong.Text);
        obj4[4] = txt_chitiet.Text;
        obj4[5] = Convert.ToDouble(txt_dongia.Text);
        SupportDb.ExecuteProcdure("capnhatsanpham1", obj4);
        lbl_thongbao.Text = "Cập nhật thành công !";
        txt_tensp.Text = "";
        txt_soluong.Text = "";
        txt_chitiet.Text="";
        txt_dongia.Text = "";
        ful_anhsp.Enabled = true;
        bt_them.Enabled = true;
        bt_capnhat.Visible = false;
        Hienthisanpham();
    }
    private void timsp()
    {
        object[] obj01 = new object[1];
        obj01[0] = Convert.ToInt32(drp_manh.SelectedValue);
        Session["manh01"] = Convert.ToInt32(drp_manh.SelectedValue);
        DataSet dsa = new DataSet();
        dsa = SupportDb.ReturnDataSet("timsptheomanh", obj01);
        grv_sp.DataSource = dsa;
        grv_sp.DataBind();
    }
    protected void bt_tim_Click(object sender, EventArgs e)
    {
        timsp();
        Panel1.Visible = true;
        Panel2.Visible = false;

    }
    protected void bt_s_Click(object sender, EventArgs e)
    {
        string tensp = "";
        string manhomhang = "";
        string soluong = "";
        string chitiet = "";
        string dongia = "";
        foreach (GridViewRow row in grv_sp.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check0");
            if (chk != null && chk.Checked)
            {
                int masanpham1 = Convert.ToInt32(grv_sp.DataKeys[row.RowIndex].Value);
                Session["masanpham1"] = masanpham1;
                object[] obj33 = new object[1];
                obj33[0] = masanpham1;
                DataSet dssp = new DataSet();
                dssp = SupportDb.ReturnDataSet("timsanphamtheoma", obj33);
                for (int i = 0; i < dssp.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = dssp.Tables[0].Rows[i];
                    tensp = dr["TENSP"].ToString();
                    manhomhang = dr["MANH"].ToString();
                    soluong = dr["SOLUONG"].ToString();
                    chitiet = dr["CHITIET"].ToString();
                    dongia = dr["DONGIA"].ToString();
                }
            }
        }
        txt_tensp.Text = tensp;
        drp_nhomhang.SelectedValue = manhomhang;
        txt_soluong.Text = soluong;
        txt_chitiet.Text = chitiet;
        txt_dongia.Text = dongia;
        bt_up.Visible = true;
        lbl_thongbao.Text = "";
        ful_anhsp.Enabled = false;
        bt_them.Enabled = false;
        timsp();
        Panel1.Visible = true;
        Panel2.Visible = false;
    }
    protected void bt_x_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_sp.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check0");
            if (chk != null && chk.Checked)
            {
                int masp1 = Convert.ToInt32(grv_sp.DataKeys[row.RowIndex].Value);
                object[] obj111 = new object[1];
                obj111[0] = masp1;
                SupportDb.ExecuteProcdure("xoasanpham", obj111);
                lbl_thongbao.Text = "Xóa thành công !";
            }
        }
        object[] obj011 = new object[1];
        obj011[0] = Session["manh01"];       
        DataSet dsa = new DataSet();
        dsa = SupportDb.ReturnDataSet("timsptheomanh", obj011);
        grv_sp.DataSource = dsa;
        grv_sp.DataBind();
        Panel1.Visible = true;
        Panel2.Visible = false;
    }
    protected void grv_sp_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_sp.PageIndex = e.NewPageIndex;
        object[] obj011 = new object[1];
        obj011[0] = Session["manh01"];
        DataSet dsa = new DataSet();
        dsa = SupportDb.ReturnDataSet("timsptheomanh", obj011);
        grv_sp.DataSource = dsa;
        grv_sp.DataBind();
    }
    protected void bt_up_Click(object sender, EventArgs e)
    {
        object[] obj4 = new object[6];
        obj4[0] = Session["masanpham1"];
        obj4[1] = txt_tensp.Text;
        obj4[2] = Convert.ToInt32(drp_nhomhang.SelectedValue);
        obj4[3] = Convert.ToInt32(txt_soluong.Text);
        obj4[4] = txt_chitiet.Text;
        obj4[5] = Convert.ToDouble(txt_dongia.Text);
        SupportDb.ExecuteProcdure("capnhatsanpham1", obj4);
        lbl_thongbao.Text = "Cập nhật thành công !";
        txt_tensp.Text = "";
        txt_soluong.Text = "";
        txt_chitiet.Text = "";
        txt_dongia.Text = "";
        ful_anhsp.Enabled = true;
        bt_them.Enabled = true;
        bt_up.Visible = false;
        object[] obj011 = new object[1];
        obj011[0] = Session["manh01"];
        DataSet dsa = new DataSet();
        dsa = SupportDb.ReturnDataSet("timsptheomanh", obj011);
        grv_sp.DataSource = dsa;
        grv_sp.DataBind();
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
    protected void bt_tatcasp_Click(object sender, EventArgs e)
    {
        Hienthisanpham();
        Panel2.Visible = true;
        Panel1.Visible = false;
    }
}