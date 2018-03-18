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

public partial class console_admin_admin_list : System.Web.UI.Page
{
    /// <summary>
    /// 创 建 者：谭臻琦
    /// 创建日期：2008.10.31
    /// 主要功能：实现管理员管理的功能
    /// ---------修改记录---------
    /// 修改日期  修改人  修改内容
    ///
    /// </summary>
    /// 

    public int adminid = 0;

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

        if (!IsPostBack)
        {
            InitEntType();
            if (operatortag == "del")
            {
                DelEntType();
            }
        }
    }


    /// <summary>
    /// 设置管理员类别标记
    /// </summary>
    /// <param name="bs"></param>
    /// <returns></returns>
    public string Operator_stat(int bs)
    {
        string str_name = "";
        if (bs == 0)
            str_name = "<span style='color:#66cc00'>系统管理员</span>";
        else if (bs == 1)
            str_name = "<span style='color:#fe6500'>普通管理员</span>";
        else if (bs == 2)
            str_name = "<span style='color:#fe6500'>编辑审核员</span>";
        else if (bs == 3)
            str_name = "<span style='color:#fe6500'>航司管理员</span>";
        else if (bs == 4)
            str_name = "<span style='color:#fe6500'>机场管理员</span>";
        else if (bs == 5)
            str_name = "<span style='color:#fe6500'>机型管理员</span>";
        else if (bs == 6)
            str_name = "<span style='color:#fe6500'>机票管理员</span>";
        else if (bs == 7)
            str_name = "<span style='color:#fe6500'>酒店管理员</span>";
        else if (bs == 8)
            str_name = "<span style='color:#fe6500'>新闻管理员</span>";
        else if (bs == 9)
            str_name = "<span style='color:#fe6500'>IDS管理员</span>";
        else if (bs == 10)
            str_name = "<span style='color:#fe6500'>客户维系管理员</span>";
        else if (bs == 11)
            str_name = "<span style='color:#fe6500'>飞赢圈管理员</span>";
        else
            str_name = "<span style='color:#fe6500'>税费管理员</span>";
        return str_name;
    }


    /// <summary>
    /// 初始化管理员信息
    /// </summary>
    protected void InitEntType()
    {
        string str = "select * from FY_admin";
        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];
        adminlist.DataSource = dt;
        adminlist.DataBind();
    }

    /// <summary>
    /// 删除管理员
    /// </summary>
    protected void DelEntType()
    {
        string str = "delete from FY_admin where id=" + Convert.ToInt32(Request.QueryString["Id"]);
        int deltag = 0;
        deltag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
        if (deltag > 0)
            scripthelp.AlertAndRedirect("删除成功", "admin_list.aspx", Page);
        else
            scripthelp.AlertAndRedirect("删除失败", "admin_list.aspx", Page);

    }
}
