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


public partial class leave_box : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

            string str = "insert into FY_LeaveMessage(title,lType,contact,telephone,content,email,addTime) values('" + Request.QueryString["title"].ToString() + "','" + Request.QueryString["lType"].ToString() + "','" + Request.QueryString["contact"].ToString() + "','" + Request.QueryString["telephone"].ToString() + "','" + Request.QueryString["content"].ToString() + "','" + Request.QueryString["email"].ToString() + "',getdate())";

            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("1");
            }
            else
            {
                Response.Write("0");
            }
    }
}
