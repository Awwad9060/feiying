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
using System.Data.SqlClient;
using eap.share;

public partial class person_myjourinfo : System.Web.UI.Page
{
    protected string Mem_LoginName = string.Empty;
    protected string Mem_ID = string.Empty;
    protected string Mem_Money = string.Empty;

    protected string title_1 = string.Empty;
    protected string context_1 = string.Empty;

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

            int id = 0;
            if (Request.QueryString["id"] != null)
                if (int.TryParse(Request.QueryString["id"].ToString(), out id))
                {
                    string str = "select top 1 * from FY_jour where jId=" + id;

                    DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                    if (ds != null)
                        if (ds.Tables[0].Rows.Count > 0)
                        {
                            DataRow dr = ds.Tables[0].Rows[0];
                            title_1 = dr["title"].ToString();
                            context_1 = dr["context"].ToString();
                        }

                    if (!IsPostBack)
                    {
                        title.Value = title_1;
                        context.Value = context_1;
                    }

                }
        }
    }

    protected void Butt_submit_Click(object sender, EventArgs e)
    {
        if(string.IsNullOrEmpty(title.Value))
        {
            scripthelp.Alert("日记标题不为空！",this.Page);
            return;
        }

        int id = 0;
        if (Request.QueryString["id"] != null)
            if (int.TryParse(Request.QueryString["id"].ToString(), out id))
            {
                string str = "update FY_jour set title='" + title.Value + "',context='" + context.Value + "',updatetime=getdate() where jId=" + id;
                
                int inserttag = 0;

                inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                if (inserttag > 0)
                {
                    Response.Write("<script>alert('操作成功！');location.href='myjourlist.aspx'</script>");
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");
            }
    }
}

