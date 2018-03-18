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

public partial class quan : System.Web.UI.Page
{
    //获取旅行日记
    protected DataRowCollection focuNews = null;

    protected DataRowCollection bbstopics = null;

    protected DataRowCollection gonglue = null;

    protected DataRowCollection dianping = null;

    protected DataRowCollection tupian = null;

    protected DataRowCollection wenda = null;

    protected DataRowCollection jieban = null;

    protected DataRowCollection clickOrder = null;

    protected DataRowCollection newPrizes = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //获取旅行日记
            focuNews = getNewsByType(6, 0, 0, 5);

            bbstopics = getBbstopic(12);

            gonglue = getQuanByType(1, 0, 17, "");

            dianping = getQuanByType(2, 0, 17, "");

            tupian = getQuanByType(3, 0, 17, "");

            wenda = getQuanByType(4, 0, 17, "");

            jieban = getQuanByType(5,  0, 17, "");

            clickOrder = getQuanByType(0, 0, 10, " order by addtime asc ");

            newPrizes = getPrizeList(4);
        }
    }



    protected void btnSearch_Click(object sender, EventArgs e)
    {
        if (txtTypeId.Value == "6")
        {
            Response.Redirect("searchQuan.aspx?username=" + txtKey.Value);
        }
        else
        {
            Response.Redirect("searchQuan.aspx?typeId=" + txtTypeId.Value + "&key=" + txtKey.Value);
        }
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



    protected DataRowCollection getQuanByType(int type, int isRecom, int num,string orderFiled)
    {
        DataRowCollection quanrow = null;

        string str = @"select top " + num + " substring(dbo.ReplaceHTML(content),0,300) as content, a.aId,a.typeId,a.title,a.publishName,a.addTime,b.mem_pic from FY_member_article as a left join tmember as b on a.publishName=b.Mem_LoginName where 1=1 and isCheck=1";
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
        else{
        
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



    protected DataRowCollection getBbstopic(int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from dnt_topics order by tId desc";
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
