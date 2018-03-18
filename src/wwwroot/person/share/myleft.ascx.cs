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

public partial class person_share_myleft : System.Web.UI.UserControl
{
    protected string[] classArray = new string[9];

    protected void Page_Load(object sender, EventArgs e)
    {
        for (int i = 0; i < classArray.Length; i++)
        {
            if(i==this.SetContrl)
                classArray[i] = "person_leftboxtwo_on";
            else
                classArray[i] = "person_leftboxtwo_out";
        }
    }

    private int setContrl;
    public int SetContrl { get{return this.setContrl;} set{this.setContrl = value;} }
}
