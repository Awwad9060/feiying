using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class newsList : System.Web.UI.Page
{
    protected static int typeId = 0;
    protected string typeName = "";
    protected DataRowCollection hotNews = null;
    protected DataRowCollection recomNews = null;

    protected DataRowCollection bbstopics = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["typeId"] != null)
        {
            typeId = Convert.ToInt32(Request.QueryString["typeId"].ToString());
            typeName = Type_stat(typeId);
            hotNews = getNewsByType(typeId, 0, 0, 10, "hitTimes");
            recomNews = getNewsByType(typeId, 0, 1, 6, "id");
            GetNewslist(typeId);
            bbstopics = getBbstopic(0, 10);

        }
        else
        {
            Response.Redirect("news.aspx");
        }
    }

    protected DataRowCollection getBbstopic(int hot, int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from dnt_topics ";
        if (hot == 0)
        {
            str = str + "order by tid desc";
        }
        else
        {
            str = str + "order by views desc";
        }
        try
        {
            Rerow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return Rerow;

    }

    protected DataRowCollection getNewsByType(int type, int istop, int isRecom, int num, string orderFile)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top " + num + "  * from FY_news where 1=1";
        if (type != 0)
        {
            str = str + " and type=" + type;
        }

        if (istop != 0)
        {
            str = str + " and isTop=1 and newsPic is not null";
        }
        if (isRecom != 0)
        {
            str = str + " and isRecom=1";
        }
        str = str + " order by " + orderFile + " desc";
        try
        {
            Newsrow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return Newsrow;
    }

    protected void GetNewslist(int type)
    {

        DataSet ds = new DataSet();


        string str = @"select top 100 percent * from FY_news where 1=1 ";

        if (type != 0)
        {
            str += " and type=" + type;
        }

        str += " order by id desc";


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
        GetNewslist(typeId);
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
            str_name = "旅游资讯";

        }
        else if (bs == 2)
        {
            str_name = "民航新闻";

        }
        else if (bs == 3)
        {
            str_name = "业界动态";

        }
        else if (bs == 4)
        {
            str_name = "机场新闻";

        }

        else if (bs == 5)
        {
            str_name = "出行智囊";

        }

        else
        {
            str_name = "旅游资讯";

        }

        return str_name;
    }

}
