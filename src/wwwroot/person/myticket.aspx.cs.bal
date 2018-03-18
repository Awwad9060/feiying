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

public partial class person_myticket : System.Web.UI.Page
{
    protected string Mem_LoginName = string.Empty;
    protected string Mem_ID = string.Empty;
    protected string Mem_Money = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
            Session.Remove("FM_CustomerDt");

        //判断登陆
        if (Session["Mem_LoginName"] == null||Session["Mem_ID"] == null || Session["Mem_Money"]==null)
            Response.Redirect("../index.aspx");
        else
        {
            Mem_LoginName = Session["Mem_LoginName"].ToString();
            Mem_ID = Session["Mem_ID"].ToString();
            Mem_Money = Session["Mem_Money"].ToString();
        }
    }

    private string Con()
    {
        return ConfigurationManager.AppSettings.Get("DatabaseConnect_Manage");
    }

    /// <summary>
    /// 获取电子票列表
    /// </summary>
    protected void GetTicketinglist()
    {
        DataSet ds = new DataSet();
        string str = @"select top 100 percent * from FM_Customer  where ticketingId is not null ";

        string txtkey = this.txtsearch.Value;
        if (txtkey == "请联系你的客服获取编号")
            txtkey = string.Empty;
        if (!string.IsNullOrEmpty(txtkey))
        {
            str += " and ticketingId = '" + this.txtsearch.Value.Trim() + "'";
        }

        str += " order by addtime desc";

        SqlParameter[] parameters = {
                    new SqlParameter("@sql", SqlDbType.NVarChar,4000),
                    new SqlParameter("@currentpage", SqlDbType.Int),
                    new SqlParameter("@pagesize", SqlDbType.Int)};

        parameters[0].Value = str;
        parameters[1].Value = Pager.CurrentPageIndex;
        parameters[2].Value = Pager.PageSize;

        ds = SqlHelper.ExecuteDataset(this.Con(), CommandType.StoredProcedure, "p_splitpage", parameters);
        this.Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);
        this.rptshopnews.DataSource = ds.Tables[1];
        this.rptshopnews.DataBind();
    }

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        this.GetTicketinglist();
    }

    /// <summary>
    /// 获取下载列表
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    protected DataTable getTicketingDt(string code)
    {
        DataTable dtO= (DataTable)Session["FM_CustomerDt"];
        if(dtO==null)
        {
            dtO = new DataTable();
            dtO.Columns.Add("cid");
            dtO.Columns.Add("code");
            dtO.Columns.Add("fromcity");
            dtO.Columns.Add("tocity");
            dtO.Columns.Add("airline");
            dtO.Columns.Add("chufa");
            dtO.Columns.Add("huicheng");
            dtO.Columns.Add("jifen");
            dtO.Columns.Add("number");
            dtO.Columns.Add("state");
            dtO.Columns.Add("path");
        }


        if (string.IsNullOrEmpty(code))
            return dtO;
        string str = @"select top 1 percent * from FM_Customer  where ticketingState=1 and ticketingId ='" + code + "'";
        DataTable dt = SqlHelper.ExecuteDataset(this.Con(), CommandType.Text, str).Tables[0];
        if (dt == null || dt.Rows.Count == 0)
        {
            scripthelp.Alert("无法查询该电子票号，请重新输入电子票号！", this.Page);
            return dtO;
        }

        for (int i = 0; i < dt.Rows.Count; i++)
        {
            DataRow[] dr = dtO.Select("cid='" + dt.Rows[i]["cId"].ToString().Trim() + "'");
            if (dr == null || dr.Length == 0)
                dtO.Rows.Add(
                    dt.Rows[i]["cId"].ToString().Trim(),
                    dt.Rows[i]["ticketingId"].ToString().Trim(),
                    dt.Rows[i]["fromcity"].ToString().Trim(),
                    dt.Rows[i]["tocity"].ToString().Trim(),
                    dt.Rows[i]["airline"].ToString().Trim(),
                    dt.Rows[i]["chufa"].ToString().Trim(),
                    dt.Rows[i]["huicheng"].ToString().Trim(),
                    dt.Rows[i]["ticketingJifen"].ToString().Trim(),
                    dt.Rows[i]["ticketingNumber"].ToString().Trim(),
                    dt.Rows[i]["ticketingState"].ToString().Trim(),
                    dt.Rows[i]["ticketingPath"].ToString().Trim()
                    );

            this.updateTicketing(dt.Rows[i]["ticketingId"].ToString().Trim());
            this.updateJifen(Convert.ToInt32(dt.Rows[i]["ticketingJifen"]));

            string strFormat = string.Format(
                "<script language='javascript'>var bFlag=confirm('{0}');if (bFlag) window.open('{1}');</script>",
                "你的电子票已成功，是否下载？",
                "http://www.fei580.com/fileload.aspx?path=/" + dt.Rows[i]["ticketingPath"].ToString().Trim() + "&cId = " + dt.Rows[i]["cId"].ToString().Trim() + ""
                );

            ClientScriptManager script = this.Page.ClientScript;
            script.RegisterStartupScript(typeof(scripthelp), "Key_ConfirmAndRunScript", strFormat);
        }
        Session["FM_CustomerDt"] = dtO;
        return dtO;
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

        string str = "update  FM_Customer set ticketingState=0 where ticketingId='" + code + "'";
        int count = SqlHelper.ExecuteNonQuery(this.Con(), CommandType.Text, str);
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

    protected void butt_search_Click(object sender, EventArgs e)
    {
        string txtkey = this.txtsearch.Value;
        if (txtkey == "请联系你的客服获取编号")
            txtkey = string.Empty;

        if (string.IsNullOrEmpty(txtkey))
        {
            scripthelp.Alert("电子票号不为空！",this.Page);
            return;
        }

        DataTable dt = this.getTicketingDt(txtkey);
        this.Pager.RecordCount = dt.Rows.Count;
        this.rptshopnews.DataSource = dt;
        this.rptshopnews.DataBind();
    }

    protected string getUrl(int state,string txtkey)
    {
        if (state == 0)
            return "alertMess();";

        return "confirmLoad('" + txtkey + "')";
    }

}
