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

public partial class console_person_feedbackadd : System.Web.UI.Page
{
    static int id =0;

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
            if (Request.QueryString["id"] != null)
                if (int.TryParse(Request.QueryString["id"].ToString(), out id))
                {
                    string str = "select top 1 * from FY_feedback left join tmember on  tmember.Mem_ID=FY_feedback.memberId where fId=" + id;

                    DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                    if (ds != null)
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            DataRow dr = ds.Tables[0].Rows[0];
                            title.Value = dr["title"].ToString();
                            context.Value = dr["context"].ToString();
                            if (dr["state"].ToString().Trim().Equals("0"))
                                stateu.Checked = true;
                            else
                                statee.Checked = true;
                            addtime.Value = dr["addtime"].ToString();
                            username.Value = dr["Mem_LoginName"].ToString();
                            tel.Value = dr["Mem_Tel"].ToString();
                            email.Value = dr["Mem_Email"].ToString();
                        }

                }
            this.lblTitle.Text = "修改会员反馈信息";
        }
    }


    /// <summary>
    ///修改会员反馈信息
    /// </summary> 
    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (string.IsNullOrEmpty(title.Value))
        {
            scripthelp.Alert("标题不为空！",this.Page);
            return;
        }

        string sta = "0";
        if (statee.Checked)
            sta = "1";

        string str = "UPDATE FY_feedback SET title = '" + title.Value + "',context='" + context.Value + "',state='"+sta+"' WHERE fId = " + id + "";
        
        int inserttag = 0;

        inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (inserttag > 0)
        {
            Response.Write("<script>alert('操作成功！');location.href='feedbacklist.aspx'</script>");
        }
        else
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");


    }

}
