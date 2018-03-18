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
public partial class console_state_HotelCity_list : System.Web.UI.Page
{
    int bigId = 0;
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

        if (Request.QueryString["bId"] != null && Convert.ToInt32(Request.QueryString["bId"]) != 0)
        {
            bigId = Convert.ToInt32(Request.QueryString["bId"]);
        }
        if (!IsPostBack)
        {
            GetEntlist(bigId); ;
        }

    }

    /// <summary>
    /// 获取酒店城市信息列表
    /// </summary>
    protected void GetEntlist(int bigId)
    {
        DataSet ds = new DataSet();
        string str = "select a.*,b.chName as stateName from FY_HotelCity as a  left join FY_State as b on a.sId =b.sId where 1=1";

        if (bigId != 0)
        {
            str += " and a.sId=" + bigId;
        }

        if (this.txttypeName.Value.Trim() != "")
        {
            str += " and a.chName like '%" + this.txttypeName.Value.Trim() + "%' ";
        }
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
        this.GetEntlist(bigId);
    }

    //查询事件
    protected void btnSelect_Click(object sender, EventArgs e)
    {
        this.GetEntlist(bigId);
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
            return str_name = " <a href='HotelCity_add.aspx?id=" + Id + "'>编辑</a>";

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

        str.Append("delete from FY_HotelCity where tId in (" + Request.Form["chk"] + ")");
        
        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);
        conn.Open();

        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {
                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                trans.Commit();
                scripthelp.AlertAndRedirect("删除酒店城市信息成功!", "HotelCity_list.aspx", this.Page);
               
            }
            catch
            {
                trans.Rollback();
               
                scripthelp.Alert("删除酒店城市信息失败!", this.Page);
                
            }
            finally
            {
                conn.Close();
            }
        }
    }

}
