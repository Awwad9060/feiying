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

public partial class console_login : System.Web.UI.Page
{
    /// <summary>
    /// 创 建 者：万正杰
    /// 创建日期：2008.10.31
    /// 主要功能：实现企业会员管理的功能
    /// ---------修改记录---------
    /// 修改日期  修改人  修改内容
    ///
    /// </summary>
    
    protected void Page_Load(object sender, EventArgs e)
    {
        string page = Request.QueryString["action"];
        if (page == "logout")
        {
            Session.Remove("adminmerinfo");
            Session.Abandon();
        }
    }

    /// <summary>
    /// 管理员登录操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_login_Click(object sender, ImageClickEventArgs e)
    {
        string data_IP = "";
        string url = Request.Url.ToString();

        IPHostEntry oIPHost = Dns.GetHostEntry(Environment.MachineName);

        if (oIPHost.AddressList.Length > 0)
            data_IP = oIPHost.AddressList[0].ToString();

        int logintag = 0;

        MemberInfo adminmerinfo = new MemberInfo();

        if (String.Compare(Session["verificode"].ToString(), txtCheckCode.Value, true) != 0)
        {
            lblMessage.Text = "验证码错误，请输入正确的验证码。";
            lblMessage.Visible = true;
            return;
        }
        else
        {
            logintag = 1;
        }
        if (logintag == 1)
        {
            string loginname = Txt_Username.Value.Trim();
            string loginpwd = Txt_pwd.Value.Trim();
            string pwd = Sys.md5("123456");
            string str = "select * from FY_admin where adminName='" + Sys.filterSQLStr(loginname) + "' and adminPwd='" + Sys.md5(Sys.filterSQLStr(loginpwd)) + "'";
            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];
            try
            {
                if (dt.Rows.Count <= 0)
                {
                    lblMessage.Text = "登用户名密码不正确，请重新输入！";
                    lblMessage.Visible = true;
                    return;
                }
                else
                {
                    DataRow dr = dt.Rows[0];
                    Session["adminName"] = dr["adminName"].ToString();
                    Session["id"] = Convert.ToInt32(dr["id"].ToString());
                    Session["flag"] = Convert.ToInt32(dr["flag"].ToString());

                    adminmerinfo.AdminName = Session["adminName"].ToString();
                    adminmerinfo.AdminId = Convert.ToInt32(Session["id"]);
                    adminmerinfo.Flag = Convert.ToInt32(Session["flag"]);

                    string sql = "update FY_admin set loginTimes=loginTimes+1,loginIp='" + data_IP + "' where id=" + adminmerinfo.AdminId + "";

                    SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, sql);

                    Session["adminmerinfo"] = adminmerinfo;
                    Response.Redirect("Default.aspx");
                }
            }
            catch (Exception err)
            {
                HttpContext.Current.Response.Write(err.Message);
            }

        }
    }
}
