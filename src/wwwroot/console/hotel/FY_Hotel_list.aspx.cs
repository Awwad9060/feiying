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

public partial class console_hotel_FY_Hotel_list : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
        if (adminmerinfo == null)
        {

            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }
        else
        {
            if (adminmerinfo.Flag == 2)
            {
                btndel.Visible = false;
            }
        }
        if (!IsPostBack)
        {
            setCityList();

            //获取列表
            GetHotellist();

        }
    }


    /// <summary>
    /// 绑定城市
    /// </summary>
    private void setCityList()
    {
        string str = "select * from FY_HotelCity order by chName";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

        this.sel_cityName.DataSource = dt;
        this.sel_cityName.DataTextField = "chName";
        this.sel_cityName.DataValueField = "tId";
        this.sel_cityName.DataBind();

        this.sel_cityName.Items.Insert(0, new ListItem(":::: 所属城市 :::: ", ""));
    }

    protected void GetHotellist()
    {

        DataSet ds = new DataSet();


        string str = @"select top 100 percent FY_Hotel.*,FY_HotelCity.chName from FY_Hotel left join FY_HotelCity on FY_HotelCity.tId =cityId where 1=1 ";

        if (!string.IsNullOrEmpty(this.txtsearch.Value))
        {
            str += " and HotelName like '%" + this.txtsearch.Value.Trim() + "%'";
        }

        if (!string.IsNullOrEmpty(this.sel_cityName.Value))
        {
            str += " and FY_HotelCity.tId=" + Convert.ToInt32(this.sel_cityName.Value) + " ";
        }

        if (!string.IsNullOrEmpty(this.sel_pass.Value))
        {
            if (this.sel_pass.Value=="0")
                str += " and FY_Hotel.toDate>='" + DateTime.Now.ToShortDateString() + "' ";
            else
                str += " and FY_Hotel.toDate<'" + DateTime.Now.ToShortDateString() + "' ";
        }

        str += "order by hId desc";

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

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        GetHotellist();
    }


    /// <summary>
    /// 设置置顶状态标记
    /// </summary>
    /// <param name="bs"></param>
    /// <returns></returns>
    public string Check_stat(int bs)
    {
        string str_name = "";
        if (bs == 1)
        {
            str_name = "<span style='color:#66cc00'>置顶酒店</span>";
        }
        else
        {
            str_name = "<span style='color:#fe6500'>无</span>";

        }
        return str_name;
    }

    /// <summary>
    /// 设置推荐状态标记
    /// </summary>
    /// <param name="bs"></param>
    /// <returns></returns>
    public string Recom_stat(int bs)
    {
        string str_name = "";
        if (bs == 1)
        {
            str_name = "<span style='color:#66cc00'>推荐酒店</span>";

        }
        else
        {
            str_name = "<span style='color:#fe6500'>无</span>";

        }
        return str_name;
    }


    /// <summary>
    /// 删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btndel_Click(object sender, EventArgs e)
    {
        StringBuilder str = new StringBuilder();

        str.Append("delete from FY_Hotel where hId in (" + Request.Form["chk"] + ");");


        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);

        conn.Open();

        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {

                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                trans.Commit();
                scripthelp.AlertAndRedirect("操作成功！", "FY_Hotel_list.aspx", this.Page);
            }
            catch
            {
                trans.Rollback();
                scripthelp.AlertAndRedirect("操作失败！", "FY_Hotel_list.aspx", this.Page);
            }
            finally
            {
                conn.Close();
            }
        }
    }



    /// <summary>
    /// 对所选择的项进行置顶
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btncheck_Click(object sender, EventArgs e)
    {
        string str = "update FY_Hotel set isTop=1 where hId in (" + Request.Form["chk"] + ")";

        int chktag = 0;

        chktag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (chktag > 0)
            scripthelp.AlertAndRedirect("操作成功！", "FY_Hotel_list.aspx", this.Page);
        else
            scripthelp.AlertAndRedirect("操作失败！", "FY_Hotel_list.aspx", this.Page);

    }

    /// <summary>
    /// 推荐案例操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnrecom_Click(object sender, EventArgs e)
    {
        string str = "update FY_Hotel set isRecom=1 where hId in (" + Request.Form["chk"] + ")";

        int chktag = 0;

        chktag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (chktag > 0)
            scripthelp.AlertAndRedirect("操作成功！", "FY_Hotel_list.aspx", this.Page);
        else
            scripthelp.AlertAndRedirect("操作失败！", "FY_Hotel_list.aspx", this.Page);
    }

    /// <summary>
    /// 取消置顶操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btncancelchk_Click(object sender, EventArgs e)
    {
        string str = "update FY_Hotel set isTop=0 where hId in (" + Request.Form["chk"] + ")";

        int chktag = 0;

        chktag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (chktag > 0)
            scripthelp.AlertAndRedirect("操作成功！", "FY_Hotel_list.aspx", this.Page);
        else
            scripthelp.AlertAndRedirect("操作失败！", "FY_Hotel_list.aspx", this.Page);

    }

    /// <summary>
    /// 取消推荐操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btncancelrecom_Click(object sender, EventArgs e)
    {
        string str = "update FY_Hotel set isRecom=0 where hId in (" + Request.Form["chk"] + ")";

        int chktag = 0;

        chktag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

        if (chktag > 0)
            scripthelp.AlertAndRedirect("操作成功！", "FY_Hotel_list.aspx", this.Page);
        else
            scripthelp.AlertAndRedirect("操作失败！", "FY_Hotel_list.aspx", this.Page);
    }


    protected void btnsearch_Click(object sender, EventArgs e)
    {
        GetHotellist();
    }
}
