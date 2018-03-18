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

public partial class share_airportcomment : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        int id = int.Parse(Request.QueryString["id"].ToString());

        DataTable dtc = getNewsComment(id);
        if (dtc == null || dtc.Rows.Count == 0)
        {
            this.panCommentn.Visible = true;
            this.panCommenty.Visible = false;
        }
        else
        {
            this.panCommentn.Visible = false;
            this.panCommenty.Visible = true;
        }
        this.repNewsComment.DataSource = dtc;
        this.repNewsComment.DataBind();
    }

    /// <summary>
    /// 获取评论
    /// </summary>
    /// <param name="newId"></param>
    /// <returns></returns>
    protected DataTable getNewsComment(int airportId)
    {
        string str = "select FY_Airport_comment.*,(case when tmember.mem_type is null then '飞瀛使者' else tmember.mem_type end) as mem_type,(case when memberId<>0 then tmember.Mem_LoginName else '飞瀛使者' end ) as loginname from FY_Airport_comment left join tmember on FY_Airport_comment.memberId=tmember.Mem_ID  where airportId=" + airportId + " order by addtime desc";

        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);

        if (ds == null)
            return null;

        return ds.Tables[0];
    }
}
