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

public partial class newsDetail : System.Web.UI.Page
{
    protected int id = 0;

    public DataRow newsOne = null;

    public string nextTitle="";
    public string preTitle="";
    public int newsType = 0;

    protected DataRowCollection hotNews = null;

    protected DataRowCollection relatNews = null;

    protected DataRowCollection recomNews = null;

    protected DataRowCollection bbstopics = null;

    protected DataRowCollection ticketDay = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["id"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["id"].ToString());
            newsOne = GetNewsDetail(id);
            newsType = Convert.ToInt32(newsOne["type"].ToString());
            bbstopics = getBbstopic(0, 10);
        }
        else
        {
            Response.Redirect("http://www.fei580.com/news.aspx");
        }


        string str = "update FY_news set  hitTimes=hitTimes+1";
        

         SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

         nextTitle = getnextTitle(id);
         preTitle = getpreTitle(id);

         hotNews = getNewsByType(newsType, 0, 0, 10,"hitTimes");
         relatNews = getNewsByType(newsType, 0, 0, 10, "id");
         //recomNews = getNewsByType(newsType, 0, 1, 6, "id");

         ticketDay = getNewsRandom(id);
    }


    #region
    protected DataRow GetNewsDetail(int tid)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select * from FY_news where id=" + tid;

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

    protected DataRowCollection getNewsRandom(int id)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top 10  FY_Ticket.*,FY_FromCity.chName as fromCityname,FY_ToCity.chName as toCityname,FY_Airline.chName as airname, FY_Airline.smallPic as smallPic from FY_Ticket ";
        str += " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity";
        str += " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity";
        str += " left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine";
        str += " where FY_Ticket.tId%" + id + " in (0,1,2,3,4,5,6,7,8,9) and FY_Ticket.tId in (select max(b.tId) from FY_Ticket as b where b.tId%" + id + " in (0,1,2,3,4,5,6,7,8,9) group by toCity) order by FY_Ticket.updateTime desc";

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

    protected DataRowCollection getNewsByType(int type, int istop, int isRecom, int num,string orderFile)
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

    public string getnextTitle(int oId)
    {
        string str="";

        string str1 = "select top 1 * from FY_news where id<" + oId + " order by id desc";
        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str1).Tables[0];
        if (dt.Rows.Count>=1)
        {
            str = "<a href='http://www.fei580.com/news_" + dt.Rows[0]["id"].ToString() + ".htm'>" + dt.Rows[0]["title"].ToString() + "</a>";
        }
        else {
            str = "没有了";
        }
        return str;
    }


    public string getpreTitle(int oId)
    {
        string str = "";


        string str1 = "select top 1 * from FY_news where id>" + oId + " order by id asc";
        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str1).Tables[0];
        if (dt.Rows.Count >= 1)
        {
            str = "<a href='http://www.fei580.com/news_" + dt.Rows[0]["id"].ToString() + ".htm'>" + dt.Rows[0]["title"].ToString() + "</a>";
        }
        else
        {
            str = "没有了";
        }
        return str;
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

}
