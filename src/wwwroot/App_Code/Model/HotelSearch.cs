using System;

/// <summary>
/// Server 的摘要说明
/// </summary>
public class HotelSearch
{
    private string cityName;

    public string CityName
    {
      get { return cityName; }
      set { cityName = value; }
    }

    private string hotelName;

    public string HotelName
    {
      get { return hotelName; }
      set { hotelName = value; }
    }

    private DateTime fromDate;

    public DateTime FromDate
    {
      get { return fromDate; }
      set { fromDate = value; }
    }

    private DateTime toDate;

    public DateTime ToDate
    {
      get { return toDate; }
      set { toDate = value; }
    }

    private int minPrice;

    public int MinPrice
    {
      get { return minPrice; }
      set { minPrice = value; }
    }

    private int maxPrice;

    public int MaxPrice
    {
      get { return maxPrice; }
      set { maxPrice = value; }
    }

    private int bookNum;

    public int BookNum
    {
      get { return bookNum; }
      set { bookNum = value; }
    }

    public string SessionKey
    {
        get { return "fei580_HotelSearchKey"; }
    }

}
