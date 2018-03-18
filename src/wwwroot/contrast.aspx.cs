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

public partial class contrast : System.Web.UI.Page
{
    protected int contrast_num = 0;
    protected string[] contrast_array = null;
    protected DataRow[] DataRow = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        string contrast_str = "";
        if (Request.Cookies["contrast_str"] == null)
        {
            Response.Cookies["contrast_str"].Value = contrast_str;
            Response.Cookies["contrast_str"].Expires = DateTime.Now.AddDays(1);
        }
        else
        {
            contrast_str = Request.Cookies["contrast_str"].Value;
        }


        if (Request.QueryString["addId"] != null && Request.QueryString["addId"] !="")
        {
            string addId = Request.QueryString["addId"].ToString();
            if (contrast_str.IndexOf(addId + ",") == -1)
            {   
                contrast_str = contrast_str + addId+"," ;  
                Response.Cookies["contrast_str"].Value = contrast_str;
                Response.Cookies["contrast_str"].Expires = DateTime.Now.AddDays(1);
            }
            
        }

        if (Request.QueryString["delId"] != null && Request.QueryString["delId"] != "")
        {
            string delId = Request.QueryString["delId"].ToString();
            if (contrast_str.IndexOf(delId+",") > -1)
            {
                contrast_str = contrast_str.Replace(delId+",","");
                Response.Cookies["contrast_str"].Value = contrast_str;
                Response.Cookies["contrast_str"].Expires = DateTime.Now.AddDays(1);
            }

        }

        contrast_array = contrast_str.Split(",".ToCharArray());
        contrast_num = contrast_array.Length - 1;
        DataRow = new DataRow[contrast_num];
        for (int i = 0; i < contrast_num; i++)
        {
            string idString = contrast_array[i].ToString();
            if (idString.IndexOf("kabe") == -1)
            {
                int tid = Convert.ToInt32(contrast_array[i].ToString());
                DataRow[i] = GetTicketDetail(tid);
            }
            else
            {
                kabe_flight flight = null;
                string[] array = idString.Split('_');
                ArrayList tickets = (ArrayList)Session[string.Format("TicketsSessionKey_{0}_{1}_{2}_{3}_{4}", array[1], array[2], array[3], array[4], array[5])];
                if (tickets == null || tickets.Count == 0)
                {
                    Response.Redirect("/index.aspx");
                    return;
                }

                foreach (kabe_flight f in tickets)
                {
                    if (f.ticketId == array[6])
                        flight = f;
                }
                if (flight == null)
                {
                    Response.Redirect("/index.aspx");
                    return;
                }

                //查询机场信息
                string logopic = string.Empty;
                string airchName = string.Empty;
                string planNum = string.Empty;
                string age = string.Empty;
                string smallPic = string.Empty;
                string logoPic = string.Empty;
                string airId = string.Empty;
                string tairportdescription = string.Empty;
                string airlineSql = "select chName,planNum,age,aid,airlineCode,description,smallPic,logoPic from FY_Airline where airlineCode='" + flight.airline + "'";
                DataSet airlineDS = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, airlineSql);
                if (airlineDS != null && airlineDS.Tables.Count > 0 && airlineDS.Tables[0].Rows.Count > 0)
                {
                    airchName = airlineDS.Tables[0].Rows[0]["chName"].ToString();
                    airId = airlineDS.Tables[0].Rows[0]["aid"].ToString();
                    smallPic = airlineDS.Tables[0].Rows[0]["smallPic"].ToString();
                    logoPic = airlineDS.Tables[0].Rows[0]["logoPic"].ToString();
                    tairportdescription = airlineDS.Tables[0].Rows[0]["description"].ToString();
                    planNum = airlineDS.Tables[0].Rows[0]["planNum"].ToString();
                    age = airlineDS.Tables[0].Rows[0]["age"].ToString();
                }
                int days = new Random().Next(-60, -5);
                string fromCityName = string.Empty, toCityName = string.Empty;

                //出发  到达  航司  查询转机信息
                DataTable dt = new DataTable();
                dt.Columns.Add("fromCity");
                dt.Columns.Add("toCity");
                dt.Columns.Add("fromCityname");
                dt.Columns.Add("fromCityCode");
                dt.Columns.Add("toCityname");
                dt.Columns.Add("toCityCode");
                dt.Columns.Add("addtime");
                dt.Columns.Add("untaxPrice");
                dt.Columns.Add("tripType");
                dt.Columns.Add("tId");
                dt.Columns.Add("fAirportCode");
                dt.Columns.Add("fromPort");
                dt.Columns.Add("tAirportName");
                dt.Columns.Add("logoPic");
                dt.Columns.Add("airname");
                dt.Columns.Add("planNum");
                dt.Columns.Add("age");
                dt.Columns.Add("smallPic");
                dt.Columns.Add("bagPrice");
                dt.Columns.Add("engerTicket");
                dt.Columns.Add("seatShip");
                dt.Columns.Add("shortstayDate");
                dt.Columns.Add("attPrice");
                dt.Columns.Add("longstayDate");
                dt.Columns.Add("childPrice");
                dt.Columns.Add("fromsaleDate");
                dt.Columns.Add("tosaleDate");
                dt.Columns.Add("fromtripDate");
                dt.Columns.Add("totripDate");
                dt.Columns.Add("returnMoney");
                dt.Columns.Add("updateProvision");
                dt.Columns.Add("limitProvision");
                dt.Columns.Add("fAirportName");
                dt.Columns.Add("tAirportCode");
                dt.Columns.Add("toPort");
                dt.Columns.Add("airId");
                dt.Columns.Add("score");
                dt.Columns.Add("zongping");
                dt.Columns.Add("xiai");
                dt.Columns.Add("xiaofei");
                dt.Columns.Add("manyi");
                dt.Columns.Add("fuwu");
                dt.Columns.Add("relayPort");
                dt.Columns.Add("returnTip");
                dt.Columns.Add("tairportdescription");
                dt.Columns.Add("startTime");
                dt.Columns.Add("arriveTime");
                dt.Rows.Add(getFromCityIdByCode(array[2], out fromCityName),
                    getToCityIdByCode(array[3], out toCityName),
                    fromCityName, array[2],
                    toCityName, array[3],
                    "2013-06-08",
                    flight.adultprice,
                    Convert.ToInt32(flight.ft) - 1,
                    "tId",
                    flight.depport,
                    ReadXmlHelper.GetAirPortNameByCode(flight.depport),
                    ReadXmlHelper.GetAirPortNameByCode(flight.arrport),
                    logoPic,
                    airchName,
                    planNum,
                    age,
                    smallPic,
                    string.Empty,//bagPrice 
                    "电子客票",//engerTicket
                    this.display_seat(flight.deproute.seat),
                    "30",//shortstayDate
                    string.Empty, //attPrice
                    "180", //afti.longstayDate, 
                    flight.childprice,
                    Convert.ToDateTime(flight.deproute.depdate).AddDays(days).ToString("yyyy-MM-dd"), //convertDate(afti.fromsaleDate.Trim()),
                    flight.deproute.depdate, //convertDate(afti.tosaleDate.Trim()),
                    flight.deproute.depdate, //convertDate(afti.fromtripDate.Trim()), 
                    flight.deproute.arrdate, //convertDate(afti.totripDate.Trim()), 
                    string.Empty,//afti.returnMoney, 
                    string.Empty,//afti.updateProvision, 
                    "<p>1．此票价为净价，不含任何费用<br />  2．票价如有更改,恕不另行通知<br />  3．不可签转,不可更改行程<br />  4．所有航段必须有确认的订座,不可开OPEN票. <br />  5．退票手续 :可退票,需缴纳手续费<br />  6．误机(NOSHOW) :需收取误机费<br />  7．更改订座 : 允许更改。乘客必须于出发日之前取消原订的航班，否则按照 '误机' 处理<br />  8．儿童票价 :成人票价的75% <br />  9．婴儿票价 :使用 IATA 公布成人票价的10%<br />  &nbsp;</p>",//afti.limitProvision, 
                    ReadXmlHelper.GetAirPortNameByCode(flight.depport),// afti.fromAirportName,
                    flight.arrport, //afti.toAirportCode, 
                    "toPort",
                    airId,
                    "100",//afti.score, 
                     "3",//afti.zongping, 
                    "2",//afti.xiai, 
                    "4",//afti.xiaofei,
                    "4",//afti.manyi, 
                    "4",//afti.fuwu, 
                    flight.deproute.route,
                    "returnTip",
                    tairportdescription,
                    flight.deproute.depdate + " " + flight.deproute.deptime.Insert(2, ":"),
                    flight.deproute.arrdate + " " + flight.deproute.arrtime.Insert(2, ":"));
                DataRow[i] = dt.Rows[0];
            }
        }


    }

    #region
    protected string display_seat(string seat)
    {
        string result = string.Empty;
        string[] array = seat.Split('-');
        foreach (string s in array)
        {
            switch (s.ToUpper().Trim())
            {
                case "Y":
                    result += "经济舱-";
                    break;
                case "F":
                    result += "头等舱-";
                    break;
                case "C":
                    result += "商务舱-";
                    break;
                case "D":
                    result += "商务舱-";
                    break;
                case "V":
                    result += "经济舱-";
                    break;
                default:
                    result += "经济舱-";
                    break;
            }
        }

        return result.TrimEnd('-');
    }
    private string getToCityIdByCode(string cityCode, out string toCityName)
    {
        string sql = "select tid,chName from FY_ToCity where cityCode='" + cityCode + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count > 0 && dsCityCode.Tables[0].Rows.Count > 0)
        {
            toCityName = dsCityCode.Tables[0].Rows[0]["chName"].ToString();
            return dsCityCode.Tables[0].Rows[0]["tid"].ToString();
        }
        toCityName = string.Empty;
        return "0";
    }

    private string getFromCityIdByCode(string cityCode, out string fromCityName)
    {
        string sql = "select fid,chName from FY_FromCity where cityCode='" + cityCode + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count > 0 && dsCityCode.Tables[0].Rows.Count > 0)
        {
            fromCityName = dsCityCode.Tables[0].Rows[0]["chName"].ToString();
            return dsCityCode.Tables[0].Rows[0]["fid"].ToString();
        }
        fromCityName = string.Empty;
        return "0";
    }

    protected DataRow GetTicketDetail(int tid)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select FY_Ticket.*,FY_FromCity.chName as fromCityname,FY_FromCity.cityCode as fromCityCode, FY_ToCity.chName as toCityname,FY_ToCity.cityCode as toCityCode, FY_Airline.chName as airname,FY_Airline.planNum as planNum,FY_Airline.age as age,FY_Airline.aId as airId ,FY_Airline.logoPic as logoPic,FY_Airline.smallPic as smallPic, fAirport.chName as fAirportName,fAirport.airPortCode as fAirportCode, tAirport.chName as tAirportName,tAirport.airPortCode as tAirportCode from FY_Ticket left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine  left join FY_Airport as  fAirport on fAirport.apId=FY_Ticket.fromPort left join FY_Airport as tAirport on tAirport.apId=FY_Ticket.toPort  where FY_Ticket.tId=" + tid;

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
}
