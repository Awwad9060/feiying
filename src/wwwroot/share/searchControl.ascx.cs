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

public partial class share_searchControl : System.Web.UI.UserControl
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            if (Request.QueryString["typeId"] != null && Request.QueryString["key"] != null)
                this.searchkey.Value = Request.QueryString["key"].ToString().Trim();
        }
        this.searchkey.Attributes.Add("onkeypress", "if(event.keyCode==13){document.all.SearchControl1_buttSearch.click();return false;}");
    }
}
