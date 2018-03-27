using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;
public partial class Admin_Quanlynguoidung : System.Web.UI.Page
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
            Hienthinguoidung();
        object[] objq = new object[0];
        DataSet dsq = new DataSet();
        dsq = SupportDb.ReturnDataSet("hienthiquyen", objq);
        if (dsq.Tables[0].Rows.Count > 0)
        {
            SupportDb.BindFromDataSetToCombo(dsq, drp_quyen, "MAQUYEN", "TENQUYEN");
        }
    }
    private void Hienthinguoidung()
    {
        object[] obj0 = new object[0];
        DataSet dsnd = new DataSet();
        dsnd = SupportDb.ReturnDataSet("hienthinguoidung", obj0);
        grv_nguoidung.DataSource = dsnd;
        grv_nguoidung.DataBind();
    }
    protected void btDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_nguoidung.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int manguoidung = Convert.ToInt32(grv_nguoidung.DataKeys[row.RowIndex].Value);
                object[] objx = new object[1];
                objx[0] = manguoidung;
                SupportDb.ExecuteProcdure("xoanguoidung", objx);
                lbl_thongbao.Text = "Xóa thành công !";
            }
        }
        Hienthinguoidung();
    }
    protected void bt_dangky_Click(object sender, EventArgs e)
    {
        if (chk_dongy.Checked == true)
        {
            if (txt_matkhau.Text.Length >= 6)
            {
                try
                {
                    object[] obj2 = new object[2];
                    obj2[0] = txt_tendangnhap.Text;
                    obj2[1] = txt_email.Text;
                    DataSet ds = new DataSet();
                    ds = SupportDb.ReturnDataSet("ktratendangnhapvaemail", obj2);
                    if (ds.Tables[0].Rows.Count > 0)
                    {
                        lbl_thongbao.Text = "Tên tài khoản đã có người đăng kí.Vui lòng nhập vào tên khác !";
                    }
                    else
                    {
                        if (ds.Tables[1].Rows.Count > 0)
                        {
                            lbl_thongbao.Text = "Email này đã đăng kí. Vui lòng nhập email khác ! ";
                        }
                        else
                        {
                            object[] obj5 = new object[7];
                            obj5[0] = Convert.ToInt32(drp_quyen.SelectedValue);
                            obj5[1] = txt_tendangnhap.Text;
                            obj5[2] = md5.hmweb_Encrypt("thuy", txt_matkhau.Text);
                            obj5[3] = txt_hoten.Text;
                            obj5[4] = txt_diachi.Text;
                            obj5[5] = txt_dienthoai.Text;
                            obj5[6] = txt_email.Text;
                            SupportDb.ExecuteProcdure("nguoidungdangky", obj5);
                            lbl_thongbao.Text = "Thêm người dùng thành công !";
                            txt_tendangnhap.Text = "";
                            txt_matkhau.Text = "";
                            txt_hoten.Text = "";
                            txt_diachi.Text = "";
                            txt_dienthoai.Text = "";
                            txt_email.Text = "";
                        }
                    }
                }
                catch
                {
                    lbl_thongbao.Text = "Có lỗi trong quá trình thêm người dùng. Bạn vui lòng kiểm tra lại !";
                }
            }
            else
            {
                lbl_thongbao.Text = "Mật khẩu quá ngắn (< 6 kí tự)";
            }
        }
        Hienthinguoidung();
        Panel1.Visible = true;
        Panel2.Visible = false;
        txt_ten.Text = "";
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_nguoidung.PageIndex = e.NewPageIndex;
        Hienthinguoidung();
    }
    protected void grv_kpnguoidung_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_kqnguoidung.PageIndex = e.NewPageIndex;
        timnguoidungtheoten();
    }
    protected void bt_tim_Click(object sender, EventArgs e)
    {
        timnguoidungtheoten();
        Panel2.Visible = true;
        Panel1.Visible = false;
    }
    private void timnguoidungtheoten()
    {
        object[] objtim = new object[1];
        objtim[0] = txt_ten.Text;
        DataSet dskqnd = new DataSet();
        dskqnd = SupportDb.ReturnDataSet("timnguoidungtheoten", objtim);
        grv_kqnguoidung.DataSource = dskqnd;
        grv_kqnguoidung.DataBind();
    }
    protected void bt_tatca_Click(object sender, EventArgs e)
    {
        Hienthinguoidung();
        txt_ten.Text = "";
        Panel1.Visible = true;
        Panel2.Visible = false;
    }
    protected void bt_xoa_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_kqnguoidung.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check0");
            if (chk != null && chk.Checked)
            {
                int manguoidung1 = Convert.ToInt32(grv_kqnguoidung.DataKeys[row.RowIndex].Value);
                object[] objx = new object[1];
                objx[0] = manguoidung1;
                SupportDb.ExecuteProcdure("xoanguoidung", objx);
                lbl_thongbao.Text = "Xóa thành công !";
            }
        }
        Hienthinguoidung();
        Panel2.Visible = false;
        Panel1.Visible = true;
        txt_ten.Text = "";
    }
}