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

public partial class airlineDetail : System.Web.UI.Page
{
    protected int id = 0;
    public DataRow airlineOne = null;
    public DataTable airlinePic = null;
    protected DataRowCollection gzToAsia = null;
    protected DataRowCollection gzToEuro = null;
    protected DataRowCollection gzToNAmerica = null;
    protected DataRowCollection gzToOceania = null;
    protected DataRowCollection hkToAsia = null;
    protected DataRowCollection hkToEuro = null;
    protected DataRowCollection hkToNAmerica = null;
    protected DataRowCollection hkToOceania = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["aid"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["aid"].ToString());
            airlineOne = GetAirLineDetail(id);
            if (string.IsNullOrEmpty(airlineOne["pic2"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic3"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic4"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic5"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic6"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic7"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic8"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic9"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic10"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic11"].ToString())
                )
                this.panelPic.Visible = false;
        }
        else
            Response.Redirect("http://www.fei580.com/airline.aspx");

        gzToAsia = getRecommendTicket(1, 1, 6);
        gzToEuro = getRecommendTicket(1, 2, 6);
        gzToNAmerica = getRecommendTicket(1, 3, 6);
        gzToOceania = getRecommendTicket(1, 5, 6);
        hkToAsia = getRecommendTicket(4, 1, 6);
        hkToEuro = getRecommendTicket(4, 2, 6);
        hkToNAmerica = getRecommendTicket(4, 3, 6);
        hkToOceania = getRecommendTicket(4, 5, 6);
    }

    #region
    protected DataRow GetAirLineDetail(int aid)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select * from FY_Airline  where aId=" + aid;

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

    protected DataRowCollection getRecommendTicket(int fromcityId, int toStateId, int num)
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



        str += " and ischear=1 order by case FY_Airline.aId when " + id + " then 0 else 1 end, FY_Ticket.updateTime desc";

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
