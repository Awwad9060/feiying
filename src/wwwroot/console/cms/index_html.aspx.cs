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

public partial class console_cms_index_html : System.Web.UI.Page
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
    /// 传入URL返回网页的html代码
    /// </summary>
    /// <param name="Url">URL</param>
    /// <returns></returns>
    public string getUrltoHtml(string Url)
    {
        string errorMsg = "";
        try
        {
            System.Net.WebRequest wReq = System.Net.WebRequest.Create(Url);

            System.Net.WebResponse wResp = wReq.GetResponse();

            System.IO.Stream respStream = wResp.GetResponseStream();

            System.IO.StreamReader reader = new System.IO.StreamReader(respStream, System.Text.Encoding.GetEncoding("utf-8"));

            return reader.ReadToEnd();

        }
        catch (System.Exception ex)
        {
            errorMsg = ex.Message;
        }
        return "";
    }

    /// <summary>
    /// 按分类来生成内容页（先删除后生成）
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btntypeOK_Click(object sender, EventArgs e)
    {
        string fileInfo = "";
        fileInfo = getUrltoHtml("http://www.Fei580.com/Default.aspx");



       Encoding code = Encoding.GetEncoding("gb2312");

       StreamWriter sw = null;
       fileInfo=
       fileInfo=fileInfo.Replace("<head>","<head><meta http-equiv=\"Content-Type\" content=\"text/html; charset=gb2312\" />");

       try
       {
           sw = new StreamWriter(HttpContext.Current.Server.MapPath("../../index.html"), false, code);
           sw.Write(fileInfo);
           sw.Flush();
           scripthelp.Alert("生成Fei580.com首页成功!", this.Page);
       }
       catch (Exception ex)
       {
           HttpContext.Current.Response.Write(ex.Message);
           HttpContext.Current.Response.End();
           HttpContext.Current.Response.Write("<script>alert('生成静态首页失败！');history.back();</script>");
       }
       finally
       {
           sw.Close();
       }
    }
}
