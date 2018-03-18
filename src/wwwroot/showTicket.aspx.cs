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

public partial class showticket : System.Web.UI.Page
{
    protected int id = 0;

    public DataRow ticketOne = null;

    protected int tmax = 0;

    protected DataRowCollection ticket_7 = null;

    protected DataRowCollection ticket_14 = null;

    protected DataRowCollection ticket_30 = null;

    protected DataRowCollection ticket_60 = null;

    protected DataRowCollection ticket_90 = null;

    protected DataRowCollection ticket_120 = null;

    protected DataRowCollection ticket_180 = null;

    protected DataRowCollection ticket_365 = null;

    protected DataRowCollection ticket_all = null;

    protected DataRowCollection hotNews = null;

    protected DataRowCollection randowTicketF = null;

    protected DataRowCollection randowTicketT = null;

    protected DataRowCollection randowNews = null;

    protected kabe_flight flight = null;
    protected string flight_fplan = string.Empty;
    protected string flight_tplan = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["tId"] != null)
        {
			string tId = Request.QueryString["tId"];	
			if(tId.IndexOf("kabe")==-1){
				id = Convert.ToInt32(Request.QueryString["tId"].ToString());
				ticketOne = GetTicketDetail(id);
			}else{
                string[] array = tId.Split('_');
                ArrayList tickets = (ArrayList)Session[string.Format("TicketsSessionKey_{0}_{1}_{2}_{3}_{4}", array[1], array[2], array[3], array[4], array[5])];
                if (tickets == null || tickets.Count == 0)
                {
                    //scripthelp.AlertAndRedirect("记录超时，请重新查询票价信息！", "/index.aspx", this);
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
                    //scripthelp.AlertAndRedirect("获取票价信息时报，请重新查询票价信息！", "/index.aspx", this);
                    Response.Redirect("/index.aspx");
                    return;
                }
				
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
                this.pan_aifeitime.Visible = true;
				
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
				if (airlineDS != null && airlineDS.Tables.Count>0 && airlineDS.Tables[0].Rows.Count>0)
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
                this.flight_fplan = this.display_plan(flight.segment, flight.deproute.route);
                if(flight.ft == "2")
                    this.flight_tplan = this.display_plan(flight.segment, flight.arrroute.route);

                dt.Rows.Add(getFromCityIdByCode(array[2]),
                    getToCityIdByCode(array[3]),
                    this.fromCityName, array[2], 
                    this.toCityName, array[3],
                    "2013-06-08", 
                    flight.adultprice, 
                    Convert.ToInt32(flight.ft)-1,
                    tId, 
                    flight.depport,
                    ReadXmlHelper.GetAirPortIDByCode(flight.depport),
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
                    "180" , //afti.longstayDate, 
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
                    ReadXmlHelper.GetAirPortIDByCode(flight.arrport),
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
				//fromCityname,toCityname,toCityCode,toCityname,addtime,
				//untaxPrice,tripType,tId,fAirportCode,fromCityCode,fromPort,
				//tAirportName,logoPic,airname,planNum,age
				//smallPic,bagPrice,engerTicket,seatShip,shortstayDate,attPrice
				//longstayDate,childPrice,fromsaleDate,tosaleDate,
				//fromtripDate,totripDate,returnMoney,updateProvision
				ticketOne = dt.Rows[0];
			}
			
				int fCityId = Convert.ToInt32(ticketOne["fromCity"].ToString());
				int tCityId = Convert.ToInt32(ticketOne["toCity"].ToString());
				ticket_7 = GetTicketDetailBydelay(7, fCityId, tCityId, 6);
				ticket_14 = GetTicketDetailBydelay(14, fCityId, tCityId, 6);
				ticket_30 = GetTicketDetailBydelay(30, fCityId, tCityId, 6);
				ticket_60 = GetTicketDetailBydelay(60, fCityId, tCityId, 6);
				ticket_90 = GetTicketDetailBydelay(90, fCityId, tCityId, 6);
				ticket_120 = GetTicketDetailBydelay(120, fCityId, tCityId, 6);
				ticket_180 = GetTicketDetailBydelay(180, fCityId, tCityId, 6);
				ticket_365 = GetTicketDetailBydelay(365, fCityId, tCityId, 6);
				ticket_all = GetTicketDetailBydelay(0, fCityId, tCityId, 5);
				tmax = tmax > ticket_7.Count ? tmax : ticket_7.Count;
				tmax = tmax > ticket_14.Count ? tmax : ticket_14.Count;
				tmax = tmax > ticket_30.Count ? tmax : ticket_30.Count;
				tmax = tmax > ticket_60.Count ? tmax : ticket_60.Count;
				tmax = tmax > ticket_90.Count ? tmax : ticket_90.Count;
				tmax = tmax > ticket_120.Count ? tmax : ticket_120.Count;
				tmax = tmax > ticket_180.Count ? tmax : ticket_180.Count;
				tmax = tmax > ticket_365.Count ? tmax : ticket_365.Count;
				hotNews = getNewsRandom(id);
				randowTicketF = GetRandowTicketF(14, fCityId, tCityId, 10);
				randowTicketT = GetRandowTicketT(14, fCityId, tCityId, 10);
				randowNews = getQuanByType(ticketOne["toCityname"].ToString());		
        }
        else
        {
            Response.Redirect("international.aspx");
        }
    }

    protected string display_route(string route)
    {
        string result = string.Empty;
        string[] array = route.Split('-');
        foreach (string s in array)
        {
            result += ReadXmlHelper.GetAirPortNameByCode(s) + "-";
        }

        return result.TrimEnd('-');
    }

    protected string display_seat(string seat)
    {
        string result = string.Empty;
        string[] array = seat.Split('-');
        foreach (string s in array)
        {
            switch(s.ToUpper().Trim())
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

    protected string display_plan(ArrayList segment, string route)
    {
        string result = string.Empty;
        foreach (kabe_segment s in segment)
        {
            string k = s.dep + "-" + s.arr;
            if (route.IndexOf(k) > -1)
            {
                result += s.plane + "/";
            }
        }
        return result.TrimEnd('/');
    }

    protected DataRowCollection getQuanByType(string title)
    {
        string strl = "select top 3 a.aId,a.typeId,a.title,a.publishName,a.addTime,b.mem_pic from FY_member_article as a"
            + " left join tmember as b on a.publishName=b.Mem_LoginName  where a.isCheck=1 and a.title like '%" + title + "%' order by a.aId desc";

        DataTable RowsF = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, strl).Tables[0];

        int count = 0;
        if (RowsF != null)
            count = RowsF.Rows.Count;

        string strr = " select top " + (10 - count) + " a.aId,a.typeId,a.title,a.publishName,a.addTime,b.mem_pic from FY_member_article as a"
            + " left join tmember as b on a.publishName=b.Mem_LoginName  where  a.isCheck=1 and a.aId%10 in (0,1,2,3,4,5,6,7,8,9) order by a.aId desc";

        DataTable RowsT = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, strr).Tables[0];

        if (RowsF == null || RowsF.Rows.Count == 0)
            return RowsT.Rows;
        if (RowsT == null || RowsT.Rows.Count == 0)
            return RowsF.Rows;

        DataTable row = null;
        if (RowsF != null)
            row = RowsF.Clone();
        else
            row = RowsT.Clone();
        if (RowsF.Rows.Count >= RowsT.Rows.Count)
        {
            for (int i = 0; i < RowsF.Rows.Count; i++)
            {
                row.Rows.Add(RowsF.Rows[i].ItemArray);
                if (i < RowsT.Rows.Count)
                    row.Rows.Add(RowsT.Rows[i].ItemArray);
            }
            return row.Rows;
        }

        for (int i = 0; i < RowsF.Rows.Count; i++)
        {
            row.Rows.Add(RowsF.Rows[i].ItemArray);
            if (i < RowsT.Rows.Count)
                row.Rows.Add(RowsT.Rows[i].ItemArray);
        }
        for (int i = RowsF.Rows.Count; i < RowsT.Rows.Count; i++)
            row.Rows.Add(RowsT.Rows[i].ItemArray);
        return row.Rows;
    }


    protected DataRowCollection getNewsRandom(int id)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top 10  * from FY_news where " + id + "%id in (0,1,2,3,4,5,6,7,8,9) order by id desc";
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

    #region
    protected DataRow GetTicketDetail(int tid)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select FY_Ticket.*,FY_FromCity.chName as fromCityname,FY_FromCity.cityCode as fromCityCode, FY_ToCity.chName as toCityname,FY_ToCity.cityCode as toCityCode, FY_Airline.chName as airname,FY_Airline.planNum as planNum,FY_Airline.age as age,FY_Airline.aId as airId ,FY_Airline.logoPic as logoPic,FY_Airline.smallPic as smallPic, fAirport.chName as fAirportName,fAirport.airPortCode as fAirportCode, tAirport.chName as tAirportName,tAirport.airPortCode as tAirportCode,tAirport.description as tairportdescription from FY_Ticket left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine  left join FY_Airport as  fAirport on fAirport.apId=FY_Ticket.fromPort left join FY_Airport as tAirport on tAirport.apId=FY_Ticket.toPort  where FY_Ticket.tId=" + tid;

        try
        {
            ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                row = ds.Tables[0].Rows[0];
                
                ds.Tables[0].Columns.Add("startTime");
                ds.Tables[0].Columns.Add("arriveTime");
                
                string starStr = Request.QueryString["startTime"];
                string arriveStr = Request.QueryString["arriveTime"];
                
                if(starStr != null && !starStr.Equals(""))
                    row["startTime"] = convertDate2(starStr);
                else
                    row["startTime"] = "待定";
                    
                if(arriveStr != null && !arriveStr.Equals(""))
                    row["arriveTime"] = convertDate2(arriveStr);
                else
                    row["arriveTime"] = "待定";
               
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
    
    private string convertDate2(string tmpToTime){
        if(tmpToTime !=null)
        return tmpToTime.Substring(0,4)+"-"+tmpToTime.Substring(4,2)+"-"+tmpToTime.Substring(6,2)+" "+tmpToTime.Substring(8,2)+":"+tmpToTime.Substring(10,2);
        
        return "";
    }

    protected DataRowCollection GetRandowTicketF(int days, int fCity, int tCity, int num)
    {
        string str = "select top "+num+" min(FY_Ticket.tId) as ticketId,FY_FromCity.chName as fromCityname, FY_ToCity.chName as toCityname,min(untaxPrice) as untaxPrice from FY_Ticket"
            + " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity"
            + " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity "
            + " where FY_Ticket.tId<>" + id + "";
        str += " and FY_Ticket.longstayDate=" + days;
        str += " and FY_Ticket.fromCity=" + fCity;
        str += " and FY_Ticket.toCity<>" + tCity;
        str += " and FY_Ticket.tripType=1 group by FY_Ticket.toCity,FY_FromCity.chName, FY_ToCity.chName";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];
        if (dt == null)
            return null;
        return dt.Rows;
    }

    protected DataRowCollection GetRandowTicketT(int days, int fCity, int tCity, int num)
    {
        string str = "select top " + num + " min(FY_Ticket.tId) as ticketId,FY_FromCity.chName as fromCityname, FY_ToCity.chName as toCityname,min(untaxPrice) as untaxPrice from FY_Ticket"
            + " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity"
            + " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity "
            + " where FY_Ticket.tId<>" + id + "";
        str += " and FY_Ticket.longstayDate=" + days;
        str += " and FY_Ticket.toCity=" + tCity;
        str += " and FY_Ticket.fromCity<>" + fCity;
        str += " and FY_Ticket.tripType=1 group by FY_Ticket.fromCity,FY_FromCity.chName, FY_ToCity.chName";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];
        if (dt == null)
            return null;
        return dt.Rows;
    }


    protected DataRowCollection GetTicketDetailBydelay(int days, int fCity, int tCity, int num)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top " + num + "  tosaleDate,totripDate,longstayDate,shortstayDate,FY_Ticket.seatShip,FY_Ticket.tripType,FY_Ticket.untaxPrice,FY_Ticket.tId as ticketId, FY_Airline.chName as airname,FY_Airline.smallPic as smallPic,FY_Airline.aId as airId  from FY_Ticket inner join FY_Airline on FY_Airline.aId=FY_Ticket.airLine where FY_Ticket.tId<>" + id;

        if (days != 0)
        {
            str = str + " and FY_Ticket.longstayDate=" + days;
        }

        if (fCity != 0)
        {
            str = str + " and FY_Ticket.fromCity=" + fCity;
        }

        if (tCity != 0)
        {
            str = str + " and FY_Ticket.toCity=" + tCity;
        }

        str = str + " and (FY_Ticket.tosaleDate>='" + DateTime.Now.ToString("yyyy-MM-dd") + "') and FY_Ticket.tripType=1  order by untaxPrice asc";
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
    
    
    private string convertDate(string tmpToTime){
		return tmpToTime.Substring(0,4)+"-"+tmpToTime.Substring(4,2)+"-"+tmpToTime.Substring(6,2);
    }

    protected string fromCityName = string.Empty;
    private string getFromCityIdByCode(string cityCode){
        string sql = "select fid,chName from FY_FromCity where cityCode='" + cityCode + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count>0 && dsCityCode.Tables[0].Rows.Count>0)
        {
            this.fromCityName = dsCityCode.Tables[0].Rows[0]["chName"].ToString();
            return dsCityCode.Tables[0].Rows[0]["fid"].ToString();
        }

        return "0";
    }

    protected string toCityName = string.Empty;
    private string getToCityIdByCode(string cityCode)
    {
        string sql = "select tid,chName from FY_ToCity where cityCode='" + cityCode + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count>0 && dsCityCode.Tables[0].Rows.Count>0)
        {
            this.toCityName = dsCityCode.Tables[0].Rows[0]["chName"].ToString();
            return dsCityCode.Tables[0].Rows[0]["tid"].ToString();
        }

        return "0";
    }

    
    private ArrayList getFlightMsg(string fromCityCode, string toCityCode, string airlineCode, string toTime){
		string sql = "select id from FY_AiFei_Ticket where fromCity='"+fromCityCode.Trim()+"' and toCity='"+toCityCode.Trim()+"' and airline='"+airlineCode.Trim()+"'";
		DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
		ArrayList flight = new ArrayList();
		
		
		if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
                string ticketId =  ds.Tables[0].Rows[0]["id"].ToString();
                sql = "select * from FY_AiFei_Flights where ticketid='"+ticketId+"' order by num asc";
                DataSet flightDS = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
                if (flightDS != null && flightDS.Tables.Count > 0 && flightDS.Tables[0].Rows.Count > 0)
                {
					 foreach (DataRow dr in flightDS.Tables[0].Rows){        
						AiFeiFlightEntity affe = new AiFeiFlightEntity();
						
						affe.airlineCode = dr["airline"].ToString();
						affe.flightNum = dr["flightNum"].ToString();
						affe.fromAirport = dr["fromAirport"].ToString();
						affe.toAirport = dr["toAirport"].ToString();
						
						//起降时间需要转化
						string tmpToTime = dr["toTime"].ToString().Trim();
						string tmpFromTime = dr["arriveTime"].ToString().Trim();
						DateTime toDT = Convert.ToDateTime(tmpToTime.Substring(0,4)+"-"+tmpToTime.Substring(4,2)+"-"+tmpToTime.Substring(6,2)+" "+tmpToTime.Substring(8,2)+":"+tmpToTime.Substring(10,2));
						DateTime fromDT = Convert.ToDateTime(tmpFromTime.Substring(0,4)+"-"+tmpFromTime.Substring(4,2)+"-"+tmpFromTime.Substring(6,2)+" "+tmpFromTime.Substring(8,2)+":"+tmpFromTime.Substring(10,2));
						DateTime selectDT = Convert.ToDateTime(toTime.Substring(0,4)+"-"+toTime.Substring(4,2)+"-"+toTime.Substring(6,2));
						
						TimeSpan ts = selectDT - toDT;
						toDT = toDT.AddDays(ts.Days);
						fromDT = fromDT.AddDays(ts.Days);
						
						affe.toTime = toDT.ToString("yyyy/MM/dd HH:mm:ss");
						affe.arriveTime = fromDT.ToString("yyyy/MM/dd HH:mm:ss");
						
						affe.airplan = dr["airplan"].ToString();
						affe.seats = Convert.ToInt32(dr["seats"].ToString());
						affe.isRelay = 0;
						
						flight.Add(affe);
					}
                }
                
				return flight;
        }
        return null;
	}
	
	
	private string  getRelayPort(string fromCity ,string toCity ,string airline){
	    string sql = "select relayPort from FY_AiFei_Ticket2 where fromCity='"+fromCity+"' and toCity='"+toCity+"' and airlineCode='"+airline+"'";
	    DataSet flightDS = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
	    if (flightDS != null && flightDS.Tables.Count > 0 && flightDS.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in flightDS.Tables[0].Rows){     
                return getAirportNameByCode(dr["relayPort"].ToString());
            }     
            return "";  
        }
        return "";
	}
	
	
	private string getAirportNameByCode(string code)
    {
        string sql = "select chName from FY_Airport where airPortCode='" + code + "'";
        DataSet dsAirportName = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsAirportName != null && dsAirportName.Tables.Count>0 && dsAirportName.Tables[0].Rows.Count>0)
        {
            return dsAirportName.Tables[0].Rows[0]["chName"].ToString();
        }

        return "";
    }

    private ArrayList randomList = new ArrayList();
    private bool isInRandomList(long key)
    {
        if (randomList.Contains(key)) return true;
        return false;
    }

    protected string readTimeFromCookie(string from, string to, string airline, string type, string stime)
    {
        if (Request.Cookies[from + to + airline + "-kabeTimeCache"] == null)
        {
            long start = new Random().Next(0, 12 * 19);//已5分钟为单位
            long end = new Random().Next(12 * 2, 12 * 5);

            while (isInRandomList(start))
            {
                start = new Random().Next(0, 12 * 19);
            }

            randomList.Add(start);

            DateTime toDT = Convert.ToDateTime(stime);
            toDT = toDT.AddMinutes(start * 5);
            DateTime arriveDT = toDT.AddMinutes(end * 5);

            //写入cookie缓存
            //fromCode,string toCode,string airLineCode
            HttpCookie cookie = new HttpCookie(from + to + airline + "-kabeTimeCache");
            cookie.Values["toDt"] = toDT.ToString("HH:mm");
            cookie.Values["arriveDt"] = arriveDT.ToString("HH:mm");
            Response.Cookies.Add(cookie);
        }
        if (Request.Cookies[from + to + airline + "-kabeTimeCache"] != null)
        {
            if (type.Equals("toDt"))
            {
                return stime + " " + Request.Cookies[from + to + airline + "-kabeTimeCache"]["toDt"];
            }
            else if (type.Equals("arriveDt"))
            {
                return stime + " " + Request.Cookies[from + to + airline + "-kabeTimeCache"]["arriveDt"];
            }
        }
        return string.Empty;
    }

    protected string readTimeBackCookie(string from, string to, string airline, string type, string stime)
    {
        if (Request.Cookies[from + to + airline + "-kabebackTimeCache"] == null)
        {
            long start = new Random().Next(0, 12 * 19);//已5分钟为单位
            long end = new Random().Next(12 * 2, 12 * 5);

            while (isInRandomList(start))
            {
                start = new Random().Next(0, 12 * 19);
            }

            randomList.Add(start);

            DateTime toDT = Convert.ToDateTime(stime);
            toDT = toDT.AddMinutes(start * 5);
            DateTime arriveDT = toDT.AddMinutes(end * 5);

            //写入cookie缓存
            //fromCode,string toCode,string airLineCode
            HttpCookie cookie = new HttpCookie(from + to + airline + "-kabebackTimeCache");
            cookie.Values["toDt"] = toDT.ToString("HH:mm");
            cookie.Values["arriveDt"] = arriveDT.ToString("HH:mm");
            Response.Cookies.Add(cookie);
        }
        if (Request.Cookies[from + to + airline + "-kabebackTimeCache"] != null)
        {
            if (type.Equals("toDt"))
            {
                return stime + " " + Request.Cookies[from + to + airline + "-kabebackTimeCache"]["toDt"];
            }
            else if (type.Equals("arriveDt"))
            {
                return stime + " " + Request.Cookies[from + to + airline + "-kabebackTimeCache"]["arriveDt"];
            }
        }
        return string.Empty;
    }
}
