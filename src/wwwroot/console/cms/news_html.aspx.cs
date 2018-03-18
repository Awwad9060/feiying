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

public partial class console_cms_news_html : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }
    }
    /// <summary>
    /// 按分类来生成内容页（先删除后生成）
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btntypeOK_Click(object sender, EventArgs e)
    {
        string str2 = "select * from FY_art_templet where id= 11";

        //模板内容
        string tempcontent = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str2).Tables[0].Rows[0]["tpContent"].ToString();

        string str3 = "select * from FY_news order by id desc";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str3).Tables[0];

        string String_News = null;

        //删除某一分类的所有内容页，重新生成
        for (int i = 0; i < dt.Rows.Count; i++)
        {
            string title = "", body = "", type = "", typeclass1 = "", typeclass2 = "", newsfrom = "";

            int nId = 0, foder = 0;

            DateTime Date = new DateTime();

            title = dt.Rows[i]["title"].ToString();
            body = dt.Rows[i]["content"].ToString();   
            nId = Convert.ToInt32(dt.Rows[i]["id"].ToString());
            Date = Convert.ToDateTime(dt.Rows[i]["addtime"].ToString());

            newsfrom = "[ 日期："+Date+" ]   来源："+dt.Rows[i]["newsfrom"].ToString()+"";

            if(Convert.ToInt32(dt.Rows[i]["type"].ToString())==0)
            {
                type="行内新闻";
                typeclass1 = "sel";
                typeclass2 = "sel_n";
            }
            else if (Convert.ToInt32(dt.Rows[i]["type"].ToString()) == 1)
            {
                type="建站知识";
                typeclass1 = "sel_n";
                typeclass2 = "sel";
            }
            else if (Convert.ToInt32(dt.Rows[i]["type"].ToString()) == 2)
            {
                type = "天维资讯";
                typeclass1 = "sel_n";
                typeclass2 = "sel";
            }
            else if (Convert.ToInt32(dt.Rows[i]["type"].ToString()) == 3)
            {
                type = "网站优化SEO";
                typeclass1 = "sel_n";
                typeclass2 = "sel";
            }
            else if (Convert.ToInt32(dt.Rows[i]["type"].ToString()) == 4)
            {
                type = "域名主机邮箱";
                typeclass1 = "sel_n";
                typeclass2 = "sel";
            }


            string _picPath = "../../news/";

            string _physicPath = Server.MapPath(_picPath);


            if (!Directory.Exists(_physicPath))
                Directory.CreateDirectory(_physicPath);
            Encoding code = Encoding.GetEncoding("gb2312");


            string htmlurl = _picPath+"n_" + nId + ".html"; //存放到数据库的路径

            CreateHtml(tempcontent, htmlurl, title, body, type, newsfrom, typeclass1, typeclass2);
        }
        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);
        conn.Open();
        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {
                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str3.ToString());
                trans.Commit();
                scripthelp.Alert("批量生成资讯内容页成功!", this.Page);

            }
            catch
            {
                trans.Rollback();
                scripthelp.Alert("删除资讯内容页失败!", this.Page);

            }
            finally
            {
                conn.Close();
            }
        }

    }


    /// <summary>
    /// 生成html
    /// </summary>
    /// <param name="title">标题</param>
    /// <param name="body">主题</param>
    /// <param name="prv">上一条</param>
    /// <param name="nex">下一条</param>
    protected void CreateHtml(string templetContent, string htmlurl,string title, string body,string strtype,string strfrom,string strclass1,string strclass2)
    {
        Encoding code = Encoding.GetEncoding("gb2312");

        StreamWriter sw = null;
        templetContent = templetContent.Replace("$titles", title);
        templetContent = templetContent.Replace("$contents", body);
        templetContent = templetContent.Replace("$arttype", strtype);
        templetContent = templetContent.Replace("$artfrom", strfrom);
        templetContent = templetContent.Replace("$artclass1", strclass1);
        templetContent = templetContent.Replace("$artclass2", strclass2);

        try
        {
            sw = new StreamWriter(HttpContext.Current.Server.MapPath(htmlurl), false, code);
            sw.Write(templetContent);
            sw.Flush();
        }
        catch (Exception ex)
        {
            HttpContext.Current.Response.Write(ex.Message);
            HttpContext.Current.Response.End();
            HttpContext.Current.Response.Write("<script>alert('生成静态新闻页面失败！');history.back();</script>");
        }
        finally
        {
            sw.Close();
        }

    }

}
