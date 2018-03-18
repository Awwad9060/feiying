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

public partial class console_ad_ad_list : System.Web.UI.Page
{
    string operatortag = string.Empty;

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
        if (adminmerinfo == null)
        {

            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }

        operatortag = Request.QueryString["Oper"];

        if (!IsPostBack)
        {
            GetAdlist();
            if (operatortag == "del")
            {
                DelEntType();
            }
        }


    }


    /// <summary>
    /// 获取广告信息列表
    /// </summary>
    protected void GetAdlist()
    {
        DataSet ds = new DataSet();
        string str = "select * from FY_advertise where 1=1";


        SqlParameter[] parameters = {
                                new SqlParameter("@sql", SqlDbType.NVarChar,40000),
                                new SqlParameter("@currentpage", SqlDbType.Int),
                                new SqlParameter("@pagesize", SqlDbType.Int)};
        parameters[0].Value = str;
        parameters[1].Value = this.Pager.CurrentPageIndex;
        parameters[2].Value = this.Pager.PageSize;
        ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);
        this.dgList.DataSource = ds.Tables[1];
        this.Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);
        this.Pager.CustomInfoHTML = "&nbsp;第" + this.Pager.CurrentPageIndex.ToString() + "页/共" + this.Pager.PageCount.ToString() + "页 总记录数：" + this.Pager.RecordCount.ToString();
        this.dgList.DataBind();
    }


    /// <summary>
    /// 删除操作
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void DelEntType()
    {
        string str = "delete from FY_advertise where id=" + Convert.ToInt32(Request.QueryString["Id"]);
        int deltag = 0;
        deltag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
        if (deltag > 0)
            Response.Write("<script>alert('删除成功！');location.href='ad_list.aspx'</script>");
        else
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('删除失败！')</script>");

    }

    /// <summary>
    /// 设置图片（flash）广告的操作
    /// </summary>
    /// <param name="advertise">0:图片广告，1：flash广告</param>
    /// <returns></returns>
    public string Operator_State(int advertise, string adverturl)
    {
        string str_name = "";
        if (advertise == 0)
        {
            str_name = "<img width='200px' height='80px' src=../../" + adverturl + "></img>";
        }
        else
        {
            str_name = "<object width='200px' height='80px' name='testflash' type='application/x-shockwave-flash' data=../../" + adverturl + ">";
            str_name += "<param name='quality' value='high' />";
            str_name += "<param name='wmode' value='transparent' />";
            str_name += "<param name='movie' value=../../" + adverturl + " /></object>";

        }
        return str_name;

    }
}
