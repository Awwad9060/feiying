using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;


public partial class console_state_state_add : System.Web.UI.Page
{

    static int id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/login.aspx", true);
        }
        if (!IsPostBack)
        {
            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string commandText = "select * from FY_State where sId='" + id + "'";
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText);
                this.txt_enName.Value = ds.Tables[0].Rows[0]["enName"].ToString();
                this.txt_chName.Value = ds.Tables[0].Rows[0]["chName"].ToString();
               
                this.lblTitle.Text = "修改大洲信息";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加大洲信息";
            }

        }
    }

    //添加或修改大洲信息
    protected void btnSave_Click(object sender, EventArgs e)
    {
       
        if (id == 0)
        {
            string enName = Sys.filterSQLStr(this.txt_enName.Value.Trim());
            string chName = Sys.filterSQLStr(this.txt_chName.Value.Trim());

            string commandText = "INSERT INTO FY_State(enName,chName)values('" + enName + "','" + chName + "')";
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            if (count > 0)
            {
                scripthelp.AlertAndRedirect("添加大洲信息成功!", "state_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("添加大洲信息失败!", this.Page);
                return;
            }
        }
        else
        {
            string enName = Sys.filterSQLStr(this.txt_enName.Value.Trim());
            string chName = Sys.filterSQLStr(this.txt_chName.Value.Trim());

            string commandText = "update FY_State set enName='" + enName + "',chName='" + chName + "' where sId='" + id + "'";
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            if (count > 0)
            {
                scripthelp.AlertAndRedirect("修改大洲信息成功!", "state_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("修改大洲信息失败!", this.Page);
                return;
            }

        }
    }


}
