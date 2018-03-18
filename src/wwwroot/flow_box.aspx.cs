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

public partial class flow_box : System.Web.UI.Page
{

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["telvalue"] != null && Request.QueryString["telvalue"] != "")
        {
            string str = "insert into FY_GuestTel(source,telphone,addtime) values('网站','" + Request.QueryString["telvalue"].ToString() + "',getdate())";

            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("1");
            }
            else
            {
                Response.Write("0");
            }

        }

        if (Request.QueryString["contact"] != null && Request.QueryString["contact"] != "")
        {
            string str = "insert into FY_FastBook(contact,fCity,tCity,fDate,tDate,bDate) values('" + Request.QueryString["contact"].ToString() + "','" + Request.QueryString["fCity"].ToString() + "','" + Request.QueryString["tCity"].ToString() + "','" + Request.QueryString["fDate"].ToString() + "','" + Request.QueryString["tDate"].ToString() + "',getdate())";

            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("1");
            }
            else
            {
                Response.Write("0");
            }

        }
    }

}
