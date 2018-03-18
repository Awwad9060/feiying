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

public partial class internatoArea : System.Web.UI.Page
{
    protected DataRowCollection DataList = null;
    protected string name = string.Empty;
    protected string title = string.Empty;
    int State = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        State = int.Parse(Request.QueryString["State"]);

        getAreaname(State);

        getAreatitle(State);

        DataList = getAllTicket(0, State);
    }

    /// <summary>
    /// 设置名称
    /// </summary>
    /// <param name="state"></param>
    /// <returns></returns>
    private void getAreaname(int state)
    {
        if (state == 0)
            name = "<h2>SPECIAL</h2><h3>特价国际机票</h3>";
        else if (state == 1)
            name = "<h2>ASIA</h2><h3>亚洲机票</h3>";
        else if (state == 2)
            name = "<h2>EURO</h2><h3>欧洲机票</h3>";
        else if (state == 3)
            name = "<h2>NAMERICA</h2><h3>北美洲机票</h3>";
        else if (state == 5)
            name = "<h2>OCEANIA</h2><h3>大洋洲机票</h3>";
        else if (state == 6)
            name = "<h2>AFRICA</h2><h3>非洲机票</h3>";
    }
    private void getAreatitle(int state)
    {
        if (state == 0)
            title = "国际机票";
        else if (state == 1)
            title = "亚洲机票";
        else if (state == 2)
            title = "欧洲机票";
        else if (state == 3)
            title = "北美洲机票";
        else if (state == 5)
            title = "大洋洲机票";
        else if (state == 6)
            title = "非洲机票";
        else if (state == 4)
            title = "出国机票";
    }
    /// <summary>
    /// 获取特价酒店列表
    /// </summary>
    /// <param name="fromcityId">城市ID</param>
    /// <param name="toStateId">地区ID（1Asia，2Euro，3NAmerica，5Oceania，6Africa）</param>
    /// <param name="num"></param>
    /// <returns></returns>
    protected DataRowCollection getAllTicket(int fromcityId, int toStateId)
    {
        DataRowCollection Rerow = null;

        string str = @"select top 100 percent FY_Ticket.*,FY_FromCity.chName as fromCityname,FY_ToCity.chName as toCityname,FY_Airline.chName as airname, FY_Airline.smallPic as smallPic from FY_Ticket ";
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



        str += " order by FY_Ticket.updateTime desc";

        try
        {
            SqlParameter[] parameters = {
                    new SqlParameter("@sql", SqlDbType.NVarChar,4000),
                    new SqlParameter("@currentpage", SqlDbType.Int),
                    new SqlParameter("@pagesize", SqlDbType.Int)};

            parameters[0].Value = str;
            parameters[1].Value = this.Pager.CurrentPageIndex;
            parameters[2].Value = this.Pager.PageSize;

           DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);

           this.Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);

           this.Pager.CustomInfoHTML = "&nbsp;第" + this.Pager.CurrentPageIndex.ToString() + "页/共" + this.Pager.PageCount.ToString() + "页 总记录数：" + this.Pager.RecordCount.ToString();

           Rerow = ds.Tables[1].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return Rerow;
    }

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        DataList = getAllTicket(0, State);
    }
}
