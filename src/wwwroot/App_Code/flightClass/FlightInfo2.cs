using System;
using System.Collections.Generic;
using System.Web;

/// <summary>
/// 往返航班的返程航班信息类
/// </summary>
public class FlightInfo2
{
	public FlightInfo2()
	{
		//
		// TODO: 在此处添加构造函数逻辑
		//
	}
    private string source;
    /// <summary>
    /// 验价时需要传递的参数
    /// </summary>
    public string Source
    {
        get { return source; }
        set { source = value; }
    }

    private string data;
    /// <summary>
    /// 验价、创建订单时需要传递的参数
    /// </summary>
    public string Data
    {
        get { return data; }
        set { data = value; }
    }

    private int polocyType;
    /// <summary>
    /// 政策类型
    /// </summary>
    public int PolocyType
    {
        get { return polocyType; }
        set { polocyType = value; }
    }

    private int isspecial;
    /// <summary>
    /// 是否特殊政策
    /// </summary>
    public int Isspecial
    {
        get { return isspecial; }
        set { isspecial = value; }
    }

    private string polocyRemark;
    /// <summary>
    /// 政策备注
    /// </summary>
    public string PolocyRemark
    {
        get { return polocyRemark; }
        set { polocyRemark = value; }
    }

    private string outPolocyId;
    /// <summary>
    /// 外部政策ID
    /// </summary>
    public string OutPolocyId
    {
        get { return outPolocyId; }
        set { outPolocyId = value; }
    }

    private Guid polocyGuid;
    /// <summary>
    /// 本地政策GUID
    /// </summary>
    public Guid PolocyGuid
    {
        get { return polocyGuid; }
        set { polocyGuid = value; }
    }

    private string filingAirline;
    /// <summary>
    /// 出票航司
    /// </summary>
    public string FilingAirline
    {
        get { return filingAirline; }
        set { filingAirline = value; }
    }

    private decimal agencyFee;
    /// <summary>
    /// 代理费
    /// </summary>
    public decimal AgencyFee
    {
        get { return agencyFee; }
        set { agencyFee = value; }
    }

    private string xmlInfo;
    /// <summary>
    /// 创建订单时需要传回的xml信息
    /// </summary>
    public string XmlInfo
    {
        get { return xmlInfo; }
        set { xmlInfo = value; }
    }

    private string airCommission;

    public string AirCommission
    {
        get { return airCommission; }
        set { airCommission = value; }
    }

    private decimal supplierPoint;
    /// <summary>
    /// 平台返点
    /// </summary>
    public decimal SupplierPoint
    {
        get { return supplierPoint; }
        set { supplierPoint = value; }
    }

    private List<FlightDetail> listInterFlightDetails;
    /// <summary>
    /// 航班详细信息集合
    /// </summary>
    public List<FlightDetail> ListInterFlightDetails
    {
        get { return listInterFlightDetails; }
        set { listInterFlightDetails = value; }
    }

    private decimal ticketPrice;
    /// <summary>
    /// 票面价
    /// </summary>
    public decimal TicketPrice
    {
        get { return ticketPrice; }
        set { ticketPrice = value; }
    }

    private decimal faxPrice;
    /// <summary>
    /// 税费
    /// </summary>
    public decimal FaxPrice
    {
        get { return faxPrice; }
        set { faxPrice = value; }
    }

    private string currency;
    /// <summary>
    /// 货币类型
    /// </summary>
    public string Currency
    {
        get { return currency; }
        set { currency = value; }
    }

    private decimal comPoint;
    /// <summary>
    /// 奖励返点
    /// </summary>
    public decimal ComPoint
    {
        get { return comPoint; }
        set { comPoint = value; }
    }

    private decimal cash;
    /// <summary>
    /// 返现
    /// </summary>
    public decimal Cash
    {
        get { return cash; }
        set { cash = value; }
    }

    private decimal fee;
    /// <summary>
    /// 开票费
    /// </summary>
    public decimal Fee
    {
        get { return fee; }
        set { fee = value; }
    }

    private string cabinRules;
    /// <summary>
    /// 退改签及限制
    /// </summary>
    public string CabinRules
    {
        get { return cabinRules; }
        set { cabinRules = value; }
    }

    private decimal policyPoint;
    /// <summary>
    /// 返点
    /// </summary>
    public decimal PolicyPoint
    {
        get { return policyPoint; }
        set { policyPoint = value; }
    }

    private decimal savePrice;
    /// <summary>
    /// 节省金额
    /// </summary>
    public decimal SavePrice
    {
        get { return savePrice; }
        set { savePrice = value; }
    }
}