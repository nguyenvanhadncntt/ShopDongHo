using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using ThuVien;

public partial class Admin_Quanlyquangcao : System.Web.UI.Page
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
            Hienthiquangcao();
    }
    private void Hienthiquangcao()
    {
        object[] obj0 = new object[0];
        DataSet dsqc = new DataSet();
        dsqc = SupportDb.ReturnDataSet("hienthiquangcao", obj0);
        grv_quangcao.DataSource = dsqc;
        grv_quangcao.DataBind();
    }
    protected void grv_nhomhang_PageIndexChanging(object sender, GridViewPageEventArgs e)
    {
        grv_quangcao.PageIndex = e.NewPageIndex;
        Hienthiquangcao();
    }
    protected void btDelete_Click(object sender, EventArgs e)
    {
        foreach (GridViewRow row in grv_quangcao.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int maqc = Convert.ToInt32(grv_quangcao.DataKeys[row.RowIndex].Value);
                object[] obj1 = new object[1];
                obj1[0] = maqc;
                SupportDb.ExecuteProcdure("xoaquangcao", obj1);
                lbl_thongbao.Text = "Xóa thành công !";
            }
        }
        Hienthiquangcao();
    }
    protected void bt_sua_Click(object sender, EventArgs e)
    {
        string tencongty = "";
        string diachi = "";      
        string sdt = "";
        string email = "";       
        foreach (GridViewRow row in grv_quangcao.Rows)
        {
            CheckBox chk = (CheckBox)row.FindControl("chk_Check");
            if (chk != null && chk.Checked)
            {
                int maquangcao = Convert.ToInt32(grv_quangcao.DataKeys[row.RowIndex].Value);
                Session["maquangcao"] = maquangcao;
                object[] obj3 = new object[1];
                obj3[0] = maquangcao;
                DataSet dsqc = new DataSet();
                dsqc = SupportDb.ReturnDataSet("timquangcaotheoma", obj3);
                for (int i = 0; i < dsqc.Tables[0].Rows.Count; i++)
                {
                    DataRow dr = dsqc.Tables[0].Rows[i];                  
                    tencongty = dr["TENCONGTY"].ToString();
                    diachi = dr["DIACHI"].ToString();                   
                    sdt = dr["SDT"].ToString();
                    email = dr["EMAIL"].ToString();                   
                }
            }
        }
        txt_tencongty.Text = tencongty;
        txt_diachi.Text = diachi;
        txt_sdt.Text = sdt;
        txt_email.Text = email;
        bt_capnhat.Visible = true;
        lbl_thongbao.Text = "";
        ful_anhquangcao.Enabled = false;
        bt_them.Enabled = false;
        Hienthiquangcao();
    }
    protected void bt_capnhat_Click(object sender, EventArgs e)
    {
        object[] obj4 = new object[5];
        obj4[0] = Session["maquangcao"];
        obj4[1] = txt_tencongty.Text;
        obj4[2] = txt_diachi.Text;
        obj4[3] = txt_sdt.Text;
        obj4[4] = txt_email.Text;      
        SupportDb.ExecuteProcdure("capnhatquangcao", obj4);
        lbl_thongbao.Text = "Cập nhật thành công !";
        txt_tencongty.Text = "";
        txt_diachi.Text = "";
        txt_sdt.Text = "";
        txt_email.Text = "";
        ful_anhquangcao.Enabled = true;
        bt_them.Enabled = true;
        bt_capnhat.Visible = false;
        Hienthiquangcao();
    }
    protected void bt_them_Click(object sender, EventArgs e)
    {
        string strpath = "../images/quangcao/";
        ful_anhquangcao.SaveAs(Server.MapPath("../images/quangcao/") + ful_anhquangcao.FileName);
        object[] obj1 = new object[5];
        obj1[0] = txt_tencongty.Text;
        obj1[1] = txt_diachi.Text;
        obj1[2] = txt_sdt.Text;
        obj1[3] = txt_email.Text;
        obj1[4] = strpath.Substring(3) + ful_anhquangcao.FileName; 
        SupportDb.ExecuteProcdure("themquangcao", obj1);
        lbl_thongbao.Text = "Thêm thành công !";
        Hienthiquangcao();
    }
}