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

public partial class console_book_ticketBook1_info1 : System.Web.UI.Page
{

    static int id = 0;

    protected string tId = string.Empty;

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
            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string str = "select * from FY_TicketBook1  where bId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                content.Value = ds.Tables[0].Rows[0]["content"].ToString();
                telephone.Value = ds.Tables[0].Rows[0]["telephone"].ToString();
                contact.Value = ds.Tables[0].Rows[0]["contact"].ToString();
                otherWay.Value = ds.Tables[0].Rows[0]["otherWay"].ToString();
                require.Value = ds.Tables[0].Rows[0]["require"].ToString();
                state.Value = ds.Tables[0].Rows[0]["state"].ToString();
                addtime.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["addtime"]).ToShortDateString();
                this.lblTitle.Text = "修改机票预定信息";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加机票预定信息";
            }
        }
    }

    /// <summary>
    /// 保存和添加操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (id == 0)
        {
        }
        else
        {
            string commandText = "update FY_TicketBook1 set content='" + Sys.filterSQLStr(content.Value.Trim()) + "' ,telephone='" + telephone.Value.Trim() + "' ,contact='" + contact.Value.Trim() + "' ,otherWay='" + otherWay.Value.Trim() + "' ,require='" + Sys.filterSQLStr(require.Value.Trim()) + "' ,state='" + state.Value.Trim() + "' where bId='" + id + "'";
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            if (count > 0)
            {
                scripthelp.AlertAndRedirect("修改机票预定信息成功!", "ticketBook1_list1.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("修改机票预定信息失败!", this.Page);
                return;
            }
        }
    }
}
