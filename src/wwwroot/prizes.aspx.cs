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


public partial class prizes : System.Web.UI.Page
{
    protected DataRowCollection newPrizes = null;

    protected  int typeId = 0;

    protected  string orderField = "pId";

    protected  string typeName = "所有奖品";

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            
                if (Request.QueryString["typeId"] != null)
                {
                    typeId = Convert.ToInt32(Request.QueryString["typeId"].ToString());
                    if (typeId == 1) typeName = "时尚达人";
                    if (typeId == 2) typeName = "数码精品";
                    if (typeId == 3) typeName = "旅行专家";
                    if (typeId == 4) typeName = "机票折扣";
                    if (typeId == 5) typeName = "酒店住宿";
                }

                if (Request.QueryString["orderField"] != null)
                {
                    orderField = Request.QueryString["orderField"].ToString();
                    if (orderField == "getNum")
                    {
                        radio1.Checked = true;
                        radio2.Checked = false;
                    }

                    if (orderField == "needScore")
                    {
                        radio2.Checked = true;
                        radio1.Checked = false;
                    }
                }
                GetPrizeslist();
       
            }
            newPrizes = getPrizeList(8);
        }

        protected void GetPrizeslist()
        {

            DataSet ds = new DataSet();


            string str = @"select top 100 percent * from FY_Prizes  where 1=1";


            if (typeId != 0)
            {
                str = str + " and type=" + typeId;
            }


            str += " order by " + orderField + " desc";


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

            prizesList.DataSource = ds.Tables[1];

            prizesList.DataBind();
        }

        /// <summary>
        /// 分页事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            GetPrizeslist();
        }



    protected DataRowCollection getPrizeList(int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from FY_Prizes order by pId desc";
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
