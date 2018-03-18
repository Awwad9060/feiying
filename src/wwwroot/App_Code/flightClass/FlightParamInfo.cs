using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// 航班查询请求参数类
/// </summary>
public class FlightParamInfo
{
    public FlightParamInfo()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    private string startairport;
    /// <summary>
    /// 出发机场码
    /// </summary>
    public string Startairport
    {
        get { return startairport; }
        set { startairport = value; }
    }
    private string endairport;
    /// <summary>
    /// 到达机场码
    /// </summary>
    public string Endairport
    {
        get { return endairport; }
        set { endairport = value; }
    }
    private string startdate;
    /// <summary>
    /// 出发时间
    /// </summary>
    public string Startdate
    {
        get { return startdate; }
        set { startdate = value; }
    }
    private string startcity = string.Empty;
    /// <summary>
    /// 出发城市
    /// </summary>
    public string Startcity
    {
        get { return startcity; }
        set { startcity = value; }
    }
    private string endcity = string.Empty;
    /// <summary>
    /// 到达城市
    /// </summary>
    public string Endcity
    {
        get { return endcity; }
        set { endcity = value; }
    }
    private string backdate = string.Empty;
    /// <summary>
    /// 返回时间
    /// </summary>
    public string Backdate
    {
        get { return backdate; }
        set { backdate = value; }
    }
    private string cabin = string.Empty;
    /// <summary>
    /// 舱位类型 经济舱：Economy  公务舱：Business
    /// </summary>
    public string Cabin
    {
        get { return cabin; }
        set { cabin = value; }
    }
    private string aircompany = string.Empty;
    /// <summary>
    /// 航空公司
    /// </summary>
    public string Aircompany
    {
        get { return aircompany; }
        set { aircompany = value; }
    }
    private int seatnum;
    /// <summary>
    /// 座位数
    /// </summary>
    public int Seatnum
    {
        get { return seatnum; }
        set { seatnum = value; }
    }
    private string passtype = string.Empty;
    /// <summary>
    /// 乘客类型 成人：ADT  儿童：CNN
    /// </summary>
    public string Passtype
    {
        get { return passtype; }
        set { passtype = value; }
    }
}