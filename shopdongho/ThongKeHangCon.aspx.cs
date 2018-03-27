using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace ShopDongHo
{
    public partial class ThongKeHangCon : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {

        }

        protected void bt_tatca_Click(object sender, EventArgs e)
        {
       
            Panel1.Visible = true;
           // Hienthihangcon();
            Panel2.Visible = false;
            //bt_tatca.Visible = false;
        
    }
    }
}