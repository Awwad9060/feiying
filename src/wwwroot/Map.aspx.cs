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

public partial class Map : System.Web.UI.Page
{
    /// <summary>
    /// 经度
    /// </summary>
    protected string lat = string.Empty;
    /// <summary>
    /// 纬度
    /// </summary>
    protected string lng = string.Empty;
    protected string name = string.Empty;
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request["lat"] != null && Request["lng"] != null && Request["name"] != null)
        {
            lat = Request["lat"];
            lng = Request["lng"];
            name = Request["name"];
        }
    }
}
