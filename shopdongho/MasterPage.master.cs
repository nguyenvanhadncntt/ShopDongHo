using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using ThuVien;
using System.Data;
using System.Data.SqlClient;
using System.Web.UI.WebControls;

public partial class MasterPage : System.Web.UI.MasterPage
{   
    protected void Page_Load(object sender, EventArgs e)
    {
       
        Control ctr = LoadControl(Request.ApplicationPath + "/Control/Left_Menu.ascx");
        lblMenuleft.Controls.Add(ctr);
        Control ctr2 = LoadControl(Request.ApplicationPath + "/Control/phukien.ascx");
        lbl_phukien.Controls.Add(ctr2);
        lblsl.Text =(string)Session["soluongsp"];
        lbltt.Text =(string) Session["thanhtoan"];
    }
    protected void btTimKiem_Click(object sender, EventArgs e)
    {
        
        Response.Redirect("TimKiemSanPham.aspx?tukhoa=" + txtTimKiem.Text);
        Session["tk"] = txtTimKiem.Text;
    }
    protected void DataList1_SelectedIndexChanged(object sender, EventArgs e)
    {

    }
    protected void bt_tim_Click(object sender, EventArgs e)
    {
        if (drp_gia.Text != "Chọn giá")
        {
            Response.Redirect("timsptheogia.aspx?tukhoa1=" + drp_gia.Text);
            Session["tk1"] = drp_gia.Text;
        }
       
    }
    protected void bt_dangnhap_Click(object sender, EventArgs e)
    {
        object[] obj = new object[2];
        obj[0] = txt_tendangnhap.Text;
        obj[1] = md5.hmweb_Encrypt("thuy", txt_matkhau.Text);
        DataSet dsuser = new DataSet();
        dsuser = SupportDb.ReturnDataSet("kiemtradangnhap", obj);
        if (dsuser.Tables[0].Rows.Count > 0)
        {
            DataRow dr = dsuser.Tables[0].Rows[0];
            lbl_thongbao.Visible = false;
            Session["taikhoan"] = txt_tendangnhap.Text;
            Session["manguoidung"] = dr["MANGUOIDUNG"].ToString();
            Session["quyen"] = dr["MAQUYEN"].ToString();
            Session["hoten"] = dr["HOTEN"].ToString();
            Session["diachi"] = dr["DIACHI"].ToString();
            Session["email"] = dr["EMAIL"].ToString();
            Session["sdt"] = dr["SDT"].ToString();
            Session["manguoidung"] = dr["MANGUOIDUNG"].ToString();
            if (Session["quyen"].ToString() != "1")
            {
                Response.Redirect("~/qlnguoidung.aspx");
            }
            else
            {
                if (Session["quyen"].ToString() != "2")
                    Response.Redirect("~/Admin/Quantri.aspx");
            }
        }
        else
        {
            lbl_thongbao.Visible = true;
            lbl_thongbao.Text = "xin vui lòng kiểm tra lại tài khoản và mật khẩu của bạn";
        }
    }
    protected void Bt_thoat_Click(object sender, EventArgs e)
    {
        Response.Redirect("TrangChu.aspx");
    }
}
