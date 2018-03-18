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
using eap.share;

public partial class share_ticketbook : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "insert into FY_TicketBook1(contact,telephone,otherWay,require,state,[content]) values('" + Server.UrlDecode(Request.QueryString["contact"].ToString()) + "','" + Server.UrlDecode(Request.QueryString["telephone"].ToString()) + "','" + Server.UrlDecode(Request.QueryString["otherWay"].ToString()) + "','" + Server.UrlDecode(Request.QueryString["req"].ToString()) + "','Î´´¦Àí','" + Server.UrlDecode(Request.QueryString["content"].ToString()) + "')";
        int inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
        if (inserttag > 0) Response.Write("1"); else Response.Write("0");
    }
}