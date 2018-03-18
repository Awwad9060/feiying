using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using System.Security.Cryptography;
using System.Text.RegularExpressions;
/// <summary>
/// Public 的摘要说明
/// </summary>
public class Public
{
//----------------------------------------------------------------------------------------------
    public static string DESKey = "tenbars1";//帐号密码的解密加密的密钥
    //，而且该密钥必须是八位···
    //修改此密钥前前先在加密解密小帮手先更新数据后，再更新此密钥
  //---------------------------------------------------------------------------------------------
    public Public()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }


    // 提取HTML代码中的文字 
    public static string StripHTML(string strHtml)
    {
        string[] aryReg ={
          @"<script[^>]*?>.*?</script>",

          @"<(\/\s*)?!?((\w+:)?\w+)(\w+(\s*=?\s*(([""'])(\\[""'tbnr]|[^\7])*?\7|\w+)|.{0})|\s)*?(\/\s*)?>",
          @"([\r\n])[\s]+",
          @"&(quot|#34);",
          @"&(amp|#38);",
          @"&(lt|#60);",
          @"&(gt|#62);", 
          @"&(nbsp|#160);", 
          @"&(iexcl|#161);",
          @"&(cent|#162);",
          @"&(pound|#163);",
          @"&(copy|#169);",
          @"&#(\d+);",
          @"-->",
          @"<!--.*\n"
         
         };

        string[] aryRep = {
           "",
           "",
           "",
           "\"",
           "&",
           "<",
           ">",
           " ",
           "\xa1",//chr(161),
           "\xa2",//chr(162),
           "\xa3",//chr(163),
           "\xa9",//chr(169),
           "",
           "\r\n",
           ""
          };

        string newReg = aryReg[0];
        string strOutput = strHtml;
        for (int i = 0; i < aryReg.Length; i++)
        {
            Regex regex = new Regex(aryReg[i], RegexOptions.IgnoreCase);
            strOutput = regex.Replace(strOutput, aryRep[i]);
        }

        strOutput.Replace("<", "");
        strOutput.Replace(">", "");
        strOutput.Replace("\r\n", "");


        return strOutput;
    }



    public static string HtmlEncode(string theString)
    {

        //theString = theString.Replace(">", "&gt;");
        //theString = theString.Replace("<", "&lt;");
        //theString = theString.Replace(" ", "&nbsp;");
        //theString = theString.Replace("&nbsp;", " ");
        //theString = theString.Replace("\"", "&quot;");
        //theString = theString.Replace("\'", "&#39;");
        //theString = theString.Replace(@"\r\n", "&lt;BR&gt;");
        //theString = theString.Replace(@"\r\n", "&lt;br&gt;");
        //theString = theString.Replace(@"\n", "&lt;BR/&gt;");
        //theString = theString.Replace(@"\n", "&lt;br/&gt;");
        return theString;
    }

}
