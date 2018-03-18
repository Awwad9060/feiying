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
using System.IO;

public partial class person_myjouradd : System.Web.UI.Page
{

    //用户对象
    protected MemberItem memberitem = new MemberItem();

    protected string Mem_LoginName = string.Empty;
    protected string Mem_ID = string.Empty;
    protected string Mem_Money = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断登陆
        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null || Session["Mem_Money"] == null)
            Response.Redirect("../index.aspx");
        else
        {
            Mem_LoginName = Session["Mem_LoginName"].ToString();
            Mem_ID = Session["Mem_ID"].ToString();
            Mem_Money = Session["Mem_Money"].ToString();
        }
    }

    protected void Butt_submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(title.Value))
            {
                scripthelp.Alert("日记标题不为空！", this.Page);
                return;
            }

            string str = "insert into FY_jour(title,context,addtime,memberId) values('" + Sys.filterSQLStr(title.Value.Trim()) + "','" + Sys.filterSQLStr(context.Value) + "',getdate()," + Mem_ID + ")";

            int inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='myjouradd.aspx'</script>");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");

        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
}
