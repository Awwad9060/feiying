using System;
using System.Collections;
using System.Data;
using System.Net;
using eap.share;
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
using System.Text;
using eap.share;
using System.Collections.Generic;
using System.IO;
using System.Threading;


/// <summary>
///AiFeiService 的摘要说明
/// </summary>
public class AiFeiService
{ 

    private string aifeServerUrl = "http://data.faredata.cn/webService/";
    private string globalTicketUrl = "globalTicket/";
    private string ticketInfoUrl = "ticketInfo/";
    private string globalFlightUrl = "globalFlight/";
    private readonly string _account = "fyjp/";

    public AiFeiService()
    {
        //
        //TODO: 在此处添加构造函数逻辑
        //
    }

    /*
    private void Request()
    {
        WebRequest request = WebRequest.Create(_httpUrl);
        WebResponse response = request.GetResponse();
        string text = new StreamReader(response.GetResponseStream(), Encoding.Default).ReadToEnd();
    }
    */

    /// <summary>
    /// 
    /// </summary>
    /// <param name="Account">账号</param>
    /// <param name="Dpt">出发城市三字码</param>
    /// <param name="Arr">母的城市三字码</param>
    /// <param name="ToTime">出发日期</param>
    /// <param name="ReTime">返回日期</param>
    /// <param name="Cate">all 全部，DC 单程，SF往返</param>
    /// <returns></returns>
    public ArrayList GlobalTicket(string Dpt, string Arr, string ToTime, string ReTime, string Cate)
    {
        ///获得三字码
        string url = aifeServerUrl + globalTicketUrl + _account + Dpt + "/" + Arr + "/" + ToTime + "/" + ReTime + "/" + Cate;
        
        //string url = "http://localhost:4896/web/SF.htm";
        ArrayList tickets = new ArrayList();
        string responseText = string.Empty;
        try
        {
            WebRequest request = WebRequest.Create(url);
            request.Timeout = 3000;
            WebResponse response = request.GetResponse();
            responseText = new System.IO.StreamReader(response.GetResponseStream()).ReadToEnd();
        }
        catch
        {
            return tickets;
        }
        //解析返回字符串
        string[] ticketArray = responseText.Split('@');
        foreach (string ticketText in ticketArray)
        {
            string[] ticketOptions = ticketText.Split('^');

            if (ticketOptions.Length == 10)
            {
                DateTime dt = DateTime.ParseExact(ticketOptions[6], "yyyyMMdd", Thread.CurrentThread.CurrentCulture);
                if (dt < DateTime.Now)
                    continue;

                bool iscon = false;
                foreach (AiFeiTicketEntity v in tickets)
                {
                    if (Convert.ToInt32(v.ticketPrice) == Convert.ToInt32(ticketOptions[8]))
                    {
                        iscon = true;
                        break;
                    }
                }
                if (iscon) continue;

                AiFeiTicketEntity afte = new AiFeiTicketEntity();
                afte.fromCity = ticketOptions[0];
                afte.toCity = ticketOptions[1];
                afte.type = ticketOptions[2];
                afte.seatShip = ticketOptions[3];
                afte.shotstayDate = ticketOptions[4];
                afte.longstayDate = ticketOptions[5];
                afte.totripDate = ticketOptions[6];
                afte.airlineCode = ticketOptions[7];
                afte.ticketPrice = ticketOptions[8];
                afte.ticketCode = ticketOptions[9];
                tickets.Add(afte);
            }
        }

        return tickets;
    }
    
    /// <summary>
    /// 机票具体信息查询接口
    /// </summary>
    public AiFeiTicketInfo TicketInfo(string num){
        try
        {
            string url = aifeServerUrl + ticketInfoUrl + _account + num;
            //string url = "http://localhost:4896/web/af.html";
            WebRequest request = WebRequest.Create(url);
            request.Timeout = 5000;
            WebResponse response = request.GetResponse();
            string responseText = new System.IO.StreamReader(response.GetResponseStream()).ReadToEnd();

            string[] ticketOptions = responseText.Split('^');

            if (ticketOptions.Length == 22)
            {
                AiFeiTicketInfo afte = new AiFeiTicketInfo();
                afte.fromCityCode = ticketOptions[0];
                long id = 0;
                afte.fromCityName = ReadXmlHelper.GetFromCityNameByCode(ticketOptions[0].ToString(), out id);
                afte.toCityCode = ticketOptions[1];
                afte.toCityName = ReadXmlHelper.GetToCityNameByCode(ticketOptions[1].ToString(), out id);
                afte.fromAirportCode = ticketOptions[2];
                afte.fromAirportName = ReadXmlHelper.GetAirPortNameByCode(ticketOptions[2]);
                afte.toAirportCode = ticketOptions[3];
                afte.toAirportName = ReadXmlHelper.GetAirPortNameByCode(ticketOptions[3]);
                afte.airlineName = ticketOptions[4];


                if (ticketOptions[5] == "SF")
                {
                    afte.tripType = "1";
                }
                else if (ticketOptions[5] == "DC")
                {
                    afte.tripType = "0";
                }

                afte.ft = ticketOptions[6];
                afte.cangwei = ticketOptions[7];
                afte.untaxprice = ticketOptions[8];
                afte.shortstayDate = ticketOptions[9];

                afte.longstayDate = ticketOptions[10];
                afte.childPrice = ticketOptions[11];
                afte.fromsaleDate = ticketOptions[12];
                afte.tosaleDate = ticketOptions[13];
                afte.fromtripDate = ticketOptions[14];
                afte.totripDate = ticketOptions[15];
                afte.returnMoney = ticketOptions[16];
                afte.updateProvision = ticketOptions[17];

                afte.wuji = ticketOptions[18];
                afte.xingli = ticketOptions[19];
                afte.limitProvision = ticketOptions[20];

                return afte;
            }
        }
        catch
        {
            return null;
        }
        return null;
    }
    
    /// <summary>
    /// 实时航班查询接口
    /// </summary>
    public ArrayList GlobalFlight(string fromCode,string toCode,string airLineCode,string cls,int num,string goTime){
        //string url = aifeServerUrl + globalFlightUrl + _account + cls + "/" + fromCode + "/" + toCode + "/" + airLineCode + "/" + num + "/" + goTime;
        string url = "http://data.faredata.cn/ticketWebService.do?method=globalFlight&account=fyjp&cls=Y&fromCode="+fromCode+"&toCode="+toCode+"&airLineCode="+airLineCode+"&mnum=1&goTime="+goTime;
        
        ArrayList flgihts = new ArrayList();
		try{
			WebRequest request = WebRequest.Create(url);
            request.Timeout = 15000;
			WebResponse response = request.GetResponse();
			string responseText = new System.IO.StreamReader(response.GetResponseStream()).ReadToEnd();
			//解析返回字符串
			string[] flightArray = responseText.Trim().Split('@');//舱位分隔符 @
	        

			//只用一个舱位数据
			foreach (string flightText in flightArray)
			{
				//cache ticket 插入ticket信息
				string ticketId = null;
				string sql = "insert into FY_Aifei_Ticket (fromCity,toCity,airline,fromTime) values ('"+fromCode+"','"+toCode+"','"+airLineCode+"','"+goTime+"') select ID=@@identity";
				DataSet dsTicket = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
				if (dsTicket != null)
				{
					ticketId = dsTicket.Tables[0].Rows[0]["ID"].ToString();
				}
			
				ArrayList flight = new ArrayList();
				//转机分割符 *
				string[] relayArray = flightText.Split('*');
	            
				int flightNum = 1;
				foreach (string relayText in relayArray)
				{
					string[] flightOptions = relayText.Split('^');
					if (flightOptions.Length == 9)
					{
						AiFeiFlightEntity affe = new AiFeiFlightEntity();

						affe.airlineCode = flightOptions[0];
						affe.flightNum = flightOptions[1];
						affe.fromAirport = flightOptions[2];
						affe.toAirport = flightOptions[3];
						affe.toTime = flightOptions[4];
						affe.arriveTime = flightOptions[5];
						affe.airplan = flightOptions[6];
						affe.seats = Convert.ToInt32(flightOptions[7]);
						affe.isRelay = Convert.ToInt32(flightOptions[8]);
	                    
						//cache 舱位信息
						if(ticketId!=null&&!ticketId.Trim().Equals("")&&!ticketId.Trim().Equals("0")){
							sql = "insert into FY_Aifei_Flights (airline,flightNum,toAirport,fromAirport,toTime,arriveTime,airplan,seats,num,ticketid) values ('"+affe.airlineCode+"','"+affe.flightNum+"','"+affe.toAirport+"','"+affe.fromAirport+"','"+affe.toTime+"','"+affe.arriveTime+"','"+affe.airplan+"','"+affe.seats+"','"+flightNum+"','"+ticketId+"')";
							SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
						}
						flightNum++;
	                    
						flight.Add(affe);
					}
				}
				flgihts.Add(flight);
				return flgihts;
			}
	        
        }catch(Exception e){
			return flgihts;
        }
        
        return flgihts;
    }

    /// <summary>
    /// 委托
    /// </summary>
    /// <param name="Dpt"></param>
    /// <param name="Arr"></param>
    /// <param name="ToTime"></param>
    /// <param name="ReTime"></param>
    /// <param name="Cate"></param>
    /// <param name="airlineId"></param>
    /// <param name="allAirlines"></param>
    /// <returns></returns>
    public delegate ArrayList AiFeiTicketsHandler(string Dpt, string Arr, string ToTime, string ReTime, string Cate, int airlineId, ref ArrayList allAirlines);

    public ArrayList AiFeiTickets(string Dpt, string Arr, string ToTime, string ReTime, string Cate, int airlineId, ref ArrayList allAirlines)
    {
        ArrayList ticketsList = this.GlobalTicket(Dpt, Arr, ToTime, ReTime, Cate);
        ArrayList tickets = new ArrayList();
        
        //查找airlineId信息
        
        string airlineCode = null;

        if (airlineId > 0)
            airlineCode = ReadXmlHelper.GetAirLineCodeByID(airlineId);
          

        foreach(object obj in ticketsList)
        { 
            AiFeiTicket aifeiTicket = new AiFeiTicket();
            AiFeiTicketEntity ticketObj = (AiFeiTicketEntity)obj;
            aifeiTicket.price = Convert.ToInt32(ticketObj.ticketPrice);
            aifeiTicket.ticketCode = ticketObj.ticketCode;

            bool hasairline = false;
            foreach (AiFeiAirline v in allAirlines)
            {
                if (v.airlineCode.Trim() == (ticketObj.airlineCode+"").Trim() && !string.IsNullOrEmpty(ticketObj.airlineCode))
                    hasairline = true;
            }
            if (!hasairline)
            {
                //查找airline信息
                long airlineId11 = 0;
                string airlineSmallPic1 = string.Empty;
                string airline1 = ReadXmlHelper.GetAirLineNameByCode(ticketObj.airlineCode, out airlineId11, out airlineSmallPic1);

                AiFeiAirline afa = new AiFeiAirline();
                afa.airlineId = airlineId11.ToString();
                afa.airlineCode = ticketObj.airlineCode;
                afa.airlineName = airline1;
                afa.airlinePic = airlineSmallPic1;
                allAirlines.Add(afa);
            }


            if(airlineCode!=null){
				if(!airlineCode.Equals(ticketObj.airlineCode))
					continue ;
            }
           
            aifeiTicket.fromCityCode = ticketObj.fromCity;
            long fromCityId = 0;
            aifeiTicket.fromCity = ReadXmlHelper.GetFromCityNameByCode(ticketObj.fromCity, out fromCityId);
            aifeiTicket.fromCityId = fromCityId.ToString();

            //查找city信息
            //string str = "select * from FY_FromCity where cityCode='" + ticketObj.fromCity.Trim() + "'";
            //DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            //if (ds != null)
            //{
            //    aifeiTicket.fromCity = ds.Tables[0].Rows[0]["chName"].ToString();
            //    aifeiTicket.fromCityId = ds.Tables[0].Rows[0]["fId"].ToString();
            //}
            //else
            //{
            //    aifeiTicket.fromCity = "";
            //    aifeiTicket.fromCityId = "0";
            //}
            
            aifeiTicket.toCityCode = ticketObj.toCity;
            long toCityId = 0;
            aifeiTicket.toCity = ReadXmlHelper.GetToCityNameByCode(ticketObj.toCity, out toCityId);
            aifeiTicket.toCityId = toCityId.ToString();

            //查找city信息
            //str = "select * from FY_ToCity where cityCode='" + ticketObj.toCity.Trim() + "'";
            //ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            //if (ds != null)
            //{
            //    aifeiTicket.toCity = ds.Tables[0].Rows[0]["chName"].ToString();
            //    aifeiTicket.toCityId = ds.Tables[0].Rows[0]["tId"].ToString();
            //}
            //else
            //{
            //    aifeiTicket.toCity = "";
            //    aifeiTicket.toCityId = "0";
            //}

            aifeiTicket.airlineCode = ticketObj.airlineCode;
            
            
            //查找airline信息
            long airlineId1 = 0;
            string airlineSmallPic = string.Empty;
            string airline = ReadXmlHelper.GetAirLineNameByCode(ticketObj.airlineCode,out airlineId1,out airlineSmallPic);
            aifeiTicket.airline = airline;
            aifeiTicket.airlineId = airlineId1.ToString();
            aifeiTicket.airlineSmallPic = airlineSmallPic;

            //str = "select * from FY_Airline where airlineCode='" + ticketObj.airlineCode.Trim() +"'";
            //ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);

            //if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            //{
            //    aifeiTicket.airline =  ;
            //    aifeiTicket.airlineId = ds.Tables[0].Rows[0]["aId"].ToString();
            //    aifeiTicket.airlineSmallPic = ds.Tables[0].Rows[0]["smallPic"].ToString();
            //}
            //else
            //{
            //    aifeiTicket.airline = "";
            //    aifeiTicket.airlineId = "0";
            //}

            aifeiTicket.sourceType = "aifei";
            if (ticketObj.type == "SF")
            {
                aifeiTicket.tripType = "1";
            }else if(ticketObj.type == "DC")
            {
                aifeiTicket.tripType = "0";
            }
            //aifeiTicket.isRelay = ticketObj.type;

            //查找税费信息
            //string str = "select * from FY_Tax where airline='" + aifeiTicket.airlineId + "' and fromCity='" + fromCityId + "' and toCity='" + toCityId + "'";
            //DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            //if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
            //{
            //    aifeiTicket.tax = ds.Tables[0].Rows[0]["tax"].ToString();
            //}
            //else
            //{
            //    aifeiTicket.tax = "---";
            //}
            
			
			//本地查询航班信息 from to airline fromtime
			/*
            ArrayList flightList = getFlightMsg(aifeiTicket.fromCityCode, aifeiTicket.toCityCode, aifeiTicket.airlineCode, ToTime);
            if(flightList == null){
				//增加航班信息缓存
				//请求航班信息
				flightList = this.GlobalFlight(aifeiTicket.fromCityCode, aifeiTicket.toCityCode, aifeiTicket.airlineCode, "Y", 1, ToTime);
				//flightList = new ArrayList();
            }
            aifeiTicket.flights = flightList;
            */

            tickets.Add(aifeiTicket);
        }
        //this.GlobalFlight(string fromCode,string toCode,string airLineCode,string cls,int num,string goTime);

        return tickets;
    }
    
	public ArrayList getFlightMsg(string fromCityCode, string toCityCode, string airlineCode, string toTime){
		string sql = "select top 1 id from FY_AiFei_Ticket where fromCity='"+fromCityCode.Trim()+"' and toCity='"+toCityCode.Trim()+"' and airline='"+airlineCode.Trim()+"'";
		DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
		ArrayList flights = new ArrayList();
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
						
						affe.toTime = toDT.ToString("yyyy-MM-dd HH:mm:ss");
						affe.arriveTime = fromDT.ToString("yyyy-MM-dd HH:mm:ss");
						
						affe.airplan = dr["airplan"].ToString();
						affe.seats = Convert.ToInt32(dr["seats"].ToString());
						affe.isRelay = 0;
						
						flight.Add(affe);
					}
                }
                
				flights.Add(flight);
				return flights;
        }
        return null;
	}

    /// <summary>
    /// 实时航班查询接口委托
    /// </summary>
    /// <param name="fromCode"></param>
    /// <param name="toCode"></param>
    /// <param name="airLineCode"></param>
    /// <param name="cls"></param>
    /// <param name="num"></param>
    /// <param name="goTime"></param>
    /// <returns></returns>
    public delegate FeiYingFlight GlobalFlight2Handler(string fromCode, string toCode, string airLineCode, string cls, int num, string goTime);

    /// <summary>
    /// 实时航班查询接口
    /// </summary>
    public FeiYingFlight GlobalFlight2(string fromCode,string toCode,string airLineCode,string cls,int num,string goTime){
        //string url = aifeServerUrl + globalFlightUrl + _account + cls + "/" + fromCode + "/" + toCode + "/" + airLineCode + "/" + num + "/" + goTime;
        string url = "http://data.faredata.cn/ticketWebService.do?method=globalFlight&account=fyjp&cls=Y&fromCode="+fromCode+"&toCode="+toCode+"&airLineCode="+airLineCode+"&mnum=1&goTime="+goTime;
        //string url = "http://localhost:4896/web/111.html";
		try{
			WebRequest request = WebRequest.Create(url);
            request.Timeout = 15000;
			WebResponse response = request.GetResponse();
			string responseText = new System.IO.StreamReader(response.GetResponseStream()).ReadToEnd();
			//解析返回字符串
			string[] flightArray = responseText.Trim().Split('@');//舱位分隔符 @
			//只用一个舱位数据
			foreach (string flightText in flightArray)
			{
			
			
				ArrayList flight = new ArrayList();
				//转机分割符 *
				string[] relayArray = flightText.Split('*');
	            
				int flightNum = 1;
				foreach (string relayText in relayArray)
				{
					string[] flightOptions = relayText.Split('^');
					if (flightOptions.Length == 9)
					{
						AiFeiFlightEntity affe = new AiFeiFlightEntity();

						affe.airlineCode = flightOptions[0];
						affe.flightNum = flightOptions[1];
						affe.fromAirport = flightOptions[2];
						affe.toAirport = flightOptions[3];
						affe.toTime = flightOptions[4];
						affe.arriveTime = flightOptions[5];
						affe.airplan = flightOptions[6];
						affe.seats = Convert.ToInt32(flightOptions[7]);
						affe.isRelay = Convert.ToInt32(flightOptions[8]);
	                    
						flight.Add(affe);
					}
				}
			
				if(flight.Count>0){
					AiFeiFlightEntity affe1 = (AiFeiFlightEntity)flight[0];
					AiFeiFlightEntity affe2 = (AiFeiFlightEntity)flight[flight.Count - 1];
					
					FeiYingFlight fyf = new FeiYingFlight();
					
					fyf.airlineCode = affe1.airlineCode;
					fyf.flightNum = affe1.flightNum;
					fyf.fromAirport = affe1.fromAirport;
					fyf.toAirport = affe2.toAirport;
					fyf.toTime = goTime;
					fyf.startTime = affe1.toTime;
					fyf.arriveTime = affe2.arriveTime;
					
					if(flight.Count>1){
					    fyf.isRelay = 1;
					    AiFeiFlightEntity affeRelay  = (AiFeiFlightEntity)flight[1];
					    fyf.relayPort = affeRelay.fromAirport;
					}
					else
					    fyf.isRelay = 0;

                    string sql = "insert into FY_Aifei_Ticket2 (fromCity,toCity,airlineCode,toTime,arriveTime,startTime,fromAirport,toAirport,isrelay,flightNum,relayPort,airplan) values ('" + fromCode + "','" + toCode + "','" + airLineCode + "','" + goTime + "','" + affe2.arriveTime + "','" + affe1.toTime + "','" + affe1.fromAirport + "','" + affe2.toAirport + "','" + fyf.isRelay + "','" + affe1.flightNum + "','" + fyf.relayPort + "','" + affe1.airplan + "')";
					DataSet dsTicket = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
					
					return fyf;
				}
				return null;
			}
	        
        }catch(Exception e){
			throw;
			//return null;
        }
        
        return null;
    }

    public FeiYingFlight getFlightMsg2(string fromCityCode, string toCityCode, string airlineCode, string toTime)
    {
        string sql = "select * from FY_AiFei_Ticket2 where fromCity='" + fromCityCode.Trim() + "' and toCity='" + toCityCode.Trim() + "' and airlineCode='" + airlineCode.Trim() + "'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);

        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            int i = new Random().Next(0, ds.Tables[0].Rows.Count - 1);
            DataRow dr = ds.Tables[0].Rows[i];
            FeiYingFlight fyf = new FeiYingFlight();

            fyf.airlineCode = dr["airlineCode"].ToString();
            fyf.flightNum = dr["flightNum"].ToString();
            fyf.fromAirport = dr["fromAirport"].ToString();
            fyf.toAirport = dr["toAirport"].ToString();
            fyf.toTime = dr["toTime"].ToString();
            fyf.startTime = dr["startTime"].ToString();
            fyf.arriveTime = dr["arriveTime"].ToString();
            fyf.airplan = dr["airplan"].ToString();
            //fyf.isRelay = dr["isRelay"].ToString();
            fyf.relayPort = dr["relayPort"].ToString();

            return fyf;
        }
        return null;
    }

    public void clearTimeOutLogs(string fromCityCode, string toCityCode, string airlineCode)
    {
        string str = "delete FY_AiFei_Ticket2 where fromCity='" + fromCityCode.Trim() + "' and toCity='" + toCityCode.Trim() + "' and airlineCode='" + airlineCode.Trim() + "' and datediff(day,addtime,getdate())>60";
        SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_select, CommandType.Text, str);
    }
}

/// <summary>
/// 机票实体
/// </summary>
public class FeiYingFlight
{
	public string airlineCode;//航空公司代码
    public string flightNum;//航班号
    public string fromAirport;//出发机场三字码
    public string toAirport;
    public string toTime;
    public string startTime;
    public string arriveTime;
    public int isRelay;//是否转机
    public string relayPort;
    public string airplan;
}

public class AiFeiTicketEntity
{
    public string fromCity;//出发城市
    public string toCity;
    public string type;
    public string seatShip;//舱位
    public string shotstayDate;//最短停留
    public string longstayDate;//最长停留
    public string totripDate;//截止出发日期
    public string airlineCode;//航空公司代码
    public string ticketPrice;
    public string ticketCode;
    public string relayPort;//中转机场
}

public class AiFeiFlightEntity
{
    public string airlineCode;//航空公司代码
    public string flightNum;//航班号
    public string fromAirport;//出发机场三字码
    public string fromAirportName;
    public string toAirport;
    public string toAirportName;
    public string toTime;
    public string arriveTime;
    public string airplan;//机型信息
    public int seats;//座位数
    public int isRelay;//是否转机
}

public class AiFeiTicket
{
	public string ticketId;
	public string flightNum;//航班号
    public int price;//票价
    public string fromCity;
    public string fromCityCode;
    public string fromCityId;
    
    public string toCity;
    public string toCityCode;
    public string toCityId;

    public string airlineCode;
    public string airline;
    public string airlineId;
    public string airlineSmallPic;

    public string tax;//税费

    public int isRelay;
    public string relayPort;
    public string sourceType;
    public string tripType;
  
    public ArrayList flights;//转机航班
    
    public string ticketCode;//票号
}

public class AiFeiAirline
{
    public string airlineCode;
    public string airlineName;
    public string airlineId;
    public string minPrice;
    public string airlinePic;
}

public class AiFeiTicketInfo
{
	public string fromCityName;
	public string fromCityCode;
	public string toCityName;
	public string toCityCode;
	public string fromAirportName;
	public string fromAirportCode;
	public string toAirportName;
	public string toAirportCode;
	public string airlineName;
	public string airId;
	public string airchName;
	public string smallPic;
	public string logoPic;
	public string tripType;
	public string ft;
	public string cangwei;
	public string untaxprice;
	public string shortstayDate;
	public string longstayDate;
	public string childPrice;
	public string fromsaleDate;
	public string tosaleDate;
	public string fromtripDate;
	public string totripDate;
	public string returnMoney;
	public string updateProvision;
	public string wuji;
	public string xingli;
	public string limitProvision ;
	public string relayPort;
	
	public string engerTicket;//客票类型
	public string attPrice;//旺季附加费
	public string tairportdescription ;
	public string bagPrice;//免费行李额
	
	public string startTime;
	public string arriveTime;
	
	public string score;
	public string zongping;
	public string xiai;
	public string xiaofei;
	public string manyi;
	public string fuwu;
	
	public string planNum;
	public string age;
}





