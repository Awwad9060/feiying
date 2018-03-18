using System;
using System.Data;
using System.IO;
using System.Web;

public class ReadXmlHelper
{
    #region 机场代码
    /// <summary>
    /// 全部机场xml路径
    /// </summary>
    private static string AirPortDataPath { get {  return HttpRuntime.AppDomainAppPath + "\\xml\\AllAirPort.xml"; } }

    /// <summary>
    /// 根据机场代码查名称
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    public static string GetAirPortNameByCode(string code)
    {
        if (string.IsNullOrEmpty(code))
            return string.Empty;

        code = code.Trim().ToUpper();
        DataTable dt = GetAllAirPortData();
        DataRow[] drs = dt.Select("code='" + code + "'");
        if (drs.Length > 0)
            return drs[0]["name"].ToString();

        return code;
    }

    /// <summary>
    /// 根据机场代码查询机场ID
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    public static string GetAirPortIDByCode(string code)
    {
        if (string.IsNullOrEmpty(code))
            return string.Empty;

        code = code.Trim().ToUpper();
        DataTable dt = GetAllAirPortData();
        DataRow[] drs = dt.Select("code='" + code + "'");
        if (drs.Length > 0)
            return drs[0]["apId"].ToString();

        return string.Empty;
    }

    /// <summary>
    /// 获取所有机场数据列表
    /// </summary>
    /// <returns></returns>
    private static DataTable GetAllAirPortData()
    {
        DataTable dt = (DataTable)CacheAccess.GetFromCache("AirPortData_Cache");
        if (dt != null)
            return dt;

        DataSet ds = new DataSet();
        if (!File.Exists(AirPortDataPath))
        {
            throw new Exception("机场数据文件不存在!");
        }
        ds.ReadXml(AirPortDataPath);
        //写入缓存
        CacheAccess.SaveToCache("AirPortData_Cache", ds.Tables[0], DateTime.Now.AddDays(1));
        return ds.Tables[0];
    }
    #endregion

    #region 航空公司代码
    /// <summary>
    /// 全部航空公司xml路径
    /// </summary>
    private static string AirLineDataPath { get {  return HttpRuntime.AppDomainAppPath + "\\xml\\AllAirLine.xml"; } }

    /// <summary>
    /// 根据航空公司代码查名称
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    public static string GetAirLineNameByCode(string code, out long id, out string pic)
    {
        id = 0; pic = string.Empty;
        if (string.IsNullOrEmpty(code))
            return string.Empty;

        code = code.Trim().ToUpper();
        DataTable dt = GetAllAirLineData();
        DataRow[] drs = dt.Select("code='" + code + "'");
        if (drs.Length > 0)
        {
            id = Convert.ToInt64(drs[0]["id"]);
            pic = drs[0]["pic"].ToString();
            return drs[0]["name"].ToString();
        }

        return code;
    }

    public static string GetAirLineNameByID(long id, out string code, out string pic)
    {
        code = string.Empty; pic = string.Empty;

        DataTable dt = GetAllAirLineData();
        DataRow[] drs = dt.Select("id='" + id + "'");
        if (drs.Length > 0)
        {
            code = drs[0]["code"].ToString();
            pic = drs[0]["pic"].ToString();
            return drs[0]["name"].ToString();
        }

        return string.Empty;
    }

    /// <summary>
    /// 根据ID获取航空公司Code
    /// </summary>
    /// <param name="id"></param>
    /// <returns></returns>
    public static string GetAirLineCodeByID(long id)
    {
        DataTable dt = GetAllAirLineData();
        DataRow[] drs = dt.Select("id='" + id + "'");
        if (drs.Length > 0)
            return drs[0]["code"].ToString();

        return string.Empty;
    }

    /// <summary>
    /// 获取所有航空公司数据列表
    /// </summary>
    /// <returns></returns>
    private static DataTable GetAllAirLineData()
    {
        DataTable dt = (DataTable)CacheAccess.GetFromCache("AirLineData_Cache");
        if (dt != null)
            return dt;

        DataSet ds = new DataSet();
        if (!File.Exists(AirLineDataPath))
        {
            throw new Exception("航空公司数据文件不存在!");
        }
        ds.ReadXml(AirLineDataPath);
        //写入缓存
        CacheAccess.SaveToCache("AirLineData_Cache", ds.Tables[0], DateTime.Now.AddDays(1));
        return ds.Tables[0];
    }
    #endregion

    #region 出发地代码
    /// <summary>
    /// 全部出发地xml路径
    /// </summary>
    private static string FromCityDataPath { get { return HttpRuntime.AppDomainAppPath + "\\xml\\AllFromCity.xml"; } }

    /// <summary>
    /// 根据出发地代码查名称
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    public static string GetFromCityNameByCode(string code, out long id)
    {
        id = 0;
        if (string.IsNullOrEmpty(code))
            return string.Empty;

        code = code.Trim().ToUpper();
        DataTable dt = GetAllFromCityData();
        DataRow[] drs = dt.Select("code='" + code + "'");
        if (drs.Length > 0)
        {
            id = Convert.ToInt64(drs[0]["id"]);
            return drs[0]["name"].ToString();
        }

        return string.Empty;
    }

    /// <summary>
    /// 获取所有出发地数据列表
    /// </summary>
    /// <returns></returns>
    private static DataTable GetAllFromCityData()
    {
        DataTable dt = (DataTable)CacheAccess.GetFromCache("FromCityData_Cache");
        if (dt != null)
            return dt;

        DataSet ds = new DataSet();
        if (!File.Exists(FromCityDataPath))
        {
            throw new Exception("出发地数据文件不存在!");
        }
        ds.ReadXml(FromCityDataPath);
        //写入缓存
        CacheAccess.SaveToCache("FromCityData_Cache", ds.Tables[0], DateTime.Now.AddDays(1));
        return ds.Tables[0];
    }
    #endregion

    #region 目的地代码
    /// <summary>
    /// 全部目的地xml路径
    /// </summary>
    private static string ToCityDataPath { get {  return HttpRuntime.AppDomainAppPath + "\\xml\\AllToCity.xml"; } }

    /// <summary>
    /// 根据目的地代码查名称
    /// </summary>
    /// <param name="code"></param>
    /// <returns></returns>
    public static string GetToCityNameByCode(string code, out long id)
    {
        id = 0;
        if (string.IsNullOrEmpty(code))
            return string.Empty;

        code = code.Trim().ToUpper();
        DataTable dt = GetAllToCityData();
        DataRow[] drs = dt.Select("code='" + code + "'");
        if (drs.Length > 0)
        {
            id = Convert.ToInt64(drs[0]["id"]);
            return drs[0]["name"].ToString();
        }

        return string.Empty;
    }

    /// <summary>
    /// 获取所有目的地数据列表
    /// </summary>
    /// <returns></returns>
    private static DataTable GetAllToCityData()
    {
        DataTable dt = (DataTable)CacheAccess.GetFromCache("ToCityData_Cache");
        if (dt != null)
            return dt;

        DataSet ds = new DataSet();
        if (!File.Exists(ToCityDataPath))
        {
            throw new Exception("目的地数据文件不存在!");
        }
        ds.ReadXml(ToCityDataPath);
        //写入缓存
        CacheAccess.SaveToCache("ToCityData_Cache", ds.Tables[0], DateTime.Now.AddDays(1));
        return ds.Tables[0];
    }
    #endregion
}
