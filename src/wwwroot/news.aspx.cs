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

public partial class news : System.Web.UI.Page
{
    //获取焦点新闻
    protected DataRowCollection focuNews = null;

    //右侧新闻
    protected DataRowCollection rightNews = null;

    //民航新闻
    protected DataRowCollection focuairlineNews = null;
    protected DataRowCollection airlineNews = null;

    //机场新闻
    protected DataRowCollection focuairportNews = null;
    protected DataRowCollection airportNews = null;

    //航机新闻
    protected DataRowCollection focuairplanNews = null;
    protected DataRowCollection airplanNews = null;

    //业界动态
    protected DataRowCollection focujobNews = null;
    protected DataRowCollection jobNews = null;


    protected DataRowCollection zhihuiNews = null;

    protected DataRowCollection bbstopics = null;

    protected DataRowCollection bbsHottopics = null;

    protected DataRowCollection clickOrder = null;

    protected DataRowCollection newPrizes = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //获取焦点新闻
        focuNews = getNewsByType(0, 1, 0, 5);

        //右侧新闻
        rightNews = getRightNews(13);

        //民航新闻
        focuairlineNews = getNewsByType(1, 0, 0,1);
        airlineNews = getNewsByType(1, 0, 0, 6);

        //机场新闻
        focuairportNews = getNewsByType(2, 0, 0, 1);
        airportNews = getNewsByType(2, 0, 0, 6);

        //航机新闻
        focuairplanNews = getNewsByType(3, 0, 0, 1);
        airplanNews = getNewsByType(3, 0, 0, 6);

        //业界动态
        focujobNews = getNewsByType(4, 0, 0, 1);
        jobNews = getNewsByType(4, 0, 0, 6);

        zhihuiNews = getNewsByType(5, 0, 0, 10);
        bbstopics = getBbstopic(0,12);

        bbsHottopics = getBbstopic(1, 12);


        clickOrder = getQuanByType(0, 0, 10, " order by addtime asc ");

        newPrizes = getPrizeList(4);

    }


    protected DataRowCollection getPrizeList(int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from FY_Prizes order by pId desc";
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

    protected DataRowCollection getQuanByType(int type, int isRecom, int num, string orderFiled)
    {
        DataRowCollection quanrow = null;

        string str = @"select top " + num + "  * from FY_member_article left join tmember on FY_member_article.publishName=tmember.Mem_LoginName where 1=1 and isCheck=1";
        if (type != 0)
        {
            str = str + " and typeId=" + type;
        }

        if (isRecom != 0)
        {
            str = str + " and isRec=1";
        }

        if (orderFiled != "")
        {
            str = str + orderFiled;
        }
        else
        {

            str = str + " order by aId desc";
        }

        try
        {
            quanrow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return quanrow;
    }


    protected DataRowCollection getRightNews(int num)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top " + num + "  * from FY_news where 1=1";


        str = str + " and  type in(1,2,3,4) and isRecom=1 order by id desc";
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
    /// 根据条件获取焦点新闻
    /// </summary>
    /// <param name="type"></param>
    /// <param name="istop"></param>
    /// <param name="isRecom"></param>
    /// <param name="num"></param>
    /// <returns></returns>
    protected DataRowCollection getNewsByType(int type, int istop, int isRecom, int num)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top " + num + "  * from FY_news where 1=1";
        if (type != 0)
        {
            str = str + " and type=" + type;
        }

        if (istop != 0)
        {
            str = str + " and isTop=1";
        }
        if (isRecom != 0)
        {
            str = str + " and isRecom=1";
        }
        str = str + " order by id desc";
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

    protected DataRowCollection getBbstopic(int hot,int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from dnt_topics ";
        if(hot==0){
        str=str+"order by tid desc";
        }else{
        str=str+"order by views desc";
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
