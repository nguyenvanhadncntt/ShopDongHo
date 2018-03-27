using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Admin_Quanlynhomhang : System.Web.UI.Page
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
        Hienthinhomhang();
        object[] objlh = new object[0];
        DataSet dsloaihang = new DataSet();
        dsloaihang = SupportDb.ReturnDataSet("hienthiloaihang", objlh);
        if (dsloaihang.Tables[0].Rows.Count > 0)
        {            
            SupportDb.BindFromDataSetToCombo(dsloaihang, drp_loaihang, "MALOAI", "TENLOAI");
        }
    }
    private void Hienthinhomhang()
    {
        object[] obj0 = new object[0];
        DataSet ds = new DataSet();
        ds = SupportDb.ReturnDataSet("hienthinhomhang", obj0);
        grv_nhomhang.DataSource = ds;
        grv_nhomhang.DataBind();
    }
    protected void btDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_nhomhang.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {               
                int manhom = Convert.ToInt32(grv_nhomhang.DataKeys[row.RowIndex].Value);
                object[] obj1 = new object[1];
                obj1[0] = manhom;
                SupportDb.ExecuteProcdure("xoanhomhang", obj1);
                lbl_thanhcong.Text = "Xóa nhóm hàng thành công !";
            }
        }
        Hienthinhomhang();
    }
    protected void bt_them_Click(object sender, EventArgs e)
    {
        object[] obj1 = new object[2];
        obj1[0] = txt_tennhomhang.Text;
        obj1[1] = Convert.ToInt32(drp_loaihang.SelectedValue);
        SupportDb.ExecuteProcdure("themnhomhang", obj1);
        lbl_thanhcong.Text = "Thêm nhóm hàng thành công !";
        txt_tennhomhang.Text = "";
        Hienthinhomhang();
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_nhomhang.PageIndex = e.NewPageIndex;
        Hienthinhomhang();
    }
    protected void bt_sua_Click(object sender, EventArgs e)
    {
        string mnh = "";
        string maloai = "";
        string tennhom = "";
        foreach (GridViewRow row in grv_nhomhang.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int manhom = Convert.ToInt32(grv_nhomhang.DataKeys[row.RowIndex].Value);
                Session["manhomh"] = manhom;
                object[] obj3 = new object[1];
                obj3[0] = manhom;
                DataSet dsnhm = new DataSet();
                dsnhm = SupportDb.ReturnDataSet("timnhomhangtheoma", obj3);
                for (int i = 0; i < dsnhm.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = dsnhm.Tables[0].Rows[i];
                    mnh = dr["MANH"].ToString();
                    maloai = dr["MALOAI"].ToString();
                    tennhom = dr["TENNH"].ToString();                    
                }
            }
        }      
        txt_tennhomhang.Text = tennhom;
        drp_loaihang.SelectedValue = maloai;
        bt_capnhat.Visible = true;
        lbl_thanhcong.Text = "";
        Hienthinhomhang();
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        object[] obj4 = new object[3];        
        obj4[0] = Session["manhomh"];
        obj4[1] = txt_tennhomhang.Text;
        obj4[2] =  Convert.ToInt32(drp_loaihang.SelectedValue);
        SupportDb.ExecuteProcdure("capnhatnhomhang", obj4);
        lbl_thanhcong.Text = "Cập nhật thành công !";       
        txt_tennhomhang.Text = "";
        Hienthinhomhang();
    }
}