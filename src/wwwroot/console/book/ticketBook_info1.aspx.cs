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

public partial class console_book_ticketBook_info1 : System.Web.UI.Page
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
                string str = "select * from FY_TicketBook  where bId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                title.Value = ds.Tables[0].Rows[0]["title"].ToString();
                telephone.Value = ds.Tables[0].Rows[0]["telephone"].ToString();
                contact.Value = ds.Tables[0].Rows[0]["contact"].ToString();
                harryGrade.Value = ds.Tables[0].Rows[0]["harryGrade"].ToString();
                tId = ds.Tables[0].Rows[0]["tId"].ToString();
                num.Value = ds.Tables[0].Rows[0]["num"].ToString();
                tripDate.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["tripDate"]).ToShortDateString();
                backDate.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["backDate"]).ToShortDateString();
                memberId.Value = ds.Tables[0].Rows[0]["memberId"].ToString();
                state.Value = ds.Tables[0].Rows[0]["state"].ToString();
                bookDate.Value = ds.Tables[0].Rows[0]["bookDate"].ToString();
                otherMess.Value = ds.Tables[0].Rows[0]["otherMess"].ToString();
                this.lblTitle.Text = "修改机票预定信息";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加机票预定信息";
            }


        }
    }
}
