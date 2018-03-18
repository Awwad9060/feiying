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
using System.Text;
using eap.share;

public partial class IDS : System.Web.UI.Page
{
    protected DataRow resultOne = null;
    protected string fromcity = string.Empty;
    protected string tocity = string.Empty;
    protected int preYear = 0;
    protected int Year = 0;
    protected int nextYear = 0;
    protected int minMonth = 0;
    protected decimal minPrice = 0;
    protected int maxMonth = 0;
    protected decimal maxPrice = 0;
    protected decimal subPrice = 0;
  
    protected void Page_Load(object sender, EventArgs e)
    {

        if (Request.QueryString["fromcity"] != null && Request.QueryString["tocity"] != null && Request.QueryString["year"] != null)
        {
            this.fromcity = Request.QueryString["fromcity"].ToString();
            this.tocity = Request.QueryString["tocity"].ToString();
            this.Year = Convert.ToInt32(Request.QueryString["year"].ToString());
            this.preYear = Year - 1 ;
            this.nextYear = Year + 1;

            DataSet ds = this.GetAvgPriceMonth(Year, fromcity, tocity, out minMonth, out minPrice, out maxMonth, out maxPrice, out subPrice);

            //立体感觉深度
            this.columnChart.Depth = 10;
            //动态升长时间
            this.columnChart.ColumnGrowTime = 5;
            this.columnChart.Width = new Unit(800);
            this.columnChart.Height = new Unit(300);
            this.columnChart.PlotAreaBackgroundColor = System.Drawing.Color.Yellow;

            this.columnChart.ChartDirectory = "~/amcharts/amcolumn/";
            //柱型1
            am.Charts.ColumnChartGraph ccg = new am.Charts.ColumnChartGraph();
            ccg.DataSource = ds;
            ccg.DataSeriesItemIDField = "Month";
            ccg.Title = fromcity +"-" + tocity +"月平均价格";
            ccg.DataValueField = "Price";
            //形状,可以是柱型,也可以是线型
            ccg.GraphType = am.Charts.ColumnChartGraphTypes.Column;
            this.columnChart.Graphs.Add(ccg);

            //设置上面显示的文字格式
            this.columnChart.DataSource = ds;
            this.columnChart.DataSeriesIDField = "Month";
            this.columnChart.DataBind();
            this.resultOne = this.GetIDSDetail(this.fromcity, this.tocity);
        }
        else
        {
            Response.Redirect("international.aspx");
        }
    }

    /// <summary>
    /// 
    /// </summary>
    /// <param name="year"></param>
    /// <param name="fromcity"></param>
    /// <param name="tocity"></param>
    /// <param name="minMonth"></param>
    /// <param name="minPrice"></param>
    /// <param name="maxMonth"></param>
    /// <param name="maxPrice"></param>
    /// <param name="subPrice"></param>
    /// <returns></returns>
    private DataSet GetAvgPriceMonth(int year, string fromcity, string tocity, out int minMonth, out decimal minPrice, out int maxMonth, out decimal maxPrice, out decimal subPrice)
    {
        DataSet ds = new DataSet();
        DataTable dt = new DataTable();
        dt.Columns.Add("Month");
        dt.Columns.Add("Price");
        ds.Tables.Add(dt);

        minPrice = maxPrice = subPrice = 0;
        minMonth = maxMonth = 1;

        StringBuilder str = new StringBuilder();
        for (int m = 1; m < 13; m++)
        {
            DateTime time = new DateTime(year, m, 1);
            string start = time.ToString("yyyy-MM-dd");
            string end = time.AddMonths(1).AddDays(-1).ToString("yyyy-MM-dd");

            str.Append("select avg(untaxPrice) from FY_Ticket");
            str.Append(" left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity");
            str.Append(" left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity");
            str.Append(" left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine");
            str.Append(string.Format(" where FY_FromCity.chName='{0}' and FY_ToCity.chName = '{1}'", fromcity, tocity));
            str.Append(string.Format(" and FY_Ticket.fromtripDate <= '{0}' and FY_Ticket.totripDate >= '{1}';", end, start));
        }
        DataSet result = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str.ToString());
        if (result == null || result.Tables == null || result.Tables.Count == 0)
            return ds;

        for (int i = 0; i < result.Tables.Count; i++)
        {
            decimal price = 0;
            if (result.Tables[i].Rows[0][0] != DBNull.Value) price = Convert.ToDecimal(result.Tables[i].Rows[0][0]);

            if (minPrice == 0 || (price < minPrice && price != 0))
            {
                minMonth = i + 1;
                minPrice = price;
            }
            if (price > maxPrice && price != 0)
            {
                maxMonth = i + 1;
                maxPrice = price;
            }
            dt.Rows.Add(i + 1, price);
        }
        if (ds.Tables[0].Rows.Count == 0) return ds;

        for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
        {
            DataRow dr = ds.Tables[0].Rows[i];
            if (Convert.ToDecimal(dr["Price"]) == 0)
            {
                dr["Price"] = minPrice;
                if (minMonth > (i + 1)) minMonth = i + 1;
            }
            subPrice += Convert.ToDecimal(dr["Price"]);
        }

        return ds;
    }

    /// <summary>
    /// 根据月份获取平均价格
    /// </summary>
    /// <param name="year"></param>
    /// <param name="month"></param>
    /// <param name="fromcity"></param>
    /// <param name="tocity"></param>
    /// <returns></returns>
    private decimal GetPrice(int year,int month,string fromcity,string tocity)
    {
        DateTime dt = new DateTime(year, month, 1); 
        string start = dt.ToString("yyyy-MM-dd");
        string end = dt.AddMonths(1).AddDays(-1).ToString("yyyy-MM-dd");

        string str = @"select avg(untaxPrice) from FY_Ticket ";
        str += " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity";
        str += " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity";
        str += " left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine";
        str += " where FY_FromCity.chName='" + fromcity + "' and FY_ToCity.chName = '" + tocity + "'";
        str += " and FY_Ticket.fromtripDate <= '" + end + "' and FY_Ticket.totripDate >= '" + start + "'";
        object obj = SqlHelper.ExecuteScalar(SqlHelper.ConnString_select, CommandType.Text, str);
        decimal result = 0;
        decimal.TryParse(obj.ToString(), out result);
        return result;
    }

    protected DataRow GetIDSDetail(string fromcity, string tocityName)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select FY_IDS.*,FY_FromCity.chName as fromCityname,FY_FromCity.cityCode as fromCityCode, FY_ToCity.chName as toCityname,FY_ToCity.cityCode as toCityCode from FY_IDS left join FY_FromCity on FY_FromCity.fId=FY_IDS.fromId left join FY_ToCity on FY_ToCity.tId=FY_IDS.toId  where FY_FromCity.chName='" + fromcity + "'  and FY_ToCity.chName='" + tocityName + "'";

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
}
