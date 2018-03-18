using System;
using System.Data;
using System.IO;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class console_ticketing_smallticketing_add : System.Web.UI.Page
{
    int memberId = 0;
    string Name = string.Empty;
    string fromcity = string.Empty;
    string tocity = string.Empty;
    string chufa = string.Empty;
    string huicheng = string.Empty;
    string airline = string.Empty;
    bool isInsert = true;

    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["memberId"] == null 
            ||Request.QueryString["Name"] == null
            || Request.QueryString["fromcity"] == null
            || Request.QueryString["tocity"] == null
            || Request.QueryString["chufa"] == null
            || Request.QueryString["huicheng"] == null
            || Request.QueryString["airline"] == null
            )
        {
            Response.Redirect("http://www.fei580.com");
            return;
        }

        memberId = Convert.ToInt32(Request.QueryString["memberId"]);
        Name = Request.QueryString["Name"].ToString();
        fromcity = Request.QueryString["fromcity"].ToString();
        tocity = Request.QueryString["tocity"].ToString();
        chufa = Request.QueryString["chufa"].ToString();
        huicheng = Request.QueryString["huicheng"].ToString();
        airline = Request.QueryString["airline"].ToString();

        string str = "select * from FY_ticketing where cId=" + memberId;
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);

        //不存在
        if (ds == null || ds.Tables[0] == null || ds.Tables[0].Rows.Count == 0)
        {
            this.isInsert = true;
            if (!IsPostBack)
            {
                this.txt_fromcity.Value = fromcity;
                this.txt_tocity.Value = tocity;
                this.txt_chufa.Value = chufa;
                this.txt_huicheng.Value = huicheng;
                this.txt_airline.Value = airline;
                this.txt_jifen.Value = "100";
                this.sel_number.Value = "1";
                this.lblTitle.Text = "新增&nbsp;&nbsp;" + Name + "&nbsp;&nbsp;电子票";
            }
        }
        else
        {
            this.isInsert = false;
            if (!IsPostBack)
            {
                this.txt_fromcity.Value = ds.Tables[0].Rows[0]["fromcity"].ToString();
                this.txt_tocity.Value = ds.Tables[0].Rows[0]["tocity"].ToString();
                this.txt_chufa.Value = ds.Tables[0].Rows[0]["chufa"].ToString();
                this.txt_huicheng.Value = ds.Tables[0].Rows[0]["huicheng"].ToString();
                this.txt_airline.Value = ds.Tables[0].Rows[0]["airline"].ToString();
                this.txt_jifen.Value = ds.Tables[0].Rows[0]["ticketingJifen"].ToString();
                this.sel_number.Value = ds.Tables[0].Rows[0]["ticketingNumber"].ToString();
                this.lblTitle.Text = "修改&nbsp;&nbsp;" + Name + "&nbsp;&nbsp;电子票";
            }
        }
    }

    /// <summary>
    /// 对数据库进行检测
    /// </summary>
    /// <param tId="friendId"></param>
    protected bool Check(string code)
    {
        MemberInfo memberinfo = (MemberInfo)Session["memberinfo"];

        string str = "if not exists (select cId from FY_ticketing where ticketingId='" + code + "') select 1 else select 0";

        if (SqlHelper.ExecuteScalar(SqlHelper.ConnString_select, CommandType.Text, str).ToString() == "0")
            return false;
        else
            return true;
    }

    /// <summary>
    /// 上传电子票
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string fromcity = this.txt_fromcity.Value;
        if (string.IsNullOrEmpty(fromcity))
        {
            scripthelp.Alert("请输入出发地！", this.Page);
            return;
        }

        string tocity = this.txt_tocity.Value;
        if (string.IsNullOrEmpty(tocity))
        {
            scripthelp.Alert("请输入目的地！", this.Page);
            return;
        }

        string chufa = this.txt_chufa.Value;
        if (!string.IsNullOrEmpty(chufa))
        {
            DateTime chufad;
            if (!DateTime.TryParse(chufa, out chufad))
            {
                scripthelp.Alert("出发日期格式错误！", this.Page);
                return;
            }
        }
        string huicheng = this.txt_huicheng.Value;
        if (!string.IsNullOrEmpty(huicheng))
        {
            DateTime huichengd;
            if (!DateTime.TryParse(huicheng, out huichengd))
            {
                scripthelp.Alert("回程日期格式错误！", this.Page);
                return;
            }
        }
        string airline = this.txt_airline.Value;
        if (string.IsNullOrEmpty(airline))
        {
            scripthelp.Alert("请输入航空公司！", this.Page);
            return;
        }

        int number = 1;
        int.Parse(this.sel_number.Value);

        string picPath = string.Empty;
        if (!FileUpload_picPath.HasFile)
        {
            scripthelp.Alert("请选择上传文件！", this.Page);
            return;
        }
        if (!FileUploadOK(out picPath))
        {
            scripthelp.Alert("上传文件失败，请重新操作！", this.Page);
            return;
        }

        int jifen = 0;
        if (!int.TryParse(this.txt_jifen.Value,out jifen))
        {
            scripthelp.Alert("输入积分格式错误！", this.Page);
            return;
        }

        string code = string.Empty;
        bool bl = false;
        while (!bl)
        {
            code = "fy" + new Random().Next(10000000, 99999999);
            bl = Check(code);
        }

        string str = string.Format(
            "insert into FY_ticketing (cId,fromcity,tocity,chufa,huicheng,airline,ticketingId,ticketingPath,ticketingState,ticketingNumber,ticketingJifen) values ({0},'{1}','{2}','{3}','{4}','{5}','{6}','{7}',{8},{9},{10}) ",
            memberId,
            fromcity,
            tocity,
            chufa,
            huicheng,
            airline,
            code,
            picPath,
            1,
            number,
            jifen
            );
        if(!isInsert)
            str = string.Format(
                "update  FY_ticketing set fromcity='{1}',tocity='{2}',chufa='{3}',huicheng='{4}',airline='{5}', ticketingId='{6}',ticketingPath='{7}',ticketingState={8},ticketingNumber={9},ticketingJifen={10},updatetime=getdate()  where cId ={0}",
                memberId,
                fromcity,
                tocity,
                chufa,
                huicheng,
                airline,
                code,
                picPath,
                1,
                number,
                jifen
                );
        try
        {
            int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_select, CommandType.Text, str);
            if (count > 0)
                scripthelp.Alert("操作成功！", this.Page);
            else
                scripthelp.Alert("操作失败！", this.Page);
        }
        catch {
            scripthelp.Alert("操作失败，请重新操作！", this.Page);
        }
    }


    /// <summary>
    /// 上传图片
    /// </summary>
    /// <param name="license_url"></param>
    /// <returns></returns>
    private bool FileUploadOK(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/ticketing/" + _time + "/";
            _dbpicPath = "upload_web/ticketing/" + _time + "/";
            _physicPath = Request.MapPath(_picPath);
            if (!Directory.Exists(_physicPath))
                Directory.CreateDirectory(_physicPath);
            #endregion

            #region 上传图片

            //读取所有上传的文件
            HttpFileCollection files = HttpContext.Current.Request.Files;
            long maxSize = long.Parse(ConfigurationManager.AppSettings.Get("newsPicSize"));
            //long maxSize = 512 * 1024;
            for (int i = 0; i < files.Count; i++)
            {
                string _fileName = FileUpload_picPath.FileName; // 客户端文件路径
                fname = Path.GetFileName(files[i].FileName);
                if (maxSize > 0 && files[i].ContentLength > maxSize)
                {
                    scripthelp.Alert("该文件(" + fname + ")超过了限制大小(" + maxSize + "byte),不允许上传。!", this.Page);
                    picPath = string.Empty;
                    return false;
                }
                //取得图片后缀
                _picExtension = GetFileExtends(_fileName);

                picPath = _picPath + _picName + _picExtension;//图片相对路径+图片随机名称+图片后缀

                FileUpload_picPath.SaveAs(_physicPath + _picName + _picExtension);//保存图片
            }
            #endregion
            _ok = true;
        }
        else
        {
            #region 返回信息
            picPath = string.Empty;
            _ok = false;
            #endregion
        }
        picPath = _dbpicPath + _picName + _picExtension;
        return _ok;
    }

    /// <summary>
    /// 取得文件后缀
    /// </summary>
    /// <param name="filename"></param>
    /// <returns></returns>
    public static string GetFileExtends(string filename)
    {
        string ext = null;
        if (filename.IndexOf('.') > 0)
        {
            string[] fs = filename.Split('.');
            ext = fs[fs.Length - 1];
        }
        return "." + ext;
    }
}
