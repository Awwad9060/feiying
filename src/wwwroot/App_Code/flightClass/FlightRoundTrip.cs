using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// 往返航班信息
/// </summary>
public class FlightRoundTrip
{
    public FlightRoundTrip()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    private List<FlightInfo> listInterFlightInfo;
    /// <summary>
    /// 航班信息数组
    /// </summary>
    public List<FlightInfo> ListInterFlightInfo
    {
        get { return listInterFlightInfo; }
        set { listInterFlightInfo = value; }
    }

    private List<FlightInfo2> listInterFlightInfo2;
    /// <summary>
    /// 往返航班的返程航班信息
    /// </summary>
    public List<FlightInfo2> ListInterFlightInfo2
    {
        get { return listInterFlightInfo2; }
        set { listInterFlightInfo2 = value; }
    }
}