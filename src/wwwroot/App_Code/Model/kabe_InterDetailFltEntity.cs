using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Xml;
using System.Collections;

/// <summary>
///kabe_InterDetailFltEntity 的摘要说明
/// </summary>
public class kabe_InterDetailFltEntity
{

    private string _sc;
    public string sc
    {
        get { return _sc; }
        set { _sc = value; }
    }

    private string _ec;
    public string ec
    {
        get { return _ec; }
        set { _ec = value; }
    }

    private string _sd;
    public string sd
    {
        get { return _sd; }
        set { _sd = value; }
    }

    private string _ed;
    public string ed
    {
        get { return _ed; }
        set { _ed = value; }
    }

    private string _air;
    public string air
    {
        get { return _air; }
        set { _air = value; }
    }

    private string _classtype;
    public string classtype
    {
        get { return _classtype; }
        set { _classtype = value; }
    }

    private string _ft;
    public string ft
    {
        get { return _ft; }
        set { _ft = value; }
    }

    private string _addtime;
    public string addtime
    {
        get { return _addtime; }
        set { _addtime = value; }
    }

    private XmlNode _result;
    public XmlNode result
    {
        get { return _result; }
        set { _result = value; }
    }
}

public class kabe_flights
{
    private string _code;
    public string code
    {
        get { return _code; }
        set { _code = value; }
    }

    private string _desc;
    public string desc
    {
        get { return _desc; }
        set { _desc = value; }
    }

    private kabe_para _para;
    public kabe_para para
    {
        get { return _para; }
        set { _para = value; }
    }

    private ArrayList _flights;
    public ArrayList flights
    {
        get { return _flights; }
        set { _flights = value; }
    }
}

public class kabe_para
{
    private string _sc;
    public string sc
    {
        get { return _sc; }
        set { _sc = value; }
    }

    private string _ec;
    public string ec
    {
        get { return _ec; }
        set { _ec = value; }
    }

    private string _sd;
    public string sd
    {
        get { return _sd; }
        set { _sd = value; }
    }

    private string _ed;
    public string ed
    {
        get { return _ed; }
        set { _ed = value; }
    }

    private string _air;
    public string air
    {
        get { return _air; }
        set { _air = value; }
    }

    private string _ft;
    public string ft
    {
        get { return _ft; }
        set { _ft = value; }
    }

    private string _pt;
    public string pt
    {
        get { return _pt; }
        set { _pt = value; }
    }

    private string _ac;
    public string ac
    {
        get { return _ac; }
        set { _ac = value; }
    }
}

public class kabe_deproute
{
    private string _route;
    public string route
    {
        get { return _route; }
        set { _route = value; }
    }

    private string _aircode;
    public string aircode
    {
        get { return _aircode; }
        set { _aircode = value; }
    }

    private string _depdate;
    public string depdate
    {
        get { return _depdate; }
        set { _depdate = value; }
    }

    private string _arrdate;
    public string arrdate
    {
        get { return _arrdate; }
        set { _arrdate = value; }
    }

    private string _deptime;
    public string deptime
    {
        get { return _deptime; }
        set { _deptime = value; }
    }

    private string _arrtime;
    public string arrtime
    {
        get { return _arrtime; }
        set { _arrtime = value; }
    }

    private string _transfer;
    public string transfer
    {
        get { return _transfer; }
        set { _transfer = value; }
    }

    private string _seat;
    public string seat
    {
        get { return _seat; }
        set { _seat = value; }
    }
}

public class kabe_segment
{
    private string _dep;
    public string dep
    {
        get { return _dep; }
        set { _dep = value; }
    }

    private string _arr;
    public string arr
    {
        get { return _arr; }
        set { _arr = value; }
    }

    private string _air;
    public string air
    {
        get { return _air; }
        set { _air = value; }
    }

    private string _flightno;
    public string flightno
    {
        get { return _flightno; }
        set { _flightno = value; }
    }
    
    
    private string _depairport;
    public string depairport
    {
        get { return _depairport; }
        set { _depairport = value; }
    }

    private string _arrairport;
    public string arrairport
    {
        get { return _arrairport; }
        set { _arrairport = value; }
    }

    private string _depdate;
    public string depdate
    {
        get { return _depdate; }
        set { _depdate = value; }
    }

    private string _arrdate;
    public string arrdate
    {
        get { return _arrdate; }
        set { _arrdate = value; }
    }

    private string _deptime;
    public string deptime
    {
        get { return _deptime; }
        set { _deptime = value; }
    }

    private string _arrtime;
    public string arrtime
    {
        get { return _arrtime; }
        set { _arrtime = value; }
    }

    private string _flytime;
    public string flytime
    {
        get { return _flytime; }
        set { _flytime = value; }
    }

    private string _plane;
    public string plane
    {
        get { return _plane; }
        set { _plane = value; }
    }

    private string _seat;
    public string seat
    {
        get { return _seat; }
        set { _seat = value; }
    }

    private string _stop;
    public string stop
    {
        get { return _stop; }
        set { _stop = value; }
    }

    private string _datas;
    public string datas
    {
        get { return _datas; }
        set { _datas = value; }
    }
}

public class kabe_flight
{
    private string _source;
    public string source
    {
        get { return _source; }
        set { _source = value; }
    }

    private string _ticketId;
    public string ticketId
    {
        get { return _ticketId; }
        set { _ticketId = value; }
    }

    private string _ft;
    public string ft
    {
        get { return _ft; }
        set { _ft = value; }
    }

    private string _relayPort;
    public string relayPort
    {
        get { return _relayPort; }
        set { _relayPort = value; }
    }

    private string _depport;
    public string depport
    {
        get { return _depport; }
        set { _depport = value; }
    }

    private string _arrport;
    public string arrport
    {
        get { return _arrport; }
        set { _arrport = value; }
    }

    private string _airline;
    public string airline
    {
        get { return _airline; }
        set { _airline = value; }
    }

    private decimal _adultprice;
    public decimal adultprice
    {
        get { return _adultprice; }
        set { _adultprice = value; }
    }

    private decimal _childprice;
    public decimal childprice
    {
        get { return _childprice; }
        set { _childprice = value; }
    }

    private string _tax;
    public string tax
    {
        get { return _tax; }
        set { _tax = value; }
    }

    private string _currency;
    public string currency
    {
        get { return _currency; }
        set { _currency = value; }
    }

    private string _open;
    public string open
    {
        get { return _open; }
        set { _open = value; }
    }

    public kabe_deproute _deproute;
    public kabe_deproute deproute
    {
        get { return _deproute; }
        set { _deproute = value; }
    }

    public kabe_deproute _arrroute;
    public kabe_deproute arrroute
    {
        get { return _arrroute; }
        set { _arrroute = value; }
    }


    public ArrayList _segment;
    public ArrayList segment
    {
        get { return _segment; }
        set { _segment = value; }
    }
}

public class kabe_Airline
{
    public string airlineCode;
    public string airlineName;
    public string airlineId;
    public string airlinePic;
    public string airlineLogoPic;
}
