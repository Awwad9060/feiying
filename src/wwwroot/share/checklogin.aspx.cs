using System;
using System.Data;
using System.Collections.Specialized;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class share_checklogin : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        NameValueCollection coll = Request.QueryString;
        string name = coll["name"];
        string pwd = coll["pwd"];
        if (string.IsNullOrEmpty(name) || string.IsNullOrEmpty(pwd))
        {
            Response.Write("必填项被置空！");
            return;
        }

        string str = "select * from tmember where Mem_LoginName='" + Sys.filterSQLStr(name) + "'";
        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];
        if (dt.Rows.Count <= 0)
        {
            Response.Write("用户不存在！");
            return;
        }
        else
        {
            DataRow dr = dt.Rows[0];
            string loginpwd = dr["Mem_LoginPasd"].ToString();
            if (loginpwd != Sys.md5(pwd))
            {
                Response.Write("密码错误！");
                return;
            }
            else
            {
                Session["Mem_LoginName"] = dr["Mem_LoginName"].ToString();
                Session["Mem_ID"] = Convert.ToInt32(dr["Mem_ID"].ToString());
                Session["Mem_Money"] = Convert.ToInt32(dr["Mem_Money"].ToString());
                Session["Mem_Money"] = Convert.ToInt32(dr["Mem_Money"].ToString());
                Session["Mem_type"] = dr["Mem_type"].ToString();
                if (dr["mem_pic"].ToString() != "")
                {
                    Session["Mem_Pic"] = dr["mem_pic"].ToString();
                }
                else
                {
                    Session["Mem_Pic"] = "images/onein029.jpg";
                }
                Response.Write("0");
           }
        }
    }
}
