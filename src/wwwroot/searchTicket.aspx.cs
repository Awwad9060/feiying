using System;
using System.Text;
using System.Collections;
using System.Data;
using System.Web;
using eap.share;
using System.Xml;

public partial class searchTicket : System.Web.UI.Page
{
    protected int csA_num = 1;

    #region request 参数
    //出发日期
    protected int fromcity;
    //目的地
    protected string tocityName1 = string.Empty;
    //0单程 1往返 2全部
    protected int tripType = 0;
    //出发日期
    protected string tripDate = string.Empty;
    //回程日期
    protected string backDate = string.Empty;

    protected string fromcityName = string.Empty;
    protected string fromcityCode = string.Empty;
    protected string tocityCode = string.Empty;
    protected int tocity = 0;


    //额外参数
    protected string airlineId = string.Empty;
    protected string page = string.Empty;
    protected string Loading = string.Empty;
    protected string orderStr = string.Empty;

    //新获取参数
    protected DataSet fromcityDataSet = null;
    protected DataSet tocityDataSet = null;
    #endregion

    protected DataRowCollection fromcitylist = null;
    protected DataRowCollection morefromcitylist = null;

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

            if (Request.QueryString["airlineId"] != null)
            {
                GetSearchTicket();
            }
            else
            {
                if (Request.QueryString["page"] == null)
                {
                    if (Request.QueryString["Loading"] == "true")
                    {
                        Session["TicketsSessionKey_Airlines"] = null;
                        GetSearchTicket();
                    }
                    else
                        this.panLoading.Visible = true;
                }
            }
        }

        fromcitylist = GetFromCitylist(fromcitylist);
        morefromcitylist = GetMoreFromCitylist(morefromcitylist);
    }

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
    /// 验证参数
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

            this.tripTypeNameLabel.Text = this.tripType == 2 ? "全部" : (this.tripType == 0 ? "单程" : "双程");
            this.tripDateLabel.Text = this.tripDate;
            this.backDateLabel.Text = this.backDate;

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
            scripthelp.AlertAndRedirect("获取参数错误！", "/index.aspx", this.Page);
        }
    }

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
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, "select * from FY_FromCity");
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
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, "select * from FY_ToCity");
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
    /// 获取航空公司
    /// </summary>
    /// <returns></returns>
    protected DataSet getAirLineDataSet()
    {
        //查找航空公司
        StringBuilder str = new StringBuilder();
        str.Append("select  FY_Ticket.airLine,min(FY_Ticket.untaxPrice) as untaxPrice ");
        str.Append(" from FY_Ticket");
        str.Append(" left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity");
        str.Append(" left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity");
        str.Append(" left join FY_Tax on (FY_Ticket.airLine = FY_Tax.airline and FY_Ticket.toCity = FY_Tax.toCity and FY_Ticket.fromCity = FY_Tax.fromCity)");
        str.Append(" where 1=1  ");
        if (this.tripType != 2) str.Append(" and (FY_Ticket.tripType=" + this.tripType + ")");
        if (this.fromcity != 0) str.Append(" and (FY_FromCity.fId=" + this.fromcity + ")");
        if (!string.IsNullOrEmpty(this.tocityName1)) str.Append(" and (FY_ToCity.chName like '%" + this.tocityName1 + "%')");
        if (!string.IsNullOrEmpty(this.tripDate)) str.Append(" and (FY_Ticket.fromtripDate<='" + this.tripDate + "' and FY_Ticket.totripDate>='" + this.tripDate + "' )");
        if (!string.IsNullOrEmpty(this.tripDate) && !string.IsNullOrEmpty(this.backDate) && this.tripType != 0)
        {
            int day = (Convert.ToDateTime(this.backDate) - Convert.ToDateTime(this.tripDate)).Days;
            str.Append(" and DateDiff(d,FY_Ticket.fromtripDate,FY_Ticket.totripDate) >= " + day);
        }
        str.Append(" and (FY_Ticket.tosaleDate>='" + DateTime.Now.ToString("yyyy-MM-dd") + "')");
        str.Append(" group by FY_Ticket.airLine order by min(FY_Ticket.untaxPrice) asc");
        return SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str.ToString());
    }

    protected DataSet getAirLineDataSets()
    {
        //查找航空公司
        string str = "select aId, airlinecode,chName,smallPic from FY_AirLine;";
        return SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
    }

    protected void InsertKabe_InterDetailFlt(kabe_InterDetailFltEntity model)
    {
        string str = "insert into kabe_InterDetailFlt(sc,ec,sd,ed,classtype,ft,result) values('" + model.sc + "','" + model.ec + "','" + model.sd + "', '" + model.ed + "','" + model.classtype + "','" + model.ft + "','" + model.result.OuterXml + "')";
        int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
    }

    protected System.Xml.XmlNode GetKabe_InterDetailFlt(string sc, string ec, string sd, string ed, string air, string classtype, string ft)
    {
        string str = "select top 1 * from kabe_InterDetailFlt where sc='" + sc + "' and ec='" + ec + "' and sd='" + sd + "' and classtype='" + classtype + "' and ft='" + ft + "'";
        if (!(!(ft == "2") || string.IsNullOrEmpty(ed)))
            str += " and ed='" + ed + "'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds != null && ds.Tables != null && ds.Tables.Count > 0 && ds.Tables[0].Rows.Count > 0)
        {
            XmlDocument xml = new XmlDocument();
            xml.LoadXml(ds.Tables[0].Rows[0]["result"].ToString());
            return xml.FirstChild;
        }
        return null;
    }
    /// <summary>
    /// 删除数据库中过期的爱飞信息
    /// </summary>
    protected void deleteKabe_InterDetailFlt()
    {
        string str = "delete kabe_InterDetailFlt where DATEDIFF(m,addtime,getdate())>0;";
        int result = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
    }

    #region 获取票价
    public delegate ArrayList getFei580TicektHandler();
    /// <summary>
    /// 获取Fei580票价
    /// </summary>
    /// <returns></returns>
    protected ArrayList getFei580Ticekt()
    {
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
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str.ToString());
        DataTable dt = ds.Tables[0];

        ArrayList result = new ArrayList();
        foreach (DataRow dr in dt.Rows)
        {
            kabe_flight item = new kabe_flight();
            item.source = "feiying";
            item.ft = (Convert.ToInt32(dr["tripType"]) + 1).ToString();
            item.ticketId = dr["tid"].ToString().Trim();
            item.depport = dr["fromCityCode"].ToString();
            item.arrport = dr["toCityCode"].ToString();
            item.airline = dr["airlineCode"].ToString();
            item.adultprice = decimal.Parse(dr["untaxPrice"].ToString());
            item.childprice = 0.00M;
            item.relayPort = dr["relayPort"].ToString();
            //item.tax = flight["tax"].InnerText;
            item.currency = "CNY";
            item.open = "0";

            //kabe_deproute _deproute = new kabe_deproute();
            //XmlElement deproute = flight["deproute"];
            //_deproute.route = deproute["route"].InnerText;
            //_deproute.aircode = deproute["aircode"].InnerText;
            //_deproute.depdate = deproute["depdate"].InnerText;
            //_deproute.arrdate = deproute["arrdate"].InnerText;
            //_deproute.deptime = deproute["deptime"].InnerText;
            //_deproute.arrtime = deproute["arrtime"].InnerText;
            //_deproute.transfer = deproute["transfer"].InnerText;
            //_deproute.seat = deproute["seat"].InnerText;
            //item.deproute = _deproute;

            //kabe_deproute _arrroute = new kabe_deproute();
            //XmlElement arrroute = flight["arrroute"];
            //_arrroute.route = arrroute["route"].InnerText;
            //_arrroute.aircode = arrroute["aircode"].InnerText;
            //_arrroute.depdate = arrroute["depdate"].InnerText;
            //_arrroute.arrdate = arrroute["arrdate"].InnerText;
            //_arrroute.deptime = arrroute["deptime"].InnerText;
            //_arrroute.arrtime = arrroute["arrtime"].InnerText;
            //_arrroute.transfer = arrroute["transfer"].InnerText;
            //_arrroute.seat = arrroute["seat"].InnerText;
            //item.arrroute = _arrroute;
            result.Add(item);
        }
        return result;
    }

    public delegate ArrayList getKABETiceketHandler(string airlineCode);
    /// <summary>
    /// 获取指定航空公司的信息
    /// </summary>
    /// <param name="airlineCode"></param>
    /// <returns></returns>
    protected ArrayList getKABETiceket(string airlineCode)
    {
        //删除过期1个月的数据
        this.deleteKabe_InterDetailFlt();

        System.Xml.XmlNode result1 = null;
        System.Xml.XmlNode result2 = null;
        //获取数据
        this.getKABERealTimeTiceket(out result1, out result2);

        ArrayList tickets = new ArrayList();
        if (result1 != null) this.getKABEObjects(ref tickets, result1, airlineCode);
        if (result2 != null) this.getKABEObjects(ref tickets, result2, airlineCode);
        //this.getKABEObjects(ref tickets, doc);
        return tickets;
    }
    /// <summary>
    /// 获取指定航空公司数据并返回给返回参数
    /// </summary>
    /// <param name="tickets"></param>
    /// <param name="xmlNode"></param>
    /// <param name="airlineCode"></param>
    private void getKABEObjects(ref ArrayList tickets, XmlNode xmlNode, string airlineCode)
    {
        if (xmlNode.SelectSingleNode("code").InnerText != "0") return;
        //单双程
        XmlElement para = xmlNode.SelectSingleNode("para") as XmlElement;
        string ft = para["ft"].InnerText;

        XmlElement flights = xmlNode.SelectSingleNode("flights") as XmlElement;
        foreach (XmlElement flight in flights.ChildNodes)
        {
            if (!string.IsNullOrEmpty(airlineCode))
            {
                if (flight["airline"].InnerText.ToLower().Trim() != airlineCode.ToLower().Trim())
                    continue;
            }

            kabe_flight item = new kabe_flight();
            item.source = "kabe";
            item.ft = ft;
            item.ticketId = System.Guid.NewGuid().ToString();
            item.depport = flight["depport"].InnerText;
            item.arrport = flight["arrport"].InnerText;
            item.airline = flight["airline"].InnerText;
            decimal adultprice = decimal.Parse(flight["adultprice"].InnerText);
            decimal childprice = decimal.Parse(flight["childprice"].InnerText);
            item.adultprice = adultprice > 1000 ? adultprice - 200 : adultprice;
            item.childprice = childprice > 1000 ? childprice - 200 : childprice;
            item.tax = flight["tax"].InnerText;
            item.currency = flight["currency"].InnerText;
            item.open = flight["open"].InnerText;

            kabe_deproute _deproute = new kabe_deproute();
            XmlElement deproute = flight["deproute"];
            _deproute.route = deproute["route"].InnerText;
            _deproute.aircode = deproute["aircode"].InnerText;
            _deproute.depdate = deproute["depdate"].InnerText;
            _deproute.arrdate = deproute["arrdate"].InnerText;
            _deproute.deptime = deproute["deptime"].InnerText;
            _deproute.arrtime = deproute["arrtime"].InnerText;
            _deproute.transfer = deproute["transfer"].InnerText;
            _deproute.seat = deproute["seat"].InnerText;
            item.deproute = _deproute;

            kabe_deproute _arrroute = new kabe_deproute();
            XmlElement arrroute = flight["arrroute"];
            _arrroute.route = arrroute["route"].InnerText;
            _arrroute.aircode = arrroute["aircode"].InnerText;
            _arrroute.depdate = arrroute["depdate"].InnerText;
            _arrroute.arrdate = arrroute["arrdate"].InnerText;
            _arrroute.deptime = arrroute["deptime"].InnerText;
            _arrroute.arrtime = arrroute["arrtime"].InnerText;
            _arrroute.transfer = arrroute["transfer"].InnerText;
            _arrroute.seat = arrroute["seat"].InnerText;
            item.arrroute = _arrroute;

            ArrayList segment = new ArrayList();
            XmlElement flightdatas = flight["flightdatas"];
            foreach (XmlElement s in flightdatas.ChildNodes)
            {
                kabe_segment _s = new kabe_segment();
                _s.dep = s["dep"].InnerText;
                _s.arr = s["arr"].InnerText;
                _s.air = s["air"].InnerText;
                _s.flightno = s["flightno"].InnerText;
                _s.depairport = s["depairport"].InnerText;
                _s.arrairport = s["arrairport"].InnerText;
                _s.depdate = s["depdate"].InnerText;
                _s.arrdate = s["arrdate"].InnerText;
                _s.deptime = s["deptime"].InnerText;
                _s.arrtime = s["arrtime"].InnerText;
                _s.flytime = s["flytime"].InnerText;
                _s.plane = s["plane"].InnerText;
                _s.seat = s["seat"].InnerText;
                _s.stop = s["stop"].InnerText;
                _s.datas = s["datas"].InnerText;
                segment.Add(_s);
            }
            item.segment = segment;
            tickets.Add(item);
        }
    }
    /// <summary>
    /// 根据查询的城市获取爱飞信息并记录到数据库并返回单程和双程的参数数据
    /// </summary>
    /// <param name="result1"></param>
    /// <param name="result2"></param>
    protected void getKABERealTimeTiceket(out System.Xml.XmlNode result1, out System.Xml.XmlNode result2)
    {
        result1 = null; result2 = null;
        KABE.Service service = new KABE.Service();
        if (this.tripType == 0)
        {
            result1 = this.GetKabe_InterDetailFlt(this.fromcityCode, this.tocityCode, this.tripDate, "", "", "Y", "1");
            if (result1 != null) return;

            result1 = service.getInterDetailFltValuesV3(this.fromcityCode, this.tocityCode, this.tripDate, "", "", "Y", "1", "437c1d948857da89467d2428c408f3d9");
            if (result1.SelectSingleNode("code").InnerText == "0")//成功记录到数据库
            {
                kabe_InterDetailFltEntity model = new kabe_InterDetailFltEntity();
                model.sc = this.fromcityCode;
                model.ec = this.tocityCode;
                model.sd = this.tripDate;
                model.ed = string.Empty;
                model.classtype = "Y";
                model.ft = "1";
                model.result = result1;
                this.InsertKabe_InterDetailFlt(model);
            }
        }
        else if (this.tripType == 1)
        {
            result1 = this.GetKabe_InterDetailFlt(this.fromcityCode, this.tocityCode, this.tripDate, this.backDate, "", "Y", "2");
            if (result1 != null) return;

            result1 = service.getInterDetailFltValuesV3(this.fromcityCode, this.tocityCode, this.tripDate, this.backDate, "", "Y", "2", "437c1d948857da89467d2428c408f3d9");
            if (result1.SelectSingleNode("code").InnerText == "0")//成功记录到数据库
            {
                kabe_InterDetailFltEntity model = new kabe_InterDetailFltEntity();
                model.sc = this.fromcityCode;
                model.ec = this.tocityCode;
                model.sd = this.tripDate;
                model.ed = this.backDate;
                model.classtype = "Y";
                model.ft = "2";
                model.result = result1;
                this.InsertKabe_InterDetailFlt(model);
            }
        }
        else if (this.tripType == 2)
        {
            result1 = this.GetKabe_InterDetailFlt(this.fromcityCode, this.tocityCode, this.tripDate, "", "", "Y", "1");
            result2 = this.GetKabe_InterDetailFlt(this.fromcityCode, this.tocityCode, this.tripDate, this.backDate, "", "Y", "2");
            System.Xml.XmlNode res1 = result1, res2 = result2;

            System.Threading.AutoResetEvent resetEvent = new System.Threading.AutoResetEvent(false);
            System.Xml.XmlNode result3 = null, result4 = null;
            IAsyncResult iar1 = null, iar2 = null;
            AsyncCallback back1 = delegate(IAsyncResult iar)
            {
                try
                {
                    result3 = service.EndgetInterDetailFltValuesV3(iar1);
                    if (result3.SelectSingleNode("code").InnerText == "0")//成功记录到数据库
                    {
                        kabe_InterDetailFltEntity model = new kabe_InterDetailFltEntity();
                        model.sc = this.fromcityCode;
                        model.ec = this.tocityCode;
                        model.sd = this.tripDate;
                        model.ed = string.Empty;
                        model.classtype = "Y";
                        model.ft = "1";
                        model.result = result3;
                        this.InsertKabe_InterDetailFlt(model);
                    }
                    if ((iar2 != null && iar2.IsCompleted) || res2 != null)
                        resetEvent.Set();
                }
                catch
                {
                    resetEvent.Set();
                }
            };
            AsyncCallback back2 = delegate(IAsyncResult iar)
            {
                try
                {
                    result4 = service.EndgetInterDetailFltValuesV3(iar2);
                    if (result4.SelectSingleNode("code").InnerText == "0")//成功记录到数据库
                    {
                        kabe_InterDetailFltEntity model = new kabe_InterDetailFltEntity();
                        model.sc = this.fromcityCode;
                        model.ec = this.tocityCode;
                        model.sd = this.tripDate;
                        model.ed = this.backDate;
                        model.classtype = "Y";
                        model.ft = "2";
                        model.result = result4;
                        this.InsertKabe_InterDetailFlt(model);
                    }
                    if ((iar1 != null && iar1.IsCompleted) || res1 != null)
                        resetEvent.Set();
                }
                catch
                {
                    resetEvent.Set();
                }
            };
            if (result1 == null)
                iar1 = service.BegingetInterDetailFltValuesV3(this.fromcityCode, this.tocityCode, this.tripDate, "", "", "Y", "1", "437c1d948857da89467d2428c408f3d9", back1, null);
            if (result2 == null)
                iar2 = service.BegingetInterDetailFltValuesV3(this.fromcityCode, this.tocityCode, this.tripDate, this.backDate, "", "Y", "2", "437c1d948857da89467d2428c408f3d9", back2, null);
            if (result1 == null || result2 == null)
            {
                if (resetEvent.WaitOne(5000, true))
                    resetEvent.Close();
            }
            if (result1 == null) result1 = result3;
            if (result2 == null) result2 = result4;
        }
    }
    #endregion

    private string getAirLineCode(DataSet airlines, string airlineId)
    {
        if (airlines == null || airlines.Tables == null
            || airlines.Tables.Count == 0
            || airlines.Tables[0].Rows.Count == 0
            || string.IsNullOrEmpty(airlineId))
            return string.Empty;

        for (int i = 0; i < airlines.Tables[0].Rows.Count; i++)
        {
            DataRow dr = airlines.Tables[0].Rows[i];
            if (dr["aId"].ToString().Trim() == airlineId.Trim())
                return dr["airlinecode"].ToString();
        }
        return string.Empty;
    }

    protected void GetSearchTicket()
    {
        DataSet airlines = this.getAirLineDataSets();//获取航空公司
        System.Threading.AutoResetEvent resetEvent = new System.Threading.AutoResetEvent(false);
        getFei580TicektHandler d1 = new getFei580TicektHandler(getFei580Ticekt);
        getKABETiceketHandler d2 = new getKABETiceketHandler(getKABETiceket);
        IAsyncResult iar1 = null, iar2 = null;
        ArrayList tickets1 = null, tickets2 = null;
        AsyncCallback back1 = delegate(IAsyncResult iar)
        {
            try
            {
                tickets1 = d1.EndInvoke(iar1);
                if (iar2 != null && iar2.IsCompleted)
                    resetEvent.Set();
            }
            catch
            {
                resetEvent.Set();
            }
        };

        AsyncCallback back2 = delegate(IAsyncResult iar)
        {
            try
            {
                tickets2 = d2.EndInvoke(iar2);
                if (iar1 != null && iar1.IsCompleted)
                    resetEvent.Set();
            }
            catch
            {
                resetEvent.Set();
            }
        };
        iar1 = d1.BeginInvoke(back1, null);
        iar2 = d2.BeginInvoke(getAirLineCode(airlines, this.airlineId), back2, null);
        if (resetEvent.WaitOne(8000, true))
            resetEvent.Close();

        //没数据 显示提示
        if ((tickets1 == null || tickets1.Count == 0) && (tickets2 == null || tickets2.Count == 0))
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

        ArrayList tickets = new ArrayList();
        if (string.IsNullOrEmpty(this.orderStr))
        {
            //排序飞瀛机票
            foreach (kabe_flight ordertickets in tickets1)
            {
                if (tickets.Count == 0)
                    tickets.Add(ordertickets);
                else
                {
                    bool isEnd = false;
                    for (int i = 0; i < tickets.Count && !isEnd; i++)
                    {
                        kabe_flight aft = (kabe_flight)tickets[i];
                        if ((i + 1) == tickets.Count && ordertickets.adultprice > aft.adultprice)
                        {
                            tickets.Add(ordertickets);
                            isEnd = true;
                            break;
                        }
                        else if (ordertickets.adultprice <= aft.adultprice)
                        {
                            tickets.Insert(i, ordertickets);
                            isEnd = true;
                            break;
                        }
                    }
                }
            }

            //排序Kabe机票
            if (tickets2 != null)
            {
                foreach (kabe_flight ordertickets in tickets2)
                {
                    if (tickets.Count == 0)
                        tickets.Add(ordertickets);
                    else
                    {
                        bool isEnd = false;
                        for (int i = 0; i < tickets.Count && !isEnd; i++)
                        {
                            kabe_flight aft = (kabe_flight)tickets[i];
                            if ((i + 1) == tickets.Count && ordertickets.adultprice > aft.adultprice)
                            {
                                tickets.Add(ordertickets);
                                isEnd = true;
                                break;
                            }
                            else if (ordertickets.adultprice < aft.adultprice)
                            {
                                tickets.Insert(i, ordertickets);
                                isEnd = true;
                                break;
                            }
                            else if (ordertickets.adultprice == aft.adultprice && ordertickets.airline.Equals(aft.airline))
                            {
                                isEnd = true;
                                break;
                            }
                        }
                    }
                }
            }
        }
        else if (this.orderStr.Trim() == "airLine")
        {
            //航空公司排序
            tickets = tickets1;
            //排序kabe机票
            foreach (kabe_flight ordertickets in tickets2)
            {
                if (tickets.Count == 0)
                    tickets.Add(ordertickets);
                else
                {
                    bool isEnd = false;
                    for (int i = 0; i < tickets.Count && !isEnd; i++)
                    {

                        kabe_flight aft = (kabe_flight)tickets[i];
                        if ((i + 1) == tickets.Count && ordertickets.adultprice > aft.adultprice && ordertickets.airline.Equals(aft.airline))
                        {
                            tickets.Add(ordertickets);
                            isEnd = true;
                            break;
                        }
                        else if (ordertickets.adultprice < aft.adultprice && ordertickets.airline.Equals(aft.airline))
                        {
                            tickets.Insert(i, ordertickets);
                            isEnd = true;
                            break;
                        }
                        else if (ordertickets.adultprice == aft.adultprice && ordertickets.airline.Equals(aft.airline))
                        {
                            tickets.Insert(i, ordertickets);
                            isEnd = true;
                            break;
                        }
                    }
                    if (!isEnd)
                        tickets.Add(ordertickets);
                }
            }
        }
        //
        if (Session["TicketsSessionKey_Airlines"] == null)
        {
            ArrayList airlinesresult = new ArrayList();
            foreach (DataRow dr in airlines.Tables[0].Rows)
            {
                foreach (kabe_flight ordertickets in tickets)
                {
                    if (dr["airlinecode"].ToString().Trim().ToLower() == ordertickets.airline.Trim().ToLower())
                    {
                        kabe_Airline a = new kabe_Airline();
                        a.airlineId = dr["aId"].ToString();
                        a.airlineCode = dr["airlinecode"].ToString();
                        a.airlineName = dr["chName"].ToString();
                        a.airlinePic = dr["smallPic"].ToString();
                        airlinesresult.Add(a);
                        break;
                    }
                }
            }
            //写入Session 分页使用
            Session["TicketsSessionKey_Airlines"] = airlinesresult;
        }
        Session["TicketsSessionKey_KaBaTickets"] = tickets2;
        Session[string.Format("TicketsSessionKey_{0}_{1}_{2}_{3}_{4}", this.tripType, fromcityCode, this.tocityCode, Convert.ToDateTime(this.tripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.backDate).ToString("yyyyMMdd"))] = tickets;
        this.BindData(tickets);
    }

    protected ArrayList pageTickets = new ArrayList();
    private void BindData(ArrayList tickets)
    {
        ArrayList airlines = (ArrayList)Session["TicketsSessionKey_Airlines"];
        this.rptAirlinesCount.Text = airlines.Count.ToString();
        this.rptAirlines.DataSource = airlines;
        this.rptAirlines.DataBind();

        this.Pager.RecordCount = tickets.Count;
        this.Pager.CurrentPageIndex = Convert.ToInt32(Request.QueryString["page"]);
        int skipCount = 12 * (Pager.CurrentPageIndex - 1);
        this.pageTickets.Clear();

        for (int i = 0, j = 0; i < tickets.Count && j < 12; i++)
        {
            if (i < skipCount)
            {
            }
            else
            {
                pageTickets.Add(tickets[i]);
                j++;
            }
        }

        //根据排序规则生成机位有限信息
        if (Pager.CurrentPageIndex == 1 && string.IsNullOrEmpty(this.orderStr))
        {
            if (this.tripType == 0)
            {//单程
                makeJpjz(pageTickets, "1", 1, 4);
            }
            else if (this.tripType == 1)
            {
                makeJpjz(pageTickets, "2", 1, 4);
            }
            else if (this.tripType == 2)
            {
                makeJpjz(pageTickets, "1", 6, 8);
                makeJpjz(pageTickets, "2", 6, 8);
            }
        }

        //this.rptshopnews.DataSource = pageTickets;
        //this.rptshopnews.DataBind();
        //首先对飞瀛航空公司排序，然后将爱飞信息插入航司中间
        //增加税费管理
    }

    #region 显示
    private void makeJpjz(ArrayList pageTickets, string tripTypeIntP, int start, int end)
    {
        string cookieKey = tripTypeIntP + "-" + this.fromcityCode + "-" + this.tocityCode + "-" + this.tripDate;
        if (Request.Cookies[cookieKey] == null)
        {
            HttpCookie cookie = new HttpCookie(cookieKey);

            //默认价格排序
            Random ra = new Random();
            int jpjzNum = ra.Next(start, end);
            int jpjzContent = 5;

            if (pageTickets.Count < 6)
            {
                jpjzContent = pageTickets.Count;
            }

            for (int i = 0, j = 0; i < jpjzNum; i++)
            {
                //生成随机数
                int jpjzTicket = ra.Next(0, jpjzContent);
                kabe_flight cacheAFT = (kabe_flight)pageTickets[jpjzTicket];
                string ticketKey = cacheAFT.airline + cacheAFT.depport + cacheAFT.arrport + cacheAFT.adultprice + "-" + cacheAFT.ticketId;

                if (cacheAFT.ft.Equals(tripTypeIntP))
                {
                    cookie.Values[ticketKey] = "jpjz";
                    j++;
                }

                if ((jpjzContent + 2) < pageTickets.Count && i == jpjzNum - 1 && j == 0)
                {
                    jpjzContent = jpjzContent + 2;
                    i = 0;
                }
            }
            cookie.Expires = System.DateTime.Now.AddDays(1);//设置过期时间  1天
            Response.Cookies.Add(cookie);
        }
    }

    protected string display_airline(string airline)
    {
        ArrayList airlines = (ArrayList)Session["TicketsSessionKey_Airlines"];
        foreach (kabe_Airline a in airlines)
        {
            if (a.airlineCode.ToLower().Trim() == airline.ToLower().Trim())
            {
                string str = "<li><img src=\"http://www.fei580.com/" + a.airlinePic + "\" alt=\"" + a.airlineName + "\" /></li>";
                str += "<li class=\"lititle\"><a target=\"_blank\" href=\"http://www.fei580.com/airline/" + a.airlineId + ".htm\">" + a.airlineName + "</a></li>";
                return str;
            }
        }

        return "<li>" + airline + "</li><li class=\"lititle\"><a href=\"javascript:void(0);\"></a></li>";
    }

    protected string display_orderboxairline(string airline)
    {
        ArrayList airlines = (ArrayList)Session["TicketsSessionKey_Airlines"];
        foreach (kabe_Airline a in airlines)
        {
            if (a.airlineCode.ToLower().Trim() == airline.ToLower().Trim())
                return "<span class=order_tag >航空公司</span><span class=airport ><img src=http://www.fei580.com/" + a.airlinePic + " /></span>" + a.airlineName + "";
        }
        return string.Empty;
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

    protected string printJpjz(kabe_flight aft)
    {
        string cookieKey = aft.ft + "-" + this.fromcityCode + "-" + this.tocityCode + "-" + this.tripDate;
        string key = aft.airline + aft.depport + aft.arrport + aft.adultprice + "-" + aft.ticketId;
        if (Request.Cookies[cookieKey] != null)
        {
            string name = Request.Cookies[cookieKey][key];
            if (name != null && name.Equals("jpjz"))
            {
                return "<img src='images/jwyouxian.gif' />";
            }
        }
        return "&nbsp;";
    }

    protected string display_plan(ArrayList segment)
    {
        string result = string.Empty;
        foreach (kabe_segment s in segment)
        {
            //if (result.IndexOf(s.plane + "/")< 0)
            result += s.plane + "/";
        }
        return result.TrimEnd('/');
    }

    protected string display_plan(ArrayList segment, string source)
    {
        if (source == "kabe")
            return display_plan(segment);
        else
        {
            ArrayList array = (ArrayList)Session["TicketsSessionKey_KaBaTickets"];
            if (array == null || array.Count == 0) return "-";

            return display_plan(((kabe_flight)array[new Random().Next(0, array.Count - 1)]).segment);
        }
    }

    protected string display_fei580_plan(ArrayList pageTickets, string airline, string ft)
    {
        string result = string.Empty;
        foreach (kabe_flight s in pageTickets)
        {
            if (s.airline.ToLower().Trim() == airline.ToLower().Trim() && ft == s.ft)
            {
                foreach (kabe_segment m in s.segment)
                {
                    result += m.plane + "/";
                }
                break;
            }
        }
        return result.TrimEnd('/');
    }

    private ArrayList randomList = new ArrayList();
    private bool isInRandomList(long key)
    {
        if (randomList.Contains(key)) return true;
        return false;
    }
    protected string readTimeFromCookie(string timetype, string from, string to, string airline, string type, string stime, string ft, int hastype)
    {
        ArrayList tickets = (ArrayList)Session[string.Format("TicketsSessionKey_{0}_{1}_{2}_{3}_{4}", this.tripType, fromcityCode, this.tocityCode, Convert.ToDateTime(this.tripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.backDate).ToString("yyyyMMdd"))];
        if (tickets != null)
        {
            foreach (kabe_flight f in tickets)
            {
                if (f.source == "feiying" || (f.airline.ToLower().Trim() != airline.Trim().ToLower()))
                    continue;

                if (ft == "1")
                {
                    if (hastype == 1)
                        return f.deproute.depdate + " " + f.deproute.deptime.Insert(2, ":");
                    else if (hastype == 2)
                        return f.deproute.arrdate + " " + f.deproute.arrtime.Insert(2, ":");
                }
                else
                {
                    if (f.ft == "1")
                        continue;

                    if (hastype == 1)
                        return f.deproute.depdate + " " + f.deproute.deptime.Insert(2, ":");
                    else if (hastype == 2)
                        return f.deproute.arrdate + " " + f.deproute.arrtime.Insert(2, ":");
                    else if (hastype == 3)
                        return f.arrroute.depdate + " " + f.arrroute.deptime.Insert(2, ":");
                    else if (hastype == 4)
                        return f.arrroute.arrdate + " " + f.arrroute.arrtime.Insert(2, ":");
                }
            }
        }
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
    #endregion

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        if (Request.QueryString["page"] == null)
            return;

        ArrayList tickets = (ArrayList)Session[string.Format("TicketsSessionKey_{0}_{1}_{2}_{3}_{4}", this.tripType, fromcityCode, this.tocityCode, Convert.ToDateTime(this.tripDate).ToString("yyyyMMdd"), Convert.ToDateTime(this.backDate).ToString("yyyyMMdd"))];
        if (tickets != null)
        {
            this.BindData(tickets);
            return;
        }

        this.GetSearchTicket();
    }

    
}
