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
using System.Collections.Generic;

public partial class showTicket2 : System.Web.UI.Page
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

    protected FlightRoundTrip flightround = null;

    /// <summary>
    /// 类型 0单程 1往返
    /// </summary>
    protected string TripType
    {
        get
        {
            try
            {
                string tt = string.Empty;
                if (Request.QueryString["tripType"] != null)
                {
                    tt = Request.QueryString["tripType"];
                }
                return tt;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
    /// <summary>
    /// 出发城市三字码
    /// </summary>
    protected string FromCityCode
    {
        get
        {
            try
            {
                string fcc = string.Empty;
                if (Request.QueryString["fromcityCode"] != null)
                {
                    fcc = Request.QueryString["fromcityCode"].ToUpper();
                }
                return fcc;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
    /// <summary>
    /// 到达城市三字码
    /// </summary>
    protected string ToCityCode
    {
        get
        {
            try
            {
                string tcc = string.Empty;
                if (Request.QueryString["tocityCode"] != null)
                {
                    tcc = Request.QueryString["tocityCode"].ToUpper();
                }
                return tcc;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
    /// <summary>
    /// 出发时间{yyyy-mm-dd}
    /// </summary>
    protected string TripDate
    {
        get
        {
            try
            {
                string td = string.Empty;
                if (Request.QueryString["tripDate"] != null)
                {
                    td = DateTime.ParseExact(Request.QueryString["tripDate"], "yyyyMMdd", System.Globalization.CultureInfo.CurrentCulture).ToString("yyyy-MM-dd");
                    //td = Convert.ToDateTime(Request.QueryString["tripDate"]).ToString("yyyy-MM-dd"); 
                }
                return td;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
    /// <summary>
    /// 返程时间{yyyy-mm-dd}
    /// </summary>
    protected string BackDate
    {
        get
        {
            try
            {
                string bd = string.Empty;
                if (Request.QueryString["backDate"] != null)
                {
                    bd = DateTime.ParseExact(Request.QueryString["backDate"], "yyyyMMdd", System.Globalization.CultureInfo.CurrentCulture).ToString("yyyy-MM-dd");
                }
                return bd;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
    /// <summary>
    /// data属性标识
    /// </summary>
    protected string DataGuid
    {
        get
        {
            try
            {
                string dg = string.Empty;
                if (Request.QueryString["dataGuid"] != null)
                {
                    dg = Request.QueryString["dataGuid"];
                }
                return dg;
            }
            catch (Exception)
            {
                return string.Empty;
            }
        }
    }
    /// <summary>
    /// 目的地名称
    /// </summary>
    protected string ToCityName = string.Empty;

    protected string FromCityName = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            try
            {
                long a = 0;
                ToCityName = ReadXmlHelper.GetToCityNameByCode(ToCityCode, out a);
                FromCityName = ReadXmlHelper.GetFromCityNameByCode(FromCityCode, out a);
                //LogHelper.WriteLog(string.Format("TripType:{0},FromCityCode:{1},ToCityCode:{2},TripDate:{3},BackDate:{4}", this.TripType, this.FromCityCode, this.ToCityCode, this.TripDate, this.BackDate));
                FlightTotal ftinfo = (FlightTotal)Session[string.Format("TicketsSessionKey2_{0}_{1}_{2}_{3}_{4}", this.TripType, this.FromCityCode, this.ToCityCode, Convert.ToDateTime(this.TripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.BackDate).ToString("yyyyMMdd"))];
                if (ftinfo != null)
                {
                    foreach (FlightRoundTrip item in ftinfo.result)
                    {
                        bool isContains = false;
                        foreach (FlightInfo fInfo in item.ListInterFlightInfo)
                        {
                            if (DataGuid == fInfo.dataId)
                            {
                                isContains = true;
                                flightround = item;
                                break;
                            }
                        }
                        if (isContains)
                        {
                            break;
                        }
                    }
                }
                else
                {
                    if (Session[string.Format("TicketsSessionKey_limit_{0}", DataGuid)] != null)
                    {
                        flightround = (FlightRoundTrip)Session[string.Format("TicketsSessionKey_limit_{0}", DataGuid)];
                    }
                    else
                    {
                        this.GetSource();
                    }
                }
            }
            catch (Exception ex)
            {
                //LogHelper.WriteLog(ex.StackTrace+ex.ToString()+ ex.Message);
            }
        }
    }
    protected void GetSource()
    {
        if (DataGuid.Length > 0 && DataGuid.Length < 32)
        {
            flightround = GetFeiying580();
            Session[string.Format("TicketsSessionKey_limit_{0}", DataGuid)] = flightround;
        }
        else
        {
            flightround = GetApi();
            Session[string.Format("TicketsSessionKey_limit_{0}", DataGuid)] = flightround;
        }
    }
    /// <summary>
    /// 获取feiying网手工数据
    /// </summary>
    /// <returns></returns>
    private FlightRoundTrip GetFeiying580()
    {
        DataRow dr = null;
        DataSet ds = null;
        FlightRoundTrip rTrip = null;
        string str = "select FY_Ticket.*,FY_FromCity.chName as fromCityname,FY_Airline.airlineCode as airlineCode,FY_FromCity.cityCode as fromCityCode, FY_ToCity.chName as toCityname,FY_ToCity.cityCode as toCityCode, FY_Airline.chName as airname,FY_Airline.planNum as planNum,FY_Airline.age as age,FY_Airline.aId as airId ,FY_Airline.logoPic as logoPic,FY_Airline.smallPic as smallPic, fAirport.chName as fAirportName,fAirport.airPortCode as fAirportCode, tAirport.chName as tAirportName,tAirport.airPortCode as tAirportCode,tAirport.description as tairportdescription from FY_Ticket left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine  left join FY_Airport as  fAirport on fAirport.apId=FY_Ticket.fromPort left join FY_Airport as tAirport on tAirport.apId=FY_Ticket.toPort  where FY_Ticket.tId=" + DataGuid;

        try
        {
            ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                dr = ds.Tables[0].Rows[0];

                rTrip = new FlightRoundTrip();
                List<FlightInfo> listF = new List<FlightInfo>();
                List<FlightInfo2> listF2 = new List<FlightInfo2>();
                if (Convert.ToInt32(TripType) == 0)
                {
                    #region 单程
                    List<FlightDetail> listDeteil = new List<FlightDetail>();
                    FlightInfo finfo = new FlightInfo();
                    finfo.Data = Guid.NewGuid().ToString("N").ToUpper();
                    finfo.Source = "feiying";
                    finfo.TicketPrice = decimal.Parse(dr["untaxPrice"].ToString());
                    finfo.XmlInfo = dr["tid"].ToString();
                    finfo.Tid = dr["tid"].ToString();

                    FlightDetail fdInfo = new FlightDetail();
                    fdInfo.AirCompanyCode = dr["airlineCode"].ToString();
                    fdInfo.StartCityCode = dr["fromCityCode"].ToString();
                    fdInfo.StartCityName = ReadXmlHelper.GetAirPortNameByCode(dr["fromCityCode"].ToString());
                    fdInfo.BeginCityName = dr["fromCityname"].ToString();

                    //如果有中转，则到达城市、机场等替换为中转地
                    if (string.IsNullOrEmpty(dr["relayPort"].ToString()))
                    {
                        fdInfo.EndCityCode = dr["toCityCode"].ToString();
                        fdInfo.EndCityName = ReadXmlHelper.GetAirPortNameByCode(dr["toCityCode"].ToString());
                        fdInfo.ToCityName = dr["toCityname"].ToString();
                    }
                    else
                    {
                        string[] array = dr["relayPort"].ToString().Split('-');
                        fdInfo.EndCityCode = array[0];
                        fdInfo.EndCityName = ReadXmlHelper.GetAirPortNameByCode(array[0]);
                        long a = 0;//纯粹接收参数
                        fdInfo.ToCityName = ReadXmlHelper.GetToCityNameByCode(array[0], out a);
                    }

                    fdInfo.FromTime = DateTime.Parse(ReadTime(this.TripDate, 0));
                    fdInfo.ArriveTime = ReadTime(fdInfo.FromTime);
                    listDeteil.Add(fdInfo);
                    //如果有中转
                    if (!string.IsNullOrEmpty(dr["relayPort"].ToString()))
                    {
                        FlightDetail fdInfo2 = new FlightDetail();
                        fdInfo2.AirCompanyCode = string.Empty;//dr["airlineCode"].ToString();
                        fdInfo2.StartCityCode = fdInfo.EndCityCode;//dr["fromCityCode"].ToString();
                        fdInfo2.EndCityCode = dr["toCityCode"].ToString();
                        fdInfo2.StartCityName = ReadXmlHelper.GetAirPortNameByCode(fdInfo.EndCityCode);
                        fdInfo2.EndCityName = ReadXmlHelper.GetAirPortNameByCode(dr["toCityCode"].ToString());
                        fdInfo2.BeginCityName = fdInfo.ToCityName;//dr["fromCityname"].ToString();
                        fdInfo2.ToCityName = dr["toCityname"].ToString();
                        fdInfo2.FromTime = ReadTime(fdInfo.ArriveTime);
                        fdInfo2.ArriveTime = ReadTime(fdInfo2.FromTime);
                        listDeteil.Add(fdInfo2);
                    }
                    finfo.ListInterFlightDetails = listDeteil;
                    listF.Add(finfo);
                    #endregion
                }
                else
                {
                    #region 去程
                    List<FlightDetail> listDeteil = new List<FlightDetail>();
                    FlightInfo finfo = new FlightInfo();
                    finfo.Data = Guid.NewGuid().ToString("N").ToUpper();
                    finfo.Source = "feiying";
                    finfo.TicketPrice = decimal.Parse(dr["untaxPrice"].ToString());
                    finfo.XmlInfo = dr["tid"].ToString();
                    finfo.Tid = dr["tid"].ToString();

                    FlightDetail fdInfo = new FlightDetail();
                    fdInfo.AirCompanyCode = dr["airlineCode"].ToString();
                    fdInfo.StartCityCode = dr["fromCityCode"].ToString();
                    fdInfo.StartCityName = ReadXmlHelper.GetAirPortNameByCode(dr["fromCityCode"].ToString());
                    fdInfo.BeginCityName = dr["fromCityname"].ToString();

                    //如果有中转，则到达城市、机场等替换为中转地
                    if (string.IsNullOrEmpty(dr["relayPort"].ToString()))
                    {
                        fdInfo.EndCityCode = dr["toCityCode"].ToString();
                        fdInfo.EndCityName = ReadXmlHelper.GetAirPortNameByCode(dr["toCityCode"].ToString());
                        fdInfo.ToCityName = dr["toCityname"].ToString();
                    }
                    else
                    {
                        string[] array = dr["relayPort"].ToString().Split('-');
                        fdInfo.EndCityCode = array[0];
                        fdInfo.EndCityName = ReadXmlHelper.GetAirPortNameByCode(array[0]);
                        long a = 0;//纯粹接收参数
                        fdInfo.ToCityName = ReadXmlHelper.GetToCityNameByCode(array[0], out a);
                    }

                    fdInfo.FromTime = DateTime.Parse(ReadTime(this.TripDate, 0));
                    fdInfo.ArriveTime = ReadTime(fdInfo.FromTime);
                    listDeteil.Add(fdInfo);
                    //如果有中转
                    if (!string.IsNullOrEmpty(dr["relayPort"].ToString()))
                    {
                        FlightDetail fdInfo2 = new FlightDetail();
                        fdInfo2.AirCompanyCode = string.Empty;//dr["airlineCode"].ToString();
                        fdInfo2.StartCityCode = fdInfo.EndCityCode;//dr["fromCityCode"].ToString();
                        fdInfo2.EndCityCode = dr["toCityCode"].ToString();
                        fdInfo2.StartCityName = ReadXmlHelper.GetAirPortNameByCode(fdInfo.EndCityCode);
                        fdInfo2.EndCityName = ReadXmlHelper.GetAirPortNameByCode(dr["toCityCode"].ToString());
                        fdInfo2.BeginCityName = fdInfo.ToCityName;//dr["fromCityname"].ToString();
                        fdInfo2.ToCityName = dr["toCityname"].ToString();
                        fdInfo2.FromTime = ReadTime(fdInfo.ArriveTime);
                        fdInfo2.ArriveTime = ReadTime(fdInfo2.FromTime);
                        listDeteil.Add(fdInfo2);
                    }
                    finfo.ListInterFlightDetails = listDeteil;
                    listF.Add(finfo);
                    #endregion

                    #region 返程
                    List<FlightDetail> listDeteil2 = new List<FlightDetail>();
                    FlightInfo2 finfo2 = new FlightInfo2();
                    finfo2.Source = "feiying";
                    finfo2.TicketPrice = decimal.Parse(dr["untaxPrice"].ToString());

                    FlightDetail fdbkInfo = new FlightDetail();
                    fdbkInfo.AirCompanyCode = dr["airlineCode"].ToString();
                    fdbkInfo.StartCityCode = dr["toCityCode"].ToString();
                    fdbkInfo.StartCityName = fdInfo.EndCityName;//使用去程的到达机场作为返回的出发机场 //ReadXmlHelper.GetAirPortNameByCode(dr["toCityCode"].ToString());
                    fdbkInfo.BeginCityName = dr["toCityname"].ToString();

                    //如果有中转，则到达城市、机场等替换为中转地
                    if (string.IsNullOrEmpty(dr["relayPort"].ToString()))
                    {
                        fdbkInfo.EndCityCode = dr["fromCityCode"].ToString();
                        fdbkInfo.EndCityName = fdInfo.StartCityName;//使用去程的出发机场作为返回的到达机场 //ReadXmlHelper.GetAirPortNameByCode(dr["fromCityCode"].ToString());
                        fdbkInfo.ToCityName = dr["fromCityname"].ToString();
                    }
                    else
                    {
                        string[] array = dr["relayPort"].ToString().Split('-');
                        fdbkInfo.EndCityCode = array[0];
                        fdbkInfo.EndCityName = fdInfo.EndCityName;
                        long a = 0;//纯粹接收参数
                        fdbkInfo.ToCityName = fdInfo.ToCityName;//ReadXmlHelper.GetToCityNameByCode(array[0], out a);
                    }

                    fdbkInfo.FromTime = DateTime.Parse(ReadTime(this.BackDate, 0));
                    fdbkInfo.ArriveTime = ReadTime(fdbkInfo.FromTime);
                    listDeteil2.Add(fdbkInfo);
                    //如果有中转
                    if (!string.IsNullOrEmpty(dr["relayPort"].ToString()))
                    {
                        FlightDetail fdbkInfo2 = new FlightDetail();
                        fdbkInfo2.AirCompanyCode = string.Empty;//dr["airlineCode"].ToString();
                        fdbkInfo2.StartCityCode = fdbkInfo.EndCityCode;//dr["fromCityCode"].ToString();
                        fdbkInfo2.EndCityCode = dr["fromCityCode"].ToString();
                        fdbkInfo2.StartCityName = fdbkInfo.EndCityName;//使用第一次中转的到达机场作为第二次中转的出发机场 //ReadXmlHelper.GetAirPortNameByCode(fdbkInfo.EndCityCode);
                        fdbkInfo2.EndCityName = fdInfo.StartCityName;//使用去程的出发机场作为返回的到达机场 //ReadXmlHelper.GetAirPortNameByCode(dr["fromCityCode"].ToString());
                        fdbkInfo2.BeginCityName = fdInfo.ToCityName;//使用去程的到达城市作为返回的出发城市 //dr["fromCityname"].ToString();
                        fdbkInfo2.ToCityName = dr["fromCityname"].ToString();
                        fdbkInfo2.FromTime = ReadTime(fdbkInfo.ArriveTime);
                        fdbkInfo2.ArriveTime = ReadTime(fdbkInfo2.FromTime);
                        listDeteil2.Add(fdbkInfo2);
                    }
                    finfo2.ListInterFlightDetails = listDeteil2;
                    listF2.Add(finfo2);
                    #endregion
                }
                rTrip.ListInterFlightInfo = listF;
                rTrip.ListInterFlightInfo2 = listF2;
            }
            return rTrip;
        }
        catch (Exception)
        {
            return null;
        }
    }
    /// <summary>
    /// 获取API接口数据
    /// </summary>
    /// <returns></returns>
    private FlightRoundTrip GetApi()
    {
        try
        {
            FlightRoundTrip rtInfo = null;
            FlightParamInfo param = new FlightParamInfo();
            param.Startairport = FromCityCode;
            param.Endairport = ToCityCode;
            param.Startdate = TripDate;
            //为往返的，加上返回时间
            if (Convert.ToInt32(TripType) == 1)
            {
                param.Backdate = BackDate;
            }
            string jsonTxt = FlightAPI.GetFlight(param);
            FlightTotal ft = FlightAPI.DeserializeJsonToObject<FlightTotal>(jsonTxt);
            if (ft.result != null)
            {
                for (int i = 0; i < ft.result.Count; i++)
                {
                    bool isContains = false;
                    for (int j = 0; j < ft.result[i].ListInterFlightInfo.Count; j++)
                    {
                        if (DataGuid == ft.result[i].ListInterFlightInfo[j].dataId)
                        {
                            rtInfo = ft.result[i];
                            isContains = true;
                            break;
                        }
                    }
                    if (isContains)
                    {
                        break;
                    }
                }
            }
            return rtInfo;
        }
        catch (Exception)
        {
            return null;
        }
    }
    /// <summary>
    /// 生成随机出发到达时间
    /// </summary>
    /// <param name="stime">时间字符串（yyyy-mm-dd）</param>
    /// <param name="timetype">0出发 1到达</param>
    /// <returns></returns>
    public string ReadTime(string stime, int timetype)
    {
        long start = new Random().Next(0, 12 * 19);//已5分钟为单位
        long end = new Random().Next(12 * 2, 12 * 5);

        while (isInRandomList(start))
        {
            start = new Random().Next(0, 12 * 19);
        }

        randomList.Add(start);

        DateTime toDT = Convert.ToDateTime(this.TripDate);
        toDT = toDT.AddMinutes(start * 5);
        DateTime arriveDT = toDT.AddMinutes(end * 5);

        if (timetype == 0)
        {
            return stime + " " + toDT.ToString("HH:mm");
        }
        else
        {
            return stime + " " + arriveDT.ToString("HH:mm");
        }
    }
    /// <summary>
    /// 在时间基础上添加一个随机时间
    /// </summary>
    /// <param name="stime"></param>
    public DateTime ReadTime(DateTime stime)
    {
        long end = new Random().Next(12 * 2, 12 * 5);
        return stime.AddMinutes(end * 5);
    }
    /// <summary>
    /// 获取航行状态文本
    /// </summary>
    /// <param name="fDetail"></param>
    /// <returns></returns>
    public string GetTransitTxt(List<FlightDetail> fDetail)
    {
        string str = string.Empty;
        if (fDetail.Count == 1)
        {
            str = "[直飞]--[飞行时长]--" + GetTransitTimeStr(fDetail[0].ArriveTime, fDetail[0].FromTime);
        }
        if (fDetail.Count == 2)
        {
            str = "[中转]-" + fDetail[0].EndCityName + "--[停留]-" + GetTransitTimeStr(fDetail[1].FromTime, fDetail[0].ArriveTime);
        }
        if (fDetail.Count == 3)
        {
            str = "[二次中转]-" + fDetail[1].BeginCityName + "/" + fDetail[1].EndCityName;
        }
        if (fDetail.Count > 3)
        {
            str = "[多次中转]-" + fDetail[1].BeginCityName + "/" + fDetail[1].EndCityName + "/" + fDetail[2].EndCityName;
        }

        return str;
    }

    /// <summary>
    /// 获取时间差的 x天x小时x分钟 【t1-t2】
    /// </summary>
    /// <returns></returns>
    private string GetTransitTimeStr(DateTime t1, DateTime t2)
    {
        try
        {
            string fstr = string.Empty;
            TimeSpan ts1 = new TimeSpan(t1.Ticks);
            TimeSpan ts2 = new TimeSpan(t2.Ticks);
            TimeSpan ts = ts1.Subtract(ts2).Duration();
            if (ts.Days > 0)
            {
                fstr = string.Format("{0}天", ts.Days);
            }
            if (ts.Hours > 0)
            {
                fstr += string.Format("{0}小时", ts.Hours);
            }
            if (ts.Minutes > 0)
            {
                fstr += string.Format("{0}分钟", ts.Minutes);
            }
            return fstr;
        }
        catch (Exception)
        {
            return "时间计算出错";
        }
    }
    /// <summary>
    /// 匹配航空公司信息
    /// </summary>
    /// <param name="airCode"></param>
    /// <returns></returns>
    public kabe_Airline CheckAirline(string airCode)
    {
        kabe_Airline airInfo = null;
        foreach (kabe_Airline item in getAirLines())
        {
            if (item.airlineCode == airCode)
            {
                airInfo = item;
                break;
            }
        }
        return airInfo;
    }

    /// <summary>
    /// 获取所有航空公司
    /// </summary>
    /// <returns></returns>
    protected ArrayList getAirLines()
    {
        //查找航空公司
        string str = "select aId, airlinecode,chName,logoPic,smallPic from FY_AirLine;";

        if (Session["TicketsSessionKey_Airlines"] == null)
        {
            //写入Session 分页使用
            DataSet _ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            ArrayList airlinesresult = new ArrayList();
            foreach (DataRow dr in _ds.Tables[0].Rows)
            {
                kabe_Airline a = new kabe_Airline();
                a.airlineId = dr["aId"].ToString();
                a.airlineCode = dr["airlinecode"].ToString();
                a.airlineName = dr["chName"].ToString();
                a.airlinePic = dr["smallPic"].ToString();
                a.airlineLogoPic = dr["logoPic"].ToString();
                airlinesresult.Add(a);
            }
            Session["TicketsSessionKey_Airlines"] = airlinesresult;
            return airlinesresult;
        }
        else
        {
            return (ArrayList)Session["TicketsSessionKey_Airlines"];
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

                if (starStr != null && !starStr.Equals(""))
                    row["startTime"] = convertDate2(starStr);
                else
                    row["startTime"] = "待定";

                if (arriveStr != null && !arriveStr.Equals(""))
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

    private string convertDate2(string tmpToTime)
    {
        if (tmpToTime != null)
            return tmpToTime.Substring(0, 4) + "-" + tmpToTime.Substring(4, 2) + "-" + tmpToTime.Substring(6, 2) + " " + tmpToTime.Substring(8, 2) + ":" + tmpToTime.Substring(10, 2);

        return "";
    }

    protected DataRowCollection GetRandowTicketF(int days, int fCity, int tCity, int num)
    {
        string str = "select top " + num + " min(FY_Ticket.tId) as ticketId,FY_FromCity.chName as fromCityname, FY_ToCity.chName as toCityname,min(untaxPrice) as untaxPrice from FY_Ticket"
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


    private string convertDate(string tmpToTime)
    {
        return tmpToTime.Substring(0, 4) + "-" + tmpToTime.Substring(4, 2) + "-" + tmpToTime.Substring(6, 2);
    }

    protected string fromCityName = string.Empty;
    private string getFromCityIdByCode(string cityCode)
    {
        string sql = "select fid,chName from FY_FromCity where cityCode='" + cityCode + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count > 0 && dsCityCode.Tables[0].Rows.Count > 0)
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
        if (dsCityCode != null && dsCityCode.Tables.Count > 0 && dsCityCode.Tables[0].Rows.Count > 0)
        {
            this.toCityName = dsCityCode.Tables[0].Rows[0]["chName"].ToString();
            return dsCityCode.Tables[0].Rows[0]["tid"].ToString();
        }

        return "0";
    }


    private ArrayList getFlightMsg(string fromCityCode, string toCityCode, string airlineCode, string toTime)
    {
        string sql = "select id from FY_AiFei_Ticket where fromCity='" + fromCityCode.Trim() + "' and toCity='" + toCityCode.Trim() + "' and airline='" + airlineCode.Trim() + "'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        ArrayList flight = new ArrayList();


        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            string ticketId = ds.Tables[0].Rows[0]["id"].ToString();
            sql = "select * from FY_AiFei_Flights where ticketid='" + ticketId + "' order by num asc";
            DataSet flightDS = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
            if (flightDS != null && flightDS.Tables.Count > 0 && flightDS.Tables[0].Rows.Count > 0)
            {
                foreach (DataRow dr in flightDS.Tables[0].Rows)
                {
                    AiFeiFlightEntity affe = new AiFeiFlightEntity();

                    affe.airlineCode = dr["airline"].ToString();
                    affe.flightNum = dr["flightNum"].ToString();
                    affe.fromAirport = dr["fromAirport"].ToString();
                    affe.toAirport = dr["toAirport"].ToString();

                    //起降时间需要转化
                    string tmpToTime = dr["toTime"].ToString().Trim();
                    string tmpFromTime = dr["arriveTime"].ToString().Trim();
                    DateTime toDT = Convert.ToDateTime(tmpToTime.Substring(0, 4) + "-" + tmpToTime.Substring(4, 2) + "-" + tmpToTime.Substring(6, 2) + " " + tmpToTime.Substring(8, 2) + ":" + tmpToTime.Substring(10, 2));
                    DateTime fromDT = Convert.ToDateTime(tmpFromTime.Substring(0, 4) + "-" + tmpFromTime.Substring(4, 2) + "-" + tmpFromTime.Substring(6, 2) + " " + tmpFromTime.Substring(8, 2) + ":" + tmpFromTime.Substring(10, 2));
                    DateTime selectDT = Convert.ToDateTime(toTime.Substring(0, 4) + "-" + toTime.Substring(4, 2) + "-" + toTime.Substring(6, 2));

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


    private string getRelayPort(string fromCity, string toCity, string airline)
    {
        string sql = "select relayPort from FY_AiFei_Ticket2 where fromCity='" + fromCity + "' and toCity='" + toCity + "' and airlineCode='" + airline + "'";
        DataSet flightDS = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (flightDS != null && flightDS.Tables.Count > 0 && flightDS.Tables[0].Rows.Count > 0)
        {
            foreach (DataRow dr in flightDS.Tables[0].Rows)
            {
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
        if (dsAirportName != null && dsAirportName.Tables.Count > 0 && dsAirportName.Tables[0].Rows.Count > 0)
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
