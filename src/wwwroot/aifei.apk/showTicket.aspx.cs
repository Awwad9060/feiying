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
    static int id = 0;

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

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["tId"] != null)
        {
			string tId = Request.QueryString["tId"];
			
			if(tId.IndexOf("aifei")==-1){
				id = Convert.ToInt32(Request.QueryString["tId"].ToString());
				ticketOne = GetTicketDetail(id);
			}else{
				string ticketNum = tId.Replace("aifei","");
				//去爱飞查询机票详细信息
				AiFeiService afs = new AiFeiService();
				AiFeiTicketInfo afti = afs.TicketInfo(ticketNum);
				afti.engerTicket = "电子客票";
				afti.score = "100";
				afti.zongping = "3";
				afti.xiai = "2";
				afti.xiaofei = "4";
				afti.manyi = "4";
				afti.fuwu = "4";
				
				
				
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
				string airlineSql = "select chName,planNum,age,aid,airlineCode,description,smallPic,logoPic from FY_Airline where airlineCode='"+afti.airlineName+"'";
				DataSet airlineDS = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, airlineSql);
				
				if (airlineDS != null && airlineDS.Tables.Count>0 && airlineDS.Tables[0].Rows.Count>0)
				{
					 afti.airchName = airlineDS.Tables[0].Rows[0]["chName"].ToString();
					 afti.airId = airlineDS.Tables[0].Rows[0]["aid"].ToString();
					 afti.smallPic = airlineDS.Tables[0].Rows[0]["smallPic"].ToString();
					 afti.logoPic = airlineDS.Tables[0].Rows[0]["logoPic"].ToString();
					 afti.tairportdescription = airlineDS.Tables[0].Rows[0]["description"].ToString();
					 afti.planNum = airlineDS.Tables[0].Rows[0]["planNum"].ToString();
					 afti.age = airlineDS.Tables[0].Rows[0]["age"].ToString();
				}
				
				
				string starStr = Request.QueryString["startTime"];
                string arriveStr = Request.QueryString["arriveTime"];
                
                if(starStr != null && !starStr.Equals(""))
                    afti.startTime = convertDate2(starStr);
                else
                    afti.startTime = "待定";
                    
                if(arriveStr != null && !arriveStr.Equals(""))
                    afti.arriveTime = convertDate2(arriveStr);
                else
                    afti.arriveTime = "待定";
                    
                afti.relayPort=getRelayPort(afti.fromCityCode,afti.toCityCode,afti.airlineName);

                dt.Rows.Add(getFromCityIdByName(afti.fromCityName), getToCityIdByName(afti.toCityName), afti.fromCityName, afti.fromCityCode, afti.toCityName, afti.toCityCode, "2013-06-08", afti.untaxprice, afti.tripType, "tId", afti.fromAirportCode, afti.fromAirportName, afti.toAirportName, afti.logoPic, afti.airchName, afti.planNum, afti.age, afti.smallPic, afti.bagPrice, afti.engerTicket, "经济舱", afti.shortstayDate, afti.attPrice, afti.longstayDate.Trim() == "-1" ? "0" : afti.longstayDate, afti.childPrice, convertDate(afti.fromsaleDate.Trim()), convertDate(afti.tosaleDate.Trim()), convertDate(afti.fromtripDate.Trim()), convertDate(afti.totripDate.Trim()), afti.returnMoney, afti.updateProvision, afti.limitProvision, afti.fromAirportName, afti.toAirportCode, "toPort", afti.airId, afti.score, afti.zongping, afti.xiai, afti.xiaofei, afti.manyi, afti.fuwu, afti.relayPort, "returnTip", afti.tairportdescription, afti.startTime, afti.arriveTime);
				
				
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
    
    private string getFromCityIdByName(string cityName){
		string sql = "select fid from FY_FromCity where chName='" + cityName + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count>0 && dsCityCode.Tables[0].Rows.Count>0)
        {
            return dsCityCode.Tables[0].Rows[0]["fid"].ToString();
        }

        return "0";
    }
    
    private string getToCityIdByName(string cityName){
		string sql = "select tid from FY_ToCity where chName='" + cityName + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count>0 && dsCityCode.Tables[0].Rows.Count>0)
        {
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
}
