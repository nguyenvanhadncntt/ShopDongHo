using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo.Controls
{
    public partial class QUANGCAO : System.Web.UI.UserControl
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
                KetNoi kn = new KetNoi();
                GridView1.DataSource = kn.loadDT("select ANHQUANGCAO from QUANGCAO");
                GridView1.DataBind();
            }
            catch(Exception e)
            {
                error.Text = e.StackTrace;
            }
        }
    }
}