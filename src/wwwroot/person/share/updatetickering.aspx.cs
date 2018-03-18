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

public partial class person_share_updatetickering : System.Web.UI.Page
{
    string url = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["code"] == null&&Request.QueryString["type"] == null)
        {
            Response.Write("false");
            return;
        }
        string code = Request.QueryString["code"].ToString();
        string type = Request.QueryString["type"].ToString();
        if (string.IsNullOrEmpty(code) || string.IsNullOrEmpty(type))
        {
            Response.Write("false");
            return;
        }

        string str = "select * from FY_ticketing where ticketingId='" + code + "'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds == null || ds.Tables[0] == null || ds.Tables[0].Rows.Count == 0)
        {
             Response.Write("false");
             return;
        }
        if (type.Trim() == "1")
        {
            if (Convert.ToInt32(ds.Tables[0].Rows[0]["ticketingState"]) == 1)
            {
                Response.Write("true");
                return;
            }
            else
            {
                Response.Write("false");
                return;
            }
        }
        this.updateTicketing(code);
        this.updateJifen(Convert.ToInt32(ds.Tables[0].Rows[0]["ticketingJifen"]));
        Response.Write(ds.Tables[0].Rows[0]["ticketingPath"].ToString());
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
        if(count>0)
            Session["Mem_Money"] = Convert.ToInt32(Session["Mem_Money"]) + jifen;
    }

}
