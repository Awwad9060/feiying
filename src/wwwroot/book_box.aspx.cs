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

public partial class book_box : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        string str = "insert into FY_TicketBook(title,tId,contact,telephone,harryGrade,num,tripDate,backDate,otherMess,state,bookDate) values('" + Request.QueryString["title"].ToString() + "','" + Request.QueryString["tId"].ToString() + "','" + Request.QueryString["contact"].ToString() + "','" + Request.QueryString["telephone"].ToString() + "','" + Request.QueryString["harryGrade"].ToString() + "','" + Request.QueryString["num"].ToString() + "','" + Request.QueryString["tripDate"].ToString() + "','" + Request.QueryString["backDate"].ToString() + "','" + Request.QueryString["otherMess"].ToString() + "','Î´´¦Àí',getdate())";
        int inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
        if (inserttag > 0) Response.Write("1"); else Response.Write("0");
    }
}