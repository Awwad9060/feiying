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

public partial class Hotel : System.Web.UI.Page
{
    protected DataRowCollection focuNews = null;
    protected DataRowCollection hotelList = null;
    protected DataRowCollection travelNewsList = null;
    protected DataRowCollection clickOrder = null;

    protected DataRowCollection recomhotel = null;
    protected DataRowCollection istophotel = null;

    protected Server server1 = null;
    protected Server server2 = null;
    protected Server server3 = null;

    protected void Page_Load(object sender, EventArgs e)
    {

        if (!IsPostBack)
        {
            HotelSearch hs = (HotelSearch)Session[new HotelSearch().SessionKey];
            if (hs != null)
            {
                this.tocityName.Value = hs.CityName;
                this.txt_fromDate.Value = hs.FromDate.ToString("yyyy-MM-dd");
                this.txt_toDate.Value = hs.ToDate.ToString("yyyy-MM-dd");
            }
            else
            {
                this.tocityName.Value = "纽约";
                this.txt_fromDate.Value = (DateTime.Now.AddDays(5)).ToString("yyyy-MM-dd");
                this.txt_toDate.Value = (DateTime.Now.AddDays(6)).ToString("yyyy-MM-dd");
            }
        }

        //特推酒店
        recomhotel=getRomHotellist(13, 0, 1, 1);
        istophotel = getRomHotellist(24, 1, 0, 0);

        focuNews = getNewsByType(7, 0, 0, 5);
        hotelList = getHotelList("曼谷", 8);
        travelNewsList = getTravelNews(9);
        clickOrder = getQuanByType(0, 1, 9, " order by addtime asc ");

        server1 = getServer(1);
        server2 = getServer(2);
        server3 = getServer(3);
    }


    protected DataRowCollection getRomHotellist(int count,int istop,int recom,int guoneiwai)
    {
        DataRowCollection dr = null;

        string str = @"select top " + count + "  * from FY_Hotel";
        str = str + " left join FY_HotelCity on FY_HotelCity.tId=FY_Hotel.cityId  where 1=1";

        if (istop != 0)
        {
            str = str + " and isTop=1 ";
        }
        if (recom != 0)
        {
            str = str + " and isRecom=1";
        }

        if (guoneiwai != 0)
        {
            str = str + " and FY_HotelCity.sId=" + guoneiwai;
        }

        str = str + " order by hId desc";

        try
        {
            dr = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return dr;
    }


    protected void btnSearch_Click(object sender, EventArgs e)
    {
        string cityName = this.tocityName.Value;
        if (string.IsNullOrEmpty(cityName))
        {
            scripthelp.Alert("请选择目的地城市！",this.Page);
            return;
        }
        string hotelName = this.txt_hotelName.Value;

        DateTime fromDate;
        DateTime toDate;
        if(string.IsNullOrEmpty(this.txt_fromDate.Value))
        {
            scripthelp.Alert("请选择入住日期！",this.Page);
            return;
        }
        if (!DateTime.TryParse(this.txt_fromDate.Value,out fromDate))
        {
            scripthelp.Alert("请选择正确的入住日期！", this.Page);
            return;
        }
        if(string.IsNullOrEmpty(this.txt_toDate.Value))
        {
            scripthelp.Alert("请选择退房日期！",this.Page);
            return;
        }
        if (!DateTime.TryParse(this.txt_toDate.Value,out toDate))
        {
            scripthelp.Alert("请选择正确的退房日期！", this.Page);
            return;
        }
        if (DateTime.Compare(DateTime.Now,fromDate) > -1)
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
        if(!string.IsNullOrEmpty(this.txt_minPrice.Value))
        {
            if(!int.TryParse(this.txt_minPrice.Value,out minPrice))
            {
                scripthelp.Alert("价格为正整数格式！", this.Page);
                return;
            }
        }
        if(!string.IsNullOrEmpty(this.txt_maxPrice.Value))
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
        HotelSearch hs = new HotelSearch();
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

    protected DataRowCollection getNewsByType(int type, int istop, int isRecom, int num)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top " + num + "  * from FY_news where 1=1";
        if (type != 0)
        {
            str = str + " and type=" + type;
        }

        if (istop != 0)
        {
            str = str + " and isTop=1 and newsPic is not null";
        }
        if (isRecom != 0)
        {
            str = str + " and isRecom=1";
        }
        str = str + " order by id desc";
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

    protected DataRowCollection getHotelList(string cityName, int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from FY_HotelRec where cityName='" + cityName + "' order by hId desc";
        try
        {
            Rerow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return Rerow;

    }

    protected DataRowCollection getTravelNews(int num)
    {
        DataRowCollection Newsrow = null;

        string str = @"select top " + num + "  * from FY_news where type in (1,2,3,4,5)";

        str = str + " order by id desc";
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

    protected DataRowCollection getQuanByType(int type, int isRecom, int num, string orderFiled)
    {
        DataRowCollection quanrow = null;

        string str = @"select top " + num + "  * from FY_member_article left join tmember on FY_member_article.publishName=tmember.Mem_LoginName where 1=1 and isCheck=1";
        if (type != 0)
        {
            str = str + " and typeId=" + type;
        }

        if (isRecom != 0)
        {
            str = str + " and isRec=1";
        }

        if (orderFiled != "")
        {
            str = str + orderFiled;
        }
        else
        {

            str = str + " order by aId desc";
        }

        try
        {
            quanrow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return quanrow;
    }

    protected Server getServer(int id)
    {
        string str = "select * from FY_server where id=" + id;

        Server ser = new Server();
        try
        {
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds == null)
                return null;
            DataRow dr = ds.Tables[0].Rows[0];
            ser.Name = dr["name"].ToString().Trim();
            ser.Title = dr["title"].ToString().Trim();
            ser.Pic = dr["pic"].ToString().Trim();
            ser.Link = dr["link"].ToString().Trim();
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return ser;
    }
}
