using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Data;
using System.Data.SqlClient;
using ThuVien;
using System.Web.UI.WebControls;

public partial class Quenmatkhau : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {

    }
    public DataTable LayDuLieu2()
    {
        string constr = "Data Source=(local);Initial Catalog=Thoitrangnu;User ID=sa;Password=123";
        SqlConnection con = new SqlConnection();
        SqlCommand cmd = new SqlCommand();
        con.ConnectionString = constr;
        con.Open();
        cmd.Connection = con;
        SqlDataAdapter adapter = new SqlDataAdapter("select * from NGUOIDUNG where TENDANGNHAP ='" + txt_tendangnhap.Text + "'", constr);
        DataTable dt = new DataTable();
        adapter.Fill(dt);
        return dt;
    }
    protected void Button1_Click(object sender, EventArgs e)
    {
        
            try
            {
                object[] obj = new object[2];
                obj[0] = txt_tendangnhap.Text;
                obj[1] = txt_email.Text;
                DataSet mk = new DataSet();
                mk = SupportDb.ReturnDataSet("laymatkhau", obj);
                if (mk.Tables[0].Rows.Count > 0)
                {
                    SupportDb.BindFromDataSetToCombo(mk, drp_matkhau, "MATKHAU", "MATKHAU");
                }
                lbl_thongbao.Text = "Mật khẩu của bạn là: ";
                string str = md5.hmweb_Decrypt("thuy",drp_matkhau.SelectedValue.ToString());
                lbl_matkhau.Text = str;
                hp1.Visible = true;
            }
            catch
            {
                lbl_thongbao.Text = "Tên đăng nhập hoặc email của bạn không đúng!";
            }
        
    }
}