using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// FlightDetail 的摘要说明
/// </summary>
public class FlightDetail
{
    public FlightDetail() 
    {
        
    }

    private string airCompanyCode;

    private string flightNumber;

    private int dayChg;

    private string planeType;

    private string startTerminal;

    private string endTerminal;

    private string stopNum;

    private string startCityCode;

    private string endCityCode;

    private string startCityName;

    private string beginCityName;

    private string toCityName;

    private string endCityName;

    private DateTime fromTime;

    private DateTime arriveTime;

    private string flyTime;

    private string cabinCode;

    private string seatNum;


    /// <summary>
    /// 航空公司代码
    /// </summary>
    public string AirCompanyCode
    {
        get { return airCompanyCode; }
        set { airCompanyCode = value; }
    }
    /// <summary>
    /// 航班号
    /// </summary>
    public string FlightNumber
    {
        get { return flightNumber; }
        set { flightNumber = value; }
    }
    /// <summary>
    /// 到达时间是否是第二天 0代表当天，1代表第二天
    /// </summary>
    public int DayChg
    {
        get { return dayChg; }
        set { dayChg = value; }
    }
    /// <summary>
    /// 机型
    /// </summary>
    public string PlaneType
    {
        get { return planeType; }
        set { planeType = value; }
    }
    /// <summary>
    /// 出发航站楼
    /// </summary>
    public string StartTerminal
    {
        get { return startTerminal; }
        set { startTerminal = value; }
    }
    /// <summary>
    /// 到达航站楼
    /// </summary>
    public string EndTerminal
    {
        get { return endTerminal; }
        set { endTerminal = value; }
    }
    /// <summary>
    /// 经停次数
    /// </summary>
    public string StopNum
    {
        get { return stopNum; }
        set { stopNum = value; }
    }
    /// <summary>
    /// 出发机场三字码
    /// </summary>
    public string StartCityCode
    {
        get { return startCityCode; }
        set { startCityCode = value; }
    }
    /// <summary>
    /// 到达机场三字码
    /// </summary>
    public string EndCityCode
    {
        get { return endCityCode; }
        set { endCityCode = value; }
    }
    /// <summary>
    /// 出发机场名称
    /// </summary>
    public string StartCityName
    {
        get { return startCityName; }
        set { startCityName = value; }
    }
    /// <summary>
    /// 出发城市名称
    /// </summary>
    public string BeginCityName
    {
        get { return beginCityName; }
        set { beginCityName = value; }
    }
    /// <summary>
    /// 到达城市名称
    /// </summary>
    public string ToCityName
    {
        get { return toCityName; }
        set { toCityName = value; }
    }
    /// <summary>
    /// 到达机场名称
    /// </summary>
    public string EndCityName
    {
        get { return endCityName; }
        set { endCityName = value; }
    }
    /// <summary>
    /// 出发时间
    /// </summary>
    public DateTime FromTime
    {
        get { return fromTime; }
        set { fromTime = value; }
    }
    /// <summary>
    /// 到达时间
    /// </summary>
    public DateTime ArriveTime
    {
        get { return arriveTime; }
        set { arriveTime = value; }
    }
    /// <summary>
    /// 飞行时长
    /// </summary>
    public string FlyTime
    {
        get { return flyTime; }
        set { flyTime = value; }
    }
    /// <summary>
    /// 舱位代码
    /// </summary>
    public string CabinCode
    {
        get { return cabinCode; }
        set { cabinCode = value; }
    }
    /// <summary>
    /// 座位数量
    /// </summary>
    public string SeatNum
    {
        get { return seatNum; }
        set { seatNum = value; }
    }
}