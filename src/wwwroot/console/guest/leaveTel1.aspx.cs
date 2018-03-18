using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Text;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class console_guest_leaveTel1 : System.Web.UI.Page
{
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
            InitEntType();
    }

    /// <summary>
    /// 初始化管理员信息
    /// </summary>
    protected void InitEntType()
    {
        DataSet ds = new DataSet();
        string str = @"select top 100 percent * from FY_GuestTel where 1=1";
        str += " and (DateDiff(d,addtime,'" + DateTime.Now + "')>-1 and DateDiff(d,addtime,'" + DateTime.Now + "') <4)";
        str += " order by gId desc";
       
        SqlParameter[] parameters = {
                                new SqlParameter("@sql", SqlDbType.NVarChar,40000),
                                new SqlParameter("@currentpage", SqlDbType.Int),
                                new SqlParameter("@pagesize", SqlDbType.Int)};
        parameters[0].Value = str;
        parameters[1].Value = this.Pager.CurrentPageIndex;
        parameters[2].Value = this.Pager.PageSize;
        ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);
        this.adminlist.DataSource = ds.Tables[1];
        this.Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);
        this.Pager.CustomInfoHTML = "&nbsp;第" + this.Pager.CurrentPageIndex.ToString() + "页/共" + this.Pager.PageCount.ToString() + "页 总记录数：" + this.Pager.RecordCount.ToString();
        this.adminlist.DataBind();

    }

    //更改页面事件
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        this.Pager.CurrentPageIndex = this.Pager.StartRecordIndex / this.Pager.PageSize + 1;
        this.InitEntType();
    }
}
