using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class airportDetail : System.Web.UI.Page
{
    protected int id = 0;
    public DataRow airlineOne = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["apId"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["apId"].ToString());
            airlineOne = GetAirPortDetail(id);

        }
        else
        {
            Response.Redirect("airport.aspx");
        }
    }

    #region
    protected DataRow GetAirPortDetail(int aid)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select * from FY_Airport where apId=" + aid;

        try
        {
            ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null && ds.Tables[0].Rows.Count != 0)
            {
                row = ds.Tables[0].Rows[0];
                ds.Dispose();
            }
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return row;
    }
    #endregion
}
