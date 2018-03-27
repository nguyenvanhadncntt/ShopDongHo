using System;
using System.Collections.Generic;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class ThongKeCachoadon : System.Web.UI.Page
    {
        SqlConnection sqlCnn;
        SqlDataAdapter sqlAdap;
        SqlCommand SqlCmd;
        DataTable dt;
        
        protected void Page_Load(object sender, EventArgs e)
        {
            ThongKeHoaDON();
        }
        void ThongKeHoaDON()
        {
            sqlCnn = new SqlConnection(@"Data Source=DESKTOP-899GKH5\THEHAPROK;Initial Catalog=phukiennu;Integrated Security=True");
            try
            {
                dt = new DataTable();
                sqlCnn.Open();
                sqlAdap = new SqlDataAdapter("select ct.*,h.Email from HOADON h join CHITIETDH ct on h.MaHD=ct.MaHD", sqlCnn);
                sqlAdap.Fill(dt);
                Report report = new Report();
                report.SetDataSource(dt);
                CrystalReportViewer1.ReportSource = report;
                CrystalReportViewer1.RefreshReport();
            }
            catch (Exception ex)
            {
                Response.Write("<script>alert('Bi loi du lieu. " + ex.Message + "')</script>");
            }
            finally
            {
                sqlCnn.Close();
                sqlAdap.Dispose();
            }
        }

    }
}