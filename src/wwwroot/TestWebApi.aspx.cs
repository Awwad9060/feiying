using Microsoft.CSharp;
using System;
using System.CodeDom;
using System.CodeDom.Compiler;
using System.Collections.Generic;
using System.IO;
using System.Net;
using System.Text;
using System.Web;
using System.Web.Services.Description;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class TestWebApi : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {
        if (!IsPostBack)
        {
            string action = "getticketlist";
            string companycode = "GX1126";
            string key = "eade9048bb984549b284c1a422335c20";
            string startairport = "SHA";
            string endairport = "HKG";
            string startdate = "2017-12-15";
            string sign = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(action + companycode + key + startairport + endairport + startdate, "MD5").ToLower();
            string curl = "http://api.trip258.com/jrinterticket.ashx?param={\"action\":\"" + action + "\",\"companycode\":\"" + companycode + "\",\"key\":\"" + key + "\",\"sign\":\"" + sign + "\",\"startairport\":\"" + startairport + "\",\"endairport\":\"" + endairport + "\",\"startdate\":\"" + startdate + "\",\"startcity\":\"\",\"endcity\":\"\",\"backdate\":\"\",\"cabin\":\"\",\"aircompany\":\"\",\"seatnum\":\"\",\"passtype\":\"\"}";
            string apiContent = WebServiceHelper.SendPostRequest(curl, "");
        }

    }
}

public static class WebServiceHelper
{
    public static string SendPostRequest(string url, string postString)
    {
        byte[] postData = Encoding.UTF8.GetBytes(postString);
        WebClient client = new WebClient();
        client.Headers.Add("Content-Type", "application/x-www-form-urlencoded");
        client.Headers.Add("ContentLength", postData.Length.ToString());
        byte[] responseData = client.UploadData(url, "POST", postData);
        return Encoding.UTF8.GetString(responseData);
    }
}