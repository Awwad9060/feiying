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

public partial class console_DataManage_UpdateAirLine : System.Web.UI.Page
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
            System.Web.Caching.Cache _cache = HttpRuntime.Cache;
            _cache.Remove("AirLineData_Cache");

            string sql = "select * from FY_AirLine";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0] == null)
            {
                scripthelp.Alert("没有获取到数据！", this.Page);
                return;
            }

            StringBuilder str = new StringBuilder();
            str.Append("<?xml version=\"1.0\" encoding=\"utf-8\" ?>\n");
            str.Append("<data>\n");
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                if (string.IsNullOrEmpty(r["chName"].ToString()))
                    continue;
                str.Append("<item>\n");
                str.Append("<id>" + r["aId"] + "</id>\n");
                str.Append("<code>" + this.getString(r["airlinecode"].ToString()) + "</code>\n");
                str.Append("<name>" + this.getString(r["chName"].ToString()) + "</name>\n");
                str.Append("<pic>" + r["smallPic"] + "</pic>\n");
                str.Append("</item>\n");
            }
            str.Append("</data>");
            this.CreateFile(str.ToString(), "../../xml/AllAirLine.xml");
        }
        catch (Exception ex)
        {
            scripthelp.Alert("更新数据失败，原因：" + this.getStr(ex.Message), this.Page);
        }
    }
}
