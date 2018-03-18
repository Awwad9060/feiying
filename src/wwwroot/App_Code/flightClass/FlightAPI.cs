using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.IO;
using System.Security.Cryptography;
using System.Text;
using System.Web;

/// <summary>
/// FightAPI 的摘要说明
/// </summary>
public class FlightAPI
{
    static FlightAPI()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
        companycode = GetConfig("flight_company_code");
        key = GetConfig("flight_key");
        apiUrl = GetConfig("flight_api_url");
    }


    private static string companycode;//公司代码
    private static string key;//key
    private static string apiUrl;//api地址

    #region 2017年改版添加
    /// <summary>
    /// 获取序列化后的航班信息
    /// </summary>
    /// <param name="result"></param>
    /// <returns></returns>
    public static FlightTotal GetFlightTotal(string jsonText)
    {
        FlightTotal jp = (FlightTotal)JsonConvert.DeserializeObject(jsonText);
        return jp;
    }
    /// <summary>
    /// 解析JSON字符串生成对象实体
    /// </summary>
    /// <typeparam name="T">对象类型</typeparam>
    /// <param name="json">json字符串(eg.{"ID":"112","Name":"石子儿"})</param>
    /// <returns>对象实体</returns>
    public static T DeserializeJsonToObject<T>(string json) where T : class
    {
        JsonSerializer serializer = new JsonSerializer();
        StringReader sr = new StringReader(json);
        object o = serializer.Deserialize(new JsonTextReader(sr), typeof(T));
        T t = o as T;
        return t;
    }
    /// <summary>
    /// 获取航班列表信息
    /// </summary>
    /// <param name="context"></param>
    /// <returns></returns>
    public static string GetFlight(FlightParamInfo param)
    {
        try
        {
            if (string.IsNullOrEmpty(param.Startairport))
                return "请选择出发地";
            if (string.IsNullOrEmpty(param.Endairport))
                return "请选择目的地";
            if (string.IsNullOrEmpty(param.Startdate))
                return "请选择出发时间";
            string action = GetConfig("flight_api_action");//方法名
            //string sign = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(action + companycode + key + param.Startairport + param.Endairport + param.Startdate, "MD5").ToLower();
            string sign = System.Web.Security.FormsAuthentication.HashPasswordForStoringInConfigFile(action
                + companycode
                + key
                + param.Startairport
                + param.Endairport 
                + param.Startdate 
                + param.Startcity 
                + param.Endcity 
                + param.Backdate 
                + param.Cabin 
                + param.Aircompany 
                + (param.Seatnum == 0 ? "" : param.Seatnum.ToString())
                + param.Passtype, "MD5").ToLower();
            string curl = string.Format("{7}?param={{\"action\":\"{0}\",\"companycode\":\"{1}\",\"key\":\"{2}\",\"sign\":\"{3}\",\"startairport\":\"{4}\",\"endairport\":\"{5}\",\"startdate\":\"{6}\",\"startcity\":\"{8}\",\"endcity\":\"{9}\",\"backdate\":\"{10}\",\"cabin\":\"{11}\",\"aircompany\":\"{12}\",\"seatnum\":\"{12}\",\"passtype\":\"{13}\"}}",
                    action,
                    companycode,
                    key,
                    sign,
                    param.Startairport,
                    param.Endairport,
                    param.Startdate,
                    apiUrl,
                    param.Startcity,
                    param.Endcity,
                    param.Backdate,
                    param.Cabin,
                    param.Aircompany,
                    param.Seatnum == 0 ? "" : param.Seatnum.ToString(),
                    param.Passtype);
            return SendPostRequest(curl, "");
        }
        catch (Exception)
        {
            return "发生异常，请联系管理员";
        }
    }
    /// <summary>
    /// 获取config
    /// </summary>
    /// <param name="_key"></param>
    /// <returns></returns>
    private static string GetConfig(string _key)
    {
        return System.Configuration.ConfigurationManager.ConnectionStrings[_key].ConnectionString;
    }
    /// <summary>
    /// 请求API
    /// </summary>
    /// <param name="url"></param>
    /// <param name="postString"></param>
    /// <returns></returns>
    private static string SendPostRequest(string url, string postString)
    {
        byte[] postData = System.Text.Encoding.UTF8.GetBytes(postString);
        System.Net.WebClient client = new System.Net.WebClient();
        client.Headers.Add("Content-Type", "application/x-www-form-urlencoded");
        client.Headers.Add("ContentLength", postData.Length.ToString());
        byte[] responseData = client.UploadData(url, "POST", postData);
        return System.Text.Encoding.UTF8.GetString(responseData);
    }
    /// <summary>
    /// 加密算法
    /// </summary>
    /// <param name="normaltxt"></param>
    /// <returns></returns>
    public static string RSAEncrypt(string normaltxt)
    {
        byte[] bytes = Encoding.Default.GetBytes(normaltxt);
        byte[] encryptBytes = new RSACryptoServiceProvider(new CspParameters()).Encrypt(bytes, false);
        return Convert.ToBase64String(encryptBytes);
    }
    /// <summary>
    /// 解密算法
    /// </summary>
    /// <param name="securityTxt"></param>
    /// <returns></returns>
    public static string RSADecrypt(string securityTxt)
    {
        try//必须使用Try catch
        {
            byte[] bytes = Convert.FromBase64String(securityTxt);
            byte[] DecryptBytes = new RSACryptoServiceProvider(new CspParameters()).Decrypt(bytes, false);
            return Encoding.Default.GetString(DecryptBytes);
        }
        catch (Exception)
        {
            return string.Empty;
        }
    }  
    #endregion
}