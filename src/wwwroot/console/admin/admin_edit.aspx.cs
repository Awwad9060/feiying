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

public partial class console_admin_admin_edit : System.Web.UI.Page
{
    /// <summary>
    /// 创 建 者：谭臻琦
    /// 创建日期：2008.11.3
    /// 主要功能：实现企业小分类管理的功能
    /// ---------修改记录---------
    /// 修改日期  修改人  修改内容
    /// 2008.11.3  万正杰  做细节方面的修改
    /// 2008.12.29  万正杰 添加对后台操作员的权限管理
    /// </summary>
    
    string operatortag = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];

        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }


        operatortag = Request.QueryString["Oper"];

        AjaxPro.Utility.RegisterTypeForAjax(typeof(console_admin_admin_edit));

        txtadname.Attributes["onblur"] = "check_adminname(this.value)";

        if (!IsPostBack)
        {
            if (operatortag == "modify")
            {
                Gettypeinfo();
                txtpwd.Visible = false;
                txtpwd2.Visible = false;
                pwd.Visible = false;
                pwd1.Visible = false;
            }

            if (operatortag == "modpwd")
            {
                txtadname.Text = adminmerinfo.AdminName;
                txtadname.Enabled = false;
                controlright.Visible = false;
            }
           
        }
    }

    /// <summary>
    /// 添加管理员信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnok_Click(object sender, EventArgs e)
    {
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];

        int right = 0;
        if (!int.TryParse(this.sel_admin.Value, out right))
        {
            scripthelp.Alert("操作员类型出错！", this.Page);
            return;
        }

        string str = "insert into FY_admin(adminName,adminPwd,flag) values('" + Sys.filterSQLStr(txtadname.Text.Trim()) + "','" + Sys.md5(txtpwd.Text.Trim()) + "'," + right + ")";

        if (operatortag == "modify")
        {
            str = "update FY_admin set adminName='" + txtadname.Text.Trim() + "',flag=" + right + "where id=" + Convert.ToInt32(Request.QueryString["Id"]); 
        }

        if (operatortag == "modpwd")
        {
            str = "update FY_admin set adminPwd='" + Sys.md5(txtpwd.Text.Trim()) + "'where id=" + adminmerinfo.AdminId + "";
        }
       
        int inserttag = 0;

        inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (inserttag > 0)
        {
            Response.Write("<script>alert('操作成功！');location.href='admin_list.aspx'</script>");
        }
        else
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");

    }

    /// <summary>
    /// 获取管理员详细信息
    /// </summary>
    protected void Gettypeinfo()
    {
        string str = "select * from FY_admin where id=" + Convert.ToInt32(Request.QueryString["Id"]);
        DataRow dr = DAO.sqlRow(SqlHelper.ConnString_select, str);
        txtadname.Text = dr["adminName"].ToString();
        txtpwd.Text = dr["adminPwd"].ToString();
        txtpwd2.Text = dr["adminPwd"].ToString();
        this.sel_admin.Value = dr["flag"].ToString().Trim();
    }

    /// <summary>
    /// 检测用户名是否被注册
    /// </summary>
    /// <param name="username"></param>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string CheckAdminName(string username)
    {
        if (CheckAdmin(username) == true)
            return "ok";
        else
            return "false";
    }

    /// <summary>
    /// 对数据库进行检测
    /// </summary>
    /// <param name="username"></param>
    /// <returns></returns>
    protected bool CheckAdmin(string username)
    {

        string str = "if not exists (select id from FY_admin where adminName='" + Sys.filterSQLStr(username) + "') select 1 else select 0";

        if (SqlHelper.ExecuteScalar(SqlHelper.ConnString_select, CommandType.Text, str).ToString() == "0")
            return false;
        else
            return true;
    }
    
}
