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


public partial class Recommend : System.Web.UI.Page
{
    protected DataRowCollection picRecommendOne = null;
    protected DataRowCollection picRecommendTwo = null;
    protected DataRowCollection picRecommendThree = null;
    protected DataRowCollection recommendEveryday = null;
    protected DataRowCollection recommendIDS = null;

    protected DataRowCollection toAsia = null;
    protected DataRowCollection toEuro = null;
    protected DataRowCollection toNAmerica = null;
    protected DataRowCollection toOceania = null;
    protected DataRowCollection toAfrica = null;

    protected void Page_Load(object sender, EventArgs e)
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
            picRecommendOne = getRecommendInfo("特价图片推荐1", 4);
            picRecommendTwo = getRecommendInfo("特价图片推荐2", 4);
            picRecommendThree = getRecommendInfo("特价图片推荐3", 4);
            toAsia = getRecommendTicket(1,0, 1, 12);
            toEuro = getRecommendTicket(1, 0, 2, 12);
            toNAmerica = getRecommendTicket(1, 0, 3, 12);
            toOceania = getRecommendTicket(1, 0, 5, 12);
            toAfrica = getRecommendTicket(1, 0, 6, 12);

            recommendEveryday = getRecommendTicket(0,0, 0, 8);
            recommendIDS = getRecommendInfo("IDS限量特价", 8);
    }

    protected DataRowCollection getRecommendInfo(string rType, int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from FY_Recommend where rType='" + rType + "' order by rId desc";
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
    /// 
    /// </summary>
    /// <param name="type">类型 0 特价，1 精选</param>
    /// <param name="fromcityId"></param>
    /// <param name="toStateId"></param>
    /// <param name="num"></param>
    /// <returns></returns>
    protected DataRowCollection getRecommendTicket(int type, int fromcityId, int toStateId, int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + " FY_Ticket.*,FY_FromCity.chName as fromCityname,FY_ToCity.chName as toCityname,FY_Airline.chName as airname, FY_Airline.smallPic as smallPic from FY_Ticket ";
        str += " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity";
        str += " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity";
        str += " left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine";
        str += " where 1=1  ";


        if (fromcityId != 0)
        {
            str += " and (FY_FromCity.fId=" + fromcityId + ")";
        }


        if (toStateId != 0)
        {
            str += " and (FY_Ticket.stateId =" + toStateId + ")";
        }

        if (type == 0)
        {
            str += " and ischear=1 ";
        }
        else
        {
            str += " and isRecom=1 ";
        }

        str += " order by FY_Ticket.updateTime desc";

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

    protected void IDS_Search(object sender, EventArgs e)
    {
        Response.Redirect("IDS.aspx?fromcity=" + fromcityStr.Value.Trim() + "&tocity=" + ids_tocity.Value.Trim() + "&year=" + DateTime.Now.Year.ToString() + "");

        //DataSet ds = null;
        //string str = "select FY_IDS.*,FY_FromCity.chName as fromCityname,FY_FromCity.cityCode as fromCityCode, FY_ToCity.chName as toCityname,FY_ToCity.cityCode as toCityCode from FY_IDS left join FY_FromCity on FY_FromCity.fId=FY_IDS.fromId left join FY_ToCity on FY_ToCity.tId=FY_IDS.toId  where FY_FromCity.chName='" + fromcityStr.Value.Trim() + "'  and FY_ToCity.chName='" + ids_tocity.Value.Trim() + "'";

        //try
        //{
        //    ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        //    if (ds != null && ds.Tables[0].Rows.Count != 0)
        //    {
        //        Response.Redirect("IDS.aspx?fromcity=" + fromcityStr.Value.Trim() + "&tocity=" + ids_tocity.Value.Trim());
        //    }
        //    else
        //    {
        //        scripthelp.Alert("sorry,暂无此航线的IDS服务提供！!", this.Page);
        //        return;
        //    }

        //}
        //catch (Exception err)
        //{
        //    HttpContext.Current.Response.Write(err.Message);
        //    HttpContext.Current.Response.End();
        //}

    }
}
