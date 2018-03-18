using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// 保存在Session中的
/// </summary>
[Serializable]
public class AirLine
{

    public int aid;                    //     递增标识
    public string chName;          // 	 中文名
    public string enName;          // 	 英文名
    public string nation;          // 	 所属国家
    public string airlineCode;          // 	 代码
    public string logoPic;
    public string description;
    public string planNum;
    public string age;
    public string baggageTerm;



    public AirLine()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 递增整数
    /// </summary>
    public int Aid
    {
        set { aid = value; }
        get { return aid; }
    }


    public string ChName
    {
        set { chName = value; }
        get { return chName; }
    }

    public string EnName
    {
        set { enName = value; }
        get { return enName; }
    }

    public string Nation
    {
        set { nation = value; }
        get { return nation; }
    }


    public string AirlineCode
    {
        set { airlineCode = value; }
        get { return airlineCode; }
    }


    public string LogoPic
    {
        set { logoPic = value; }
        get { return logoPic; }
    }


    public string Description
    {
        set { description = value; }
        get { return description; }
    }


    public string PlanNum
    {
        set { planNum = value; }
        get { return planNum; }
    }

    public string Age
    {
        set { age = value; }
        get { return age; }
    }

    public string BaggageTerm
    {
        set { baggageTerm = value; }
        get { return baggageTerm; }
    }

}
