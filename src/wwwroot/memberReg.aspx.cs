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

public partial class memberReg : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {

        }
        AjaxPro.Utility.RegisterTypeForAjax(typeof(memberReg));
    }

    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string CheckUserName(string username)
    {
        if (CheckUser(username) == true)
            return "ok";
        else
            return "false";
    }

    /// <summary>
    /// 对数据库进行检测
    /// </summary>
    /// <param name="username"></param>
    /// <returns></returns>
    protected bool CheckUser(string username)
    {

        string str = "if not exists (select Mem_ID from tmember where Mem_LoginName='" + Sys.filterSQLStr(username) + "') select 1 else select 0";

        if (SqlHelper.ExecuteScalar(SqlHelper.ConnString_select, CommandType.Text, str).ToString() == "0")
            return false;
        else
            return true;
    }

    /// <summary>
    /// 提交注册信息
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnok_Click(object sender, EventArgs e)
    {
        StringBuilder str = new StringBuilder();
        if (CheckUser(shortname.Value.Trim())==false)
        {
            Response.Write("<script>alert('该用户名已被注册！');history.go(-1);</script>");
        }
        else
        {
            if (string.IsNullOrEmpty(this.shortname.Value))
            {
                scripthelp.Alert("用户名不为空！",this.Page);
                return;
            }

            if (string.IsNullOrEmpty(this.pwd1.Value))
            {
                scripthelp.Alert("密码不能为空！", this.Page);
                return;
            }
            if (string.IsNullOrEmpty(this.pwd2.Value))
            {
                scripthelp.Alert("确认密码不能为空！", this.Page);
                return;
            }
            if (this.pwd1.Value != this.pwd2.Value)
            {
                scripthelp.Alert("两次密码不一致！", this.Page);
                return;
            }
            if (string.IsNullOrEmpty(this.trueName.Value))
            {
                scripthelp.Alert("真实姓名不能为空！", this.Page);
                return;
            }
            if (string.IsNullOrEmpty(this.tel.Value))
            {
                scripthelp.Alert("电话不能为空！", this.Page);
                return;
            }
            if (string.IsNullOrEmpty(this.emailusername.Value))
            {
                scripthelp.Alert("邮箱不能为空！", this.Page);
                return;
            }

            string sex = "M";
            if (sex1.Checked)
            {
                sex = "M";
            }
            if (sex2.Checked)
            {
                sex = "W";
            }

            str.Append("insert into tmember(Mem_LoginName,Mem_LoginPasd,Mem_Email,Mem_Sex,Mem_Name,Mem_Tel,Mem_Money,Mem_RegistDate,mem_type,mem_pic)");

            str.Append(" values('" + shortname.Value.Trim() + "','" + Sys.md5(pwd1.Value.Trim()) + "','" + emailusername.Value.Trim() + "','" + sex + "','" + trueName.Value.Trim() + "','" + tel.Value.Trim() + "',50,getdate(),'飞瀛行者','/images/onein029.jpg')");

            int inserttag = 0;
            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str.ToString());

            if (inserttag > 0)
            {
                Session["Mem_LoginName"] = shortname.Value.Trim();
                string str1 = "select Mem_ID,Mem_Money,Mem_pic,Mem_type from tmember where Mem_LoginName='" + shortname.Value.Trim() + "'";
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str1);
                if (ds != null)
                {
                    Session["Mem_ID"] = Convert.ToInt32(ds.Tables[0].Rows[0]["Mem_ID"].ToString());
                    Session["Mem_Money"] = Convert.ToInt32(ds.Tables[0].Rows[0]["Mem_Money"].ToString());
                    Session["Mem_pic"] = ds.Tables[0].Rows[0]["Mem_pic"].ToString();
                    Session["Mem_type"] = ds.Tables[0].Rows[0]["Mem_type"].ToString();
                }
                Response.Write("<script>alert('注册成功！');location.href='index.aspx'</script>");
            }
            else
            {
                Response.Write("<script>alert('注册失败！');history.go(-1);</script>");
            }
        }
    }
}
