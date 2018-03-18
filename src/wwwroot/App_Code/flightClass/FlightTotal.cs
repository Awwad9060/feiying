using Newtonsoft.Json;
using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// 航班总类
/// </summary>
public class FlightTotal
{
    public FlightTotal()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}

    private string _successcode;
    /// <summary>
    /// 成功标识 T-成功;F-失败;
    /// </summary>
    public string successcode
    {
        get { return _successcode; }
        set { _successcode = value; }
    }

    private List<FlightRoundTrip> _result;
    /// <summary>
    /// 返回结果集
    /// </summary>
    public List<FlightRoundTrip> result
    {
        get { return _result; }
        set { _result = value; }
    }
}