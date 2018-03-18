using System;
using System.Collections;
using System.Data;
using System.Text;
using System.Web;
using eap.share;
using Fei580.Model;

public partial class index : System.Web.UI.Page
{
    #region 客服
    protected int csA_num = 1;
    protected Hashtable htCSA = new Hashtable();    //客服A 预订的数据,Key分别为数据 1,2,3,4,5,6,7,8
    protected int csB_num = 2;
    protected Hashtable htCSB = new Hashtable();    //客服B 预订的数据,Key分别为数据 1,2,3,4,5,6,7,8
    #endregion

    #region 推荐
    protected DataRowCollection recommendOne = null;
    protected DataRowCollection recommendTwo1 = null;
    protected DataRowCollection recommendTwo2 = null;
    protected DataRowCollection recommendTwo3 = null;
    protected DataRowCollection recommendTwo4 = null;
    protected DataRowCollection recommendThree = null;
    protected DataRowCollection recommendFour = null;
    protected DataRowCollection recommendFive = null;
    #endregion

    #region 获取数据列表
    protected DataRowCollection focuNews = null;
    protected DataRowCollection gzToAsia = null;
    protected DataRowCollection gzToEuro = null;
    protected DataRowCollection gzToNAmerica = null;
    protected DataRowCollection gzToOceania = null;

    protected DataRowCollection hkToAsia = null;
    protected DataRowCollection hkToEuro = null;
    protected DataRowCollection hkToNAmerica = null;
    protected DataRowCollection hkToOceania = null;

    protected DataRowCollection hotelList = null;
    protected DataRowCollection travelNewsList = null;

    protected DataRowCollection clickOrder = null;
    #endregion

    protected Server server1 = null;
    protected Server server2 = null;
    protected Server server3 = null;

    protected void btnDownloadTicket_Click(object sender, EventArgs e)
    {
        Response.Clear();
        //Response.Redirect("/newstar/Manager.aspx", false);

        HttpContext.Current.Response.Redirect("person/myticketDownLoad.aspx?ticketId=" + eticket.Value);
    }

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string commandText3 = "select * from FY_FromCity";
            DataSet ds1 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText3);
            if (ds1 != null)
            {
                string html = "";
                html += "<cite><input name=\"fromCityHidden\" type=\"text\" class=\"fromcity\" id=\"fromCityHidden\" value=\"广州\" /></cite>";
                html += "<ul>";
                foreach (DataRow dr in ds1.Tables[0].Rows)
                {
                    html += "<li><a onclick=\"clickFromCity(" + dr["fid"].ToString() + ",'" + dr["chName"].ToString() + "');\">" + dr["chName"].ToString() + "</a></li>";
                }
                html += "</ul>";
                divselect.InnerHtml = html;
            }

            fromtripDate.Value = (DateTime.Now.AddDays(1)).ToString("yyyy-MM-dd");
            backtripDate.Value = (DateTime.Now.AddDays(30)).ToString("yyyy-MM-dd");
        }
        recommendOne = getRecommendInfo("今期特价推荐", 8);
        recommendTwo1 = getRecommendInfo("随便看看", 8);
        recommendTwo2 = getRecommendInfo("行程未定", 8);
        recommendTwo3 = getRecommendInfo("价格比较", 8);
        recommendTwo4 = getRecommendInfo("等待签证", 8);

        recommendThree = getRecommendInfo("本周图片推荐", 6);
        recommendFour = getRecommendInfo("精选图片推", 3);
        recommendFive = getRecommendInfo("向你推荐", 5);

        getCS_Num();    //取得客户编号（根据编号 1、2、3、4、5、6获取图片）
        htCSA = getCSDataA(8);     //取得客服A动态数据
        setCSInfoA();
        htCSB = getCSDataB(8);     //取得客服B动态数据
        setCSInfoB();

        getSearchingInfo(20);   //获取“大家正在查”

        focuNews = getNewsByType(0, 1, 0, 5);
        gzToAsia = getRecommendTicket(1, 1, 6);
        gzToEuro = getRecommendTicket(1, 2, 6);
        gzToNAmerica = getRecommendTicket(1, 3, 6);
        gzToOceania = getRecommendTicket(1, 5, 6);
        hkToAsia = getRecommendTicket(4, 1, 6);
        hkToEuro = getRecommendTicket(4, 2, 6);
        hkToNAmerica = getRecommendTicket(4, 3, 6);
        hkToOceania = getRecommendTicket(4, 5, 6);

        hotelList = getHotelList("曼谷", 8);

        travelNewsList = getTravelNews(9);

        clickOrder = getQuanByType(0, 1, 9, " order by addtime desc ");

        server1 = getServer(1);
        server2 = getServer(2);
        server3 = getServer(3);
    }

    ////取"大家正在查"数据
    //protected DataRowCollection getSearchingInfo(int num)
    //{
    //    Random rd = new Random();

    //    string ret = "[";
    //    DataRowCollection Rerow = null;

    //    string str = @"select top " + num + "  A.*,B.* ";
    //    str +=" from FY_Searching as A left outer join FY_CityMap as B on A.toCity = B.cityName order by NEWID()";
    //    try
    //    {
    //        Rerow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
    //    }
    //    catch (Exception err)
    //    {
    //        HttpContext.Current.Response.Write(err.Message);
    //        HttpContext.Current.Response.End();
    //    }
    //    int cnt = Rerow.Count;
    //    for (int i = 0; i < cnt; i++)
    //    {
    //        DateTime flyDate = DateTime.Now.AddDays(rd.Next(0,8));
    //        string flyDateStr = flyDate.Month + "月" + flyDate.Day + "日";
    //        if (i == 0)
    //        {
    //            ret += "{";
    //            //第一个，就直接作为首次展示的结果
    //            txtSearchingPrice.InnerHtml = Rerow[i]["price"].ToString();
    //            txtSearchingFlyDate.InnerHtml = flyDateStr;

    //        }
    //        else
    //        {
    //            ret += ",{";
    //        }
    //        ret += "'lineType':'" + Rerow[i]["lineType"] + "'";
    //        ret += ",'flyDate':'" + flyDateStr + "'";
    //        ret += ",'fromCity':'" + Rerow[i]["fromCity"] + "'";
    //        ret += ",'toCity':'" + Rerow[i]["toCity"] + "'";
    //        ret += ",'toward':'" + Rerow[i]["toward"] + "'";
    //        ret += ",'airline':'" + Rerow[i]["airline"] + "'";
    //        ret += ",'price':'" + Rerow[i]["price"] + "'";
    //        ret += ",'top':'" + Rerow[i]["positionTop"] + "'";
    //        ret += ",'left':'" + Rerow[i]["positionLeft"] + "'";
    //        ret += ",'topB':'" + Rerow[i]["positionTopB"] + "'";
    //        ret += ",'leftB':'" + Rerow[i]["positionLeftB"] + "'";
    //        ret += "}";
    //    }
    //    ret += "]";

    //    txtSearching.Value = ret;

    //    return Rerow;
    //}

    #region "取得大家正在查数据"
    protected void getSearchingInfo(int num)
    {
        FlySearchingRadom.CheckDataA(num);  //重新检查缓存数据

        string ret = "[";
        int cnt = 0;
        foreach (DictionaryEntry item in FlySearchingRadom.htDataA)
        {
            FlySearchingInfo fs = (FlySearchingInfo)FlySearchingRadom.htDataA[item.Key];
            if (cnt == 0)
            {
                ret += "{";
            }
            else
            {
                ret += ",{";
            }
            ret += "'flyDate':'" + fs.FlyDate.ToString("yyyy-MM-dd") + "'";
            ret += ",'flyDateBack':'" + fs.FlyDate.AddDays(7).ToString("yyyy-MM-dd") + "'";
            ret += ",'flyDateShow':'" + fs.FlyDateShow + "'";
            ret += ",'fromCityId':'" + fs.CityFromId + "'";
            ret += ",'fromCity':'" + fs.CityFrom + "'";
            ret += ",'toCityId':'" + fs.CityToId + "'";
            ret += ",'toCity':'" + fs.CityTo + "'";
            ret += ",'toward':'" + fs.LineType + "'";
            ret += ",'airline':'" + fs.AirLine + "'";
            ret += ",'price':'" + fs.Price + "'";
            ret += ",'top':'" + fs.PositionTop + "'";
            ret += ",'left':'" + fs.PositionLeft + "'";
            ret += ",'priceTop':'" + fs.PriceTop + "'";
            ret += ",'priceLeft':'" + fs.PriceLeft + "'";
            ret += ",'priceDirect':'" + fs.PriceDirect + "'";
            ret += ",'topB':'" + fs.PositionTopB + "'";
            ret += ",'leftB':'" + fs.PositionLeftB + "'";
            ret += ",'priceTopB':'" + fs.PriceTopB + "'";
            ret += ",'priceLeftB':'" + fs.PriceLeftB + "'";
            ret += ",'priceDirectB':'" + fs.PriceDirectB + "'";
            ret += "}";

            cnt += 1;
        }
        ret += "]";
        txtSearching.Value = ret;
    }

    #endregion

    #region "动态客服设置"
    //设置动态客服A
    public void setCSInfoA()
    {
        StringBuilder sbHtml = new StringBuilder("");
        int cnt = 0;
        foreach (DictionaryEntry item in htCSA)
        {
            CSBookInfo csb = (CSBookInfo)htCSA[item.Key];
            //sbHtml.Append("<li><span class=\"ddt\" id=\"csA_BookTime\">" + csb.BookTimeDesc + "</span> 我为 <span class=\"ddlk\">旅客</span> <span class=\"ddlk\" id=\"csA_CustomerNum\"> " + csb.CustomerNumber.ToString() + "</span> 预订了 <span class=\"ddfm\" id=\"csA_CityFrom\">" + csb.CityFrom + "</span> 至 <span class=\"ddfm\" id=\"csA_CityTo\">" + csb.CityTo + "</span>的机票与酒店</li>");

            //因hashtable是栈存储，后入先出。原先后入的都是时间离当前最长的，所以最新时间的Key都在最后，应在前端插入html，而不要在尾部append
            sbHtml.Insert(0, "<li><span class=\"ddt\" id=\"csA_BookTime\">" + csb.BookTimeDesc + "</span> 我为 <span class=\"ddlk\">旅客</span> <span class=\"ddlk\" id=\"csA_CustomerNum\"> " + csb.CustomerNumber.ToString() + "</span> 预订了 <span class=\"ddfm\" id=\"csA_CityFrom\">" + csb.CityFrom + "</span> 至 <span class=\"ddfm\" id=\"csA_CityTo\">" + csb.CityTo + "</span>的机票与酒店</li>");
        }
        sbHtml.Insert(0, "<ul>");
        sbHtml.Append("</ul>");
        divKFA.InnerHtml = sbHtml.ToString();

        //csDataA.Value = json;
    }

    //设置动态客服B
    public void setCSInfoB()
    {
        StringBuilder sbHtml = new StringBuilder("");
        int cnt = 1;
        foreach (DictionaryEntry item in htCSB)
        {
            CSBookInfo csb = (CSBookInfo)htCSB[item.Key];
            //sbHtml.Append("<li><span class=\"ddt\" id=\"csB_BookTime\">" + csb.BookTimeDesc + "</span> 我为 <span class=\"ddlk\">旅客</span> <span class=\"ddlk\" id=\"csB_CustomerNum\"> " + csb.CustomerNumber.ToString() + "</span> 预订了 <span class=\"ddfm\" id=\"csB_CityFrom\">" + csb.CityFrom + "</span> 至 <span class=\"ddfm\" id=\"csB_CityTo\">" + csb.CityTo + "</span>的机票与酒店</li>");

            //因hashtable是栈存储，后入先出。原先后入的都是时间离当前最长的，所以最新时间的Key都在最后，应在前端插入html，而不要在尾部append
            sbHtml.Insert(0, "<li><span class=\"ddt\" id=\"csB_BookTime\">" + csb.BookTimeDesc + "</span> 我为 <span class=\"ddlk\">旅客</span> <span class=\"ddlk\" id=\"csB_CustomerNum\"> " + csb.CustomerNumber.ToString() + "</span> 预订了 <span class=\"ddfm\" id=\"csB_CityFrom\">" + csb.CityFrom + "</span> 至 <span class=\"ddfm\" id=\"csB_CityTo\">" + csb.CityTo + "</span>的机票与酒店</li>");

        }
        sbHtml.Insert(0, "<ul>");
        sbHtml.Append("</ul>");
        divKFB.InnerHtml = sbHtml.ToString();
    }

    public void getCS_Num()
    {
        DateTime nowTime = DateTime.Now;
        int a = nowTime.Day % 6;
        if (a != 0)
        {
            csA_num = a;
            csB_num = a + 1;
        }
        else
        {
            csA_num = 6;
            csB_num = 1;
        }
    }

    //取得动态客服A数据（预订成功数据）
    protected Hashtable getCSDataA(int count)
    {
        CSRadom.CheckDataA(count);
        return CSRadom.htDataA;
    }

    //取得动态客服B数据（预订成功数据）
    protected Hashtable getCSDataB(int count)
    {
        CSRadom.CheckDataB(count);
        return CSRadom.htDataB;
    }

    #endregion

    protected DataRowCollection getRecommendTicket(int fromcityId, int toStateId, int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + " FY_Ticket.*,FY_FromCity.chName as fromCityname,FY_ToCity.chName as toCityname,FY_Airline.chName as airname, FY_Airline.smallPic as smallPic from FY_Ticket WITH (NOLOCK) ";
        str += " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity";
        str += " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity";
        str += " left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine";
        str += " where 1=1  ";
        if (fromcityId != 0)
            str += " and (FY_FromCity.fId=" + fromcityId + ")";


        if (toStateId != 0)
            str += " and (FY_Ticket.stateId =" + toStateId + ")";
        str += " and ischear=1 order by FY_Ticket.updateTime desc";

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

    protected DataRowCollection getRecommendInfo(string rType, int num)
    {
        DataRowCollection Rerow = null;
        string str = @"select top " + num + "  * from FY_Recommend WITH (NOLOCK) where rType='" + rType + "' order by rId desc";
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
        string str = @"select top " + num + "  * from FY_news where type in (1,2,3,4,5)  order by id desc";
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

    protected DataRowCollection getNewsByType(int type, int istop, int isRecom, int num)
    {
        DataRowCollection Newsrow = null;
        string str = @"select top " + num + "  * from FY_news where 1=1";
        if (type != 0)
            str = str + " and type=" + type;
        if (istop != 0)
            str = str + " and isTop=1 and newsPic is not null";
        if (isRecom != 0)
            str = str + " and isRecom=1";
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
        string str = @"select top " + num + "  * from FY_HotelRec where cityName='" + cityName + "' and position <> '' order by hId desc";
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

    protected DataRowCollection getBbstopic(int num)
    {
        DataRowCollection Rerow = null;
        string str = @"select top " + num + "  * from dnt_topics order by tId desc";
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

    protected DataRowCollection getQuanByType(int type, int isRecom, int num, string orderFiled)
    {
        DataRowCollection quanrow = null;
        string str = @"select top " + num + "  * from FY_member_article left join tmember on FY_member_article.publishName=tmember.Mem_LoginName where 1=1 and isCheck=1";
        if (type != 0)
            str += (" and typeId=" + type);

        if (isRecom != 0)
            str += " and isRec=1";

        if (!string.IsNullOrEmpty(orderFiled))
            str += orderFiled;
        else
            str += " order by aId desc";
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