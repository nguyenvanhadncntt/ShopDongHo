using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class ThuongHieu : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            loadDL((String)Request.QueryString["mn"]);
        }
        public void loadDL(String str)
        {
            KetNoi kn = new KetNoi();
            kn.loadDT("select * from SANPHAM s join NHOMHANG n on s.MaNH=n.MANH where TenSP like '%" + str + "%'");
            DataList1.DataSource = kn.loadDT("select * from SANPHAM s join NHOMHANG n on s.MaNH=n.MANH where n.MANH ='" + str + "'");
            DataList1.DataBind();
        }

        protected void kick_Click(object sender, EventArgs e)
        {

        }
    }
}