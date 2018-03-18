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


public partial class airplaneDetail : System.Web.UI.Page
{
    protected int id = 0;
    public DataRow airlineOne = null;
    public DataTable airlinePic = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["pId"] != null)
        {
            id = Convert.ToInt32(Request.QueryString["pId"].ToString());
            airlineOne = GetAirPlaneDetail(id);

            if (string.IsNullOrEmpty(airlineOne["pic2"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic3"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic4"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic5"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic6"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic7"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic8"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic9"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic10"].ToString())
                && string.IsNullOrEmpty(airlineOne["pic11"].ToString())
                )
                this.panelPic.Visible = false;
        }
        else
        {
            Response.Redirect("airplane.aspx");
        }
    }

    #region
    protected DataRow GetAirPlaneDetail(int aid)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select * from FY_Airplan where pId=" + aid;

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
