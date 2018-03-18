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
using eap.share;
using Fei580.Model;

    public partial class international : System.Web.UI.Page
    {
        protected int csA_num = 1;
        protected Hashtable htCSA = new Hashtable();    //客服A 预订的数据,Key分别为数据 1,2,3,4,5,6,7,8
        protected int csB_num = 2;
        protected Hashtable htCSB = new Hashtable();    //客服B 预订的数据,Key分别为数据 1,2,3,4,5,6,7,8

        protected DataRowCollection picRecommendOne = null;
        protected DataRowCollection picRecommendTwo = null;
        protected DataRowCollection picRecommendThree = null;
        protected DataRowCollection recommendEveryday = null;

        protected DataRowCollection toAsia = null;
        protected DataRowCollection toEuro = null;
        protected DataRowCollection toNAmerica = null;
        protected DataRowCollection toOceania = null;
        protected DataRowCollection toAfrica = null;

        protected DataRowCollection recommendThree = null;
        protected DataRowCollection hotelList = null;       //

        protected void Page_Load(object sender, EventArgs e)
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
            picRecommendOne = getRecommendInfo("特价图片推荐1", 4);
            picRecommendTwo = getRecommendInfo("特价图片推荐2", 4);
            picRecommendThree = getRecommendInfo("特价图片推荐3", 4);

            recommendThree = getRecommendInfo("本周图片推荐", 6);
            hotelList = getHotelList("曼谷", 8);

            getCS_Num();    //取得客户编号（根据编号 1、2、3、4、5、6获取图片）
            htCSA = getCSDataA(8);     //取得客服A动态数据
            setCSInfoA();
            htCSB = getCSDataB(8);     //取得客服B动态数据
            setCSInfoB();

            getSearchingInfo(20);   //获取“大家正在查”

            toAsia = getRecommendTicket(0, 1, 24);
            toEuro = getRecommendTicket(0, 2, 24);
            toNAmerica = getRecommendTicket(0, 3, 24);
            toOceania = getRecommendTicket(0, 5, 24);
            toAfrica = getRecommendTicket(0, 6, 24);

            recommendEveryday = getRecommendTicket(0, 0, 8);



        }



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
            int cnt = 0;
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

        protected DataRowCollection getRecommendInfo(string rType, int num)
        {
            DataRowCollection Rerow = null;

            string str = @"select top " + num + "  * from FY_Recommend where rType='" + rType + "' order by rId desc";
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


        protected DataRowCollection getRecommendTicket(int fromcityId, int toStateId, int num)
        {
            DataRowCollection Rerow = null;

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



            str += " and isRecom=1 order by FY_Ticket.updateTime desc";

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

        //protected void IDS_Search(object sender, EventArgs e)
        //{
        //    Response.Redirect("IDS.aspx?fromcity=" + fromcityStr.Value.Trim() + "&tocity=" + ids_tocity.Value.Trim() + "&year=" + DateTime.Now.Year.ToString() + "");

        //    //DataSet ds = null;
        //    //string str = "select FY_IDS.*,FY_FromCity.chName as fromCityname,FY_FromCity.cityCode as fromCityCode, FY_ToCity.chName as toCityname,FY_ToCity.cityCode as toCityCode from FY_IDS left join FY_FromCity on FY_FromCity.fId=FY_IDS.fromId left join FY_ToCity on FY_ToCity.tId=FY_IDS.toId  where FY_FromCity.chName='" + fromcityStr.Value.Trim() +"'  and FY_ToCity.chName='" + ids_tocity.Value.Trim() + "'";

        //    //try
        //    //{
        //    //    ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        //    //    if (ds != null && ds.Tables[0].Rows.Count != 0)
        //    //    {
        //    //        Response.Redirect("IDS.aspx?fromcity=" + fromcityStr.Value.Trim() + "&tocity=" + ids_tocity.Value.Trim());
        //    //    }
        //    //    else
        //    //    {
        //    //        scripthelp.Alert("sorry,暂无此航线的IDS服务提供！!", this.Page);
        //    //        return;
        //    //    }

        //    //}
        //    //catch (Exception err)
        //    //{
        //    //    HttpContext.Current.Response.Write(err.Message);
        //    //    HttpContext.Current.Response.End();
        //    //}      
        //}
    }

