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

public partial class share_insertnewscomment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        string name = string.Empty;
        string comtcontent = Request.QueryString["comtcontent"].ToString();
        int type =int.Parse(Request.QueryString["type"].ToString());

        if (string.IsNullOrEmpty(comtcontent)
            || comtcontent.Length > 500
            )
        {
            Response.Write("评论内容不为空且长度不超500字符！");
            return;
        }
        int memberId = 0;

        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null)
        {
            Response.Write("请先登录后评论或选择匿名发表！");
            return;
        }
        else
        {
            memberId = int.Parse(Session["Mem_ID"].ToString());
            name = Session["Mem_LoginName"].ToString();
        }

        string str = "insert into FY_news_comment(newId,name,comtcontent,memberId) values ('" + id + "','" + name + "','" + comtcontent + "','" + memberId + "')";

        int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (count > 0)
        {
            Response.Write(true);
            return;
        }
        else
            Response.Write("评论失败!");
    }
}
