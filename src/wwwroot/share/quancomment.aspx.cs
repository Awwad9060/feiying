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

public partial class share_quancomment : System.Web.UI.Page
{
    public DataRow quanDetailOne = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        int id= int.Parse(Request.QueryString["id"].ToString());

        quanDetailOne = getQuanDetai(id);

        DataTable dtc = getArtComment(id);
        if (dtc == null || dtc.Rows.Count == 0)
            this.panCommentn.Visible = true;
        else
            this.panCommentn.Visible = false;
        this.repArtComment.DataSource = dtc;
        this.repArtComment.DataBind();
    }

    #region
    protected DataRow getQuanDetai(int aId)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select * from FY_member_article left join tmember on FY_member_article.publishName=tmember.Mem_LoginName where aId=" + aId;

        try
        {
            ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                row = ds.Tables[0].Rows[0];
                ds.Dispose();
            }
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return row;
    }
    #endregion

    /// <summary>
    /// 获取文章评论
    /// </summary>
    /// <param name="newId"></param>
    /// <returns></returns>
    protected DataTable getArtComment(int artId)
    {
        string str = "select FY_member_article_comment.*,(case when tmember.mem_type is null then '飞瀛使者' else tmember.mem_type end) as mem_type,(case when memberId<>0 then tmember.Mem_LoginName else '匿名发表' end ) as loginname from FY_member_article_comment left join tmember on FY_member_article_comment.memberId=tmember.Mem_ID  where artId=" + artId + " order by addtime desc";

        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);

        if (ds == null)
            return null;

        return ds.Tables[0];
    }
}
