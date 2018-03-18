using System;
using System.Collections;
using System.Data;
using System.Web;
using eap.share;

public partial class searchTicket : System.Web.UI.Page
{
    protected DataRowCollection fromcitylist = null;
    protected DataRowCollection morefromcitylist = null;
    protected string fromCityName = "";
    protected string toCityName = "";
    protected string ajaxToTime = "";
    protected string ajaxFromTime = "";
    protected int ajaxSerachType = -1;

    protected void Page_Load(object sender, EventArgs e)
    {

        randomList = new ArrayList();
        ajaxSerachType = tripTypeInt;
        ajaxToTime = tripDateStr.Trim().Replace("-", "");//
        ajaxFromTime = backDateStr.Trim().Replace("-", "");//

        if (!IsPostBack)
        {
            string commandText3 = "select * from FY_FromCity";
            DataSet ds1 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText3);
            if (ds1 != null)
            {
                fromCity.DataSource = ds1;
                fromCity.DataTextField = "chName";
                fromCity.DataValueField = "fid";
                fromCity.DataBind();
            }

            if (Request.QueryString["airlineId"] != null)
                GetSearchTicket();
            else
            {
                if (Request.QueryString["page"] == null)
                {
                    if (Request.QueryString["Loading"] == "true")
                        GetSearchTicket();
                    else
                        this.panLoading.Visible = true;
                }
            }
        }

        fromcitylist = GetFromCitylist(fromcitylist);
        morefromcitylist = GetMoreFromCitylist(morefromcitylist);
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


    protected void GetSearchTicket()
    {
        //从本地数据库查询
        DataSet ds = new DataSet();

        //查找航空公司名称  构造航空公司排序数组
        string str = @"select top 100 percent";
        str += " FY_Ticket.tid,FY_Ticket.untaxPrice,FY_Ticket.relayPort,FY_Ticket.tripType,";
        str += " FY_FromCity.cityCode as fromCityCode,";
        str += " FY_ToCity.cityCode as toCityCode,";
        str += " FY_Tax.tax,";
        str += " FY_FromCity.chName as fromCityname,FY_FromCity.fId,FY_Airline.aId,FY_ToCity.tId as toId,";
        str += " FY_ToCity.chName as toCityname,FY_Airline.airlineCode as airlineCode,FY_Airline.chName as airname, FY_Airline.smallPic as smallPic from FY_Ticket ";
        str += " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity";
        str += " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity";
        str += " left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine";
        str += " left join FY_Tax on (FY_Ticket.tripType =FY_Tax.taxType and FY_Ticket.airLine = FY_Tax.airline and FY_Ticket.toCity = FY_Tax.toCity and FY_Ticket.fromCity = FY_Tax.fromCity)";
        str += " where 1=1  ";

        //查找航空公司
        string strAirline = @"select  FY_Ticket.airLine,min(FY_Ticket.untaxPrice) as untaxPrice  ";
        strAirline += " from FY_Ticket";
        strAirline += " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity";
        strAirline += " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity";
        strAirline += " left join FY_Tax on (FY_Ticket.airLine = FY_Tax.airline and FY_Ticket.toCity = FY_Tax.toCity and FY_Ticket.fromCity = FY_Tax.fromCity)";
        strAirline += " where 1=1  ";

        if (tripTypeInt != 2)
        {
            str += " and (FY_Ticket.tripType=" + tripTypeInt + ")";
            strAirline += " and (FY_Ticket.tripType=" + tripTypeInt + ")";
        }

        if (fromCityId != 0)
        {
            str += " and (FY_FromCity.fId=" + fromCityId + ")";
            strAirline += " and (FY_FromCity.fId=" + fromCityId + ")";
        }

        if (toCityNameStr != "")
        {
            str += " and (FY_ToCity.chName like '%" + toCityNameStr + "%')";
            strAirline += " and (FY_ToCity.chName like '%" + toCityNameStr + "%')";
        }

        if (tripDateStr != "")
        {
            str += " and (FY_Ticket.fromtripDate<='" + tripDateStr + "' and FY_Ticket.totripDate>='" + tripDateStr + "' )";
            strAirline += " and (FY_Ticket.fromtripDate<='" + tripDateStr + "' and FY_Ticket.totripDate>='" + tripDateStr + "' )";
        }

        if (tripDateStr != "" && backDateStr != "" && tripTypeInt != 0)
        {
            int day = (Convert.ToDateTime(backDateStr) - Convert.ToDateTime(tripDateStr)).Days;
            str += " and DateDiff(d,FY_Ticket.fromtripDate,FY_Ticket.totripDate) >= " + day;
            strAirline += " and DateDiff(d,FY_Ticket.fromtripDate,FY_Ticket.totripDate) >= " + day;
        }

        str += " and (FY_Ticket.tosaleDate>='" + DateTime.Now.ToString("yyyy-MM-dd") + "')";
        strAirline += " and (FY_Ticket.tosaleDate>='" + DateTime.Now.ToString("yyyy-MM-dd") + "')";

        if (airlineId != 0)
            str += " and (FY_Airline.aId=" + airlineId + ")";

        if (getorderStr != "")
        {
            str += " order by FY_Ticket." + getorderStr + " asc ,FY_Ticket.tId desc";
        }
        else
        {
            str += " order by FY_Ticket.untaxPrice asc ,FY_Ticket.tId desc";
        }

        ArrayList allAirlines = new ArrayList();
        strAirline += " group by FY_Ticket.airLine order by min(FY_Ticket.untaxPrice) asc";
        //查询航空公司
        DataSet dsStrAirLine = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, strAirline);
        if (dsStrAirLine != null)
        {
            foreach (DataRow drAifeiAirline in dsStrAirLine.Tables[0].Rows)
            {
                AiFeiAirline afa = new AiFeiAirline();
                afa.minPrice = drAifeiAirline["untaxPrice"].ToString();
                afa.airlineId = drAifeiAirline["airLine"].ToString();

                string code = string.Empty;
                string pic = string.Empty;
                afa.airlineName = ReadXmlHelper.GetAirLineNameByID(Convert.ToInt64(afa.airlineId), out code, out pic);
                afa.airlinePic = pic;
                afa.airlineCode = code;
                //if(allAirlines.Count<11)
                allAirlines.Add(afa);
            }
        }

        //从爱飞网获得数据并排序
        AiFeiService aifeiService = new AiFeiService();
        //ArrayList = aifeiService.GlobalTicket(dpt, arr, toTime, reTime, cate);
        ///dpt  出发三字码   arr  到达三字码
        ///

        string arr = getToCityCodeByName(toCityNameStr);
        string dpt = getFromCityCodeByName(fromCityName);

        //string cate = "ALL";
        string cate = "SF";

        ArrayList aifeiTickets = new ArrayList();

        if (tripTypeInt == 0)
        {
            cate = "DC";
            aifeiTickets = aifeiService.AiFeiTickets(dpt, arr, ajaxToTime, ajaxFromTime, cate, airlineId, ref allAirlines);//过滤航空公司
        }
        else if (tripTypeInt == 1)
        {
            cate = "SF";
            aifeiTickets = aifeiService.AiFeiTickets(dpt, arr, ajaxToTime, ajaxFromTime, cate, airlineId, ref allAirlines);//过滤航空公司
        }
        else if (tripTypeInt == 2)
        {
            System.Threading.AutoResetEvent resetEvent = new System.Threading.AutoResetEvent(false);
            AiFeiService.AiFeiTicketsHandler d1 = new AiFeiService.AiFeiTicketsHandler(aifeiService.AiFeiTickets);
            AiFeiService.AiFeiTicketsHandler d2 = new AiFeiService.AiFeiTicketsHandler(aifeiService.AiFeiTickets);
            IAsyncResult iar1 = null, iar2 = null;
            ArrayList aifeiTickets2 = null;
            AsyncCallback back1 = delegate(IAsyncResult iar)
            {
                aifeiTickets = d1.EndInvoke(ref allAirlines, iar1);
                if (iar2 != null && iar2.IsCompleted)
                    resetEvent.Set();
            };

            AsyncCallback back2 = delegate(IAsyncResult iar)
            {
                aifeiTickets2 = d2.EndInvoke(ref allAirlines, iar2);
                if (iar1 != null && iar1.IsCompleted)
                    resetEvent.Set();
            };
            iar1 = d1.BeginInvoke(dpt, arr, ajaxToTime, ajaxFromTime, "SF", airlineId, ref allAirlines, back1, null);
            iar2 = d2.BeginInvoke(dpt, arr, ajaxToTime, ajaxFromTime, "DC", airlineId, ref allAirlines, back2, null);
            if (resetEvent.WaitOne(2000, true))
                resetEvent.Close();
            if (aifeiTickets2 != null)
            {
                for (int i = 0; i < aifeiTickets2.Count; i++)
                {
                    aifeiTickets.Add(aifeiTickets2[i]);
                }
            }
        }

        //获得爱飞机票列表
        ArrayList tickets = new ArrayList();
        ArrayList feiYingTickets = new ArrayList();

        int aifeinum = Convert.ToInt32(this.hidd_aifeinum.Value);
        ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);

        //没数据 显示提示
        if ((ds.Tables[0] == null || ds.Tables[0].Rows.Count == 0) && aifeiTickets.Count == 0)
        {
            this.panHaveValue2.Visible = false;
            this.panNoValue.Visible = true;
            return;
        }
        else
        {
            this.panHaveValue2.Visible = true;
            this.panNoValue.Visible = false;

            DataTable dt = ds.Tables[0];
            //遍历行
            foreach (DataRow dr in dt.Rows)
            {
                //遍历列
                AiFeiTicket aifeiTicket = new AiFeiTicket();
                aifeiTicket.ticketId = dr["tid"].ToString().Trim();
                aifeiTicket.price = Convert.ToInt32(dr["untaxPrice"].ToString());
                aifeiTicket.fromCity = dr["fromCityName"].ToString();
                aifeiTicket.fromCityCode = dr["fromCityCode"].ToString();
                aifeiTicket.fromCityId = dr["fId"].ToString();
                aifeiTicket.toCity = dr["toCityName"].ToString();
                aifeiTicket.toCityCode = dr["toCityCode"].ToString();
                aifeiTicket.toCityId = dr["toId"].ToString();
                aifeiTicket.airlineCode = dr["airlineCode"].ToString();
                aifeiTicket.airline = dr["airname"].ToString();
                aifeiTicket.airlineId = dr["aId"].ToString();
                aifeiTicket.airlineSmallPic = dr["smallPic"].ToString();
                aifeiTicket.relayPort = dr["relayPort"].ToString();
                aifeiTicket.sourceType = "feiying";
                aifeiTicket.tripType = dr["tripType"].ToString();//单程or往返
                //查询税费信息
                //aifeiTicket.tax = getTaxMessage(aifeiTicket.fromCityId, aifeiTicket.toCityId, aifeiTicket.airlineId, Convert.ToInt32(aifeiTicket.tripType));
                feiYingTickets.Add(aifeiTicket);
            }
        }

        if (getorderStr.Equals(""))
        {
            //排序飞瀛机票
            foreach (AiFeiTicket orderTicket in feiYingTickets)
            {
                if (tickets.Count == 0)
                {
                    tickets.Add(orderTicket);
                }
                else
                {
                    bool isEnd = false;
                    for (int i = 0; i < tickets.Count && !isEnd; i++)
                    {
                        AiFeiTicket aft = (AiFeiTicket)tickets[i];
                        if ((i + 1) == tickets.Count && orderTicket.price > aft.price)
                        {
                            tickets.Add(orderTicket);
                            isEnd = true;
                            break;
                        }
                        else if (orderTicket.price <= aft.price)
                        {
                            tickets.Insert(i, orderTicket);
                            isEnd = true;
                            break;
                        }
                    }
                }
            }

            //排序爱飞机票
            foreach (AiFeiTicket orderTicket in aifeiTickets)
            {
                if (tickets.Count == 0)
                {
                    tickets.Add(orderTicket);
                }
                else
                {
                    bool isEnd = false;
                    for (int i = 0; i < tickets.Count && !isEnd; i++)
                    {

                        AiFeiTicket aft = (AiFeiTicket)tickets[i];
                        if ((i + 1) == tickets.Count && orderTicket.price > aft.price)
                        {
                            tickets.Add(orderTicket);
                            isEnd = true;
                            break;
                        }
                        else if (orderTicket.price < aft.price)
                        {
                            tickets.Insert(i, orderTicket);
                            isEnd = true;
                            break;
                        }
                        else if (orderTicket.price == aft.price && orderTicket.airlineCode.Equals(aft.airlineCode))
                        {
                            isEnd = true;
                            break;
                        }
                    }
                }
            }
        }
        else if (getorderStr.Equals("airLine"))
        {
            //航空公司排序
            tickets = feiYingTickets;

            //排序爱飞机票
            foreach (AiFeiTicket orderTicket in aifeiTickets)
            {
                if (tickets.Count == 0)
                {
                    tickets.Add(orderTicket);
                }
                else
                {
                    bool isEnd = false;
                    for (int i = 0; i < tickets.Count && !isEnd; i++)
                    {

                        AiFeiTicket aft = (AiFeiTicket)tickets[i];
                        if ((i + 1) == tickets.Count && orderTicket.price > aft.price && orderTicket.airlineCode.Equals(aft.airlineCode))
                        {
                            tickets.Add(orderTicket);
                            isEnd = true;
                            break;
                        }
                        else if (orderTicket.price < aft.price && orderTicket.airlineCode.Equals(aft.airlineCode))
                        {
                            tickets.Insert(i, orderTicket);
                            isEnd = true;
                            break;
                        }
                        else if (orderTicket.price == aft.price && orderTicket.airlineCode.Equals(aft.airlineCode))
                        {
                            isEnd = true;
                            break;
                        }
                    }
                }
            }
        }

        //绑定航空公司
        Session["TicketsSessionKey_Airlines"] = allAirlines;

        //写入Session 分页使用
        Session["TicketsSessionKey_" + tripTypeInt + "_" + fromCityId + "_" + Server.HtmlEncode(toCityNameStr) + "_" + ajaxToTime + "_" + ajaxFromTime] = tickets;
        this.BindData(tickets);
    }

    private void BindData(ArrayList tickets)
    {
        ArrayList airlines = (ArrayList)Session["TicketsSessionKey_Airlines"];
        this.rptAirlinesCount.Text = airlines.Count.ToString();
        this.rptAirlines.DataSource = airlines;
        this.rptAirlines.DataBind();

        Pager.RecordCount = tickets.Count;
        Pager.CurrentPageIndex = Convert.ToInt32(Request.QueryString["page"]);
        int skipCount = 12 * (Pager.CurrentPageIndex - 1);
        ArrayList pageTickets = new ArrayList();

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
        if (Pager.CurrentPageIndex == 1 && getorderStr.Equals(""))
        {

            if (tripTypeInt == 0)
            {//单程
                makeJpjz(pageTickets, "0", 1, 4);
            }
            else if (tripTypeInt == 1)
            {
                makeJpjz(pageTickets, "1", 1, 4);
            }
            else if (tripTypeInt == 2)
            {
                makeJpjz(pageTickets, "0", 6, 8);
                makeJpjz(pageTickets, "1", 6, 8);
            }
        }

        this.rptshopnews.DataSource = pageTickets;
        this.rptshopnews.DataBind();
        //首先对飞瀛航空公司排序，然后将爱飞信息插入航司中间
        //增加税费管理
    }


    private void makeJpjz(ArrayList pageTickets, string tripTypeIntP, int start, int end)
    {
        string cookieKey = tripTypeIntP + "-" + fromCityId + "-" + getToCityCodeByName(toCityNameStr.Trim()) + "-" + tripDateStr;
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
                AiFeiTicket cacheAFT = (AiFeiTicket)pageTickets[jpjzTicket];
                string ticketKey = cacheAFT.airlineCode + cacheAFT.fromCityCode + cacheAFT.toCityCode + cacheAFT.price + "-" + cacheAFT.ticketId + "-" + cacheAFT.ticketCode;

                if (cacheAFT.tripType.Equals(tripTypeIntP))
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


    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        if (Request.QueryString["page"] == null)
            return;
        //if (Request.QueryString["page"] == "1" && Request.QueryString["Loading"] == "true")
        //    return;

        ArrayList tickets = (ArrayList)Session["TicketsSessionKey_" + tripTypeInt + "_" + fromCityId + "_" + Server.HtmlEncode(toCityNameStr) + "_" + ajaxToTime + "_" + ajaxFromTime];
        if (tickets != null)
        {
            this.BindData(tickets);
            return;
        }

        GetSearchTicket();
    }

    protected string printJpjz(AiFeiTicket aft)
    {
        string cookieKey = aft.tripType + "-" + fromCityId + "-" + getToCityCodeByName(toCityNameStr.Trim()) + "-" + tripDateStr;
        string key = aft.airlineCode + aft.fromCityCode + aft.toCityCode + aft.price + "-" + aft.ticketId + "-" + aft.ticketCode;
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

    protected string printfXXLink(AiFeiTicket aft)
    {
        //加上起降时间
        if (aft.sourceType.Equals("feiying"))
        {
            return "/ticket_" + aft.ticketId + "_" + readTimeFromCookie(aft.fromCityCode, aft.toCityCode, aft.airlineCode, "toDt", ajaxToTime) + "_" + readTimeFromCookie(aft.fromCityCode, aft.toCityCode, aft.airlineCode, "arriveDt", ajaxToTime) + ".htm";
        }
        else if (aft.sourceType.Equals("aifei"))
        {
            return "/ticket_" + aft.ticketCode + "aifei_" + readTimeFromCookie(aft.fromCityCode, aft.toCityCode, aft.airlineCode, "toDt", ajaxToTime) + "_" + readTimeFromCookie(aft.fromCityCode, aft.toCityCode, aft.airlineCode, "arriveDt", ajaxToTime) + ".htm";
        }
        return "#";
    }

    private ArrayList getFlightMsg(string fromCityCode, string toCityCode, string airlineCode, string toTime)
    {
        string sql = "select id from FY_AiFei_Ticket where fromCity='" + fromCityCode.Trim() + "' and toCity='" + toCityCode.Trim() + "' and airline='" + airlineCode.Trim() + "'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        ArrayList flights = new ArrayList();
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

            flights.Add(flight);
            return flights;
        }
        return null;
    }


    private int fromCityId
    {
        get
        {
            if (Request.QueryString["fromCity"] != null)
            {
                fromCity.SelectedValue = Request.QueryString["fromcity"].ToString();
                string str = "select * from FY_FromCity where fId=" + Convert.ToInt32(Request.QueryString["fromcity"].ToString());
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                if (ds != null)
                {
                    //fromCityNameLabel.Text = ds.Tables[0].Rows[0]["chName"].ToString();
                    fromCityName = ds.Tables[0].Rows[0]["chName"].ToString();
                    this.fromCity.SelectedValue = Request.QueryString["fromCity"].ToString().Trim();
                }
                return Convert.ToInt32(Request.QueryString["fromcity"].ToString());
            }
            else
            {
                return 0;
            }
        }
    }

    private string toCityNameStr
    {
        get
        {
            if (Request.QueryString["toCityName"] != null)
            {
                tocityName.Value = Request.QueryString["toCityName"].ToString().Trim();
                //toCityNameLabel.Text = Request.QueryString["toCityName"].ToString().Trim();
                toCityName = Request.QueryString["toCityName"].ToString().Trim();
                return Sys.filterSQLStr(Request.QueryString["toCityName"].ToString().Trim());
            }
            else
            {
                return "";
            }
        }
    }

    private int tripTypeInt
    {
        get
        {
            if (Request.QueryString["tripType"] != null && Request.QueryString["tripType"] != "")
            {
                if (Request.QueryString["tripType"].ToString() == "2")
                {
                    tripTypeNameLabel.Text = "全部";
                    this.tripType1.Checked = true;
                    this.backtripDate.Disabled = true;
                }
                if (Request.QueryString["tripType"].ToString() == "0")
                {
                    tripTypeNameLabel.Text = "单程";
                    this.tripType2.Checked = true;
                    this.backtripDate.Disabled = false;
                }
                if (Request.QueryString["tripType"].ToString() == "1")
                {
                    tripTypeNameLabel.Text = "往返";
                    this.tripType3.Checked = true;
                    this.backtripDate.Disabled = true;
                }

                return Convert.ToInt32(Request.QueryString["tripType"].ToString());
            }
            else
            {
                tripTypeNameLabel.Text = "全部";
                return 2;
            }
        }
    }


    private string tripDateStr
    {
        get
        {
            if (Request.QueryString["tripDate"] != null)
            {
                fromtripDate.Value = Request.QueryString["tripDate"].ToString().Trim();
                tripDateLabel.Text = Request.QueryString["tripDate"].ToString().Trim();
                return Sys.filterSQLStr(Request.QueryString["tripDate"].ToString().Trim());
            }
            else
            {
                return "";
            }
        }
    }

    protected int airlineId
    {
        get
        {
            if (Request.QueryString["airlineId"] != null)
            {
                return Convert.ToInt32(Request.QueryString["airlineId"].ToString().Trim());
            }
            else
            {
                return 0;
            }
        }
    }

    private string backDateStr
    {
        get
        {
            if (Request.QueryString["backDate"] != null)
            {
                backtripDate.Value = Request.QueryString["backDate"].ToString().Trim();
                backDateLabel.Text = Request.QueryString["backDate"].ToString().Trim();
                return Sys.filterSQLStr(Request.QueryString["backDate"].ToString().Trim());
            }
            else
            {
                return "";
            }
        }
    }

    private string getorderStr
    {
        get
        {
            if (Request.QueryString["orderStr"] != null)
            {
                return Sys.filterSQLStr(Request.QueryString["orderStr"].ToString().Trim());
            }
            else
            {
                return "";
            }
        }
    }

    protected string getFromCityNameByCode(string cityCode)
    {
        string sql = "select chName from FY_FromCity where cityCode='" + cityCode + "'";
        DataSet dsCityName = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityName != null)
        {

            return dsCityName.Tables[0].Rows[0]["chName"].ToString();
        }

        return "";
    }

    protected string getToCityNameByCode(string cityCode)
    {
        string sql = "select chName from FY_ToCity where cityCode='" + cityCode + "'";
        DataSet dsCityName = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityName != null && dsCityName.Tables.Count > 0 && dsCityName.Tables[0].Rows.Count > 0)
        {
            return dsCityName.Tables[0].Rows[0]["chName"].ToString();
        }

        return "";
    }

    protected string getFromCityCodeByName(string cityName)
    {
        string sql = "select cityCode from FY_FromCity where chName='" + cityName + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count > 0 && dsCityCode.Tables[0].Rows.Count > 0)
        {
            return dsCityCode.Tables[0].Rows[0]["cityCode"].ToString();
        }

        return "";
    }

    protected string getToCityCodeByName(string cityName)
    {
        string sql = "select cityCode from FY_ToCity where chName='" + cityName + "'";
        DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityCode != null && dsCityCode.Tables.Count > 0 && dsCityCode.Tables[0].Rows.Count > 0)
        {
            return dsCityCode.Tables[0].Rows[0]["cityCode"].ToString();
        }

        return "";
    }

    //查询并返回税费信息
    private string getTaxMessage(string fromCity, string toCity, string airline, int taxType)
    {
        string sql = "select tax from FY_Tax where fromCity='" + fromCity + "' and toCity='" + toCity + "' and airline='" + airline + "' and taxType='" + taxType + "'";
        DataSet taxDS = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (taxDS != null && taxDS.Tables.Count > 0 && taxDS.Tables[0].Rows.Count > 0)
        {
            return taxDS.Tables[0].Rows[0]["tax"].ToString();
        }
        else
        {
            return "------";
        }

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

    protected string printf_flights(AiFeiTicket aft, string type)
    {
        if (type.Equals("from"))
        {
            string str = "";

            if (aft.tripType.Equals("1"))
            {
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(aft.fromCityCode) + "</li><li class='lititle2'>起飞：" + convertDate(ajaxToTime, readTimeFromCookie(aft.fromCityCode, aft.toCityCode, aft.airlineCode, "toDt", ajaxToTime)) + "</li>";
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(aft.toCityCode) + "</li><li class='lititle2'>起飞：" + convertDate(ajaxFromTime, readTimeFromCookie(aft.toCityCode, aft.fromCityCode, aft.airlineCode, "toDt", ajaxFromTime)) + "</li>";
            }

            if (aft.tripType.Equals("0"))
            {
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(aft.fromCityCode) + "</li><li class='lititle2'>起飞：" + convertDate(ajaxToTime, readTimeFromCookie(aft.fromCityCode, aft.toCityCode, aft.airlineCode, "toDt", ajaxToTime)) + "</li>";
            }
            return str;
        }
        else if (type.Equals("to"))
        {
            string str = "";

            if (aft.tripType.Equals("1"))
            {
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(aft.toCityCode) + "</li><li class='lititle2'>到达：" + convertDate(ajaxToTime, readTimeFromCookie(aft.fromCityCode, aft.toCityCode, aft.airlineCode, "arriveDt", ajaxToTime)) + "</li>";
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(aft.fromCityCode) + "</li><li class='lititle2'>到达：" + convertDate(ajaxFromTime, readTimeFromCookie(aft.toCityCode, aft.fromCityCode, aft.airlineCode, "arriveDt", ajaxFromTime)) + "</li>";
            }

            if (aft.tripType.Equals("0"))
            {
                str += "<li class='lititle1'>" + ReadXmlHelper.GetAirPortNameByCode(aft.toCityCode) + "</li><li class='lititle2'>到达：" + convertDate(ajaxToTime, readTimeFromCookie(aft.fromCityCode, aft.toCityCode, aft.airlineCode, "arriveDt", ajaxToTime)) + "</li>";
            }
            return str;
        }
        else if (type.Equals("line"))
        {
            string str = "";

            if (aft.tripType.Equals("1"))
            {
                str += "<li class='lititle1'><img src='/images/sgo.gif'/>&rarr;</li><li class='lititle2'>&nbsp;</li>";
                str += "<li class='lititle1'><img src='/images/sback.gif'/>&rarr;</li><li class='lititle2'>&nbsp;</li>";
            }

            if (aft.tripType.Equals("0"))
            {
                str += "<li class='lititle1'><img src='/images/sgo.gif'/>&rarr;</li><li class='lititle2'>&nbsp;</li>";
            }
            return str;
        }
        return "";
    }

    protected string readTimeFromCookie(string from, string to, string airline, string type, string stime)
    {
        if (Request.Cookies[from + to + airline + "-timeCache"] == null)
        {
            long start = new Random().Next(0, 12 * 19);//已5分钟为单位
            long end = new Random().Next(12 * 2, 12 * 5);

            while (isInRandomList(start))
            {
                start = new Random().Next(0, 12 * 19);
            }

            randomList.Add(start);

            DateTime toDT = Convert.ToDateTime(stime.Substring(0, 4) + "-" + stime.Substring(4, 2) + "-" + stime.Substring(6, 2));
            toDT = toDT.AddMinutes(start * 5);
            DateTime arriveDT = toDT.AddMinutes(end * 5);

            //写入cookie缓存
            //fromCode,string toCode,string airLineCode
            HttpCookie cookie = new HttpCookie(from + to + airline + "-timeCache");
            cookie.Values["toDt"] = toDT.ToString("yyyyMMddHHmmss");
            cookie.Values["arriveDt"] = arriveDT.ToString("yyyyMMddHHmmss");
            Response.Cookies.Add(cookie);
        }

        if (Request.Cookies[from + to + airline + "-timeCache"] != null)
        {
            if (type.Equals("toDt"))
            {
                return Request.Cookies[from + to + airline + "-timeCache"]["toDt"];
            }
            else if (type.Equals("arriveDt"))
            {
                return Request.Cookies[from + to + airline + "-timeCache"]["arriveDt"];
            }
        }

        return null;
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="time"></param>
    /// <param name="tmpToTime"></param>
    /// <returns></returns>
    private string convertDate(string time, string tmpToTime)
    {
        return time.Substring(0, 4) + "-" + time.Substring(4, 2) + "-" + time.Substring(6, 2) + " " + tmpToTime.Substring(8, 2) + ":" + tmpToTime.Substring(10, 2);
    }

    private ArrayList randomList = new ArrayList();
    private bool isInRandomList(long key)
    {
        if (randomList.Contains(key))
            return true;
        return false;
    }

    //protected string printf_relayPort(string airPort){
    //    if(airPort!=null&&airPort.Trim().Length>4)
    //        return "经 "+airPort.Substring(4,airPort.Trim().Length-4);
    //    return "直飞";
    //}

    protected string printf_relayPort(string airPort)
    {
        if (!string.IsNullOrEmpty(airPort) && airPort.Trim().Length > 4)
            return "中转";
        return string.Empty;
    }
}
