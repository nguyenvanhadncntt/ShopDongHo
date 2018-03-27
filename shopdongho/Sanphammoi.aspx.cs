using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Data;
using System.Data.SqlClient;
using ThuVien;
using System.Configuration;
public partial class Sanphammoi : System.Web.UI.Page
{
    string connectString = ConfigurationSettings.AppSettings["constr"];
    SqlConnection sqlcon;
    SqlDataAdapter adapter;
    ASP.global_asax m = new ASP.global_asax();
    DataTable objDT;
    DataRow objDR;
    protected void Page_Load(object sender, EventArgs e)
    {
        Phantrang();
        Session["sl"] = "";
        if ((DataTable)Session["Cart"] == null) MakeCart();
    }
    private void Phantrang()
    {
        objDT = new DataTable();
        sqlcon = new SqlConnection(connectString);
        adapter = new SqlDataAdapter("hienthisanphammoi", sqlcon);
        adapter.Fill(objDT);
        CollectionPager1.PageSize = 8;
        CollectionPager1.DataSource = objDT.DefaultView;
        CollectionPager1.BindToControl = DataList3;
        DataList3.DataSource = CollectionPager1.DataSourcePaged;
    }
    void MakeCart()
    {
        objDT = new DataTable();
        objDT.Columns.Add("TENSP", System.Type.GetType("System.String"));
        objDT.Columns.Add("ANHSP", System.Type.GetType("System.String"));
        objDT.Columns.Add("DONGIA", System.Type.GetType("System.Double"));
        objDT.Columns.Add("SOLUONGSP", System.Type.GetType("System.Int32"));
        objDT.Columns.Add("THANHTIEN", System.Type.GetType("System.Double"));
        objDT.Columns.Add("MASP", System.Type.GetType("System.Int32"));
        Session["Cart"] = objDT;
    }
    void themhangvaogio(DataRow x)
    {
        objDT = (DataTable)Session["Cart"];
        for (int i = 0; i < objDT.Rows.Count; i++)
            if ((String)objDT.Rows[i]["TENSP"] == (String)x["TENSP"])
            {
                Double dongia = (Double)objDT.Rows[i]["DONGIA"];
                if ((Int32)(objDT.Rows[i]["SOLUONGSP"]) > 3)
                {
                    objDT.Rows[i]["DONGIA"] = dongia - 0.3;
                    objDT.Rows[i]["THANHTIEN"] = (Int32)objDT.Rows[i]["SOLUONGSP"] * (Double)objDT.Rows[i]["DONGIA"];
                }
            }
        bool themmoi = true;
        for (int i = 0; i < objDT.Rows.Count; i++)
            if ((String)objDT.Rows[i]["TENSP"] == (String)x["TENSP"])
            {
                objDT.Rows[i]["SOLUONGSP"] = (Int32)objDT.Rows[i]["SOLUONGSP"] + 1;
                objDT.Rows[i]["THANHTIEN"] = (Int32)objDT.Rows[i]["SOLUONGSP"] * (Double)objDT.Rows[i]["DONGIA"];
                themmoi = false;
            }
        if (themmoi == true)
        {
            if (((Int32)x["SOLUONG"]).ToString() != "0")
            {
                objDR = objDT.NewRow();
                objDR["TENSP"] = (string)x["TENSP"];
                objDR["ANHSP"] = (string)x["ANHSP"];
                objDR["DONGIA"] = (Double)x["DONGIA"];
                objDR["SOLUONGSP"] = 1;
                objDR["THANHTIEN"] = (Double)x["DONGIA"];
                objDR["MASP"] = (Int32)x["MASP"];
                objDT.Rows.Add(objDR);
            }
            else Response.Redirect("~/Thongbaosoluong.aspx");
        }
        Session["Cart"] = objDT;
    }
    protected void btMua_Click(object sender, EventArgs e)
    {
        Button x = (Button)sender;
        objDR = m.DR("select * from SANPHAM where MASP = " + x.CommandArgument.ToString());
        themhangvaogio(objDR);
        string url = "Giohang.aspx";
        Response.Redirect(url); 
    }
    protected void bt_chitiet_Click(object sender, EventArgs e)
    {
        Button b = (Button)sender;
        DataRow x = m.DR("select * from SANPHAM where MASP = " + b.CommandArgument.ToString());
        Session["DR"] = x;
        Response.Redirect("Chitietsp.aspx");
    }
}