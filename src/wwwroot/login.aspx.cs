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
using System.Net;
using eap.share;

public partial class login : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void btnok_Click(object sender, EventArgs e)
    {
        string data_IP = "";
        string url = "index.aspx";

        if (Request.QueryString["url"] != null && Request.QueryString["url"].ToString() != "")
        {
            url = Request.QueryString["url"].ToString();
        }


        IPHostEntry oIPHost = Dns.GetHostEntry(Environment.MachineName);

        if (oIPHost.AddressList.Length > 0)
            data_IP = oIPHost.AddressList[0].ToString();


        string str = "select * from tmember where Mem_LoginName='" + Sys.filterSQLStr(shortname.Value.Trim()) + "'";
        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];
        if (dt.Rows.Count <= 0)
        {
            lblerrmes.Text = "该用户信息不存在，请先注册！";
            return;
        }
        else
        {
            DataRow dr = dt.Rows[0];
            string loginpwd = dr["Mem_LoginPasd"].ToString();
            if (loginpwd != Sys.md5(pwd1.Value.Trim()))
            {
                lblerrmes.Text = "用户名密码错误！";
                return;
            }
            else
            {
                Session["Mem_LoginName"] = dr["Mem_LoginName"].ToString();
                Session["Mem_ID"] = Convert.ToInt32(dr["Mem_ID"].ToString());
                Session["Mem_Money"] = Convert.ToInt32(dr["Mem_Money"].ToString());
                Session["Mem_type"] =dr["Mem_type"].ToString();
                if (dr["mem_pic"].ToString() != "")
                {
                    Session["Mem_Pic"] = dr["mem_pic"].ToString();
                }
                else
                {
                    Session["Mem_Pic"] = "images/onein029.jpg";
                }
                Response.Redirect(url);
            }

        }

    }
}
