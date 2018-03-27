using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Admin_Quanlydonhang : System.Web.UI.Page
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
            Hienthidonhang();
    }
    private void Hienthidonhang()
    {
        object[] obj0 = new object[0];
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("hienthidonhang2", obj0);
        grv_donhang.DataSource = ds;
        grv_donhang.DataBind();
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_donhang.PageIndex = e.NewPageIndex;
        Hienthidonhang();
        
    }
    protected void bt_sua_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_donhang.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int madh1 = Convert.ToInt32(grv_donhang.DataKeys[row.RowIndex].Value);
                Session["madh1"] = madh1;
                Response.Redirect("~/Admin/chitietdonhang.aspx");
            }
        }
        
    }
    protected void btDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_donhang.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int madh = Convert.ToInt32(grv_donhang.DataKeys[row.RowIndex].Value);                
                object[] obj1 = new object[1];
                obj1[0] = madh;
                SupportDb.ExecuteProcdure("xoadonhang", obj1);
                lbl_thongbao.Text = "Xóa thành công !";
            }
        }
        Hienthidonhang();
    }
    protected void bt_sua_Click1(object sender, EventArgs e)
    {
        bt_capnhat.Enabled = true;
        string tenkhach = "";
        string diachi = "";
        string sdt = "";
        string email = "";
        string ngaydathang = "";
        string chuky= "";
        string tongtien = "";
        string pttt = "";
        string ptvc = "";
        string tinhtrang = "";
        string ghichu = "";
        foreach (GridViewRow row in grv_donhang.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int madonhang = Convert.ToInt32(grv_donhang.DataKeys[row.RowIndex].Value);
                Session["madonhang"] = madonhang;
                object[] obj3 = new object[1];
                obj3[0] = madonhang;
                DataSet dsdh = new DataSet();
                dsdh = SupportDb.ReturnDataSet("timdonhangtheoma", obj3);
                for (int i = 0; i < dsdh.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = dsdh.Tables[0].Rows[i];                  
                    tenkhach = dr["HOTEN"].ToString();
                    diachi = dr["DIACHI"].ToString();
                    sdt = dr["SDT"].ToString();
                    email = dr["EMAIL"].ToString();
                    ngaydathang = dr["NGAYDATHANG"].ToString();
                    chuky = dr["CHUKY"].ToString();
                    tongtien = dr["TONGTIEN"].ToString();
                    pttt = dr["PTTT"].ToString();
                    ptvc = dr["PTVC"].ToString();
                    tinhtrang = dr["TINHTRANG"].ToString();
                    ghichu = dr["GHICHU"].ToString();
                }
            }
        }
        txt_tenkhach.Text = tenkhach;
        txt_diachi.Text = diachi;
        txt_sdt.Text = sdt;
        txt_email.Text = email;
        txt_ngaydathang.Text = ngaydathang;
        txt_chuky.Text = chuky;
        txt_tongtien.Text = tongtien;
        txt_pttt.Text = pttt;
        txt_ptvc.Text = ptvc;
        drp_tinhtrang.SelectedValue = tinhtrang;
        drp_ghichu.SelectedValue = ghichu;
        Hienthidonhang();
    }
    protected void bt_capnhat_Click(object sender, EventArgs e)
    {
        object[] obj4 = new object[3];
        obj4[0] = Session["madonhang"];
        obj4[1] = drp_tinhtrang.SelectedValue;
        obj4[2] = drp_ghichu.SelectedValue;     
        SupportDb.ExecuteProcdure("capnhatdonhang1", obj4);
        lbl_thongbao.Text = "Cập nhật thành công !";
        txt_tenkhach.Text = "";
        txt_diachi.Text = "";
        txt_sdt.Text ="";
        txt_email.Text = "";
        txt_ngaydathang.Text = "";
        txt_chuky.Text = "";
        txt_tongtien.Text = "";
        txt_pttt.Text = "";
        txt_ptvc.Text = "";
        Hienthidonhang();
        hienthitimkiem();
        bt_capnhat.Enabled = false;       
    }
    protected void bt_tim_Click(object sender, EventArgs e)
    {
        hienthitimkiem();
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    private void hienthitimkiem()
    {
        object[] obja = new object[2];
        obja[0] = txt_tenkhach1.Text;
        obja[1] = Convert.ToInt32(drp_thang.SelectedValue);
        DataSet ds1 = new DataSet();
        ds1 = SupportDb.ReturnDataSet("timdonhangtheotenkhachvathang", obja);
        grv_timkiem.DataSource = ds1;
        grv_timkiem.DataBind();
    }

    protected void grv_timkiem_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_timkiem.PageIndex = e.NewPageIndex;
        hienthitimkiem();
    }
    protected void bt_tatca_Click(object sender, EventArgs e)
    {
        Hienthidonhang();
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
    protected void bt_ct1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_timkiem.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check0");
            if (chk != null && chk.Checked)
            {
                int madh1 = Convert.ToInt32(grv_timkiem.DataKeys[row.RowIndex].Value);
                Session["madh1"] = madh1;
                Response.Redirect("~/Admin/chitietdonhang.aspx");
            }
        }
    }
    protected void bt_s1_Click(object sender, EventArgs e)
    {
        bt_capnhat.Enabled = true;
        string tenkhach = "";
        string diachi = "";
        string sdt = "";
        string email = "";
        string ngaydathang = "";
        string chuky = "";
        string tongtien = "";
        string pttt = "";
        string ptvc = "";
        string tinhtrang = "";
        string ghichu = "";
        foreach (GridViewRow row in grv_timkiem.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check0");
            if (chk != null && chk.Checked)
            {
                int madonhang1 = Convert.ToInt32(grv_timkiem.DataKeys[row.RowIndex].Value);
                Session["madonhang"] = madonhang1;
                object[] obj33 = new object[1];
                obj33[0] = madonhang1;
                DataSet dsdh = new DataSet();
                dsdh = SupportDb.ReturnDataSet("timdonhangtheoma", obj33);
                for (int i = 0; i < dsdh.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = dsdh.Tables[0].Rows[i];
                    tenkhach = dr["HOTEN"].ToString();
                    diachi = dr["DIACHI"].ToString();
                    sdt = dr["SDT"].ToString();
                    email = dr["EMAIL"].ToString();
                    ngaydathang = dr["NGAYDATHANG"].ToString();
                    chuky = dr["CHUKY"].ToString();
                    tongtien = dr["TONGTIEN"].ToString();
                    pttt = dr["PTTT"].ToString();
                    ptvc = dr["PTVC"].ToString();
                    tinhtrang = dr["TINHTRANG"].ToString();
                    ghichu = dr["GHICHU"].ToString();
                }
            }
        }
        txt_tenkhach.Text = tenkhach;
        txt_diachi.Text = diachi;
        txt_sdt.Text = sdt;
        txt_email.Text = email;
        txt_ngaydathang.Text = ngaydathang;
        txt_chuky.Text = chuky;
        txt_tongtien.Text = tongtien;
        txt_pttt.Text = pttt;
        txt_ptvc.Text = ptvc;
        drp_tinhtrang.SelectedValue = tinhtrang;
        drp_ghichu.SelectedValue = ghichu;
        hienthitimkiem();
        Panel1.Visible = false;
        Panel2.Visible = true;
    }
    protected void btx1_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_timkiem.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check0");
            if (chk != null && chk.Checked)
            {
                int madh1 = Convert.ToInt32(grv_timkiem.DataKeys[row.RowIndex].Value);
                object[] obj112 = new object[1];
                obj112[0] = madh1;
                SupportDb.ExecuteProcdure("xoadonhang", obj112);
                lbl_thongbao.Text = "Xóa thành công !";
            }
        }
        Hienthidonhang();
        Panel2.Visible = false;
        Panel1.Visible = true;
    }
}