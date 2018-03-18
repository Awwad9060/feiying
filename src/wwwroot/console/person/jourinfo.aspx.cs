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

public partial class cms_person_jourinfo : System.Web.UI.Page 
{

    static int aId = 0;

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
            //初始化页面
            if (Request.QueryString["aId"] != null)
            {
                aId = Convert.ToInt32(Request.QueryString["aId"].ToString());
                string str = "select * from FY_member_article where aId=" + aId;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                title.Value = ds.Tables[0].Rows[0]["title"].ToString();
                type.Value = ds.Tables[0].Rows[0]["typeId"].ToString();
                FCKeditor1.Value = ds.Tables[0].Rows[0]["content"].ToString();

                this.lblTitle.Text = "会员文章信息";
            }
        }
    }
}
