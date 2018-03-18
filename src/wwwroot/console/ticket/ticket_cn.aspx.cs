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

public partial class console_ticket_ticket_cn : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
   //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];

        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }

        if (!IsPostBack)
        {
            string str = "select * from FY_Config where id=1";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            FCKeditor.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ticketToday"].ToString());
            FCKeditor1.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["ticketEveryDay"].ToString());
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        string commandText = "update FY_Config set ticketToday='" + Sys.filterSQLStr(FCKeditor.Value) + "',ticketEveryDay='" + Sys.filterSQLStr(FCKeditor1.Value) + "' where id=1";
        int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
        if (count > 0)
        {
            scripthelp.AlertAndRedirect("机票更新成功!", "ticket_cn.aspx", this.Page);
        }
    }
}
