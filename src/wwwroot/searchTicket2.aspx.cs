using System;
using System.Text;
using System.Collections;
using System.Data;
using System.Web;
using eap.share;
using System.Xml;
using System.Collections.Generic;

public partial class searchTicket2 : System.Web.UI.Page
{
    protected int csA_num = 1;

    #region request 参数
    protected int fromcity;//出发城市ID
    protected string tocityName1 = string.Empty;//到达城市名称
    protected int tripType = 0;    //0单程 1往返 2全部
    protected string tripDate = string.Empty;//出发日期
    protected string backDate = string.Empty;//回程日期
    protected string fromcityName = string.Empty;//出发城市名称
    protected string fromcityCode = string.Empty;//出发城市编码
    protected string tocityCode = string.Empty;//到达城市编码
    protected int tocity = 0;//到达城市ID


    //额外参数
    protected string airlineId = string.Empty;
    protected string page = string.Empty;
    protected string Loading = string.Empty;
    protected string orderStr = string.Empty;

    //新获取参数
    protected DataSet fromcityDataSet = null;//出发地城市列表
    protected DataSet tocityDataSet = null;//目的地城市列表
    #endregion

    protected DataRowCollection fromcitylist = null;//显示的出发城市列表
    protected DataRowCollection morefromcitylist = null;//隐藏的出发城市列表
    /// <summary>
    /// 初始化
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Page_Load(object sender, EventArgs e)
    {
        this.CheckRequestArgs();
        this.getCS_Num();
        this.fromcityDataSet = this.getFromCityDataSet();
        this.tocityDataSet = this.getToCityDataSet();

        if (!IsPostBack)
        {
            this.fromCity.DataSource = this.fromcityDataSet;
            this.fromCity.DataTextField = "chName";
            this.fromCity.DataValueField = "fid";
            this.fromCity.DataBind();



            if (Request.QueryString["page"] == null)
            {
            }
            else
            {
                this.Pager.CurrentPageIndex = 1;

            }
            if (Request.QueryString["Loading"] == "true")
            {
                Session["TicketsSessionKey_Airlines"] = null;
                this.AsyncData();
            }
            else
                this.panLoading.Visible = true;

            fromcitylist = GetFromCitylist(fromcitylist);
            morefromcitylist = GetMoreFromCitylist(morefromcitylist);
        }
    }
    /// <summary>
    /// 获取前6个出发城市
    /// </summary>
    /// <param name="citylist"></param>
    /// <returns></returns>
    protected DataRowCollection GetFromCitylist(DataRowCollection citylist)
    {
        DataRowCollection rows = null;
        string str = @"select top 6 * from FY_FromCity order by paixu asc";
        try
        {
            rows = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return rows;
    }
    /// <summary>
    /// 获取排序前6个以后的出发城市
    /// </summary>
    /// <param name="morefromcitylist"></param>
    /// <returns></returns>
    protected DataRowCollection GetMoreFromCitylist(DataRowCollection morefromcitylist)
    {
        DataRowCollection rows = null;
        string str = @"select * from FY_FromCity where fid>6 order by paixu asc";
        try
        {
            rows = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return rows;
    }
    /// <summary>
    /// 获取出发城市表
    /// </summary>
    /// <returns></returns>
    protected DataSet getFromCityDataSet()
    {
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, "select fId,ChName,CityCode from FY_FromCity");
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            DataRow[] drs = ds.Tables[0].Select("fId='" + this.fromcity + "'");
            this.fromcityCode = drs[0]["CityCode"].ToString();
            this.fromcityName = drs[0]["ChName"].ToString();
        }
        return ds;
    }
    /// <summary>
    /// 获取目的城市表
    /// </summary>
    /// <returns></returns>
    protected DataSet getToCityDataSet()
    {
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, "select tId,CityCode,ChName from FY_ToCity");
        if (ds != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            DataRow[] drs = ds.Tables[0].Select("ChName='" + this.tocityName1 + "'");
            if (drs == null || drs.Length == 0)
            {
                Response.Redirect("/index.aspx");
                return null;
            }

            this.tocityCode = drs[0]["CityCode"].ToString();
            this.tocity = int.Parse(drs[0]["tId"].ToString());
        }

        return ds;
    }
    /// <summary>
    /// 获取所有航空公司
    /// </summary>
    /// <returns></returns>
    protected ArrayList getAirLines()
    {
        //查找航空公司
        string str = "select aId, airlinecode,chName,logoPic,smallPic from FY_AirLine;";

        if (Session["TicketsSessionKey_Airlines_All"] == null)
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
            Session["TicketsSessionKey_Airlines_All"] = airlinesresult;
            return airlinesresult;
        }
        else
        {
            return (ArrayList)Session["TicketsSessionKey_Airlines_All"];
        }
    }
    /// <summary>
    /// 验证并获取参数
    /// </summary>
    protected void CheckRequestArgs()
    {
        try
        {
            this.fromcity = int.Parse(Request.QueryString["fromcity"]);
            this.tocityName1 = Request.QueryString["tocityName"];
            this.tripType = int.Parse(Request.QueryString["tripType"]);
            this.tripDate = Request.QueryString["tripDate"];
            this.backDate = Request.QueryString["backDate"];

            //this.tripTypeNameLabel.Text = this.tripType == 2 ? "全部" : (this.tripType == 0 ? "单程" : "双程");
            //this.tripDateLabel.Text = this.tripDate;
            //this.backDateLabel.Text = this.backDate;

            if (!string.IsNullOrEmpty(Request.QueryString["airlineId"]))
                this.airlineId = Request.QueryString["airlineId"];

            if (!string.IsNullOrEmpty(Request.QueryString["Loading"]))
                this.Loading = Request.QueryString["Loading"];

            if (!string.IsNullOrEmpty(Request.QueryString["page"]))
                this.page = Request.QueryString["page"];

            if (!string.IsNullOrEmpty(Request.QueryString["orderStr"]))
                this.orderStr = Request.QueryString["orderStr"];
        }
        catch
        {
            //scripthelp.AlertAndRedirect("获取参数错误！", "/index.aspx", this.Page);
        }
    }
    /// <summary>
    /// 异步获取数据
    /// </summary>
    public void AsyncData()
    {
        FlightTotal tickets1 = null;
        if (Session[string.Format("TicketsSessionKey2_{0}_{1}_{2}_{3}_{4}", this.tripType, fromcityCode, this.tocityCode, Convert.ToDateTime(this.tripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.backDate).ToString("yyyyMMdd"))] == null)
        {
            //通知等待
            //System.Threading.AutoResetEvent resetEvent = new System.Threading.AutoResetEvent(false);

            System.Threading.AutoResetEvent[] autoEvents = new System.Threading.AutoResetEvent[]
               {
                new System.Threading.AutoResetEvent(false),
                new System.Threading.AutoResetEvent(false)
               };
            GjrinterFlightHandler d1 = new GjrinterFlightHandler(GetFlights);
            GFei_580Handler d2 = new GFei_580Handler(getFei580Ticekt);
            IAsyncResult iar1 = null;
            IAsyncResult iar2 = null;
            List<FlightRoundTrip> tickets2 = null;
            AsyncCallback back1 = delegate(IAsyncResult iar)
            {
                try
                {
                    tickets1 = d1.EndInvoke(iar1);
                    if (iar1 != null && iar1.IsCompleted)
                        autoEvents[0].Set();
                }
                catch (Exception)
                {
                    autoEvents[0].Set();
                }
            };
            AsyncCallback back2 = delegate(IAsyncResult iar)
            {
                try
                {
                    tickets2 = d2.EndInvoke(iar2);
                    if (iar2 != null && iar2.IsCompleted)
                        autoEvents[1].Set();
                }
                catch (Exception)
                {
                    autoEvents[1].Set();
                }
            };
            iar1 = d1.BeginInvoke(back1, null);
            iar2 = d2.BeginInvoke(back2, null);
            //等待通知
            //if (resetEvent.WaitOne(12000, true))
            if (System.Threading.AutoResetEvent.WaitAll(autoEvents, 10000)) 
            {
                autoEvents[0].Close();
                autoEvents[1].Close();
            }
                //resetEvent.Close();

            #region 无数据显示
            //没数据 显示提示
            if ((tickets1 == null || tickets1.result == null) && (tickets2 == null || tickets2.Count == 0))
            //if ((tickets1 == null || (tickets1.result == null ? 0 : tickets1.result.Count) == 0))
            {
                this.panHaveValue2.Visible = false;
                this.panNoValue.Visible = true;
                return;
            }
            else
            {
                this.panHaveValue2.Visible = true;
                this.panNoValue.Visible = false;
            }
            #endregion

            #region 整合数据
            if (tickets1 != null)
            {
                if (tickets1.result != null)
                {
                    foreach (FlightRoundTrip item in tickets2)
                    {
                        tickets1.result.Add(item);
                    }
                }
                else
                {
                    tickets1.result = tickets2;
                }
            }
            else
            {
                tickets1 = new FlightTotal();
                tickets1.result = tickets2;
            }
            #endregion

            #region 排序
            if (true)
            {
                if (tickets1.result != null)
                {
                    airlineList.Clear();
                    //冒泡排序
                    for (int i = 0; i < tickets1.result.Count - 1; i++)
                    {
                        for (int j = tickets1.result.Count - 1; j > i; j--)
                        {
                            if (tickets1.result[j].ListInterFlightInfo[0].TicketPrice < tickets1.result[j - 1].ListInterFlightInfo[0].TicketPrice)
                            {
                                FlightRoundTrip finfo = tickets1.result[j];
                                tickets1.result[j] = tickets1.result[j - 1];
                                tickets1.result[j - 1] = finfo;
                            }
                        }
                        #region 获取航空公司
                        if (tickets1.result[i].ListInterFlightInfo.Count > 0)
                        {
                            foreach (FlightInfo item in tickets1.result[i].ListInterFlightInfo)
                            {
                                if (!isInAirlineList(item.ListInterFlightDetails[0].AirCompanyCode))
                                {
                                    airlineList.Add(item.ListInterFlightDetails[0].AirCompanyCode);
                                }
                            }
                        }
                        #endregion
                    }
                    #region 保存查询结果中出现的航空公司
                    ArrayList arr = this.getAirLines();
                    ArrayList newArr = new ArrayList();
                    foreach (string item in airlineList)
                    {
                        foreach (kabe_Airline airlineInfo in arr)
                        {
                            if (item == airlineInfo.airlineCode)
                            {
                                newArr.Add(airlineInfo);
                            }
                        }
                    }
                    Session["TicketsSessionKey_Airlines"] = newArr;
                    #endregion
                }
            }
            #endregion
        }
        else
        {
            tickets1 = (FlightTotal)Session[string.Format("TicketsSessionKey2_{0}_{1}_{2}_{3}_{4}", this.tripType, fromcityCode, this.tocityCode, Convert.ToDateTime(this.tripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.backDate).ToString("yyyyMMdd"))];
        }

        this.BindData(tickets1);
        dvPageCount.InnerHtml = tickets1.result.Count.ToString();
    }
    /// <summary>
    /// 获取API数据并存储到session
    /// </summary>
    /// <returns></returns>
    public FlightTotal GetFlights()
    {
        FlightParamInfo param = new FlightParamInfo();
        param.Startairport = fromcityCode;
        param.Endairport = tocityCode;
        param.Startdate = tripDate;
        //为往返的，加上返回时间
        if (tripType == 1)
        {
            param.Backdate = backDate;
        }
        string jsonTxt = FlightAPI.GetFlight(param);
        FlightTotal ft = FlightAPI.DeserializeJsonToObject<FlightTotal>(jsonTxt);
        return ft;
    }

    /// <summary>
    /// 获取Fei580票价
    /// </summary>
    /// <returns></returns>
    protected List<FlightRoundTrip> getFei580Ticekt()
    {
        #region SQL语句
        StringBuilder str = new StringBuilder();
        str.Append("select top 100 percent");
        str.Append(" FY_Ticket.tid,FY_Ticket.untaxPrice,FY_Ticket.relayPort,FY_Ticket.tripType,");
        str.Append(" FY_FromCity.cityCode as fromCityCode,");
        str.Append(" FY_ToCity.cityCode as toCityCode,");
        str.Append(" FY_Tax.tax,");
        str.Append(" FY_FromCity.chName as fromCityname,FY_FromCity.fId,FY_Airline.aId,FY_ToCity.tId as toId,");
        str.Append(" FY_ToCity.chName as toCityname,FY_Airline.airlineCode as airlineCode,FY_Airline.chName as airname, FY_Airline.smallPic as smallPic from FY_Ticket ");
        str.Append(" left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity");
        str.Append(" left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity");
        str.Append(" left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine");
        str.Append(" left join FY_Tax on (FY_Ticket.tripType =FY_Tax.taxType and FY_Ticket.airLine = FY_Tax.airline and FY_Ticket.toCity = FY_Tax.toCity and FY_Ticket.fromCity = FY_Tax.fromCity)");
        str.Append(" where 1=1 ");
        if (this.tripType != 2) str.Append(" and (FY_Ticket.tripType=" + this.tripType + ")");
        if (this.fromcity != 0) str.Append(" and (FY_FromCity.fId=" + this.fromcity + ")");
        if (!string.IsNullOrEmpty(this.tocityName1)) str.Append(" and (FY_ToCity.chName like '%" + tocityName1 + "%')");
        if (!string.IsNullOrEmpty(this.tripDate)) str.Append(" and (FY_Ticket.fromtripDate<='" + tripDate + "' and FY_Ticket.totripDate>='" + tripDate + "' )");
        if (!string.IsNullOrEmpty(this.tripDate) && !string.IsNullOrEmpty(this.backDate) && this.tripType != 0)
        {
            int day = (Convert.ToDateTime(backDate) - Convert.ToDateTime(tripDate)).Days;
            str.Append(" and DateDiff(d,FY_Ticket.fromtripDate,FY_Ticket.totripDate) >= " + day);
        }
        str.Append(" and (FY_Ticket.tosaleDate>='" + DateTime.Now.ToString("yyyy-MM-dd") + "')");
        if (!string.IsNullOrEmpty(this.airlineId)) str.Append(" and (FY_Airline.aId=" + airlineId + ")");
        if (string.IsNullOrEmpty(this.orderStr))
            str.Append(" order by FY_Ticket.untaxPrice asc ,FY_Ticket.tId desc");
        else
            str.Append(" order by FY_Ticket." + this.orderStr + " asc ,FY_Ticket.tId desc");
        #endregion
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str.ToString());
        DataTable dt = ds.Tables[0];

        List<FlightRoundTrip> ListRTrip = new List<FlightRoundTrip>();

        foreach (DataRow dr in dt.Rows)
        {
            FlightRoundTrip rTrip = new FlightRoundTrip();
            List<FlightInfo> listF = new List<FlightInfo>();
            List<FlightInfo2> listF2 = new List<FlightInfo2>();
            if (Convert.ToInt32(dr["tripType"]) == 0)
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

                fdInfo.FromTime = DateTime.Parse(ReadTime(this.tripDate, 0));
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

                fdInfo.FromTime = DateTime.Parse(ReadTime(this.tripDate, 0));
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

                fdbkInfo.FromTime = DateTime.Parse(ReadTime(this.backDate, 0));
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
            ListRTrip.Add(rTrip);
        }
        return ListRTrip;
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

        DateTime toDT = Convert.ToDateTime(this.tripDate);
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
    /// 随机数集合
    /// </summary>
    private ArrayList randomList = new ArrayList();
    /// <summary>
    /// 每次查询结果的航空公司集合
    /// </summary>
    private ArrayList airlineList = new ArrayList();
    /// <summary>
    /// 判断是否已包含随机数
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    private bool isInRandomList(long key)
    {
        if (randomList.Contains(key)) return true;
        return false;
    }
    /// <summary>
    /// 判断是否已包含航空公司
    /// </summary>
    /// <param name="key"></param>
    /// <returns></returns>
    private bool isInAirlineList(string key)
    {
        if (airlineList.Contains(key)) return true;
        return false;
    }
    /// <summary>
    /// 数据接口托管
    /// </summary>
    /// <returns></returns>
    public delegate FlightTotal GjrinterFlightHandler();
    public delegate List<FlightRoundTrip> GFei_580Handler();
    /// <summary>
    /// 分页集合
    /// </summary>
    protected ArrayList pageTickets = new ArrayList();
    /// <summary>
    /// 获取航班信息
    /// </summary>
    /// <returns></returns>
    public void BindData(FlightTotal fInfo)
    {
        #region 绑定航空公司
        //绑定航空公司
        ArrayList airlines = (ArrayList)Session["TicketsSessionKey_Airlines"];
        if (airlines != null)
        {
            //LogHelper.WriteLog("进入了航空公司绑定：" + airlines.Count);
            this.rptAirlinesCount.Text = airlines.Count.ToString();
        }
        this.rptAirlines.DataSource = airlines;
        this.rptAirlines.DataBind();
        #endregion

        pageTickets.Clear();
        FlightTotal ft = fInfo;
        //if (fInfo == null)
        //{
        //    ft = GetFlights();
        //}
        //else
        //{
        //    ft = fInfo;
        //}
        if (Session[string.Format("TicketsSessionKey2_{0}_{1}_{2}_{3}_{4}", this.tripType, fromcityCode, this.tocityCode, Convert.ToDateTime(this.tripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.backDate).ToString("yyyyMMdd"))] == null)
        {
            Session[string.Format("TicketsSessionKey2_{0}_{1}_{2}_{3}_{4}", this.tripType, fromcityCode, this.tocityCode, Convert.ToDateTime(this.tripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.backDate).ToString("yyyyMMdd"))] = ft;
        }
        //绑定航空公司
        //ArrayList airlines = (ArrayList)Session["TicketsSessionKey_Airlines"];
        //this.rptAirlinesCount.Text = airlines.Count.ToString();
        //this.rptAirlines.DataSource = airlines;
        //this.rptAirlines.DataBind();


        //绑定分页控件
        this.Pager.RecordCount = ft.result != null ? ft.result.Count : 0;
        this.Pager.CurrentPageIndex = Convert.ToInt32(Request.QueryString["page"]);
        int skipCount = this.Pager.PageSize * (Pager.CurrentPageIndex - 1);

        for (int i = 0, j = 0; i < this.Pager.RecordCount && j < this.Pager.PageSize; i++)
        {
            if (i < skipCount)
            {
            }
            else
            {
                pageTickets.Add(ft.result[i]);
                j++;
            }
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
    /// 获取当值客服
    /// </summary>
    public void getCS_Num()
    {
        DateTime nowTime = DateTime.Now;
        int a = nowTime.Day % 6;
        if (a != 0)
        {
            csA_num = a;
        }
        else
        {
            csA_num = 6;
        }
    }
    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        if (Request.QueryString["page"] == null)
            return;

        FlightTotal tickets = (FlightTotal)Session[string.Format("TicketsSessionKey2_{0}_{1}_{2}_{3}_{4}", this.tripType, fromcityCode, this.tocityCode, Convert.ToDateTime(this.tripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.backDate).ToString("yyyyMMdd"))];
        if (tickets != null)
        {
            this.BindData(tickets);
            return;
        }
    }
}
