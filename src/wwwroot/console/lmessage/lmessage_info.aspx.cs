using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Text;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class console_lmessage_lmessage_info : System.Web.UI.Page
{

    static int id = 0;

    protected string tId = string.Empty;

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
            if (Request.QueryString["id"] == null)
            {
                Response.Redirect("~/console/login.aspx", true);
                return;
            }

            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            string str = "select * from FY_LeaveMessage  where lId=" + id;
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            title.Value = ds.Tables[0].Rows[0]["title"].ToString();
            this.lType.Value = ds.Tables[0].Rows[0]["lType"].ToString();
            this.contact.Value = ds.Tables[0].Rows[0]["contact"].ToString();
            telephone.Value = ds.Tables[0].Rows[0]["telephone"].ToString();
            content.Value = ds.Tables[0].Rows[0]["content"].ToString();
            eMail.Value = ds.Tables[0].Rows[0]["email"].ToString();
            addtime.Value = ds.Tables[0].Rows[0]["addTime"].ToString();
        }
    }
}
