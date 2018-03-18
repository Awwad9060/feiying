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


public partial class prizesDetail : System.Web.UI.Page
{
    protected static int pId = 0;
    public DataRow prizesDetailOne = null;
    protected DataRowCollection newPrizes = null;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["pId"] != null)
            {
                pId = Convert.ToInt32(Request.QueryString["pId"].ToString());

                prizesDetailOne = getPrizesDetai(pId);
                newPrizes = getPrizeList(8);
            }
            else
            {
                Response.Redirect("prizes.aspx");
            }

            if (!IsPostBack)
            {
          
        }
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

    protected string getTypeName(string value)
    {
        string tyepName = "所有奖品";
        if (value == "1") tyepName = "时尚达人";
        if (value == "2") tyepName = "数码精品";
        if (value == "3") tyepName = "旅行专家";
        if (value == "4") tyepName = "机票折扣";
        if (value == "5") tyepName = "酒店住宿";

        return tyepName;
    }


    #region
    protected DataRow getPrizesDetai(int pId)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select * from FY_Prizes where pId=" + pId;

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


    protected void btnok_order(object sender, EventArgs e)
    {
        string str = "insert into FY_prizes_order(pId,addMember,addTime,method,status,linkNan,linkAddress,linkCode,linkTel,otherDetail) values('" + pId + "','" + Session["Mem_LoginName"].ToString() + "',getdate(),'兑换方式',0,'" + txt_linkMan.Value.Trim() + "','" + txt_linkAddress.Value.Trim() + "','" + txt_linkCode.Value.Trim() + "','" + txt_linkTel.Value.Trim() + "','" + txt_otherDetail.Value.Trim() + "')";

        int inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);


        string str1 = "update tmember set Mem_Money=Mem_Money-" + Convert.ToInt32(prizesDetailOne["needScore"].ToString()) + " where Mem_ID=" + Convert.ToInt32(Session["Mem_ID"].ToString());

        SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str1);

        Session["Mem_Money"] = Convert.ToInt32(Session["Mem_Money"].ToString()) - Convert.ToInt32(prizesDetailOne["needScore"].ToString());

        if (inserttag > 0)
        {
            Response.Write("<script>alert('恭喜您，我们会在1个工作日寄出奖品。');location.href='prizes.aspx'</script>");
        }
        else
        {
            Response.Write("<script>alert('服务器出错，请重新领取。');location.href='prizes.aspx'</script>");
        }
    }
}
