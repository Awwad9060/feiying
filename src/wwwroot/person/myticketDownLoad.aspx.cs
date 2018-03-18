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
using System.Data.SqlClient;
using eap.share;

public partial class person_myticketDownLoad : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断登陆
        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null || Session["Mem_Money"] == null)
        {
            string strFormat = string.Format("<script language='javascript'>var bFlag=confirm('{0}');if (bFlag) window.location.href ='{1}'; else window.location.href ='/Index.aspx'; </script>",
            "下载电子客票需要登录帐户，是否确定登录账号？", "/Login.aspx?url=/person/myticketDownLoad.aspx");

            ClientScriptManager script = this.Page.ClientScript;
            script.RegisterStartupScript(typeof(scripthelp), "Key_ConfirmAndRunScript", strFormat);
        }
    }

    /// <summary>
    /// 获取下载号
    /// </summary>
    /// <param name="adminId"></param>
    /// <returns></returns>
    public int updateTicketing(string code)
    {
        if (string.IsNullOrEmpty(code))
            return 0;

        string str = "update  FY_ticketing set ticketingState=0 where ticketingId='" + code + "'";
        int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_select, CommandType.Text, str);
        return count;
    }


    public void updateJifen(int jifen)
    {
        if (jifen == 0)
            return;

        string Mem_ID = Session["Mem_ID"].ToString();

        string str = "update tmember set Mem_Money = Mem_Money+" + jifen + " WHERE Mem_ID = " + Mem_ID + "";
        int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
        if (count > 0)
            Session["Mem_Money"] = Convert.ToInt32(Session["Mem_Money"]) + jifen;
    }


    /// <summary>
    /// 获取下载列表
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    protected void getTicketingDt(string code)
    {
        string str = @"select top 1 percent * from FY_ticketing  where ticketingId ='" + code + "'";
        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];
        if (dt == null || dt.Rows.Count == 0)
        {
            scripthelp.Alert("无法查询该电子票号，请重新输入电子票号！", this.Page);
            return;
        }
        if (Convert.ToInt32(dt.Rows[0]["ticketingState"]) == 0)
        {
            scripthelp.Alert("该电子票早前已获取成功，请到你的行程列表中下载！", this.Page);
            return;
        }

        this.insertLog(dt.Rows[0]);
        this.updateTicketing(dt.Rows[0]["ticketingId"].ToString().Trim());
        this.updateJifen(Convert.ToInt32(dt.Rows[0]["ticketingJifen"]));

        string strFormat = string.Format(
            "<script language='javascript'>var bFlag=confirm('{0}');if (bFlag) window.open('{1}');</script>",
            "你的电子票已成功，是否下载？",
            "http://www.fei580.com/fileload.aspx?path=/" + dt.Rows[0]["ticketingPath"].ToString().Trim() + "&cId = " + dt.Rows[0]["cId"].ToString().Trim() + "");

        ClientScriptManager script = this.Page.ClientScript;
        script.RegisterStartupScript(typeof(scripthelp), "Key_ConfirmAndRunScript", strFormat);
    }


    /// <summary>
    /// 插入行
    /// </summary>
    /// <param name="dr"></param>
    /// <returns></returns>
    public int insertLog(DataRow dr)
    {
        if (dr == null)
            return 0;

        string str = "insert into FY_ticketinglog(cId,fromcity,tocity,chufa,huicheng,airline,ticketingId,ticketingPath,ticketingJifen,ticketingMember,ticketingNumber,Mem_LoginName)values(" + dr["cId"] + ",'" + dr["fromcity"] + "','" + dr["tocity"] + "','" + dr["chufa"] + "','" + dr["huicheng"] + "','" + dr["airline"] + "','" + dr["ticketingId"] + "','" + dr["ticketingPath"] + "','" + dr["ticketingJifen"] + "','" + dr["ticketingMember"] + "','" + dr["ticketingNumber"] + "','" + Session["Mem_LoginName"] + "')";
        int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_select, CommandType.Text, str);
        return count;
    }

    protected void butt_search_Click(object sender, EventArgs e)
    {
        if (string.IsNullOrEmpty(this.txtsearch.Value) || this.txtsearch.Value == "请联系你的客服获取编号")
        {
            scripthelp.Alert("电子票号不为空！", this.Page);
            return;
        }

        this.getTicketingDt(this.txtsearch.Value);
    }
}
