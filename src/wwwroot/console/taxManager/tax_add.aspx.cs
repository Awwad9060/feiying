using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Text;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class console_taxManager_add : System.Web.UI.Page
{
    static int id = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
        
          
           //绑定出发城市 
           string commandText3 = "select * from FY_FromCity";
           DataSet ds3 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText3);
           if (ds3 != null)
           {
                fromCity.DataSource = ds3;
                fromCity.DataTextField = "chName";
                fromCity.DataValueField = "fid";
                fromCity.DataBind();
            }
           

            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string str = "select FY_FromCity.fId,FY_Airline.airlineCode as airlineCode,FY_Airline.chName as airlineName,FY_Tax.taxType, FY_Tax.id,FY_Tax.tax,FY_FromCity.cityCode as fromCityCode,FY_ToCity.cityCode as toCityCode,FY_FromCity.chName as fromCityName,FY_ToCity.chName as toCityName from FY_Tax ";
                str += " left join FY_FromCity  on FY_FromCity.fId=FY_Tax.fromCity";
                str += " left join FY_ToCity on FY_toCity.tId=FY_Tax.toCity";
                str += " left join FY_Airline on FY_Airline.aId=FY_Tax.airline";
                str += " where id=" + id;

                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);

                txtSearch.Value = ds.Tables[0].Rows[0]["airlineCode"].ToString() + "-" + ds.Tables[0].Rows[0]["airlineName"].ToString();
                fromCity.Value = ds.Tables[0].Rows[0]["fId"].ToString();
                txtSearch_tocity.Value = ds.Tables[0].Rows[0]["toCityCode"].ToString() + "-" + ds.Tables[0].Rows[0]["toCityName"].ToString();
                airlineTax.Value = ds.Tables[0].Rows[0]["tax"].ToString();
                if (Convert.ToInt32(ds.Tables[0].Rows[0]["taxType"]) == 0)
                    this.taxType0.Checked = true;
                else
                    this.taxType1.Checked = true;
            }
        }
        AjaxPro.Utility.RegisterTypeForAjax(typeof(console_taxManager_add));
    }

    /// <summary>
    /// 判断是否已经存在
    /// </summary>
    /// <param name="fromCity"></param>
    /// <param name="toCity"></param>
    /// <param name="airline"></param>
    /// <returns></returns>
    public static bool Exist(int taxType, int fromCity, int toCity, int airline)
    {
        string sql = "if not exists (select ID from FY_Tax where taxType='" + taxType + "' and fromCity='" + fromCity + "' and toCity='" + toCity + "' and airline='" + airline + "' ) select 1 else select 0";
        object result = SqlHelper.ExecuteScalar(SqlHelper.ConnString_insert, CommandType.Text, sql);
        if (Convert.ToInt32(result) == 1)
            return false;
        else
            return true;
    }

    /// <summary>
    /// 判断是否已经存在
    /// </summary>
    /// <param name="fromCity"></param>
    /// <param name="toCity"></param>
    /// <param name="airline"></param>
    /// <returns></returns>
    public static bool Exist(int id, int taxType, int fromCity, int toCity, int airline)
    {
        string sql = "if not exists (select ID from FY_Tax where taxType='" + taxType + "' and fromCity='" + fromCity + "' and toCity='" + toCity + "' and airline='" + airline + "' and id !=" + id + " ) select 1 else select 0";
        object result = SqlHelper.ExecuteScalar(SqlHelper.ConnString_insert, CommandType.Text, sql);
        if (Convert.ToInt32(result) == 1)
            return false;
        else
            return true;
    }

    //保存
    protected void btnSave_Click(object sender, EventArgs e)
    {

        if (Request.QueryString["id"] == null)
        {
            int airline = getAirlineIdByName(this.txtSearch.Value);
            //int fromCity = getFromCityIdByName(this.fromCity.Value);
            int fromCity = Convert.ToInt32(this.fromCity.Value);
            int toCity = getToCityIdByName(this.txtSearch_tocity.Value);
            string taxValue = this.airlineTax.Value;
            int taxType = 0;
            if (this.taxType1.Checked)
                taxType = 1;

            if (Exist(taxType, fromCity, toCity, airline))
            {
                scripthelp.Alert("已经存在税费信息!", this.Page);
                return;
            }

            string commandText = "INSERT into FY_Tax(taxType,fromCity,toCity,airline,tax) values ('" + taxType + "','" + fromCity + "','" + toCity + "','" + airline + "','" + taxValue + "')";
            int count1 = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            if (0 >= count1)
            {
                scripthelp.Alert("添加税费信息失败!", this.Page);
                return;
            }
            else
            {
                scripthelp.AlertAndRedirect("添加税费信息成功!", "tax_list.aspx", this.Page);
                return;
            }
        }
        else
        {
            int airline = getAirlineIdByName(this.txtSearch.Value);
            //int fromCity = getFromCityIdByName(this.fromCity.Value);
            int fromCity = Convert.ToInt32(this.fromCity.Value);
            int toCity = getToCityIdByName(this.txtSearch_tocity.Value);
            string taxValue = this.airlineTax.Value;
            int taxType = 0;
            if (this.taxType1.Checked)
                taxType = 1;

            if (Exist(id,taxType, fromCity, toCity, airline))
            {
                scripthelp.Alert("已经存在税费信息!", this.Page);
                return;
            }

            string commandText = "update FY_Tax set taxType='" + taxType + "',fromCity='" + fromCity + "' ,toCity='" + toCity + "' ,airline='" + airline + "', tax='" + taxValue + "' where id=" + id; ;
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, commandText);
            if (count > 0)
            {
                scripthelp.AlertAndRedirect("修改税费信息成功!", "tax_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("修改税费信息失败!", this.Page);
                return;
            }
        }
    }

    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string GetAirport(string name)
    {
        string sql = "select * from FY_Airport where chName like '%" + name + "%' or airportCode like  '" + name + "%'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);

        try
        {
            List<string> list = new List<string>();
            #region
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list.Add(ds.Tables[0].Rows[i]["airportCode"].ToString() + "-" + ds.Tables[0].Rows[i]["chName"].ToString());
            }
            #endregion
            List<string> l1 = list.FindAll(delegate(string ss) { return ss.Contains(name); });
            string str = "[";
            foreach (string s in l1)
            {
                str += "\"" + s + "\"" + ",";
            }
            str = str.TrimEnd(',') + "]";
            return str;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }

    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string GetArray(string name)
    {
        string sql = "select * from FY_Airline where chName like '%" + name + "%' or airlineCode like  '" + name + "%'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);

        try
        {
            List<string> list = new List<string>();
            #region
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list.Add(ds.Tables[0].Rows[i]["airlineCode"].ToString() + "-" + ds.Tables[0].Rows[i]["chName"].ToString());
            }
            #endregion
            List<string> l1 = list.FindAll(delegate(string ss) { return ss.Contains(name); });
            string str = "[";
            foreach (string s in l1)
            {
                str += "\"" + s + "\"" + ",";
            }
            str = str.TrimEnd(',') + "]";
            return str;
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


    private string getAirlineById(int id)
    {
        string airlineName = "";
        string str = "select (airlineCode+'-'+chName) as airlineName from FY_airline where aId=" + id;
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds != null)
        {
            airlineName = ds.Tables[0].Rows[0]["airlineName"].ToString();
        }
        return airlineName;
    }

    private int getAirlineIdByName(string name)
    {
        int aId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select aId,airlineCode,chName from FY_airline where airlineCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                {
                    aId = Convert.ToInt32(ds.Tables[0].Rows[0]["aId"].ToString());
                }
            }
        }
        return aId;

    }

    private int getFromCityIdByName(string name)
    {
        int fId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select fId,cityCode,chName from FY_FromCity where cityCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                {
                    fId = Convert.ToInt32(ds.Tables[0].Rows[0]["fId"].ToString());
                }
            }
        }
        return fId;
    }

    private int getToCityIdByName(string name)
    {
        int tId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select tId,cityCode,chName from FY_ToCity where cityCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                {
                    tId = Convert.ToInt32(ds.Tables[0].Rows[0]["tId"].ToString());
                }
            }
        }
        return tId;
    }

    private int getAirPortIdByName(string name)
    {
        int aId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select apId,airportCode,chName from FY_Airport where airportCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null)
            {
                if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                {
                    aId = Convert.ToInt32(ds.Tables[0].Rows[0]["apId"].ToString());
                }
            }
        }
        return aId;

    }


    protected string getFromCityNameByCode(string cityCode)
    {
        string sql = "select chName from FY_FromCity where cityCode='" + cityCode + "'";
        DataSet dsCityName = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityName != null)
        {

            return dsCityName.Tables[0].Rows[0]["chName"].ToString();
        }

        return "";
    }

    protected string getToCityNameByCode(string cityCode)
    {
        string sql = "select chName from FY_ToCity where cityCode='" + cityCode + "'";
        DataSet dsCityName = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        if (dsCityName != null)
        {

            return dsCityName.Tables[0].Rows[0]["chName"].ToString();
        }

        return "";
    }


    /// <summary>
    /// 根据大洲获取市信息
    /// </summary>
    /// <param name="bigId"></param>
    /// <returns></returns>
    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string GetCity_to(string name)
    {
        string sql = "select * from FY_ToCity where chName like '%" + name + "%' or cityCode like  '" + name + "%'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        try
        {
            List<string> list = new List<string>();
            #region
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list.Add(ds.Tables[0].Rows[i]["cityCode"].ToString() + "-" + ds.Tables[0].Rows[i]["chName"].ToString());
            }
            #endregion
            List<string> l1 = list.FindAll(delegate(string ss) { return ss.Contains(name); });
            string str = "[";
            foreach (string s in l1)
            {
                str += "\"" + s + "\"" + ",";
            }
            str = str.TrimEnd(',') + "]";
            return str;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }
}
