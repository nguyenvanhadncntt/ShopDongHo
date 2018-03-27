using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.SessionState;

namespace ShopDongHo
{
    public class Global : System.Web.HttpApplication
    {

        protected void Application_Start(object sender, EventArgs e)
        {

        }

        protected void Session_Start(object sender, EventArgs e)
        {
            Session["quyen"] = 0;
            Session["ten"] = "";
            Session["email"] = "";
            Session["gioitinh"] = -1;
            Session["diachi"] = "";
            Session["matkhau"] = "";
            Session["sdt"] = "";
            Session["image"] = "";
            Session["sl"] = 0;
            Session["tonggia"] = 0;
            Session["Cart"] = null;
        }

        protected void Application_BeginRequest(object sender, EventArgs e)
        {

        }

        protected void Application_AuthenticateRequest(object sender, EventArgs e)
        {

        }

        protected void Application_Error(object sender, EventArgs e)
        {

        }

        protected void Session_End(object sender, EventArgs e)
        {

        }

        protected void Application_End(object sender, EventArgs e)
        {

        }
    }
}