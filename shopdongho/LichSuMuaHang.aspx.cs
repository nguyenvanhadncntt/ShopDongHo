using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class LichSuMuaHang : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            dt = kn.loadDT("select TenSP,t.SOLUONG,NgayDat,t.DONGIA from HOADON h join CHITIETDH t on h.MaHD = t.MaHD join SANPHAM n on t.MaSP = n.MaSP where Email = '" + Session["email"] + "'");
            Session["dt"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }



        protected void GridView1_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            dt = (DataTable)Session["dt"];
            int pageIndex = e.NewPageIndex;
            GridView1.DataSource = dt;
            if (pageIndex >= 0)
                GridView1.PageIndex = pageIndex;
            GridView1.DataBind();
        }
    }
}