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


public partial class console_aifei_Default : System.Web.UI.Page
{
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
            //准备城市数据
            //出发城市设置
         
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
        
        GetAiFeiTickets();
        AjaxPro.Utility.RegisterTypeForAjax(typeof(console_aifei_Default));
    }

    protected void GetAiFeiTickets()
    {
        //获得页面参数
        string dpt = "";
        string arr = "";
        string toTime = "";
        string reTime = "";
        string cate = "";

        //出发城市
        if (fromCity.SelectedValue != "" && fromCity.SelectedValue != "0")
        {
            //获得出发城市三字码
            string cityCodeSql = "select cityCode from FY_FromCity where fId='"+fromCity.SelectedValue+"'";
            DataSet dsCityCode = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, cityCodeSql);
            if (dsCityCode != null)
            {

                dpt = dsCityCode.Tables[0].Rows[0]["cityCode"].ToString();
            }
        }
        else
        {
            return ;
        }

        //目的城市
        if (txtSearch_tocity.Value.Trim() != "")
        {
           //获得目的城市三字码
            arr = txtSearch_tocity.Value.Trim().Substring(0, 3);
        }
        else
        {
            return ;
        }

        //获得出发时间
        if (fromtripDate_more.Value.Trim() != ""){
            toTime = fromtripDate_more.Value.Trim().Replace("-","");
        }
        else
        {
            return ;
        }

        //获得到达时间
        if (totripDate_more.Value.Trim() != ""){
            reTime = totripDate_more.Value.Trim().Replace("-", "");
        }
        else
        {
            return ;
        }
        
        //获得客票类型
        if (cateSelect.Value.Trim() != "")
        {
            cate = cateSelect.Value.Trim();
        }
        else
        {
            return ;
        }

        

        //请求客票
        AiFeiService aifeiService = new AiFeiService();

        ArrayList data = aifeiService.GlobalTicket(dpt, arr, toTime, reTime, cate);
        ArrayList tickets = new ArrayList();
        //排序爱飞机票
        foreach (AiFeiTicketEntity orderTicket in data)
        {
            //过滤日期
            DateTime dt = Convert.ToDateTime(orderTicket.totripDate.Substring(0, 4) + "-" + orderTicket.totripDate.Substring(4, 2) + "-" + orderTicket.totripDate.Substring(6, 2));
            if ((dt - DateTime.Now).Days < 0)
                continue;

            //获取中转
            FeiYingFlight toFlight = aifeiService.getFlightMsg2(orderTicket.fromCity, orderTicket.toCity, orderTicket.airlineCode, "");
            if (toFlight != null)
            {
                if (string.IsNullOrEmpty(toFlight.relayPort))
                    orderTicket.relayPort = "直飞";
                else
                    orderTicket.relayPort = ReadXmlHelper.GetAirPortNameByCode(toFlight.relayPort);
            }
            if (tickets.Count == 0)
            {
                tickets.Add(orderTicket);
            }
            else
            {
                for (int i = 0; i < tickets.Count; i++)
                {
                    AiFeiTicketEntity aft = (AiFeiTicketEntity)tickets[i];

                    if (tickets.Count <= i + 1)
                    {
                        tickets.Add(orderTicket);
                        break;
                    }
                    else
                    {
                        AiFeiTicketEntity next = (AiFeiTicketEntity)tickets[i + 1];
                        if (Convert.ToDecimal(orderTicket.ticketPrice) > Convert.ToDecimal(aft.ticketPrice) && Convert.ToDecimal(orderTicket.ticketPrice) <= Convert.ToDecimal(next.ticketPrice))
                        {
                            tickets.Insert(i + 1, orderTicket);
                            break;
                        }
                    }
                }
            }
        }

        this.GetData = tickets;
        rptshopnews.DataSource = tickets;
        rptshopnews.DataBind();
    }

    protected string getColorTicktName( string fromcity,
    string tocity,
    int isChear,
    int isRecom)
    {
        if (isChear == 0 && isRecom == 0)
            return fromcity + "--" + tocity;
        else
            return string.Format(
                "<span style=\"color:red\">{0}--{1}</span>",
                fromcity,
                tocity);
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
                list.Add(ds.Tables[0].Rows[i]["airlineCode"].ToString() + "-" + ds.Tables[0].Rows[i]["chName"].ToString());
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

    /// <summary>
    /// 保存和添加操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSearch_Click(object sender, EventArgs e)
    {

    }

    protected string getFromCityNameByCode(string cityCode)
    {
        string sql = "select chName from FY_FromCity where cityCode='"+cityCode+"'";
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
        if (dsCityName != null)
        {

            return dsCityName.Tables[0].Rows[0]["chName"].ToString();
        }

        return "";
    }

    protected string getTicketType(string ticketType)
    {
        if(ticketType.Equals("DC"))
            return "单程";
        else if(ticketType.Equals("SF"))
            return "往返";
        else
            return "全部";
    }

    protected void rptshopnews_ItemCommand(object source, RepeaterCommandEventArgs e)
    {
        if (e.Item.ItemType == ListItemType.Header)
        {
            ArrayList tickets = new ArrayList();
            if (e.CommandName.Trim() == "airlineCode")
            {
                //排序爱飞机票
                foreach (AiFeiTicketEntity orderTicket in this.GetData)
                {
                    if (tickets.Count == 0)
                    {
                        tickets.Add(orderTicket);
                    }
                    else
                    {
                        bool isEqual = false;
                        for (int i = 0; i < tickets.Count; i++)
                        {
                            AiFeiTicketEntity aft = (AiFeiTicketEntity)tickets[i];
                            if (orderTicket.airlineCode.Equals(aft.airlineCode))
                            {
                                isEqual = true;
                                if (tickets.Count <= i + 1)
                                {
                                    tickets.Add(orderTicket);
                                    break;
                                }
                                else
                                {
                                    AiFeiTicketEntity next = (AiFeiTicketEntity)tickets[i + 1];
                                    if (orderTicket.airlineCode.Equals(next.airlineCode) && Convert.ToDecimal(orderTicket.ticketPrice) > Convert.ToDecimal(aft.ticketPrice) && Convert.ToDecimal(orderTicket.ticketPrice) <= Convert.ToDecimal(next.ticketPrice))
                                    {
                                        tickets.Insert(i + 1, orderTicket);
                                        break;
                                    }
                                }
                            }
                            else
                            {
                                if (isEqual)
                                {
                                    tickets.Insert(i, orderTicket);
                                    break;
                                }
                            }
                        }
                        if (!isEqual)
                            tickets.Add(orderTicket);
                    }
                }
            }
            else
            {
                //排序爱飞机票
                foreach (AiFeiTicketEntity orderTicket in this.GetData)
                {
                    if (tickets.Count == 0)
                    {
                        tickets.Add(orderTicket);
                    }
                    else
                    {
                        for (int i = 0; i < tickets.Count; i++)
                        {
                            AiFeiTicketEntity aft = (AiFeiTicketEntity)tickets[i];

                            if (tickets.Count <= i + 1)
                            {
                                tickets.Add(orderTicket);
                                break;
                            }
                            else
                            {
                                AiFeiTicketEntity next = (AiFeiTicketEntity)tickets[i + 1];
                                if (Convert.ToDecimal(orderTicket.ticketPrice) > Convert.ToDecimal(aft.ticketPrice) && Convert.ToDecimal(orderTicket.ticketPrice) <= Convert.ToDecimal(next.ticketPrice))
                                {
                                    tickets.Insert(i + 1, orderTicket);
                                    break;
                                }
                            }
                        }
                    }
                }
            }
            rptshopnews.DataSource = tickets;
            rptshopnews.DataBind();
        }
    }

    private ArrayList GetData
    {
        get
        {
            return Cache["_data"] as ArrayList;
        }
        set
        {
            Cache["_data"] = value;
        }
    }
}
