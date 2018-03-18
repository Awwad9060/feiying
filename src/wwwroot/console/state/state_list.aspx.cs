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

public partial class console_state_state_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/login.aspx", true);
        }
        else
        {
            if (adminmerinfo.Flag == 2)
            {
                btndel.Visible = false;
                add.Visible = false;
            }
        }
        if (!IsPostBack)
        {
            GetEntlist(); ;
        }

    }

    /// <summary>
    /// 获取天霸知道类别信息列表
    /// </summary>
    protected void GetEntlist()
    {
        DataSet ds = new DataSet();
        string str = "select * from FY_State where 1=1";
        SqlParameter[] parameters = {
                                new SqlParameter("@sql", SqlDbType.NVarChar,40000),
                                new SqlParameter("@currentpage", SqlDbType.Int),
                                new SqlParameter("@pagesize", SqlDbType.Int)};
        parameters[0].Value = str;
        parameters[1].Value = this.Pager.CurrentPageIndex;
        parameters[2].Value = this.Pager.PageSize;
        ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);
        this.dgList.DataSource = ds.Tables[1];
        this.Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);
        this.Pager.CustomInfoHTML = "&nbsp;第" + this.Pager.CurrentPageIndex.ToString() + "页/共" + this.Pager.PageCount.ToString() + "页 总记录数：" + this.Pager.RecordCount.ToString();
        this.dgList.DataBind();
    }

    //更改页面事件
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        this.Pager.CurrentPageIndex = this.Pager.StartRecordIndex / this.Pager.PageSize + 1;
        this.GetEntlist();
    }

    //查询事件
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        this.GetEntlist();
    }

    /// <summary>
    /// 设置针对“编辑”，“删除”的操作
    /// </summary>
    /// <param name="bs"></param>
    /// <param name="internId"></param>
    /// <returns></returns>
    public string Operator_State(int Id)
    {
        string str_name = "";

        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];

        if (adminmerinfo.Flag == 2)
        {
            return str_name = "无权限";
        }
        else
        {
            return str_name = " <a href='state_add.aspx?id=" + Id + "'>编辑</a>";

        }

    }

    /// <summary>
    /// 删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btndel_Click(object sender, EventArgs e)
    {
        StringBuilder str = new StringBuilder();
        str.Append("delete from FY_State where sId in (" + Request.Form["chk"] + ")");
        str.Append("delete from FY_FromCity where sId in (" + Request.Form["chk"] + ")");
        str.Append("delete from FY_ToCity where sId in (" + Request.Form["chk"] + ")");

        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);
        conn.Open();
        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {
                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                trans.Commit();
                scripthelp.AlertAndRedirect("删除大洲信息成功!", "state_list.aspx", this.Page);
            }
            catch
            {
                trans.Rollback();
                scripthelp.AlertAndRedirect("删除大洲信息失败!", "state_list.aspx", this.Page);
            }
            finally
            {
                conn.Close();
            }
        }
    }

}
