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
using System.Collections.Specialized;
using eap.share;

public partial class HotelList : System.Web.UI.Page
{
    protected DataRow City = null;
    protected HotelSearch hs = null;
    protected string CityName = string.Empty, stateName=string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {

        NameValueCollection coll = Request.QueryString;
        CityName = coll["cityName"];
        if (CityName == null)
        {    
            Response.Redirect("Hotel.aspx");
            return;
        }
        hs= (HotelSearch)Session[new HotelSearch().SessionKey];
        if (hs == null || hs.CityName != CityName)
        {
            hs = new HotelSearch();
            hs.CityName = CityName;
            hs.HotelName = string.Empty;
            hs.FromDate = DateTime.Now.AddDays(5);
            hs.ToDate = DateTime.Now.AddDays(6);
            hs.MinPrice = 0;
            hs.MaxPrice = 0;
            hs.BookNum = 1;
            Session[hs.SessionKey] = hs;
        }
        
        if (!IsPostBack)
        {
            this.tocityName.Value = hs.CityName;
            this.txt_hotelName.Value = hs.HotelName;
            this.txt_fromDate.Value = hs.FromDate.ToString("yyyy-MM-dd");
            this.txt_toDate.Value = hs.ToDate.ToString("yyyy-MM-dd");
            if (hs.MinPrice != 0 || hs.MaxPrice != 0)
            {
                this.txt_minPrice.Value = hs.MinPrice.ToString();
                this.txt_maxPrice.Value = hs.MaxPrice.ToString();
            }
            this.selBookNum.Value = hs.BookNum.ToString();
        }
        this.Page.Title = hs.CityName+"酒店-特价酒店-飞瀛网";

        City = getCityInfo(hs.CityName.Trim());
        if (City == null)
        {
            scripthelp.AlertAndRedirect("无法找到该目的地城市！", "Hotel.aspx", this.Page);
            return;
        }
        else
            stateName = City["stateName"].ToString();


        GetShopNewslist(hs.CityName, hs.HotelName, hs.FromDate.ToShortDateString(), hs.ToDate.ToShortDateString(), hs.MinPrice, hs.MaxPrice, hs.BookNum);

        getHotelListByCity(hs.CityName, hs.HotelName, hs.FromDate.ToShortDateString(), hs.ToDate.ToShortDateString(), hs.MinPrice, hs.MaxPrice, hs.BookNum);

        getRecommendTicket(0, Convert.ToInt32(City["sId"]), 10);
        
    }

    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string cityName = this.tocityName.Value;
        if (string.IsNullOrEmpty(cityName))
        {
            scripthelp.Alert("请选择目的地城市！", this.Page);
            return;
        }
        string hotelName = this.txt_hotelName.Value;

        DateTime fromDate;
        DateTime toDate;
        if (string.IsNullOrEmpty(this.txt_fromDate.Value))
        {
            scripthelp.Alert("请选择入住日期！", this.Page);
            return;
        }
        if (!DateTime.TryParse(this.txt_fromDate.Value, out fromDate))
        {
            scripthelp.Alert("请选择正确的入住日期！", this.Page);
            return;
        }
        if (string.IsNullOrEmpty(this.txt_toDate.Value))
        {
            scripthelp.Alert("请选择退房日期！", this.Page);
            return;
        }
        if (!DateTime.TryParse(this.txt_toDate.Value, out toDate))
        {
            scripthelp.Alert("请选择正确的退房日期！", this.Page);
            return;
        }
        if (DateTime.Compare(DateTime.Now, fromDate) > -1)
        {
            scripthelp.Alert("入住日期已过期！", this.Page);
            return;
        }

        if (DateTime.Compare(fromDate, toDate) > -1)
        {
            scripthelp.Alert("入住日期不能小于退房日期！", this.Page);
            return;
        }

        int minPrice = 0;
        int maxPrice = 0;
        if (!string.IsNullOrEmpty(this.txt_minPrice.Value))
        {
            if (!int.TryParse(this.txt_minPrice.Value, out minPrice))
            {
                scripthelp.Alert("价格为正整数格式！", this.Page);
                return;
            }
        }
        if (!string.IsNullOrEmpty(this.txt_maxPrice.Value))
        {
            if (!int.TryParse(this.txt_maxPrice.Value, out maxPrice))
            {
                scripthelp.Alert("价格为正整数格式！", this.Page);
                return;
            }
        }

        if (minPrice > maxPrice)
        {
            scripthelp.Alert("最低价格小于最高价格！", this.Page);
            return;
        }

        int bookNum = int.Parse(this.selBookNum.Value);
        //记录session
        hs = new HotelSearch();
        hs.CityName = cityName;
        hs.HotelName = hotelName;
        hs.FromDate = fromDate;
        hs.ToDate = toDate;
        hs.MinPrice = minPrice;
        hs.MaxPrice = maxPrice;
        hs.BookNum = bookNum;
        Session[hs.SessionKey] = hs;

        Response.Redirect("hotellist_" + Server.UrlEncode(cityName) + ".htm");
    }

    protected void getRecommendTicket(int fromcityId, int toStateId, int num)
    {
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

        str += " and ischear=1 order by FY_Ticket.updateTime desc";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

        this.repRecomTicket.DataSource = dt;
        this.repRecomTicket.DataBind();
    }

    private void getHotelListByCity(string cityName, string hotelName, string fromDate, string toDate, int minPrice, int maxPrice, int bookNum)
    {
        string str = @"select top 5  * from FY_Hotel left join FY_HotelCity on FY_HotelCity.tId=FY_Hotel.cityId where 1=1";

        if (!string.IsNullOrEmpty(cityName))
        {
            str += " and FY_HotelCity.chName like '%" + cityName.Trim() + "%'";
        }

        if (!string.IsNullOrEmpty(hotelName))
        {
            str += " and HotelName like '%" + hotelName.Trim() + "%'";
        }

        if (!string.IsNullOrEmpty(fromDate) && !string.IsNullOrEmpty(toDate))
        {
            str += " and ((Convert(datetime,FY_Hotel.fromDate)<='" + fromDate + "' or FY_Hotel.fromDate='') and (Convert(datetime,FY_Hotel.toDate)>='" + toDate + "' or FY_Hotel.toDate='') )";
        }

        if (minPrice != 0 || maxPrice != 0)
        {
            str += " and '" + minPrice + "'<=Price and Price<='" + maxPrice + "'";
        }

        if (bookNum != 0)
        {
            str += " and (" + bookNum + "<=RoomNum or RoomNum ='')";
        }

        str += " order by hots desc";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

        this.repRecomHotel.DataSource = dt;
        this.repRecomHotel.DataBind();
    }

    protected DataRow getCityInfo(string chName)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select FY_HotelCity.*,FY_State.chName as stateName from FY_HotelCity left join FY_State on FY_HotelCity.sId =FY_State.sId  where FY_HotelCity.chName='"+chName+"'" ;

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

    /// <summary>
    /// 获取航空公司列表
    /// </summary>
    protected void GetShopNewslist(string cityName, string hotelName, string fromDate, string toDate, int minPrice, int maxPrice, int bookNum)
    {

        DataSet ds = new DataSet();


        string str = @"select top 100 percent * from FY_Hotel left join FY_HotelCity on FY_HotelCity.tId=FY_Hotel.cityId where 1=1 ";

        if (!string.IsNullOrEmpty(cityName))
        {
            str += " and FY_HotelCity.chName like '%" + cityName.Trim() + "%'";
        }

        if (!string.IsNullOrEmpty(hotelName))
        {
            str += " and HotelName like '%" + hotelName.Trim() + "%'";
        }

        if (!string.IsNullOrEmpty(fromDate) && !string.IsNullOrEmpty(toDate))
        {
            str += " and ((Convert(datetime,FY_Hotel.fromDate)<='" + fromDate + "' or FY_Hotel.fromDate='') and (Convert(datetime,FY_Hotel.toDate)>='" + toDate + "' or FY_Hotel.toDate='') )";
        }

        if (minPrice != 0 || maxPrice != 0)
        {
            str += " and '" +minPrice+"'<=Price and Price<='" +maxPrice+"'";
        }

        if (bookNum != 0)
        {
            str += " and (" + bookNum + "<=RoomNum or RoomNum ='')";
        }

        str += " order by hId desc";

        SqlParameter[] parameters = {
                    new SqlParameter("@sql", SqlDbType.NVarChar,4000),
                    new SqlParameter("@currentpage", SqlDbType.Int),
                    new SqlParameter("@pagesize", SqlDbType.Int)};

        parameters[0].Value = str;
        parameters[1].Value = Pager.CurrentPageIndex;
        parameters[2].Value = Pager.PageSize;


        ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);

        Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);

        Pager.CustomInfoHTML = "&nbsp;第" + Pager.CurrentPageIndex.ToString() + "页/共" + Pager.PageCount.ToString() + "页 总记录数：" + Pager.RecordCount.ToString();

        rptshopnews.DataSource = ds.Tables[1];

        rptshopnews.DataBind();

    }

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        GetShopNewslist(hs.CityName, hs.HotelName, hs.FromDate.ToShortDateString(), hs.ToDate.ToShortDateString(), hs.MinPrice, hs.MaxPrice, hs.BookNum);
    }
}
