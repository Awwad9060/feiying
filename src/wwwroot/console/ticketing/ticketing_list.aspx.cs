using System;
using System.Data;
using System.IO;
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

public partial class console_ticketing_ticketing_list : System.Web.UI.Page
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
        else
        {
            if (adminmerinfo.Flag == 2)
            {
                btndel.Visible = false;
            }
        }

        //获取电子票列表
        GetTicketinglist();
    }
    
    /// <summary>
    /// 获取电子票列表
    /// </summary>
    protected void GetTicketinglist()
    {
        DataSet ds = new DataSet();
        string str = @"select top 100 percent *  from FY_ticketing where ticketingId<>'' and ticketingId is not null ";
        if (txtsearch.Value.Trim() != "")
        {
            str += " and ticketingId like '%" + txtsearch.Value.Trim() + "%'";
        }

        str += " order by addtime desc";

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
        GetTicketinglist();
    }

    /// <summary>
    /// 根据条件来查询
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        GetTicketinglist();
    }

    /// <summary>
    /// 获取用户名
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    private DataTable getFilePath(string id)
    {
        string str = "select ticketingPath from FY_ticketing where cId in (" + Request.Form["chk"] + ");";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

        return dt;
    }

    /// <summary>
    /// 删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btndel_Click(object sender, EventArgs e)
    {
        //获取文件
        DataTable fdt = getFilePath(Request.Form["chk"]);

        string str = "update  FY_ticketing set ticketingId='',ticketingPath='',ticketingState=0,ticketingNumber=0,ticketingJifen=0  where cId in (" + Request.Form["chk"] + ");";
        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_select);
        conn.Open();
        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {

                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str);
                trans.Commit();

                if (fdt != null && fdt.Rows.Count != 0)
                    foreach (DataRow dr in fdt.Rows)
                    {
                        string FilePath = dr["ticketingPath"].ToString();
                        //删除文件
                        if (File.Exists(Server.MapPath("/"+FilePath)))
                            File.Delete(Server.MapPath("/"+FilePath));
                    }

                scripthelp.AlertAndRedirect("操作成功！", "ticketing_list.aspx", this.Page);
            }
            catch
            {
                trans.Rollback();
                scripthelp.AlertAndRedirect("操作失败！", "ticketing_list.aspx", this.Page);
            }
            finally
            {
                conn.Close();
            }
        }
    }
}
