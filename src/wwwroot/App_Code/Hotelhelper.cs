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
/// Hotelhelper 的摘要说明
/// </summary>
public class Hotelhelper
{
    public Hotelhelper()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 获取酒店星级图片
    /// </summary>
    /// <param name="Code"></param>
    /// <returns></returns>
    public static string getHotelRate(string Code)
    {
        string Image=string.Empty;
        switch(Code)
        {
            case "1":
                Image = "<img src=\"/images/hotelrate/1.gif\" alt=\"\" />";
                break;
            case "2":
                Image = "<img src=\"/images/hotelrate/2.gif\" alt=\"\" />";
                break;
            case "2+":
                Image = "<img src=\"/images/hotelrate/2.5.gif\" alt=\"\" />";
                break;
            case "3":
                Image = "<img src=\"/images/hotelrate/3.gif\" alt=\"\" />";
                break;
            case "3+":
                Image = "<img src=\"/images/hotelrate/3.5.gif\" alt=\"\" />";
                break;
            case "4":
                Image = "<img src=\"/images/hotelrate/4.gif\" alt=\"\" />";
                break;
            case "4+":
                Image = "<img src=\"/images/hotelrate/4.5.gif\" alt=\"\" />";
                break;
            default:
                Image = "<img src=\"/images/hotelrate/5.gif\" alt=\"\" />";
                break;
        }

        return Image;
    }

}
