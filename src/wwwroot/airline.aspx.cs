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

public partial class airline : System.Web.UI.Page
{
    //获取焦点新闻
    protected DataRowCollection focuNews = null;

    //最佳服务航空公司
    protected DataRowCollection goodairline = null;

    //2009最佳服务航空公司
    protected DataRowCollection yeargoodairline = null;

    //地区最佳服务航空公司
    protected DataRowCollection citygoodairline = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string commandText3 = "select * from FY_FromCity";
            DataSet ds1 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText3);
            if (ds1 != null)
            {
                fromCity.DataSource = ds1;
                fromCity.DataTextField = "chName";
                fromCity.DataValueField = "fid";
                fromCity.DataBind();
            }
            fromtripDate.Value = (DateTime.Now.AddDays(1)).ToString("yyyy-MM-dd");
            backtripDate.Value = (DateTime.Now.AddDays(30)).ToString("yyyy-MM-dd");
        }
        //获取航空公司列表
        GetShopNewslist();

        //最佳服务航空公司
        goodairline =getAirlineByType(0,0,0,11);
        //2009最佳服务航空公司
        yeargoodairline = getAirlineByType(0,0,0,11);
        //地区最佳服务航空公司
        citygoodairline = getAirlineByType(0, 0, 0, 11);

        //获取焦点新闻
        focuNews = getNewsByType(8, 0, 0, 5);
    }

    /// <summary>
    /// 获取航空公司列表
    /// </summary>
    protected void GetShopNewslist()
    {

        DataSet ds = new DataSet();


        string str = @"select top 100 percent * from FY_Airline where 1=1 ";

        if (txtsearch.Value.Trim() != "中文、英文、二字代码、城市名称"&&
            !string.IsNullOrEmpty(this.txtsearch.Value))
        {
            str += " and chName+enName+airlineCode like '%" + txtsearch.Value.Trim() + "%'";
        }

        str += " order by aId desc";


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
            str = str + " and isTop=1 and newsPic is not null";
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


    /// <summary>
    /// 根据条件获取航空公司列表
    /// </summary>
    /// <param name="type"></param>
    /// <param name="istop"></param>
    /// <param name="isRecom"></param>
    /// <param name="num"></param>
    /// <returns></returns>
    protected DataRowCollection getAirlineByType(int type, int istop, int isRecom, int num)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top " + num + "  * from FY_Airline where 1=1";
        if (type != 0)
        {
            str = str + " and type=" + type;
        }

        //if (istop != 0)
        //{
        //    str = str + " and isTop=1 and newsPic is not null";
        //}
        //if (isRecom != 0)
        //{
        //    str = str + " and isRecom=1";
        //}
        str = str + " order by aId desc";
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

    protected void btnSearchName_Click(object sender, EventArgs e)
    {
        GetShopNewslist();
    }
}
