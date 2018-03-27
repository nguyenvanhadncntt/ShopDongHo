using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo.Controls
{
    public partial class DS_TH : System.Web.UI.UserControl
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                loadGV();
            }
        }
        public void loadGV()
        {
            try
            {
                KetNoi k = new KetNoi();
                GridView1.DataSource = k.loadDT("select * from NHOMHANG");
                GridView1.DataBind();
            }
            catch (Exception e)
            {
                //error.Text = e.StackTrace;
            }
        }

    }
}