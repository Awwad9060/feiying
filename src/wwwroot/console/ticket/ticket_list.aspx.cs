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

public partial class console_airline_airline_list : System.Web.UI.Page
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
            //获取机票列表
            GetShopNewslist();

            //绑定出发城市 
            string commandText3 = "select * from FY_FromCity";
            DataSet ds3 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText3);
            if (ds3 != null)
            {
                fromCity.DataSource = ds3;
                fromCity.DataTextField = "chName";
                fromCity.DataValueField = "fid";
                fromCity.DataBind();
                fromCity.Items.Insert(0, new ListItem("请选择", "0"));
            }
        }
    }

    /// <summary>
    /// 获取机票列表
    /// </summary>
    protected void GetShopNewslist()
    {

        DataSet ds = new DataSet();


        string str = @"select top 100 percent FY_Ticket.*,FY_FromCity.chName as fromCityname,FY_ToCity.chName as toCityname,FY_Airline.chName as airname,FY_Airline.smallPic as smallPic from FY_Ticket ";
        str+=" left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity";
        str+=" left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity";
        str+=" left join FY_Airline on FY_Airline.aId=FY_Ticket.airLine";
        str += " where 1=1  ";


        if (fromCity.SelectedValue!="" && fromCity.SelectedValue!="0")
        {
            str += " and (FY_FromCity.fId='"+fromCity.SelectedValue+"')";
        }


        if (tocitytxt.Value.Trim() != "")
        {
            str += " and (FY_ToCity.chName like '%" + tocitytxt.Value.Trim() + "%')";
        }


        if (airlinetxt.Value.Trim() != "")
        {
            str += " and (FY_Airline.chName like '%" + airlinetxt.Value.Trim() + "%')";
        }

        if (this.che_pastdue.Checked)
        {
            str += " and  DateDiff(d,FY_Ticket.tosaleDate,getdate())<0";
        }

        if (orderFiled.Value == "" || orderFiled.Value == "0")
        {
            str += " order by FY_Ticket.tId desc";
        }


        if (orderFiled.Value == "1")
        {
            str += " order by FY_Ticket.untaxPrice asc, FY_Ticket.tId desc ";
        }


        if (orderFiled.Value == "2")
        {
            str += " order by FY_Ticket.untaxPrice desc, FY_Ticket.tId desc ";
        }

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

    protected string getColorTicktName(
        string fromcity,
        string tocity, 
        int isChear, 
        int isRecom)
    {
        if (isChear == 0 && isRecom == 0)
            return fromcity + "--" + tocity;
        else
            return string.Format(
                "<span style=\"color:red\">{0}--{1}</span>",
                fromcity,
                tocity);
    }

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        GetShopNewslist();
    }

    /// <summary>
    /// 根据条件来查询
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnsearch_Click(object sender, EventArgs e)
    {
        GetShopNewslist();
    }


    /// <summary>
    /// 删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btndel_Click(object sender, EventArgs e)
    {
        StringBuilder str = new StringBuilder();

        str.Append("delete from FY_Ticket where tId in (" + Request.Form["chk"] + ");");

      
        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);

        conn.Open();

        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {

                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                trans.Commit();
                scripthelp.AlertAndRedirect("操作成功！", "ticket_list.aspx", this.Page);
            }
            catch
            {
                trans.Rollback();
                scripthelp.AlertAndRedirect("操作失败！", "ticket_list.aspx", this.Page);
            }
            finally
            {
                conn.Close();
            }
        }
    }

}
