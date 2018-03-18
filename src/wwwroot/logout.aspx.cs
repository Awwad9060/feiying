using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

public partial class logout : System.Web.UI.Page
{
    string url = "index.aspx";
    protected void Page_Load(object sender, EventArgs e)
    {
        Session.Remove("Mem_LoginName");
        Session.Remove("Mem_ID");
        Session.Remove("Mem_Money");
        Session.Remove("Mem_pic");
        Session.Remove("Mem_type");

        Session.Abandon();
        if (Request.QueryString["url"] != null && Request.QueryString["url"].ToString() != "")
            url = Server.UrlDecode(Request.QueryString["url"].ToString());

        Response.Redirect(url);
    }
}