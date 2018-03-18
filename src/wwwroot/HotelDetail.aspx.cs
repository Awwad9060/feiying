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

public partial class HotelDetail : System.Web.UI.Page
{
    public DataRow hotelOne = null;
    protected HotelSearch hs = null;
    protected int id=0, RanNum = 25;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["hid"] == null)
        {
            Response.Redirect("Hotel.aspx");
            return;
        }

        id = Convert.ToInt32(Request.QueryString["hid"]);
        hotelOne = GetHotelDetail(id);

        DataTable dt = new DataTable();
        dt.Columns.Add("Pic");
        dt.Columns.Add("Name");

        if (!string.IsNullOrEmpty(hotelOne["pic2"].ToString()))
            dt.Rows.Add(hotelOne["pic2"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic3"].ToString()))
            dt.Rows.Add(hotelOne["pic3"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic4"].ToString()))
            dt.Rows.Add(hotelOne["pic4"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic5"].ToString()))
            dt.Rows.Add(hotelOne["pic5"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic6"].ToString()))
            dt.Rows.Add(hotelOne["pic6"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic7"].ToString()))
            dt.Rows.Add(hotelOne["pic7"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic8"].ToString()))
            dt.Rows.Add(hotelOne["pic8"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic9"].ToString()))
            dt.Rows.Add(hotelOne["pic9"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic10"].ToString()))
            dt.Rows.Add(hotelOne["pic10"].ToString(), hotelOne["HotelName"]);
        if (!string.IsNullOrEmpty(hotelOne["pic11"].ToString()))
            dt.Rows.Add(hotelOne["pic11"].ToString(), hotelOne["HotelName"]);
        this.repHotelPic.DataSource = dt;
        this.repHotelPic.DataBind();


        ReReadHotel(hotelOne);

        getHotelListByCity(Convert.ToInt32(hotelOne["cityId"]));

        getRecommendTicket(0, Convert.ToInt32(hotelOne["sId"]), 10);

        bindComment(id);

        string str = "update FY_Hotel set hots=hots+1 where hId="+id;

        SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        //读取cookie
        HttpCookie hc = Request.Cookies["HotelRandom" + id];
        if (hc != null)
            RanNum = int.Parse(hc.Values["Num"]);
        else
        {
            //记录cookie
            RanNum = new Random().Next(25, 300);
            HttpCookie hci = new HttpCookie("HotelRandom" + id);
            hci.Values["Num"] = RanNum.ToString();
            hci.Expires = DateTime.Now.AddDays(3);
            Response.Cookies.Add(hci);
        }

        if (hotelOne == null)
        {
            scripthelp.AlertAndRedirect("无法找到该酒店！", "Hotel.aspx", this.Page);
            return;
        }

        hs = (HotelSearch)Session[new HotelSearch().SessionKey];
        if (hs == null || hs.CityName != hotelOne["chName"].ToString())
        {
            hs = new HotelSearch();
            hs.CityName = hotelOne["chName"].ToString();
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
            this.sel_bookroomnum.Value = hs.BookNum.ToString();
            this.sel_bookpesonnum.Value = "1";
            this.txt_bookfromdate.Value = hs.FromDate.ToString("yyyy-MM-dd");
            this.txt_booktodate.Value = hs.ToDate.ToString("yyyy-MM-dd");
        }
        this.Page.Title = hotelOne["HotelName"] + "-特价酒店-飞瀛网";


        if (!IsPostBack)
        {
            for(int i=0;i<5;i++)
            {
                this.sel_year.Items.Insert(i, 
                    new ListItem((DateTime.Now.Year + i).ToString(), (DateTime.Now.Year + i).ToString())
                    );
            }

            this.radtype0.Checked = true;
        }
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


    private void getHotelListByCity(int CityId)
    {
        string str = "select top 5 * from FY_Hotel where cityId=" + CityId + " and isRecom=1 order by hId desc";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select,CommandType.Text,str).Tables[0];

        this.repRecomHotel.DataSource = dt;
        this.repRecomHotel.DataBind();
    }

    private void ReReadHotel(DataRow dr)
    {
        //记录/获取用户最近浏览过的酒店
        string hId = string.Empty;
        string HotelName = string.Empty;
        string Price = string.Empty;
        string rate = string.Empty;
        string picPath = string.Empty;

        if (Request.Cookies["CookieHotelRecently_fei580"] != null)
        {
            HttpCookie getCookie = Request.Cookies["CookieHotelRecently_fei580"];
            hId = getCookie.Values["hId"].Replace(dr["hId"].ToString().Trim() + ",", "");
            HotelName = HttpUtility.UrlDecode(getCookie.Values["HotelName"]).Replace(dr["HotelName"].ToString().Trim() + ",", ""); 
            Price = getCookie.Values["Price"].Replace(dr["Price"].ToString().Trim() + ",", "");
            rate = getCookie.Values["rate"].Replace(dr["rate"].ToString().Trim() + ",", "");
            picPath = getCookie.Values["picPath"].Replace(dr["picPath"].ToString().Trim() + ",", "");

            DataTable cookieHotelRecently = new DataTable();
            cookieHotelRecently.Columns.Add("hId", typeof(string));
            cookieHotelRecently.Columns.Add("HotelName", typeof(string));
            cookieHotelRecently.Columns.Add("Price", typeof(string));
            cookieHotelRecently.Columns.Add("rate", typeof(string));
            cookieHotelRecently.Columns.Add("picPath", typeof(string));
            string[] hIda = hId.Split(',');
            string[] HotelNamea = HotelName.Split(',');
            string[] Pricea = Price.Split(',');
            string[] ratea = rate.Split(',');
            string[] picPatha = picPath.Split(',');
            for (int i = 0; i < hIda.Length&&i<4; i++)
            {
                if (string.IsNullOrEmpty(hIda[i]))
                    continue;
                cookieHotelRecently.Rows.Add(hIda[i], HotelNamea[i], Pricea[i], ratea[i], picPath[i]);
            }
            this.rptCookieHotel.DataSource = cookieHotelRecently;
            this.rptCookieHotel.DataBind();
        }
        HttpCookie setCookie = new HttpCookie("CookieHotelRecently");
        setCookie.Values["hId"] = dr["hId"].ToString().Trim() + "," + hId;
        setCookie.Values["HotelName"] = HttpUtility.UrlEncode(dr["HotelName"].ToString().Trim() + "," + HotelName);
        setCookie.Values["Price"] = dr["Price"].ToString().Trim() + "," + Price;
        setCookie.Values["rate"] = dr["rate"].ToString().Trim() + "," + rate;
        setCookie.Values["picPath"] = dr["picPath"].ToString().Trim() + "," + picPath;
        HttpContext.Current.Response.Cookies.Add(setCookie);
    }

    private void bindHotelPic(string Pic,string Name,int hId)
    {
        DataTable dt = new DataTable();
        dt.Columns.Add("Pic");
        dt.Columns.Add("Name");
        dt.Rows.Add(Pic, Name);

        string str = "select * from FY_Hotel_Pic where hotelId=" + hId;
        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnString_select, CommandType.Text, str);
        while (dr.Read())
        {
            if (!string.IsNullOrEmpty(dr["pic1"].ToString()))
                dt.Rows.Add(dr["pic1"].ToString(), dr["hotel1"]);
            if (!string.IsNullOrEmpty(dr["pic2"].ToString()))
                dt.Rows.Add(dr["pic2"].ToString(), dr["hotel2"]);
            if (!string.IsNullOrEmpty(dr["pic3"].ToString()))
                dt.Rows.Add(dr["pic3"].ToString(), dr["hotel3"]);
            if (!string.IsNullOrEmpty(dr["pic4"].ToString()))
                dt.Rows.Add(dr["pic4"].ToString(), dr["hotel4"]);
            if (!string.IsNullOrEmpty(dr["pic5"].ToString()))
                dt.Rows.Add(dr["pic5"].ToString(), dr["hotel5"]);
            if (!string.IsNullOrEmpty(dr["pic6"].ToString()))
                dt.Rows.Add(dr["pic6"].ToString(), dr["hotel6"]);
            if (!string.IsNullOrEmpty(dr["pic7"].ToString()))
                dt.Rows.Add(dr["pic7"].ToString(), dr["hotel7"]);
            if (!string.IsNullOrEmpty(dr["pic8"].ToString()))
                dt.Rows.Add(dr["pic8"].ToString(), dr["hotel8"]);
            if (!string.IsNullOrEmpty(dr["pic9"].ToString()))
                dt.Rows.Add(dr["pic9"].ToString(), dr["hotel9"]);
        }

        this.repHotelPic.DataSource = dt;
        this.repHotelPic.DataBind();
    }

    protected DataRow GetHotelDetail(int aid)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select FY_Hotel.*,FY_HotelCity.chName,FY_State.sId,FY_State.chName as stateName from FY_Hotel left join FY_HotelCity on FY_HotelCity.tId =cityId left join FY_State on FY_HotelCity.sId =FY_State.sId  where hId=" + aid;

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

    protected void bindComment(int hId)
    {
        DataSet ds = new DataSet();


        string str = @"select top 100 percent FY_Hotel_comment.*,(case when tmember.mem_type is null then '飞瀛使者' else tmember.mem_type end) as mem_type,(case when memberId<>0 then tmember.Mem_LoginName else '飞瀛使者' end ) as loginname  from FY_Hotel_comment left join tmember on FY_Hotel_comment.memberId=tmember.Mem_ID   where hId=" + hId;

        str += " order by addtime desc";


        SqlParameter[] parameters = {
                    new SqlParameter("@sql", SqlDbType.NVarChar,4000),
                    new SqlParameter("@currentpage", SqlDbType.Int),
                    new SqlParameter("@pagesize", SqlDbType.Int)};

        parameters[0].Value = str;
        parameters[1].Value = this.Pager.CurrentPageIndex;
        parameters[2].Value = this.Pager.PageSize;


        ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);

        this.Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);

        this.Pager.CustomInfoHTML = "&nbsp;第" + Pager.CurrentPageIndex.ToString() + "页/共" + Pager.PageCount.ToString() + "页 总记录数：" + Pager.RecordCount.ToString();

        this.repComent.DataSource = ds.Tables[1];

        this.repComent.DataBind();
    }


    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        bindComment(id);
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

    protected void but_submit_Click(object sender, EventArgs e)
    {
        int hId = id;
        int type = 0;
        if (this.radtype1.Checked)
            type = 1;
        int year = int.Parse(this.sel_year.Value);
        int mouth = int.Parse(this.sel_mouth.Value);

        string tel = this.txt_tel.Value;
        string name = string.Empty;
        string comtcontent = this.txt_comment.Value;

        if (string.IsNullOrEmpty(tel))
        {
            scripthelp.Alert("用户电话不为空！", this.Page);
            return;
        }

        if (string.IsNullOrEmpty(comtcontent) || comtcontent.Length > 500)
        {
            scripthelp.Alert(" 评论内容不为空，且字数不大于500字符！", this.Page);
            return;
        }

        int memberId;

        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null)
        {
            scripthelp.Alert("请先登录后发表评论！", this.Page);
            return;
        }
        else
        {
            memberId = int.Parse(Session["Mem_ID"].ToString());
            name = Session["Mem_LoginName"].ToString();
        }

        string str = "insert into FY_Hotel_comment(hId,type,year,mouth,tel,name,comtcontent,memberId) values ('" + hId + "','" + type + "','" + year + "','" + mouth + "','" + tel + "','" + name + "','" + comtcontent + "','" + memberId + "')";

        int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (count > 0)
        {
            scripthelp.AlertAndRedirect("评论成功！", "hotelinfo_"+id+".htm", this.Page);
            return;
        }
        else
        {
            scripthelp.Alert("评论失败！", this.Page);
        }
    }


    protected void butbook_Click(object sender, ImageClickEventArgs e)
    {
        int memberId = 0;
        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null)
        {
            //scripthelp.Alert("请先登录后进行预定！", this.Page);
            //return;
        }
        else
            memberId = int.Parse(Session["Mem_ID"].ToString());

        int roomNum = int.Parse(this.sel_bookroomnum.Value);
        int personNum = int.Parse(this.sel_bookpesonnum.Value);

        DateTime fromDate;
        DateTime toDate;
        if (string.IsNullOrEmpty(this.txt_bookfromdate.Value))
        {
            scripthelp.Alert("请选择入住日期！", this.Page);
            return;
        }
        if (!DateTime.TryParse(this.txt_bookfromdate.Value, out fromDate))
        {
            scripthelp.Alert("请选择正确的入住日期！", this.Page);
            return;
        }
        if (string.IsNullOrEmpty(this.txt_booktodate.Value))
        {
            scripthelp.Alert("请选择退房日期！", this.Page);
            return;
        }
        if (!DateTime.TryParse(this.txt_booktodate.Value, out toDate))
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

        string booktel = this.txt_booktel.Value;
        if (string.IsNullOrEmpty(booktel))
        {
            scripthelp.Alert("请输入联系电话！", this.Page);
            return;
        }
        string bookinfo = this.text_bookinfo.Value;

        if (bookinfo.Length > 500)
        {
            scripthelp.Alert("附加说明长度不超500字符！", this.Page);
            return;
        }

        string str = "insert into FY_HotelBook(hId,memberId,Price,fromDate,toDate,roomNum,personNum,booktel,bookinfo) values (" + id + "," + memberId + ",'" + hotelOne["Price"] + "','" + fromDate + "','" + toDate + "'," + roomNum + "," + personNum + ",'" + booktel + "','" + bookinfo + "')";

        int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (count > 0)
        {
            scripthelp.Alert("预定成功，我们的客服将尽快与你联系确认！", this.Page);
            return;
        }
        else
            scripthelp.Alert("预定失败，请联系客服！", this.Page);
    }
}
