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

public partial class share_insertquancomment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"].ToString());
        string comtcontent = Request.QueryString["comtcontent"].ToString();

        if (string.IsNullOrEmpty(comtcontent))
        {
            Response.Write("请输入评论内容！");
            return;
        }
        else if (comtcontent.Length > 500)
        {
            Response.Write("评论内容最多为500字符！");
            return;
        }

        int memberId = 0;

        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null)
        {
            Response.Write("请先登录后评论！");
            return;
        }
        else
            memberId = int.Parse(Session["Mem_ID"].ToString());

        string str = "insert into FY_member_article_comment(artId,comtcontent,memberId) values ('" + id + "','" + comtcontent + "','" + memberId + "')";

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
