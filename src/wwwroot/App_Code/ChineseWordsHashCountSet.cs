using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Collections;

/// <summary>
/// ChineseWordsHashCountSet 的摘要说明
/// </summary>
public class ChineseWordsHashCountSet
{
    /// <summary>   
    /// 记录字符串在中文词语中出现次数的Hashtable。键为特定的字符串，值为该字符串在中文词语中出现的次数。   
    /// </summary>   
    private Hashtable _rootTable;
    /// <summary>   
    /// 类型初始化。   
    /// </summary>   
    public ChineseWordsHashCountSet()
    {
        _rootTable = new Hashtable();
    }
    /// <summary>   
    /// 查询指定字符串出现在中文字典所录中文词语的前端的次数。   
    /// </summary>   
    /// <param name="s">指定字符串</param>   
    /// <returns>字符串出现在中文字典所录中文词语的前端的次数。若为-1，表示不出现。</returns>   
    public int GetCount(string s)
    {
        if (!this._rootTable.ContainsKey(s.Length))
        {
            return -1;
        }
        Hashtable _tempTable = (Hashtable)this._rootTable[s.Length];
        if (!_tempTable.ContainsKey(s))
        {
            return -1;
        }
        return (int)_tempTable[s];
    }
    /// <summary>   
    /// 向次数字典中插入一个词语。解析该词语，插入次数字典。   
    /// </summary>   
    /// <param name="s">所处理的字符串。</param>   
    public void InsertWord(string s)
    {
        for (int i = 0; i < s.Length; i++)
        {
            string _s = s.Substring(0, i + 1);
            this.InsertSubString(_s);
        }
    }
    /// <summary>   
    /// 向次数字典中插入一个字符串的次数记录。   
    /// </summary>   
    /// <param name="s">所插入的字符串。</param>   
    private void InsertSubString(string s)
    {
        if (!_rootTable.ContainsKey(s.Length) && s.Length > 0)
        {
            Hashtable _newHashtable = new Hashtable();
            _rootTable.Add(s.Length, _newHashtable);
        }
        Hashtable _tempTable = (Hashtable)_rootTable[s.Length];
        if (!_tempTable.ContainsKey(s))
        {
            _tempTable.Add(s, 1);
        }
        else
        {
            _tempTable[s] = (int)_tempTable[s] + 1;
        }
    }
}   
