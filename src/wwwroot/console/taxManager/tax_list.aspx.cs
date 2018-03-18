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

public partial class console_taxManager_tax_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            //获取机票列表
            GetShopNewslist();
        }
    }
    //获得税费列表
    protected void GetShopNewslist()
    {
        DataSet ds = new DataSet();

        string str = @"select top 100 percent FY_Airline.airlineCode as airlineCode,FY_Tax.taxType, FY_Airline.chName as airlineName, FY_Tax.id,FY_Tax.tax,FY_FromCity.cityCode as fromCityCode,FY_ToCity.cityCode as toCityCode,FY_FromCity.chName as fromCityName,FY_ToCity.chName as toCityName from FY_Tax ";
        str += " left join FY_FromCity on FY_FromCity.fId=FY_Tax.fromCity";
        str += " left join FY_ToCity on FY_ToCity.tId=FY_Tax.toCity";
        str += " left join FY_Airline on FY_Airline.aId=FY_Tax.airline";
        str += " order by FY_Tax.id desc  ";

        SqlParameter[] parameters = {
                    new SqlParameter("@sql", SqlDbType.NVarChar,4000),
                    new SqlParameter("@currentpage", SqlDbType.Int),
                    new SqlParameter("@pagesize", SqlDbType.Int)};

        parameters[0].Value = str;
        parameters[1].Value = Pager.CurrentPageIndex;
        parameters[2].Value = Pager.PageSize;


        ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);


        Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);

        Pager.CustomInfoHTML = "&nbsp;第" + Pager.CurrentPageIndex.ToString() + "页/共" + Pager.PageCount.ToString() + "页 总记录数：" + Pager.RecordCount.ToString();

        rptshopnews.DataSource = ds.Tables[1];

        rptshopnews.DataBind();
    }


    protected void btndel_Click(object sender, EventArgs e)
    {
        StringBuilder str = new StringBuilder();

        str.Append("delete from FY_Tax where id in (" + Request.Form["chk"] + ");");


        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);

        conn.Open();

        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {

                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                trans.Commit();
                scripthelp.AlertAndRedirect("操作成功！", "tax_list.aspx", this.Page);
            }
            catch
            {
                trans.Rollback();
                scripthelp.AlertAndRedirect("操作失败！", "tax_list.aspx", this.Page);
            }
            finally
            {
                conn.Close();
            }
        }
    }


    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        GetShopNewslist();
    }
}
