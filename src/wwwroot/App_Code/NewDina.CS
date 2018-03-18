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
/// NewDina 的摘要说明
/// </summary>
public class NewDina
{
        #region Fields
        private string _news_Title = String.Empty;
        private string _news_Content = String.Empty;
        #endregion

        #region 
        public string news_Title
        {
            get { return _news_Title; }
            set { _news_Title = value; }
        }
        public string news_Content
        {
            get { return _news_Content; }
            set { _news_Content = value; }
        }
        
        #endregion
}
