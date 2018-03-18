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

public partial class IdsSearch : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }

    protected void IDS_Search(object sender, EventArgs e)
    {
        Response.Redirect("IDS.aspx?fromcity=" + fromcityStr.Value.Trim() + "&tocity=" + ids_tocity.Value.Trim() + "&year=" + DateTime.Now.Year.ToString() + "");

        //DataSet ds = null;
        //string str = "select FY_IDS.*,FY_FromCity.chName as fromCityname,FY_FromCity.cityCode as fromCityCode, FY_ToCity.chName as toCityname,FY_ToCity.cityCode as toCityCode from FY_IDS left join FY_FromCity on FY_FromCity.fId=FY_IDS.fromId left join FY_ToCity on FY_ToCity.tId=FY_IDS.toId  where FY_FromCity.chName='" + fromcityStr.Value.Trim() + "'  and FY_ToCity.chName='" + ids_tocity.Value.Trim() + "'";

        //try
        //{
        //    ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        //    if (ds != null && ds.Tables[0].Rows.Count != 0)
        //    {
        //        Response.Redirect("IDS.aspx?fromcity=" + fromcityStr.Value.Trim() + "&tocity=" + ids_tocity.Value.Trim());
        //    }
        //    else
        //    {
        //        scripthelp.Alert("sorry,暂无此航线的IDS服务提供！!", this.Page);
        //        return;
        //    }

        //}
        //catch (Exception err)
        //{
        //    HttpContext.Current.Response.Write(err.Message);
        //    HttpContext.Current.Response.End();
        //}
    }
}
