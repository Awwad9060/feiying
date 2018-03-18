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


public partial class share_AifeiRequest : System.Web.UI.Page
{

    private string from = string.Empty;
    private string to = string.Empty;
    private string totime = string.Empty;
    private string fromtime = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        from = Request.QueryString["from"];
        to = Request.QueryString["to"];
        string airline = Request.QueryString["airline"];
        totime = Request.QueryString["totime"];
        fromtime = Request.QueryString["fromtime"];
        string ticketType = Request.QueryString["ticketType"];//机票类型  单程、往返

        AiFeiService afs = new AiFeiService();
        //清除过期记录
        afs.clearTimeOutLogs(from, to, airline);

        if(ticketType!=null&&ticketType.Equals("1")){
        //往返
			FeiYingFlight toFlight = afs.getFlightMsg2(from, to, airline, totime);	
			FeiYingFlight backFlight = afs.getFlightMsg2(to, from, airline, fromtime);

            //System.Threading.AutoResetEvent resetEvent = new System.Threading.AutoResetEvent(false);
            //AiFeiService.GlobalFlight2Handler d1 = new AiFeiService.GlobalFlight2Handler(afs.GlobalFlight2);
            //AiFeiService.GlobalFlight2Handler d2 = new AiFeiService.GlobalFlight2Handler(afs.GlobalFlight2);
            //IAsyncResult iar1 = null, iar2 = null;
            //bool searchto = false, searchback = false;
            //AsyncCallback back1 = delegate(IAsyncResult iar)
            //{
            //    toFlight = d1.EndInvoke(iar1);
            //    if (!searchback || (iar2 != null && iar2.IsCompleted))
            //        resetEvent.Set();
            //};

            //AsyncCallback back2 = delegate(IAsyncResult iar)
            //{
            //    backFlight = d2.EndInvoke(iar2);
            //    if (!searchto || (iar1 != null && iar1.IsCompleted))
            //        resetEvent.Set();
            //};
            //if (toFlight == null)
            //{
            //    searchto = true;
            //    iar1 = d1.BeginInvoke(from, to, airline, "Y", 1, totime, back1, null);
            //}
            //if (backFlight == null)
            //{
            //    searchback = true;
            //    iar2 = d2.BeginInvoke(to, from, airline, "Y", 1, fromtime, back2, null);
            //}

            //if (toFlight == null || backFlight == null)
            //{
            //    if (resetEvent.WaitOne(30000, true))
            //        resetEvent.Close();
            //}

            ////远程
            //if (toFlight == null)
            //{
            //    //请求远程
            //    System.Threading.Thread thread = new System.Threading.Thread((System.Threading.ThreadStart)delegate
            //    {
            //        toFlight = afs.GlobalFlight2(from, to, airline, "Y", 1, totime);
            //    });
            //    thread.IsBackground = true;
            //    thread.Start();
            //}
            //if (backFlight == null)
            //{
            //    //请求远程
            //    System.Threading.Thread thread = new System.Threading.Thread((System.Threading.ThreadStart)delegate
            //    {
            //        backFlight = afs.GlobalFlight2(to, from, airline, "Y", 1, fromtime);
            //    });
            //    thread.IsBackground = true;
            //    thread.Start();
            //}

            if (toFlight == null)
            {
                this.InsertAiFeiLogs(from, to, airline, totime);
            }
            if (backFlight == null)
            {
                this.InsertAiFeiLogs(to, from, airline, fromtime);
            }

			//没有数据
			if (toFlight==null||backFlight==null)
			{
				Response.Write("false");
				Response.End();
				return;
			}
			
			StringBuilder str = new StringBuilder();
			str.Append("<div>");
			str.Append("<span class=\"aifeifrom\">" + printf_flights(toFlight,backFlight,"from",ticketType) + "</span>");
			str.Append("<span class=\"aifeito\">" + printf_flights(toFlight,backFlight ,"to",ticketType) + "</span>");
			str.Append("<span class=\"aifeiline\">" + printf_flights(toFlight, backFlight,"line",ticketType) + "</span>");
			str.Append("<span class=\"relay\">" + printf_relay(toFlight, backFlight) + "</span>");
            if (string.IsNullOrEmpty(toFlight.airplan) && string.IsNullOrEmpty(backFlight.airplan))
                str.Append("<span class=\"airplan\"></span>");
            else if (!string.IsNullOrEmpty(toFlight.airplan) && !string.IsNullOrEmpty(backFlight.airplan))
                str.Append("<span class=\"airplan\">" + (toFlight.airplan + "").Trim() + " / " + (backFlight.airplan + "").Trim() + "</span>");
            else str.Append("<span class=\"airplan\">" + (toFlight.airplan + "").Trim() + (backFlight.airplan + "").Trim() + "</span>");

			str.Append("</div>");
			Response.Write(str.ToString());
			Response.End();
        }else if(ticketType!=null&&ticketType.Equals("0")){
			FeiYingFlight toFlight = afs.getFlightMsg2(from, to, airline, totime);	
            ////远程
            //if (toFlight == null)
            //{
            //    //请求远程
            //    System.Threading.Thread thread = new System.Threading.Thread((System.Threading.ThreadStart)delegate
            //    {
            //        toFlight = afs.GlobalFlight2(from, to, airline, "Y", 1, totime);
            //    });
            //    thread.IsBackground = true;
            //    thread.Start();
            //}	
			
			//没有数据
			if (toFlight == null)
			{
                this.InsertAiFeiLogs(from, to, airline, totime);

				Response.Write("false");
				Response.End();
				return;
			}
			
			StringBuilder str = new StringBuilder();
			str.Append("<div>");
			str.Append("<span class=\"aifeifrom\">" + printf_flights(toFlight, null,"from",ticketType) + "</span>");
			str.Append("<span class=\"aifeito\">" + printf_flights(toFlight, null,"to",ticketType) + "</span>");
			str.Append("<span class=\"aifeiline\">" + printf_flights(toFlight, null,"line",ticketType) + "</span>");
			str.Append("<span class=\"relay\">" + printf_relay(toFlight, null) + "</span>");
            str.Append("<span class=\"airplan\">" + (toFlight.airplan + "").Trim() + "</span>");
			str.Append("</div>");
			Response.Write(str.ToString());
			Response.End();
        }
    }
    
    //private string printf_relay(FeiYingFlight toFlight,FeiYingFlight backFlight){
    //    //return ReadXmlHelper.GetAirPortNameByCode(toFlight.relayPort);
    //    if (string.IsNullOrEmpty(toFlight.relayPort))
    //        return string.Empty;

    //    long id = 0;
    //    string result = ReadXmlHelper.GetToCityNameByCode(toFlight.relayPort, out id);
    //    if (string.IsNullOrEmpty(result))
    //        return string.Empty;

    //    return "经 " + result + "城市转机";
    //}

    /// <summary>
    /// 插入系统记录
    /// </summary>
    private void InsertAiFeiLogs(string fromCode, string toCode, string airLineCode, string goTime)
    {
        System.Threading.Thread thread = new System.Threading.Thread((System.Threading.ThreadStart)delegate
        {
            try
            {
                string sql = "if not exists(select * from FY_Aifei_SearchLogs where fromCity='" + fromCode.Trim() + "' and toCity='" + toCode.Trim() + "' and airlineCode='" + airLineCode.Trim() + "')";
                sql += " begin";
                sql += " insert into FY_Aifei_SearchLogs (fromCity,toCity,airlineCode,toTime) values ('" + fromCode.Trim() + "','" + toCode.Trim() + "','" + airLineCode.Trim() + "','" + goTime.Trim() + "')";
                sql += " end";
                SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
            }
            catch
            {
            }
        });
        thread.IsBackground = true;
        thread.Start();
    }

    private string printf_relay(FeiYingFlight toFlight, FeiYingFlight backFlight)
    {
        if (string.IsNullOrEmpty(toFlight.relayPort.Trim()))
            return "直飞";

        return "中转";
    }

    private string datetimeTo(string date)
    {
        return date.Substring(0, 4) + "-" + date.Substring(4, 2) + "-" + date.Substring(6, 2) + " " + date.Substring(8, 2) + ":" + date.Substring(10, 2);
    }

    protected string printf_flights(FeiYingFlight toFlight,FeiYingFlight backFlight, string type,string ticketType)
    {
        if (type.Equals("from"))
        {
            string str = "";
      
			if(toFlight!=null){
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(from) + "</li><li class='lititle2'>起飞：" + convertDate(totime, toFlight.startTime) + "</li>";
			}
			
			if(backFlight!=null){
				str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(to) + "</li><li class='lititle2'>起飞：" +  convertDate(fromtime, backFlight.startTime) + "</li>";
			}
            return str;
        }
        else if (type.Equals("to"))
        {
            string str = "";
      
			if(toFlight!=null){
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(to) + "</li><li class='lititle2'>到达：" + convertDate(totime, toFlight.startTime, toFlight.arriveTime) + "</li>";
			}
			
			if(backFlight!=null){
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(from) + "</li><li class='lititle2'>到达：" + convertDate(fromtime, backFlight.startTime, backFlight.arriveTime) + "</li>";
			}
            return str;
        }
        else if (type.Equals("line"))
        {
            string str = "";
            
            if(toFlight!=null){
                str += "<li class='lititle1'><img src='/images/sgo.gif'/>&rarr;</li><li class='lititle2'>&nbsp;</li>";
			}
			
			if(backFlight!=null){
                str += "<li class='lititle1'><img src='/images/sback.gif'/>&rarr;</li><li class='lititle2'>&nbsp;</li>";
			}
            return str;
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
    
    /// <summary>
    /// 
    /// </summary>
    /// <param name="time"></param>
    /// <param name="tmpToTime"></param>
    /// <returns></returns>
    private string convertDate(string time, string tmpToTime){
        return time.Substring(0, 4) + "-" + time.Substring(4, 2) + "-" + time.Substring(6, 2) + " " + tmpToTime.Substring(8, 2) + ":" + tmpToTime.Substring(10, 2);
    }

    private string convertDate(string time, string tmpToTime, string arriveTime)
    {
        DateTime dt1 = StringToDate(tmpToTime);
        DateTime dt2 = StringToDate(arriveTime);
        double minutes = (dt2 - dt1).TotalMinutes;

        return Convert.ToDateTime(time.Substring(0, 4) + "-" + time.Substring(4, 2) + "-" + time.Substring(6, 2) + " " + tmpToTime.Substring(8, 2) + ":" + tmpToTime.Substring(10, 2)).AddMinutes(minutes).ToString("yyyy-MM-dd HH:mm");
    }

    private DateTime StringToDate(string tmpToTime)
    {
        return Convert.ToDateTime(tmpToTime.Substring(0, 4) + "-" + tmpToTime.Substring(4, 2) + "-" + tmpToTime.Substring(6, 2) + " " + tmpToTime.Substring(8, 2) + ":" + tmpToTime.Substring(10, 2));
    }

    #region Helper
    /// <summary>
    /// 向页面输出xml内容
    /// </summary>
    /// <param name="xmlnode">xml内容</param>
    private void ResponseXML(System.Text.StringBuilder xmlnode)
    {
        System.Web.HttpContext.Current.Response.Clear();
        System.Web.HttpContext.Current.Response.ContentType = "Text/XML";
        System.Web.HttpContext.Current.Response.Expires = 0;

        System.Web.HttpContext.Current.Response.Cache.SetNoStore();
        System.Web.HttpContext.Current.Response.Write(xmlnode.ToString());
        System.Web.HttpContext.Current.Response.End();
    }
    #endregion

    #region Helper
    /// <summary>
    /// 向页面输出文本内容

    /// </summary>
    /// <param name="xmlnode">xml内容</param>
    private void ResponsePlain(System.Text.StringBuilder xmlnode)
    {
        System.Web.HttpContext.Current.Response.Clear();
        System.Web.HttpContext.Current.Response.ContentType = "Text/plain";
        System.Web.HttpContext.Current.Response.Expires = 0;

        System.Web.HttpContext.Current.Response.Cache.SetNoStore();
        System.Web.HttpContext.Current.Response.Write(xmlnode.ToString());
        System.Web.HttpContext.Current.Response.End();
    }
    #endregion
}
