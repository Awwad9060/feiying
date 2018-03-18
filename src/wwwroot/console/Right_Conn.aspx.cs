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

public partial class console_Right_Conn : System.Web.UI.Page
{
    /// <summary>
    /// 创 建 者：万正杰
    /// 创建日期：2008.12.4
    /// 主要功能：统计相关模块的功能
    /// ---------修改记录---------
    /// 修改日期  修改人  修改内容
    ///
    /// </summary>
    protected int enttotal = 0, entunpass = 0, entisrecom = 0, pertotal = 0, perunpass = 0, perisrecom = 0; //会员管理

    protected int arttotal = 0, artunpass = 0, artisrecom = 0; //文章管理

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }
    }

}
