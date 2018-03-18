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
/// ChineseWordUnit 的摘要说明
/// </summary>
public struct ChineseWordUnit
{
    private string _word;
//    private int _power;
    /// <summary>   
    /// 中文词语单元所对应的中文词。   
    /// </summary>   
    public string Word
    {
        get
        {
            return _word;
        }
    }
    /// <summary>   
    /// 该中文词语的权重。   
    /// </summary>   
    //public int Power
    //{
    //    get
    //    {
    //        return _power;
    //    }
    //}
    /// <summary>   
    /// 结构初始化。   
    /// </summary>   
    /// <param name="word">中文词语</param>   
    /// <param name="power">该词语的权重</param>   
    public ChineseWordUnit(string word)
    {
        this._word = word;
    }
}