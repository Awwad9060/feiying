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

public partial class console_ad_top_add : System.Web.UI.Page 
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

        this.img_top.ImageUrl = "/images/headbglast.jpg";
        this.lblTitle.Text = "首页头部底图替换";
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        if (!FileUpload_adPath.HasFile)
        {
            scripthelp.Alert("请选择要替换的图片文件!", this.Page);
            return;
        }
        string path="/images/",filrname = "headbglast.jpg";    
        FileUpload_adPath.SaveAs(Request.MapPath(path) + filrname);//保存图片

        Response.Write("<script>alert('操作成功！');location.href='ad_list.aspx'</script>");
    }
}
