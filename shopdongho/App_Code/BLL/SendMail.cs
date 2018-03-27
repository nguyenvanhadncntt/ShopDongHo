using System;
using System.Data;
using System.Configuration;
using System.Linq;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml.Linq;
using System.Net.Mail;
using System.Net;

/// <summary>
/// Summary description for SendMail
/// </summary>
public class SendMail
{
	public SendMail()
	{
		//
		// TODO: Add constructor logic here
		//
	}
    string smtpServer = "smtp.gmail.com";
    int smtpPort = 587;
    string mailFrom = "";
    string mailUser = "";
    string mailPass = "";

    public SendMail(string user, string password)
    {
        mailFrom = user;
        mailUser = user;
        mailPass = password;
    }

    public bool GuiThu(string tieuDe, string mailBody, string mailTo)
    {
        try
        {
            MailMessage mailMessage = new MailMessage();
            SmtpClient mailClient = new SmtpClient(smtpServer, smtpPort);
            mailClient.Timeout = 15000;
            mailClient.Credentials = new NetworkCredential(mailUser, mailPass);
            mailClient.EnableSsl = true;


            mailMessage.IsBodyHtml = true;
            mailMessage.From = new MailAddress(mailFrom);
            mailMessage.Subject = tieuDe;
            mailMessage.Body = mailBody;
            mailMessage.To.Add(mailTo);
            mailClient.Send(mailMessage);
            return true;

        }
        catch
        {
            return false;
        }

    }
}
