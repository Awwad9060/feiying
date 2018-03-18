using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Text;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;


public partial class cms_ticket_ticket_add : System.Web.UI.Page
{

    static int id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];

        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }

        if (!IsPostBack)
        {
            //出发城市设置
            {
                //绑定出发城市 
                string commandText3 = "select * from FY_FromCity";
                DataSet ds3 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText3);
                if (ds3 != null)
                {
                    fromCity.DataSource = ds3;
                    fromCity.DataTextField = "chName";
                    fromCity.DataValueField = "fid";
                    fromCity.DataBind();
                }
            }
           
         
            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string str = "select * from FY_Ticket where tId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                title.Value = ds.Tables[0].Rows[0]["title"].ToString();
                fromCity.Value = ds.Tables[0].Rows[0]["fromCity"].ToString();
                //if (Convert.ToInt32(ds.Tables[0].Rows[0]["tripType"].ToString()) == 1)
                //{
                //    tripType1.Checked = false;
                //    tripType2.Checked = true;
                //}
                //else
                //{
                //    tripType1.Checked = true;
                //    tripType2.Checked = false;
                //}


  
                bagPrice.Value = ds.Tables[0].Rows[0]["bagPrice"].ToString();

                if (Convert.ToInt32(ds.Tables[0].Rows[0]["returnTip"].ToString()) == 1)
                {
                    returnTip1.Checked = true;
                    returnTip2.Checked = false;
                }
                else
                {
                    returnTip1.Checked = false;
                    returnTip2.Checked = true;
                }

                engerTicket.Value = ds.Tables[0].Rows[0]["engerTicket"].ToString();
                seatShip.Value = ds.Tables[0].Rows[0]["seatShip"].ToString();
                untaxPrice_more.Value = ds.Tables[0].Rows[0]["untaxPrice"].ToString();
                shortstayDate_more.Value = ds.Tables[0].Rows[0]["shortstayDate"].ToString();
                longstayDate_more.Value = ds.Tables[0].Rows[0]["longstayDate"].ToString();
                attPrice.Value = ds.Tables[0].Rows[0]["attPrice"].ToString();
                childPrice.Value = ds.Tables[0].Rows[0]["childPrice"].ToString();
                txtSearch.Value = getAirlineById(Convert.ToInt32(ds.Tables[0].Rows[0]["airLine"].ToString()));
                txtSearch_tocity.Value = getToCityById(Convert.ToInt32(ds.Tables[0].Rows[0]["toCity"].ToString()));
                txtSearch_fromport.Value=getAirportById(Convert.ToInt32(ds.Tables[0].Rows[0]["fromPort"].ToString()));
                txtSearch_toport.Value=getAirportById(Convert.ToInt32(ds.Tables[0].Rows[0]["toPort"].ToString()));
                txtSearch_relayport.Value = ds.Tables[0].Rows[0]["relayPort"].ToString();
                fromsaleDate_more.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["fromsaleDate"].ToString()).ToString("yyyy-MM-dd");
                tosaleDate_more.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["tosaleDate"].ToString()).ToString("yyyy-MM-dd");
                fromtripDate_more.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["fromtripDate"].ToString()).ToString("yyyy-MM-dd");
                totripDate_more.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["totripDate"].ToString()).ToString("yyyy-MM-dd");
                returnMoney.Value = ds.Tables[0].Rows[0]["returnMoney"].ToString();
                updateProvision.Value = ds.Tables[0].Rows[0]["updateProvision"].ToString();
                txt_score.Value = ds.Tables[0].Rows[0]["score"].ToString();
                txt_addScore.Value = ds.Tables[0].Rows[0]["addScore"].ToString();
                txt_zongping.Value = ds.Tables[0].Rows[0]["zongping"].ToString();
                txt_xiai.Value = ds.Tables[0].Rows[0]["xiai"].ToString();
                txt_manyi.Value = ds.Tables[0].Rows[0]["manyi"].ToString();
                txt_xiaofei.Value = ds.Tables[0].Rows[0]["xiaofei"].ToString();
                txt_fuwu.Value = ds.Tables[0].Rows[0]["fuwu"].ToString();
                this.IsLimited.Value = ds.Tables[0].Rows[0]["IsLimited"].ToString().Trim();


                addpriceMore.Visible = false;
                adddateMore.Visible = false;
                txtNumDiv.Visible = false;
                

                if (Convert.ToInt32(ds.Tables[0].Rows[0]["isChear"].ToString()) == 1)
                {
                    isPass1.Checked = true;
                    isPass2.Checked = false;
                }
                else
                {
                    isPass1.Checked = false;
                    isPass2.Checked = true;
                }

                if (Convert.ToInt32(ds.Tables[0].Rows[0]["isRecom"].ToString()) == 1)
                {
                    isRecom1.Checked = true;
                    isRecom2.Checked = false;
                }
                else
                {
                    isRecom1.Checked = false;
                    isRecom2.Checked = true;
                }
                FCKeditor.Value = Server.HtmlDecode(ds.Tables[0].Rows[0]["limitProvision"].ToString());
                this.lblTitle.Text = "修改机票信息";
            }
            else
            {
                id = 0;
                bind_allInfo();
                
                this.lblTitle.Text = "添加机票信息";
            }


        }

        AjaxPro.Utility.RegisterTypeForAjax(typeof(cms_ticket_ticket_add));
    }

    /// <summary>
    /// 初始化所有数据
    /// </summary>
    protected void bind_allInfo()
    {
        if (!IsPostBack)
        {
            //时间初始化
            fromsaleDate_more.Value = DateTime.Now.ToString("yyyy-MM-dd");
            tosaleDate_more.Value = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");

            //时间初始化
            fromtripDate_more.Value = DateTime.Now.ToString("yyyy-MM-dd");
            totripDate_more.Value = DateTime.Now.AddDays(5).ToString("yyyy-MM-dd");
        }
    }

    private string getAirlineById(int id)
    {
        string airlineName = "";
        string str = "select (airlineCode+'-'+chName) as airlineName from FY_airline where aId="+id;
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds != null)
        {
            airlineName = ds.Tables[0].Rows[0]["airlineName"].ToString();
        }
        return airlineName;
    }

    private int getAirlineIdByName(string name)
    {
        int aId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select aId,airlineCode,chName from FY_airline where airlineCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                {
                    aId = Convert.ToInt32(ds.Tables[0].Rows[0]["aId"].ToString());
                }
            }
        }
        return aId;

    }


    private int getToCityIdByName(string name)
    {
        int aId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select tId,cityCode,chName from FY_ToCity where cityCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                {
                    aId = Convert.ToInt32(ds.Tables[0].Rows[0]["tId"].ToString());
                }
            }
        }
        return aId;

    }

    private int getAirPortIdByName(string name)
    {
        int aId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select apId,airportCode,chName from FY_Airport where airportCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                {
                    aId = Convert.ToInt32(ds.Tables[0].Rows[0]["apId"].ToString());
                }
            }
        }
        return aId;

    }

    private int getStateIdByName(string name)
    {
        int aId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select sId,cityCode,chName from FY_ToCity where cityCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                {
                    aId = Convert.ToInt32(ds.Tables[0].Rows[0]["sId"].ToString());
                }
            }
        }
        return aId;
    }


    private string getToCityById(int id)
    {
        string cityName = "";
        string str = "select (cityCode+'-'+chName) as cityName from FY_ToCity where tId=" + id;
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds != null)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                cityName = ds.Tables[0].Rows[0]["cityName"].ToString();
            }
        }
        return cityName;
    }



    private string getAirportById(int id)
    {
        string airportName = "";
        if (id != 0)
        {
            string str = "select (airportCode+'-'+chName) as airportName from FY_Airport where apId=" + id;
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (ds.Tables[0].Rows.Count > 0)
                {
                    airportName = ds.Tables[0].Rows[0]["airportName"].ToString();
                }


                }
        }
        return airportName;
    }

    
    
    /// <summary>
    /// 初始花出发城市
    /// </summary>
    /// <param name="bigId"></param>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public DataSet GetTo_City()
    {
        string commandText3 = "select * from FY_FromCity";
        return SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText3);
    }

    /// <summary>
    /// 根据大洲获取市信息
    /// </summary>
    /// <param name="bigId"></param>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string GetCity_to(string name)
    {
        string sql = "select * from FY_ToCity where chName like '%" + name + "%' or cityCode like  '" + name + "%'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        try
        {
            List<string> list = new List<string>();
            #region
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list.Add(ds.Tables[0].Rows[i]["cityCode"].ToString() + "-" + ds.Tables[0].Rows[i]["chName"].ToString());
            }
            #endregion
            List<string> l1 = list.FindAll(delegate(string ss) { return ss.Contains(name); });
            string str = "[";
            foreach (string s in l1)
            {
                str += "\"" + s + "\"" + ",";
            }
            str = str.TrimEnd(',') + "]";
            return str;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }

    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string GetArray(string name)
    {
        string sql = "select * from FY_Airline where chName like '%" + name + "%' or airlineCode like  '" + name + "%'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
      
        try
        {
            List<string> list = new List<string>();
            #region
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list.Add(ds.Tables[0].Rows[i]["airlineCode"].ToString()+"-"+ds.Tables[0].Rows[i]["chName"].ToString());
            }
            #endregion
            List<string> l1 = list.FindAll(delegate(string ss) { return ss.Contains(name); });
            string str = "[";
            foreach (string s in l1)
            {
                str += "\"" + s + "\"" + ",";
            }
            str = str.TrimEnd(',') + "]";
            return str;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string GetAirport(string name)
    {
        string sql = "select * from FY_Airport where chName like '%" + name + "%' or airportCode like  '" + name + "%'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);

        try
        {
            List<string> list = new List<string>();
            #region
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list.Add(ds.Tables[0].Rows[i]["airportCode"].ToString() + "-" + ds.Tables[0].Rows[i]["chName"].ToString());
            }
            #endregion
            List<string> l1 = list.FindAll(delegate(string ss) { return ss.Contains(name); });
            string str = "[";
            foreach (string s in l1)
            {
                str += "\"" + s + "\"" + ",";
            }
            str = str.TrimEnd(',') + "]";
            return str;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    

    /// <summary>
    /// 保存和添加操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        int ticketType = 0, tripType = 0, returnTip = 0, isPass = 0, isRecom = 0;


        //if (tripType1.Checked)
        //{
        //    tripType = 0;
        //}
        //else
        //{
        //    tripType = 1;
        //}

        if (returnTip1.Checked)
        {
            returnTip = 1;
        }
        else
        {
            returnTip = 0;
        }
        if (isPass1.Checked)
        {
            isPass = 1;
        }
        else
        {
            isPass = 0;
        }
        if (isRecom1.Checked)
        {
            isRecom = 1;
        }
        else
        {
            isRecom = 0;
        }

        if (id == 0)
        {
            if (Request.Form["untaxPrice_more"] != null)
            {
                string[] untaxPrice_more = Convert.ToString(Request.Form["untaxPrice_more"]).Split(',');
                string[] shortstayDate_more = Convert.ToString(Request.Form["shortstayDate_more"]).Split(',');
                string[] longstayDate_more = Convert.ToString(Request.Form["longstayDate_more"]).Split(',');
                string[] IsLimited = Convert.ToString(Request.Form["IsLimited"]).Split(',');

                for (int i = 0; i < untaxPrice_more.Length; i++)
                {
                    string untaxPrice_more_value = untaxPrice_more[i];
                    string shortstayDate_more_value = shortstayDate_more[i];
                    string longstayDate_more_value = longstayDate_more[i];

                    int IsLimited_value = 0;
                    if (IsLimited[i].ToString().Trim() == "1")
                        IsLimited_value = 1;
                    
                    //后增加
                    if (shortstayDate_more_value.Trim() == "0" && longstayDate_more_value.Trim()=="0")
                        tripType = 0;
                    else
                        tripType = 1;

                    if (Request.Form["fromsaleDate_more"] != null)
                    {
                        string[] fromsaleDate_more = Convert.ToString(Request.Form["fromsaleDate_more"]).Split(',');
                        string[] tosaleDate_more = Convert.ToString(Request.Form["tosaleDate_more"]).Split(',');
                        string[] fromtripDate_more = Convert.ToString(Request.Form["fromtripDate_more"]).Split(',');
                        string[] totripDate_more = Convert.ToString(Request.Form["totripDate_more"]).Split(',');

                        for (int j = 0; j < fromsaleDate_more.Length; j++)
                        {

                            string fromsaleDate_more_value = fromsaleDate_more[j];
                            string tosaleDate_more_value = tosaleDate_more[j];
                            string fromtripDate_more_value = fromtripDate_more[j];
                            string totripDate_more_value = totripDate_more[j];
                            int num = 1;
                            if (txtNum.Value != "")
                            {
                                num = Convert.ToInt32(txtNum.Value);
                                if (num<1){
                                num=1;
                                }
                            }
                            for (int n = 1; n <= num; n++)
                            {
                                string commandText2 = "INSERT INTO FY_Ticket(title,fromCity,stateId,toCity,ticketType,tripType,airLine,fromPort,toPort,relayPort,bagPrice,returnTip,engerTicket,seatShip,untaxPrice,";
                                commandText2 += "shortstayDate,longstayDate,attPrice,childPrice,fromsaleDate,tosaleDate,fromtripDate,totripDate,returnMoney,updateProvision,limitProvision,addtime,updatetime,isChear,isRecom,score,addScore,zongping,xiai,xiaofei,manyi,fuwu,IsLimited)";
                                commandText2 += "values('" + Sys.filterSQLStr(title.Value.Trim()) + "'," + fromCity.Value.Trim() + "," + getStateIdByName(txtSearch_tocity.Value) + "," + getToCityIdByName(txtSearch_tocity.Value) + "," + ticketType + "," + tripType + "," + getAirlineIdByName(txtSearch.Value) + ",";
                                commandText2 += "" + getAirPortIdByName(txtSearch_fromport.Value) + "," + getAirPortIdByName(txtSearch_toport.Value) + ",'" + Sys.filterSQLStr(txtSearch_relayport.Value) + "','" + Sys.filterSQLStr(bagPrice.Value.Trim()) + "'," + returnTip + ",";
                                commandText2 += "'" + Sys.filterSQLStr(engerTicket.Value.Trim()) + "','" + Sys.filterSQLStr(seatShip.Value.Trim()) + "','" + Sys.filterSQLStr(untaxPrice_more_value) + "',";
                                commandText2 += "'" + Sys.filterSQLStr(shortstayDate_more_value) + "','" + Sys.filterSQLStr(longstayDate_more_value) + "','" + Sys.filterSQLStr(attPrice.Value.Trim()) + "',";
                                commandText2 += "'" + Sys.filterSQLStr(childPrice.Value.Trim()) + "','" + Sys.filterSQLStr(fromsaleDate_more_value) + "','" + Sys.filterSQLStr(tosaleDate_more_value) + "',";
                                commandText2 += "'" + Sys.filterSQLStr(fromtripDate_more_value) + "','" + Sys.filterSQLStr(totripDate_more_value) + "','" + Sys.filterSQLStr(returnMoney.Value.Trim()) + "',";
                                commandText2 += "'" + Sys.filterSQLStr(updateProvision.Value.Trim()) + "','" + Sys.filterSQLStr(FCKeditor.Value) + "',getdate(),getdate()," + isPass + "," + isRecom + "," + txt_score.Value + "," + txt_addScore.Value + "," + txt_zongping.Value + "," + txt_xiai.Value + "," + txt_xiaofei.Value + "," + txt_manyi.Value + "," + txt_fuwu.Value + "," + IsLimited_value + ")";
                                int count1 = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText2);

                                if (0 >= count1)
                                {
                                    scripthelp.Alert("添加机票信息失败!", this.Page);
                                    return;
                                }
                            }
                        }
                    }
                    else
                    {
                        scripthelp.Alert("添加机票信息失败!", this.Page);
                    }

                }
                scripthelp.AlertAndRedirect("添加机票信息成功!", "ticket_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("添加机票信息失败!", this.Page);
            }

        }
        else
        {
            //后增加
            if (this.shortstayDate_more.Value.Trim() == "0"&&this.longstayDate_more.Value.Trim()=="0")
                tripType = 0;
            else
                tripType = 1;

            string commandText = "update FY_Ticket set title='" + Sys.filterSQLStr(title.Value.Trim()) + "' ,fromCity=" + fromCity.Value.Trim() + " ,stateId=" + getStateIdByName(txtSearch_tocity.Value) + ", toCity=" + getToCityIdByName(txtSearch_tocity.Value) + " ,ticketType=" + ticketType + " ,tripType=" + tripType + " ,airLine=" + getAirlineIdByName(txtSearch.Value) + " ,fromPort=" + getAirPortIdByName(txtSearch_fromport.Value) + " ,toPort=" + getAirPortIdByName(txtSearch_toport.Value) + " ,relayPort='" + Sys.filterSQLStr(txtSearch_relayport.Value) + "' ,bagPrice='" + Sys.filterSQLStr(bagPrice.Value.Trim()) + "',returnTip=" + returnTip + " ,engerTicket='" + Sys.filterSQLStr(engerTicket.Value.Trim()) + "' ,seatShip='" + Sys.filterSQLStr(seatShip.Value.Trim()) + "',untaxPrice='" + Sys.filterSQLStr(untaxPrice_more.Value.Trim()) + "',shortstayDate='" + Sys.filterSQLStr(shortstayDate_more.Value.Trim()) + "',longstayDate='" + Sys.filterSQLStr(longstayDate_more.Value.Trim()) + "',attPrice='" + Sys.filterSQLStr(attPrice.Value.Trim()) + "',childPrice='" + Sys.filterSQLStr(childPrice.Value.Trim()) + "',fromsaleDate='" + Sys.filterSQLStr(fromsaleDate_more.Value.Trim()) + "',tosaleDate='" + Sys.filterSQLStr(tosaleDate_more.Value.Trim()) + "',fromtripDate='" + Sys.filterSQLStr(fromtripDate_more.Value.Trim()) + "',totripDate='" + Sys.filterSQLStr(totripDate_more.Value.Trim()) + "',returnMoney='" + Sys.filterSQLStr(returnMoney.Value.Trim()) + "',updateProvision='" + Sys.filterSQLStr(updateProvision.Value.Trim()) + "',limitProvision='" + Sys.filterSQLStr(FCKeditor.Value) + "',updatetime=getdate(),isChear=" + isPass + ",isRecom=" + isRecom + ",score=" + txt_score.Value + ",addScore=" + txt_addScore.Value + ",zongping=" + txt_zongping.Value + ",xiai=" + txt_xiai.Value + ",xiaofei=" + txt_xiaofei.Value + ",manyi=" + txt_manyi.Value + ",fuwu=" + txt_fuwu.Value + ",IsLimited ="+this.IsLimited.Value+" where tId='" + id + "'";
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            if (count > 0)
            {
                scripthelp.AlertAndRedirect("修改机票信息成功!", "ticket_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("修改机票信息失败!", this.Page);
                return;
            }
        }
    }
}
