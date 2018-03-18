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


public partial class console_state_fromCity_add : System.Web.UI.Page
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
            //绑定大洲信息

            string commandText = "select * from FY_State";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText);
            DropDownList1.DataSource = ds;
            DropDownList1.DataTextField = "chName";
            DropDownList1.DataValueField = "sId";
            DropDownList1.DataBind();

            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string commandText1 = "select * from FY_FromCity where fId='" + id + "'";
                DataSet ds1 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText1);
                if (ds1 != null)
                {
                    this.txt_cityCode.Value = ds1.Tables[0].Rows[0]["cityCode"].ToString();
                    this.txt_enName.Value = ds1.Tables[0].Rows[0]["enName"].ToString();
                    this.txt_chName.Value = ds1.Tables[0].Rows[0]["chName"].ToString();
                    this.txt_paixu.Value = ds1.Tables[0].Rows[0]["paiXu"].ToString();

                    DropDownList1.SelectedValue = ds1.Tables[0].Rows[0]["sId"].ToString();
                }
                this.lblTitle.Text = "修改出发城市信息";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加出发城市信息";
            }

        }
    }


    //添加或修改出发城市信息
    protected void btnSave_Click(object sender, EventArgs e)
    {
      
        if (id == 0)
        {
            string cityCode = Sys.filterSQLStr(this.txt_cityCode.Value.Trim());
            string enName = Sys.filterSQLStr(this.txt_enName.Value.Trim());
            string chName = Sys.filterSQLStr(this.txt_chName.Value.Trim());
            string paiXu = Sys.filterSQLStr(this.txt_paixu.Value.Trim());

            string bigId = DropDownList1.SelectedValue;
            string commandText = "INSERT INTO FY_FromCity(cityCode,enName,chName,sId,paiXu) values('" + cityCode + "','" + enName + "','" + chName + "','" + bigId + "','" + paiXu + "')";
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            
            if (count > 0)
            {
                scripthelp.AlertAndRedirect("添加出发城市信息成功!", "fromCity_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("添加出发城市失败!", this.Page);
                return;
            }
        }
        else
        {
            string cityCode = Sys.filterSQLStr(this.txt_cityCode.Value.Trim());
            string enName = Sys.filterSQLStr(this.txt_enName.Value.Trim());
            string chName = Sys.filterSQLStr(this.txt_chName.Value.Trim());
            string paiXu = Sys.filterSQLStr(this.txt_paixu.Value.Trim());

            string bigId = DropDownList1.SelectedValue;
            string commandText = "update FY_FromCity set cityCode='" + cityCode + "' ,enName='" + enName + "' ,chName='" + chName + "' ,sId='" + bigId + "',paiXu='" + paiXu + "' where fId='" + id + "'";
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            if (count > 0)
            {
                scripthelp.AlertAndRedirect("修改出发城市信息成功!", "fromCity_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("修改出发城市信息失败!", this.Page);
                return;
            }

        }
    }


}
