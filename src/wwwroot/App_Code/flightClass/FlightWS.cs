
using System;
using System.Web;

public class FlightWS : IHttpHandler
{

    public void ProcessRequest(HttpContext context)
    {
        //context.Response.ContentType = "text/plain";
        //context.Response.Write("Hello World");
        context.Response.Clear();
        context.Response.Charset = "utf-8";
        context.Response.Buffer = true;
        context.Response.ContentEncoding = System.Text.Encoding.UTF8;
        context.Response.ContentType = "application/json";
        context.Response.Write(GetFlight(context));
        context.Response.Flush();
        context.Response.End();
    }
    /// <summary>
    /// 获取航班列表信息
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    public string GetFlight(HttpContext context)
    {
        try
        {
            string host = context.Request.Url.Host;//请求的url
            string action = GetConfig("flight_api_action");//方法名
            string companycode = GetConfig("flight_company_code");//公司代码
            string key = GetConfig("flight_key");//key
            string apiUrl = GetConfig("flight_api_url");//api地址
            string startairport = context.Request.QueryString["startairport"];
            string endairport = context.Request.QueryString["endairport"];
            string startdate = context.Request.QueryString["startdate"];
            string sign = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(action + companycode + key + startairport + endairport + startdate, "MD5").ToLower();
            string curl = string.Format("{7}?param={{\"action\":\"{0}\",\"companycode\":\"{1}\",\"key\":\"{2}\",\"sign\":\"{3}\",\"startairport\":\"{4}\",\"endairport\":\"{5}\",\"startdate\":\"{6}\",\"startcity\":\"\",\"endcity\":\"\",\"backdate\":\"\",\"cabin\":\"\",\"aircompany\":\"\",\"seatnum\":\"\",\"passtype\":\"\"}}",
                    action,
                    companycode,
                    key,
                    sign,
                    startairport,
                    endairport,
                    startdate,
                    apiUrl);
            return SendPostRequest(curl, "");
        }
        catch (Exception)
        {
            return "发生异常，请联系管理员";
        }
    }

    private string GetConfig(string _key)
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings[_key].ConnectionString;
    }

    private string SendPostRequest(string url, string postString)
    {
        byte[] postData = System.Text.Encoding.UTF8.GetBytes(postString);
        System.Net.WebClient client = new System.Net.WebClient();
        client.Headers.Add("Content-Type", "application/x-www-form-urlencoded");
        client.Headers.Add("ContentLength", postData.Length.ToString());
        byte[] responseData = client.UploadData(url, "POST", postData);
        return System.Text.Encoding.UTF8.GetString(responseData);
    }
    public bool IsReusable
    {
        get
        {
            return false;
        }
    }

}