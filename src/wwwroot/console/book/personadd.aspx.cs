using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Text;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class console_book_personadd : System.Web.UI.Page
{
    static string id =string.Empty;

    //用户对象
    protected MemberItem memberitem = new MemberItem();

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];

        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }

        if (!IsPostBack)
        {
            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id =Request.QueryString["id"].ToString();

                memberitem = getMyInfo(id);

                if (memberitem != null)
                {
                    username.Value = memberitem.Mem_LoginName;
                    nickname.Value = memberitem.Mem_Name;
                    tel.Value = memberitem.Mem_Tel;
                    email.Value = memberitem.Mem_Email;
                    company.Value = memberitem.Mem_company;
                    qq.Value = memberitem.Mem_qq;
                    msn.Value = memberitem.Mem_msn;
                    txtMoney.Value = memberitem.Mem_Money;
                    txt_type.Value = memberitem.Mem_type;
                    if (memberitem.Mem_Sex.Trim().Equals("M"))
                        sexm.Checked = true;
                    else
                        sexr.Checked = true;
                    if (!string.IsNullOrEmpty(memberitem.Mem_birthday))
                        date.Value = Convert.ToDateTime(memberitem.Mem_birthday.Trim()).ToShortDateString();
                    post.Value = memberitem.Mem_Addr;

                    this.isUploadPic.Text = "已上传：<img src=../../" + memberitem.Mem_pic + " height='80' width='80'>";
                    this.oldPic.Value = memberitem.Mem_pic;

                    this.lblTitle.Text = "会员信息";
                }
            }
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
            mitem.Mem_type = dr["mem_type"].ToString();
        }

        return mitem;
    }
}
