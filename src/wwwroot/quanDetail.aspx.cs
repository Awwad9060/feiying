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

public partial class quanDetail : System.Web.UI.Page
{
    protected static int aId=0;
    public DataRow quanDetailOne = null;
    protected DataRowCollection clickOrder = null;

    protected DataRowCollection randowTicket = null;

    protected DataRowCollection randowNews = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["aId"] != null)
        {
            aId = Convert.ToInt32(Request.QueryString["aId"].ToString());

            quanDetailOne=getQuanDetai(aId);
            if (quanDetailOne==null || Convert.ToInt32(quanDetailOne["isCheck"]) == 0)
            {
                Response.Redirect("quan.aspx");
                return;
            }
            updateQuanDetail(aId);
        }
        else
        {
            Response.Redirect("quan.aspx");
        }

        clickOrder = getQuanByType(0, 0, 10, " order by addtime asc ");

        randowTicket = GetRandowTicket(10);
        randowNews = getQuanByRow(Convert.ToInt32(quanDetailOne["typeId"]), 0, 10, string.Empty);
    }


    protected DataRowCollection GetRandowTicket(int num)
    {
        string strF = "select top " + num + "  FY_Ticket.untaxPrice,FY_Ticket.tId as ticketId,FY_FromCity.chName as fromCityname,FY_ToCity.chName as toCityname from FY_Ticket"
            + " left join FY_FromCity on FY_FromCity.fId=FY_Ticket.fromCity"
            + " left join FY_ToCity on FY_ToCity.tId=FY_Ticket.toCity "
            + " where " + aId + "%FY_Ticket.tId in (0,1,2,3,4,5,6,7,8,9) and untaxPrice<>0";
        strF += " and FY_Ticket.tripType=1  order by untaxPrice asc";

        try
        {
            DataRowCollection row = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, strF).Tables[0].Rows;
            return row;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return null;

    }

    protected DataRowCollection getQuanByRow(int type, int isRecom, int num, string orderFiled)
    {
        DataRowCollection quanrow = null;

        string str = @"select top " + num + " a.aId,a.typeId,a.title,a.publishName,a.addTime,b.mem_pic from FY_member_article as a left join tmember as b on a.publishName=b.Mem_LoginName where isCheck=1 and " + aId + "%a.aId in (0,1,2,3,4,5,6,7,8,9) ";
        if (type != 0)
        {
            str = str + " and typeId=" + type;
        }

        if (isRecom != 0)
        {
            str = str + " and isRec=1";
        }

        if (orderFiled != "")
        {
            str = str + orderFiled;
        }
        else
        {

            str = str + " order by aId desc";
        }

        try
        {
            quanrow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return quanrow;
    }

    protected void updateQuanDetail(int aId)
    {

       string  str="update FY_member_article set clicks=clicks+1 where aId ="+aId;


        SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);

        conn.Open();

        using (SqlTransaction trans = conn.BeginTransaction())
        {
            try
            {

                SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str);
                trans.Commit();
            }
            catch
            {
                trans.Rollback();
            }
            finally
            {
                conn.Close();
            }
        }
    }


    protected string getTypeName(string value)
    {
        string tyepName = "攻略游记";
        if (value == "1") tyepName = "攻略游记";
        if (value == "2") tyepName = "旅游点评";
        if (value == "3") tyepName = "图片故事";
        if (value == "4") tyepName = "旅游问答";
        if (value == "5") tyepName = "录找结伴";

        return tyepName;
    }


     #region
    protected DataRow getQuanDetai(int aId)
    {
        DataRow row = null;
        DataSet ds = null;
        string str = "select * from FY_member_article left join tmember on FY_member_article.publishName=tmember.Mem_LoginName where isCheck=1 and aId=" + aId;

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

     protected DataRowCollection getQuanByType(int type, int isRecom, int num, string orderFiled)
    {
        DataRowCollection quanrow = null;

        string str = @"select top " + num + "  * from FY_member_article left join tmember on FY_member_article.publishName=tmember.Mem_LoginName where 1=1 and isCheck=1";
        if (type != 0)
        {
            str = str + " and typeId=" + type;
        }

        if (isRecom != 0)
        {
            str = str + " and isRec=1";
        }

        if (orderFiled != "")
        {
            str = str + orderFiled;
        }
        else
        {

            str = str + " order by aId desc";
        }

        try
        {
            quanrow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return quanrow;
    }
}
