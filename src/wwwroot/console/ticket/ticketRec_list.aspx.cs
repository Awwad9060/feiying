using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class console_ticket_ticketRec_list : System.Web.UI.Page
{
    protected string rType = "今期特价推荐";
    protected void Page_Load(object sender, EventArgs e)
    {
         if (Request.QueryString["rType"] != null)
         {
             rType=Request.QueryString["rType"].ToString();
         }
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
        if (adminmerinfo == null)
        {

            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }
        else
        {
            if (adminmerinfo.Flag == 2)
            {
                btndel.Visible = false;
            }
        }
        if (!IsPostBack)
        {
            //获取列表
            GetShopNewslist();

        }
    }

    protected void GetShopNewslist()
    {

        DataSet ds = new DataSet();


        string str = @"select top 100 percent * from FY_Recommend where rType='" + rType+"' order by rId desc";

 

        SqlParameter[] parameters = {
                    new SqlParameter("@sql", SqlDbType.NVarChar,4000),
                    new SqlParameter("@currentpage", SqlDbType.Int),
                    new SqlParameter("@pagesize", SqlDbType.Int)};

        parameters[0].Value = str;
        parameters[1].Value = Pager.CurrentPageIndex;
        parameters[2].Value = Pager.PageSize;


        ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);


        Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);

        Pager.CustomInfoHTML = "&nbsp;第" + Pager.CurrentPageIndex.ToString() + "页/共" + Pager.PageCount.ToString() + "页 总记录数：" + Pager.RecordCount.ToString();

        rptshopnews.DataSource = ds.Tables[1];

        rptshopnews.DataBind();

    }

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        GetShopNewslist();
    }


    /// <summary>
    /// 删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btndel_Click(object sender, EventArgs e)
    {
        StringBuilder str = new StringBuilder();

        str.Append("delete from FY_Recommend where rId in (" + Request.Form["chk"] + ");");


        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);

        conn.Open();

        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {

                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                trans.Commit();
                scripthelp.AlertAndRedirect("操作成功！", "ticketRec_list.aspx?rType="+rType, this.Page);
            }
            catch
            {
                trans.Rollback();
                scripthelp.AlertAndRedirect("操作失败！", "ticketRec_list.aspx?rType=" + rType, this.Page);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
