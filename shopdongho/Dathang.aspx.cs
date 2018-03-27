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
    public partial class DatHang : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            try
            {
                KetNoi kn = new KetNoi();
                DataTable dt = (DataTable)Session["Cart"];
                SqlDataReader read = kn.getReader("select Max(MaHD) as MaDH from HOADON");
                int mhd;
               
                read.Read();
                if (read["MaDH"].ToString() == "")
                {
                    mhd = 1;
                }else
                mhd = int.Parse(read["MaDH"].ToString()) + 1;
                kn.updateDonHang("" + mhd, Session["email"].ToString(), Session["diachi"].ToString());
                for (int i = 0; i < dt.Rows.Count; i++)
                {
                    kn.upadateChiTietDonHang("" + mhd, dt.Rows[i]["MaSP"].ToString(), int.Parse(dt.Rows[i]["SOLUONGSP"].ToString()), int.Parse(dt.Rows[i]["DONGIA"].ToString()));
                   
                }
     
            }
            catch (Exception ex)
            {
                Response.Write(ex.Message);

            }
        }
    }
}