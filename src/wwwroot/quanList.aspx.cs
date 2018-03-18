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


public partial class quanList : System.Web.UI.Page
{

    protected DataRowCollection bbstopics = null;

    protected DataRowCollection clickOrder = null;

    protected static int typeId = 0;

    protected static string typeName = "攻略游记";

    protected static string username = "";

    protected static string keyword="";

    protected void Page_Load(object sender, EventArgs e)
    {
       
        if (!IsPostBack)
        {
            if (Request.QueryString["typeId"] == null && Request.QueryString["username"] == null)
            {
                Response.Redirect("quan.aspx");
            }
            else
            {
                if (Request.QueryString["typeId"] != null)
                {
                    typeId = Convert.ToInt32(Request.QueryString["typeId"].ToString());
                    if (typeId == 1) typeName = "攻略游记";
                    if (typeId == 2) typeName = "旅游点评";
                    if (typeId == 3) typeName = "图片故事";
                    if (typeId == 4) typeName = "旅游问答";
                    if (typeId == 5) typeName = "寻找结伴";
                }
                else if (Request.QueryString["username"] != null)
                {
                    username = Request.QueryString["username"].ToString();
                }

            }

            if (Request.QueryString["key"] != null)
            {
                keyword = Request.QueryString["key"].ToString();
            }
            GetQuanlist();
        }

        bbstopics = getBbstopic(12);

        clickOrder = getQuanByType(0, 0, 10, " order by addtime asc ");
    }

    protected void GetQuanlist()
    {

        DataSet ds = new DataSet();


        string str = @"select top 100 percent a.aId,a.typeId,a.title,a.publishName,a.addTime,b.mem_pic from FY_member_article as a left join tmember as b on a.publishName=b.Mem_LoginName where 1=1 and isCheck=1";
        
        if (typeId != 0)
        {
            str = str + " and typeId=" + typeId;
        }

        if (username != "")
        {
            str = str + " and publishName='" + username+"'";
        }

        if (keyword != "")
        {
            str = str + " and title like '%" + keyword + "%'";
        }


        str += " order by a.aId desc";


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

        quanlist.DataSource = ds.Tables[1];

        quanlist.DataBind();
    }

    /// <summary>
    /// 分页事件
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void Pager_PageChanged(object sender, EventArgs e)
    {
        GetQuanlist();
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



    protected DataRowCollection getBbstopic(int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from dnt_topics order by tId desc";
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
