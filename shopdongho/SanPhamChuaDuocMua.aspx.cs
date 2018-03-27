using System;
using System.Collections.Generic;
using System.Data;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class SanPhamChuaDuocMua : System.Web.UI.Page
    {
        DataTable dt;
        protected void Page_Load(object sender, EventArgs e)
        {
            KetNoi kn = new KetNoi();
            dt = kn.loadDT("select * from SANPHAM s left join CHITIETDH ct on s.MaSP=ct.MaSP where ct.MaSP is null");
            Session["dt"] = dt;
            GridView1.DataSource = dt;
            GridView1.DataBind();
        }

        protected void GridView1_Sorting(object sender, GridViewSortEventArgs e)
        {
            if (ViewState["sort"] == null) ViewState["sort"] = "Asc";
            else if ((string)ViewState["sort"] == "Asc")
                ViewState["sort"] = "Desc";
            else
                ViewState["sort"] = "Asc";
            dt = (DataTable)Session["dt"];
            DataView dv = new DataView(dt);
            dv.Sort = e.SortExpression + " " + (string)ViewState["sort"];
            GridView1.DataSource = dv;
            GridView1.DataBind();
            dt = (DataTable)dv.ToTable();
            Session["dt"] = dt;
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