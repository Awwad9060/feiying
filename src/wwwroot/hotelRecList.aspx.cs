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

public partial class hotelRecList : System.Web.UI.Page
{
    protected DataRowCollection hotelList = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        string cityname = "广州";
        if (Request.QueryString["cityname"] != null && Request.QueryString["cityname"].ToString() != "")
        {
            cityname = Request.QueryString["cityname"].ToString();
        }

        hotelList = getHotelList(cityname, 8);
    }


    protected DataRowCollection getHotelList(string cityName, int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from FY_HotelRec where cityName='" + cityName + "' order by hId desc";
        try
        {
            Rerow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return Rerow;

    }
}
