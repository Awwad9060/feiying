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

public partial class person_myfeedinfo : System.Web.UI.Page
{
    protected string Mem_LoginName = string.Empty;
    protected string Mem_ID = string.Empty;
    protected string Mem_Money = string.Empty;

    protected string title = string.Empty;
    protected string context = string.Empty;
    protected string state = string.Empty;
    protected string addtime = string.Empty;


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

            int id=0;
            if(Request.QueryString["id"]!=null)
                if(int.TryParse(Request.QueryString["id"].ToString(),out id))
                {
                    string str = "select top 1 * from FY_feedback where fId="+id;
                    
                   DataSet ds= SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                   if(ds!=null)
                       if (ds.Tables[0].Rows.Count > 0)
                       {
                           DataRow dr = ds.Tables[0].Rows[0];
                           title=dr["title"].ToString();
                           context = dr["context"].ToString();
                           context = Sys.filterSQLStr(context);
                           context = context.Replace("\n", "<br>");
                           context = context.Replace("  ", "&nbsp;&nbsp");

                           state = dr["state"].ToString();
                           addtime = dr["addtime"].ToString();
                       }
                
                }
        }
    }
}
