using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// Server 的摘要说明
/// </summary>
public class Server
{
    private string name;

    public string Name
    {
        get { return name; }
        set { name = value; }
    }

    private string title;

    public string Title
    {
        get { return title; }
        set { title = value; }
    }

    private string pic;

    public string Pic
    {
        get { return pic; }
        set { pic = value; }
    }

    private string link;

    public string Link
    {
        get { return link; }
        set { link = value; }
    }
}
