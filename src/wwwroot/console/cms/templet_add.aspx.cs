using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.IO;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class cms_templet_add : System.Web.UI.Page //编辑文章模版信息
{
    static int id = 0;

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
                //id = Convert.ToInt32(Req.GetPara("id"));
                string commandText = "select * from FY_art_templet where id='" + id + "'";
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText);
                this.txttpName.Value = ds.Tables[0].Rows[0]["tpName"].ToString();
                this.txtmodel.Text = ds.Tables[0].Rows[0]["tpContent"].ToString();
                this.lblTitle.Text = "修改资讯模版信息";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加资讯模版信息";
            }
           
        }
    }

    //添加或修改文章模版信息
    protected void btnSave_Click(object sender, EventArgs e)
    {
   
        if (id == 0)
        {
            string tpName = Sys.filterSQLStr(this.txttpName.Value.Trim());

            string commandText = "INSERT INTO FY_art_templet(tpName,tpContent)values('" + tpName + "','" + txtmodel.Text.Trim() + "')";
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);

            if (count > 0)
            {
                scripthelp.AlertAndRedirect("添加资讯模版信息成功!", "templet_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("添加资讯模版信息失败!", this.Page);
                return;
            }
        }
        else
        {
            string tpName = Sys.filterSQLStr(this.txttpName.Value.Trim());

            string commandText = "update FY_art_templet set tpName='" + tpName + "',tpContent='" + txtmodel.Text.Trim() + "' where id='" + id + "'";
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            if (count > 0)
            {
                scripthelp.AlertAndRedirect("修改资讯模版信息成功!", "templet_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("修改资讯模版信息失败!", this.Page);
                return;
            }

        }
    }
}

