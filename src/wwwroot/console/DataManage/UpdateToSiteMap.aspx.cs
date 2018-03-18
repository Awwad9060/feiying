using System;
using System.Collections;
using System.Configuration;
using System.Data;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Text;
using System.IO;
using eap.share;

public partial class console_DataManage_UpdateToSiteMap : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    /// <summary>
    /// 过滤字符
    /// </summary>
    /// <param name="str"></param>
    /// <returns></returns>
    private string getStr(string str)
    {
        return str.Replace("\"", "").Replace("'", "").Replace("\\", " ");
    }

    /// <summary>
    /// 生成文件
    /// </summary>
    /// <param name="templetContent">文件的内容</param>
    /// <param name="fileUrl">文件的路径（包括文件名）</param>
    protected void CreateFile(string templetContent, string fileUrl)
    {
        try
        {
            Encoding code = Encoding.GetEncoding("utf-8");
            StreamWriter sw = new StreamWriter(HttpContext.Current.Server.MapPath(fileUrl), false, code);
            sw.Write(templetContent);
            sw.Flush();
            sw.Close();
            scripthelp.Alert("生成文件" + fileUrl + "成功", this.Page);
        }
        catch (Exception ex)
        {
            scripthelp.Alert(string.Format("生成文件{0}失败，原因：{1}", fileUrl, this.getStr(ex.Message)), this.Page);
        }
    }

    private string getString(string str)
    {
        return str.Replace("'", "").Replace("-", " ").Replace("(", "[").Replace(")", "]");
    }

    /// <summary>
    /// 更新
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btn_update_Click(object sender, EventArgs e)
    {
        try
        {

            StringBuilder str = new StringBuilder();
            str.Append("<?xml version=\"1.0\" encoding=\"UTF-8\"?>\n");
            str.Append("<urlset xmlns=\"http://www.sitemaps.org/schemas/sitemap/0.9\" xmlns:xsi=\"http://www.w3.org/2001/XMLSchema-instance\">\n");
            str.Append("<url>\n");
            str.Append("<loc>http://www.fei580.com</loc>\n");
            str.Append("<lastmod>" + new DateTime().ToString("yyyy-MM-dd HH:mm:ss") + "</lastmod>\n");
            str.Append("<changefreq>daily</changefreq>\n");
            str.Append("<priority>0.8</priority>\n");
            str.Append("</url>\n");
            //机票信息
            string sql = "select top 10000 tId,updatetime from FY_Ticket order by updatetime desc";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
            if (ds != null && ds.Tables.Count != 0 || ds.Tables[0] != null)
            {
                foreach (DataRow r in ds.Tables[0].Rows)
                {
                    str.Append("<url>\n");
                    str.Append("<loc>http://www.fei580.com/ticket_"+Convert.ToInt32(r["tId"])+".htm</loc>\n");
                    str.Append("<lastmod>"+ Convert.ToDateTime(r["updatetime"]).ToString("yyyy-MM-dd HH:mm:ss")+"</lastmod>\n");
                    str.Append("<changefreq>daily</changefreq>\n");
                    str.Append("<priority>0.8</priority>\n");
                    str.Append("</url>\n");
                }
            }
            //新闻信息
            string sql1 = "select top 1000 id,addtime from FY_news order by addtime desc";
            DataSet ds1 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql1);
            if (ds1 != null && ds1.Tables.Count != 0 || ds1.Tables[0] != null)
            {
                foreach (DataRow r in ds1.Tables[0].Rows)
                {
                    str.Append("<url>\n");
                    str.Append("<loc>http://www.fei580.com/news_"+Convert.ToInt32(r["id"])+".htm</loc>\n");
                    str.Append("<lastmod>"+ Convert.ToDateTime(r["addtime"]).ToString("yyyy-MM-dd HH:mm:ss")+"</lastmod>\n");
                    str.Append("<changefreq>daily</changefreq>\n");
                    str.Append("<priority>0.8</priority>\n");
                    str.Append("</url>\n");
                }
            }
            //机场信息
            string sql2 = "select top 1000 apId from FY_Airport order by apId desc";
            DataSet ds2 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql2);
            if (ds2 != null && ds2.Tables.Count != 0 || ds2.Tables[0] != null)
            {
                foreach (DataRow r in ds2.Tables[0].Rows)
                {
                    str.Append("<url>\n");
                    str.Append("<loc>http://www.fei580.com/airport/"+Convert.ToInt32(r["apId"])+".htm</loc>\n");
                    str.Append("<lastmod>"+ new DateTime().ToString("yyyy-MM-dd HH:mm:ss")+"</lastmod>\n");
                    str.Append("<changefreq>daily</changefreq>\n");
                    str.Append("<priority>0.8</priority>\n");
                    str.Append("</url>\n");
                }
            }
            //航空公司信息
            string sql3 = "select top 1000 aId from FY_Airline order by aId desc";
            DataSet ds3 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql3);
            if (ds3 != null && ds3.Tables.Count != 0 || ds3.Tables[0] != null)
            {
                foreach (DataRow r in ds3.Tables[0].Rows)
                {
                    str.Append("<url>\n");
                    str.Append("<loc>http://www.fei580.com/airline/"+Convert.ToInt32(r["aId"])+".htm</loc>\n");
                    str.Append("<lastmod>"+ new DateTime().ToString("yyyy-MM-dd HH:mm:ss")+"</lastmod>\n");
                    str.Append("<changefreq>daily</changefreq>\n");
                    str.Append("<priority>0.8</priority>\n");
                    str.Append("</url>\n");
                }
            }
            //trip信息
            string sql4 = "select top 1000 aId from FY_member_article where isCheck=1 order by aId desc";
            DataSet ds4 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql4);
            if (ds4 != null && ds4.Tables.Count != 0 || ds4.Tables[0] != null)
            {
                foreach (DataRow r in ds4.Tables[0].Rows)
                {
                    str.Append("<url>\n");
                    str.Append("<loc>http://www.fei580.com/trip/"+Convert.ToInt32(r["aId"])+".htm</loc>\n");
                    str.Append("<lastmod>" + new DateTime().ToString("yyyy-MM-dd HH:mm:ss") + "</lastmod>\n");
                    str.Append("<changefreq>daily</changefreq>\n");
                    str.Append("<priority>0.8</priority>\n");
                    str.Append("</url>\n");
                }
            }
            str.Append("</urlset>");
            this.CreateFile(str.ToString(), "../../sitemap.xml");
        }
        catch (Exception ex)
        {
            scripthelp.Alert("更新数据失败，原因：" + this.getStr(ex.Message), this.Page);
        }
    }
}
