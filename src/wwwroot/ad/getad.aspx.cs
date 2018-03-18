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
using System.Text;
using eap.share;

public partial class ad_getad : System.Web.UI.Page
{
    protected int id = 0;
    protected int type = 0;
    protected int imgwidth = 0;
    protected int imgheight = 0;
    protected string adpath = string.Empty;
    protected string linkUrl = string.Empty;
    protected int display = 0;

    protected void Page_Load(object sender, EventArgs e)
    {
        try
        {
            if (!string.IsNullOrEmpty(Request.Params["id"]))
                id = Int32.Parse(Request.Params["id"]);
            if (!string.IsNullOrEmpty(Request.Params["width"]))
                imgwidth = Int32.Parse(Request.Params["width"]);
            if (!string.IsNullOrEmpty(Request.Params["height"]))
                imgheight = Int32.Parse(Request.Params["height"]);
            
            this.GetAdPath();
            if (string.IsNullOrEmpty(adpath) || display == 1)
                return;

            string w = string.Empty;
            if (id == 8)
                w = this.getIndexTop(linkUrl, adpath, imgwidth, imgheight, type);
            else
                w = this.getOther(linkUrl, adpath, imgwidth, imgheight, type);

            Response.Write(w);
            Response.End();
        }
        catch (Exception)
        {

            throw;
        }

    }

    protected string getIndexTop(string linkUrl, string adpath, int imgwidth, int imgheight, int type)
    {
        StringBuilder str = new StringBuilder();
        str.Append("document.write(\"");      
        str.Append("<div style=' margin:auto;' >");
        if(type==0)
            str.Append(string.Format("<a href='{0}' target='_blank' ><img src='http://www.fei580.com/{1}' width='{2}px' height='{3}px' /></a>", linkUrl, adpath, imgwidth, imgheight));
        else
        {
            str.Append("<object width='" + imgwidth + "px' height='" + imgheight + "px' name='testflash' type='application/x-shockwave-flash' data=../../" + adpath + " >");
            str.Append("<param name='quality' value='high' />");
            str.Append("<param name='wmode' value='transparent' />");
            str.Append("<param name='movie' value=../../" + adpath + " /></object>");
        }
        str.Append("</div>");
        str.Append("<div style='float:right; margin-right:0px; width:66px;' ><img onclick='closeIndexTop()' style='border:0;cursor:pointer;' src='images/cls_66x22.gif' /></div>");
        str.Append("\");");

        return str.ToString();
    }


    protected string getOther(string linkUrl, string adpath, int imgwidth, int imgheight, int type)
    {
        StringBuilder str = new StringBuilder();
        if (type == 0)
            str.Append(string.Format("document.write(\"<a href='{0}' target='_blank' ><img src='http://www.fei580.com/{1}' width='{2}px' height='{3}px' /></a>\");", linkUrl, adpath, imgwidth, imgheight));
        else
        {
            str.Append("document.write(\"<object width='" + imgwidth + "px' height='" + imgheight + "px' name='testflash' type='application/x-shockwave-flash' data=../../" + adpath + " >");
            str.Append("<param name='quality' value='high' />");
            str.Append("<param name='wmode' value='transparent' />");
            str.Append("<param name='movie' value=../../" + adpath + " /></object>\");");
        }
        return str.ToString();
    }

    protected void GetAdPath()
    {
        DataSet ds;
        string str;
        try
        {
            str = @"SELECT TOP 1 * FROM FY_advertise WHERE id=" + id;
            ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds.Tables[0].Rows.Count > 0)
            {
                DataRowCollection rows = ds.Tables[0].Rows;
                adpath = rows[0]["adPath"].ToString();
                linkUrl = rows[0]["linkUrl"].ToString();
                type = int.Parse(rows[0]["adKind"].ToString());
                display = int.Parse(rows[0]["display"].ToString());
            }
        }
        catch (Exception)
        {
            throw;
        }
    }
}
