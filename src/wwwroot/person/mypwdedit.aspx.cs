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
using eap.share;
using System.Data.SqlClient;

public partial class person_mypwdedit : System.Web.UI.Page
{
    //用户对象
    protected MemberItem memberitem = new MemberItem();

    protected string Mem_LoginName = string.Empty;
    protected string Mem_ID = string.Empty;
    protected string Mem_Money = string.Empty;

    protected DataRowCollection recommendThree = null;
    protected DataRowCollection recommendFour = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断登陆
        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null || Session["Mem_Money"] == null)
            Response.Redirect("../index.aspx");
        else
        {
            Mem_LoginName = Session["Mem_LoginName"].ToString();
            Mem_ID = Session["Mem_ID"].ToString();
            Mem_Money = Session["Mem_Money"].ToString();

            memberitem = getMyInfo(Mem_ID);

            recommendThree = getRecommendInfo("本周图片推荐", 3);
            recommendFour = getRecommendInfo("精选图片推", 3);
        }
    }

    protected DataRowCollection getRecommendInfo(string rType, int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from FY_Recommend where rType='" + rType + "' order by rId desc";
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


    /// <summary>
    /// 获取个人信息
    /// </summary>
    /// <param name="menberId"></param>
    protected MemberItem getMyInfo(string menberId)
    {
        if (string.IsNullOrEmpty(menberId))
            return null;

        MemberItem mitem = new MemberItem();

        string str = "select top 1 * from tmember where Mem_ID='" + menberId.Trim() + "'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds != null)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            mitem.Mem_ID = dr["Mem_ID"].ToString();
            mitem.Mem_LoginName = dr["Mem_LoginName"].ToString();
            mitem.Mem_Biming = dr["Mem_Biming"].ToString();
            mitem.Mem_Email = dr["Mem_Email"].ToString();
            mitem.Mem_Sex = dr["Mem_Sex"].ToString();
            mitem.Mem_City = dr["Mem_City"].ToString();
            mitem.Mem_Name = dr["Mem_Name"].ToString();
            mitem.Mem_Addr = dr["Mem_Addr"].ToString();
            mitem.Mem_Tel = dr["Mem_Tel"].ToString();
            mitem.Mem_Mobile = dr["Mem_Mobile"].ToString();
            mitem.Mem_CardID = dr["Mem_CardID"].ToString();
            mitem.Mem_IDcard = dr["Mem_IDcard"].ToString();
            mitem.Mem_Grade = dr["Mem_Grade"].ToString();
            mitem.Mem_Status = dr["Mem_Status"].ToString();
            mitem.Mem_Money = dr["Mem_Money"].ToString();
            mitem.Mem_RegistDate = dr["Mem_RegistDate"].ToString();
            mitem.Mem_Remark = dr["Mem_Remark"].ToString();
            mitem.Mem_province = dr["mem_province"].ToString();
            mitem.Mem_zip = dr["mem_zip"].ToString();
            mitem.Mem_power = dr["mem_power"].ToString();
            mitem.Mem_fax = dr["mem_fax"].ToString();
            mitem.Mem_both = dr["mem_both"].ToString();
            mitem.Mem_cid = dr["mem_cid"].ToString();
            mitem.Mem_company = dr["mem_company"].ToString();
            mitem.Mem_ifActive = dr["mem_ifActive"].ToString();
            mitem.Mem_lastlogintime = dr["mem_lastlogintime"].ToString();
            mitem.Mem_logins = dr["mem_logins"].ToString();
            mitem.Mem_lastloginip = dr["mem_lastloginip"].ToString();
            mitem.Mem_bankxiao = dr["mem_bankxiao"].ToString();
            mitem.Mem_birthday = dr["mem_birthday"].ToString();
            mitem.Mem_qq = dr["mem_qq"].ToString();
            mitem.Mem_msn = dr["mem_msn"].ToString();
            mitem.Mem_pic = dr["mem_pic"].ToString();
            mitem.Mem_LoginPasd = dr["Mem_LoginPasd"].ToString();
        }

        return mitem;
    }

    /// <summary>
    /// 提交修改密码
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void But_submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(pwd1.Value)||string.IsNullOrEmpty(pwd2.Value)||string.IsNullOrEmpty(pwd3.Value))
            {
                scripthelp.Alert("密码不为空，请输入!", this.Page);
                return;
            }

            if (!Sys.md5(pwd1.Value.Trim()).Equals(memberitem.Mem_LoginPasd.Trim()))
            {
                scripthelp.Alert("原密码不正确!", this.Page);
                return;
            }

            if (!pwd2.Value.Trim().Equals(pwd3.Value.Trim()))
            {
                scripthelp.Alert("确认密码不一致!", this.Page);
                return;
            }

            string str = "UPDATE tmember SET Mem_LoginPasd = '" + Sys.md5(pwd2.Value.Trim()) + "'  WHERE Mem_ID = " + Mem_ID + "";

            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
            if (count > 0)
                scripthelp.AlertAndRedirect("更新密码成功！", "mypwdedit.aspx", this.Page);
            else
                scripthelp.Alert("更新密码失败！", this.Page);
        }
        catch (Exception ex)
        {
            throw ex;
        }
    }
}
