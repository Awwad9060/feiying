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

public partial class console_works_works_list : System.Web.UI.Page
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

        //获取新闻资讯列表
        GetShopNewslist();
    }

    /// <summary>
    /// 获取资讯新闻列表
    /// </summary>
    protected void GetShopNewslist()
    {

        DataSet ds = new DataSet();


        string str = @"select top 100 percent * from FY_news where 1=1 ";

        if (txtsearch.Value.Trim() != "")
        {
            str += " and title like '%" + txtsearch.Value.Trim() + "%'";
        }

        if (Select1.Value.Trim()!= "")
        {
            str += " and type="+Convert.ToInt32(Select1.Value.Trim())+" ";
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
        GetShopNewslist();
    }

    /// <summary>
    /// 根据条件来查询
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        GetShopNewslist();
    }

    /// <summary>
    /// 设置置顶状态标记
    /// </summary>
    /// <param name="bs"></param>
    /// <returns></returns>
    public string Check_stat(int bs)
    {
        string str_name = "";
        if (bs == 1)
        {
            str_name = "<span style='color:#66cc00'>焦点新闻</span>";
        }
        else
        {
            str_name = "<span style='color:#fe6500'>无</span>";

        }
        return str_name;
    }

    /// <summary>
    /// 设置类型
    /// </summary>
    /// <param name="bs"></param>
    /// <returns></returns>
    public string Type_stat(int bs)
    {
        

        string str_name = "";
        if (bs == 1)
        {
            str_name = "<span style='color:#66cc00'>旅游资讯</span>";

        }
        else if (bs == 2)
        {
            str_name = "<span style='color:#66cc00'>民航新闻</span>";

        }
        else if (bs ==3)
        {
            str_name = "<span style='color:#66cc00'>业界动态</span>";

        }
        else if (bs ==4)
        {
            str_name = "<span style='color:#66cc00'>机场新闻</span>";

        }

        else if (bs ==5)
        {
            str_name = "<span style='color:#66cc00'>出行智囊</span>";

        }
        else if (bs == 6)
        {
            str_name = "<span style='color:#66cc00'>旅行日记</span>";

        }
        else if (bs == 7)
        {
            str_name = "<span style='color:#66cc00'>酒店快讯</span>";
        }
        else if (bs == 8)
        {
            str_name = "<span style='color:#66cc00'>航空快讯</span>";

        }

        return str_name;
    }

    /// <summary>
    /// 设置推荐状态标记
    /// </summary>
    /// <param name="bs"></param>
    /// <returns></returns>
    public string Recom_stat(int bs)
    {
        string str_name = "";
        if (bs == 1)
        {
            str_name = "<span style='color:#66cc00'>封面新闻</span>";

        }
        else
        {
            str_name = "<span style='color:#fe6500'>无</span>";

        }
        return str_name;
    }

    /// <summary>
    /// 对所选择的项进行置顶
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btncheck_Click(object sender, EventArgs e)
    {
        string str = "update FY_news set isTop=1 where id in (" + Request.Form["chk"] + ")";

        int chktag = 0;

        chktag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (chktag > 0)
            scripthelp.AlertAndRedirect("操作成功！", "news_list.aspx", this.Page);
        else
            scripthelp.AlertAndRedirect("操作失败！", "news_list.aspx", this.Page);

    }


    /// <summary>
    /// 删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btndel_Click(object sender, EventArgs e)
    {
        StringBuilder str = new StringBuilder();

        str.Append("delete from FY_news where id in (" + Request.Form["chk"] + ")");

      
        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);

        conn.Open();

        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {

                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                trans.Commit();
                scripthelp.AlertAndRedirect("操作成功！", "news_list.aspx", this.Page);
            }
            catch
            {
                trans.Rollback();
                scripthelp.AlertAndRedirect("操作失败！", "news_list.aspx", this.Page);
            }
            finally
            {
                conn.Close();
            }
        }
    }

    /// <summary>
    /// 推荐案例操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnrecom_Click(object sender, EventArgs e)
    {
        string str = "update FY_news set isRecom=1 where id in (" + Request.Form["chk"] + ")";

        int chktag = 0;

        chktag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (chktag > 0)
            scripthelp.AlertAndRedirect("操作成功！", "news_list.aspx", this.Page);
        else
            scripthelp.AlertAndRedirect("操作失败！", "news_list.aspx", this.Page);
    }

    /// <summary>
    /// 取消置顶操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btncancelchk_Click(object sender, EventArgs e)
    {
        string str = "update FY_news set isTop=0 where id in (" + Request.Form["chk"] + ")";

        int chktag = 0;

        chktag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (chktag > 0)
            scripthelp.AlertAndRedirect("操作成功！", "news_list.aspx", this.Page);
        else
            scripthelp.AlertAndRedirect("操作失败！", "news_list.aspx", this.Page);

    }

    /// <summary>
    /// 取消推荐操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btncancelrecom_Click(object sender, EventArgs e)
    {
        string str = "update FY_news set isRecom=0 where id in (" + Request.Form["chk"] + ")";

        int chktag = 0;

        chktag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (chktag > 0)
            scripthelp.AlertAndRedirect("操作成功！", "news_list.aspx", this.Page);
        else
            scripthelp.AlertAndRedirect("操作失败！", "news_list.aspx", this.Page);
    }
}
