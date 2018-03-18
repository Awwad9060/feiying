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
using System.Data.SqlClient;
using eap.share;

public partial class quanPublish : System.Web.UI.Page
{
    //用户对象
    protected MemberItem memberitem = new MemberItem();

    protected string artNum = "0";

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断登陆
        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null || Session["Mem_Money"] == null)
            Response.Write("<script>alert('请登陆');location.href='login.aspx?url=quanPublish.aspx'</script>");
        else
        {

            if (!IsPostBack) {
                memberitem = getMyInfo(Session["Mem_ID"].ToString());
                getArtNum(Session["Mem_LoginName"].ToString());
            }

        }

    }

    protected void getArtNum(string username)
    {
        string str = "select count(*) as artNum from FY_member_article where publishName='" + username.Trim() + "'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds != null)
        {
            DataRow dr = ds.Tables[0].Rows[0];
            artNum = dr["artNum"].ToString();
        }
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
        }

        return mitem;
    }


    protected void Butt_submit_Click(object sender, EventArgs e)
    {
        try
        {
            if (string.IsNullOrEmpty(txtTitle.Value))
            {
                scripthelp.Alert("请输入标题！", this.Page);
                return;
            }

            if (string.IsNullOrEmpty(type.Value))
            {
                scripthelp.Alert("请选择分类！", this.Page);
                return;
            }


            if (String.Compare(Session["verificode"].ToString(), txtCheckCode.Value, true) != 0)
            {
                scripthelp.Alert("验证码错误，请输入正确的验证码！", this.Page);
                return;
            }


            string str = "insert into FY_member_article(typeId,title,content,addtime,updateTime,publishName,clicks,isRec,isCheck) values('" + type.Value + "','" + txtTitle.Value.Trim() + "','" + Sys.filterSQLStr(intro.Value.Trim()) + "',getdate(),getdate(),'" + Session["Mem_LoginName"].ToString() + "',0,0,0)";

            int inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);



           // string str1 = "update tmember set Mem_Money=Mem_Money+1 where Mem_LoginName='" + Session["Mem_LoginName"].ToString() + "'";

           //SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str1);
           //Session["Mem_Money"] = Convert.ToInt32(Session["Mem_Money"].ToString()) + 1;

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='quan.aspx'</script>");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");

        }
        catch (Exception ex)
        {
            throw ex;
        }
    }


}
