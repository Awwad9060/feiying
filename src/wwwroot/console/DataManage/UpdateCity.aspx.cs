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

public partial class console_DataManage_UpdateCity : System.Web.UI.Page
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
            string sql = "select a.*,b.chName as stateName from FY_ToCity as a  left join FY_State as b on a.sId =b.sId where 1=1";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
            if (ds == null || ds.Tables.Count == 0 || ds.Tables[0] == null)
            {
                scripthelp.Alert("没有获取到数据！", this.Page);
                return;
            }

            StringBuilder str = new StringBuilder();
            str.Append("var CityData=");
            str.Append("\n");
            str.Append("[");
            str.Append("\n");
            foreach (DataRow r in ds.Tables[0].Rows)
            {
                if (string.IsNullOrEmpty(r["chName"].ToString()))
                    continue;
                str.Append("{z:\"" + this.getString(r["chName"] + "") + "\",p:\"" + this.getString(r["enName"] + "") + "\",i:\"" + this.getString(r["cityCode"] + "") + "\"},");
                str.Append("\n");
            }
            str.Append("];");
            str.Append("\n");

            this.CreateFile(str.ToString(), "../../CityClient/CityData.js");
        }
        catch (Exception ex)
        {
            scripthelp.Alert("更新数据失败，原因：" + this.getStr(ex.Message), this.Page);
        }
    }
}
