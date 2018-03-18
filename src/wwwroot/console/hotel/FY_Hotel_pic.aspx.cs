using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Text;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;

public partial class cms_hotel_FY_Hotel_pic : System.Web.UI.Page 
{
    private string preFileDateTime = "";

    private int preFileIndex = 0;

    public int hotelId = 0;

    private bool isInt = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
        if (adminmerinfo == null)
        {

            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }

        hotelId = Convert.ToInt32(Request.QueryString["hotelId"]);

        string str = "select * from FY_Hotel where hId=" + hotelId;
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        this.lblTitle.Text = ds.Tables[0].Rows[0]["HotelName"].ToString() + "图片集";

        isInt = CheckHotelPic(hotelId);

        if (!isInt && !IsPostBack)
            GetProInfo();
    }

    /// <summary>
    /// 对数据库进行检测(true不存在，false存在)
    /// </summary>
    /// <param tId="friendId"></param>
    protected bool CheckHotelPic(int hotelId)
    {
        string str = "if not exists (select id from FY_Hotel_Pic where hotelId=" + hotelId + ") select 1 else select 0";

        if (SqlHelper.ExecuteScalar(SqlHelper.ConnString_select, CommandType.Text, str).ToString() == "0")
            return false;
        else
            return true;
    }

    /// <summary>
    /// 获取要修改图片的信息
    /// </summary>
    protected void GetProInfo()
    {
        string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;
        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnString_select, CommandType.Text, str);
        while (dr.Read())
        {
            if (dr["pic1"].ToString() != "")
                imgpro1.ImageUrl = "../../" + dr["pic1"].ToString();
            this.txt_hotel1.Value = dr["hotel1"].ToString();

            if (dr["pic2"].ToString() != "")
                imgpro2.ImageUrl = "../../" + dr["pic2"].ToString();
            this.txt_hotel2.Value = dr["hotel2"].ToString();

            if (dr["pic3"].ToString() != "")
                imgpro3.ImageUrl = "../../" + dr["pic3"].ToString();
            this.txt_hotel3.Value = dr["hotel3"].ToString();
        
            if (dr["pic4"].ToString() != "")
      
                imgpro4.ImageUrl = "../../" + dr["pic4"].ToString();
            this.txt_hotel4.Value = dr["hotel4"].ToString();
     
            if (dr["pic5"].ToString() != "")
       
                imgpro5.ImageUrl = "../../" + dr["pic5"].ToString();
            this.txt_hotel5.Value = dr["hotel5"].ToString();
        
            if (dr["pic6"].ToString() != "")
        
                imgpro6.ImageUrl = "../../" + dr["pic6"].ToString();
            this.txt_hotel6.Value = dr["hotel6"].ToString();
       
            if (dr["pic7"].ToString() != "")
     
                imgpro7.ImageUrl = "../../" + dr["pic7"].ToString();
            this.txt_hotel7.Value = dr["hotel7"].ToString();
      
            if (dr["pic8"].ToString() != "")
      
                imgpro8.ImageUrl = "../../" + dr["pic8"].ToString();
            this.txt_hotel8.Value = dr["hotel8"].ToString();
   
            if (dr["pic9"].ToString() != "")
     
                imgpro9.ImageUrl = "../../" + dr["pic9"].ToString();
            this.txt_hotel9.Value = dr["hotel9"].ToString(); 
        }

    }

    /// <summary>
    /// 添加（修改）信息 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnok_Click(object sender, EventArgs e)
    {
        string str = string.Empty;
        string ppic1 = string.Empty;
        string ppic2 = string.Empty;
        string ppic3 = string.Empty;
        string ppic4 = string.Empty;
        string ppic5 = string.Empty;
        string ppic6 = string.Empty;
        string ppic7 = string.Empty;
        string ppic8 = string.Empty;
        string ppic9 = string.Empty;

        string ahotel1 = string.Empty;
        string ahotel2 = string.Empty;
        string ahotel3 = string.Empty;
        string ahotel4 = string.Empty;
        string ahotel5 = string.Empty;
        string ahotel6 = string.Empty;
        string ahotel7 = string.Empty;
        string ahotel8 = string.Empty;
        string ahotel9 = string.Empty;

        if (!isInt)
        {
            str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

            if (dt.Rows.Count < 0)
                return;
            else
            {
                ppic1 = dt.Rows[0]["pic1"].ToString();
                ppic2 = dt.Rows[0]["pic2"].ToString();
                ppic3 = dt.Rows[0]["pic3"].ToString();
                ppic4 = dt.Rows[0]["pic4"].ToString();
                ppic5 = dt.Rows[0]["pic5"].ToString();
                ppic6 = dt.Rows[0]["pic6"].ToString();
                ppic7 = dt.Rows[0]["pic7"].ToString();
                ppic8 = dt.Rows[0]["pic8"].ToString();
                ppic9 = dt.Rows[0]["pic9"].ToString();
            }

            ahotel1 = this.txt_hotel1.Value.Trim();
            ahotel2 = this.txt_hotel2.Value.Trim();
            ahotel3 = this.txt_hotel3.Value.Trim();
            ahotel4 = this.txt_hotel4.Value.Trim();
            ahotel5 = this.txt_hotel5.Value.Trim();
            ahotel6 = this.txt_hotel6.Value.Trim();
            ahotel7 = this.txt_hotel7.Value.Trim();
            ahotel8 = this.txt_hotel8.Value.Trim();
            ahotel9 = this.txt_hotel9.Value.Trim();

            if (hidpic1.Value == "")
            {
                hidpic1.Value = ppic1;
            }

            if (hidpic2.Value == "")
            {
                hidpic2.Value = ppic2;
            }

            if (hidpic3.Value == "")
            {
                hidpic3.Value = ppic3;
            }

            if (hidpic4.Value == "")
            {
                hidpic4.Value = ppic4;
            }

            if (hidpic5.Value == "")
            {
                hidpic5.Value = ppic5;
            }

            if (hidpic6.Value == "")
            {
                hidpic6.Value = ppic6;
            }

            if (hidpic7.Value == "")
            {
                hidpic7.Value = ppic7;
            }

            if (hidpic8.Value == "")
            {
                hidpic8.Value = ppic8;
            }
            if (hidpic9.Value == "")
            {
                hidpic9.Value = ppic9;
            }

            str = "update FY_Hotel_Pic set hotelId = " + hotelId + ","
                      + "pic1='" + Sys.filterSQLStr(hidpic1.Value) + "',pic2='" + Sys.filterSQLStr(hidpic2.Value) + "',pic3='" + Sys.filterSQLStr(hidpic3.Value) + "',pic4='" + Sys.filterSQLStr(hidpic4.Value) + "',"
                      + "pic5='" + Sys.filterSQLStr(hidpic5.Value) + "',pic6='" + Sys.filterSQLStr(hidpic6.Value) + "',pic7='" + Sys.filterSQLStr(hidpic7.Value) + "',pic8='" + Sys.filterSQLStr(hidpic8.Value) + "',"
                      + "pic9='" + Sys.filterSQLStr(hidpic9.Value) + "',"
                      + "hotel1='" + ahotel1 + "',hotel2='" + ahotel2 + "',hotel3='" + ahotel3 + "',hotel4='" + ahotel4 + "',hotel5='" + ahotel5 + "',"
                      + "hotel6='" + ahotel6 + "',hotel7='" + ahotel7 + "',hotel8='" + ahotel8 + "',hotel9='" + ahotel9 + "' "
                      + " where hotelId=" + hotelId;
        }
        else
        {
            str = "insert into FY_Hotel_Pic(hotelId,pic1,pic2,pic3,pic4,pic5,pic6,pic7,pic8,pic9,hotel1,hotel2,hotel3,hotel4,hotel5,hotel6,hotel7,hotel8,hotel9)"
             + "values(" + hotelId + ","
             + "'" + Sys.filterSQLStr(hidpic1.Value) + "','" + Sys.filterSQLStr(hidpic2.Value) + "','" + Sys.filterSQLStr(hidpic3.Value) + "','" + Sys.filterSQLStr(hidpic4.Value) + "',"
             + "'" + Sys.filterSQLStr(hidpic5.Value) + "','" + Sys.filterSQLStr(hidpic6.Value) + "','" + Sys.filterSQLStr(hidpic7.Value) + "','" + Sys.filterSQLStr(hidpic8.Value) + "',"
             + "'" + Sys.filterSQLStr(hidpic9.Value) + "',"
             + "'" + ahotel1 + "','" + ahotel2 + "','" + ahotel3 + "','" + ahotel4 + "','" + ahotel5 + "','" + ahotel6 + "','" + ahotel7 + "','" + ahotel8 + "','" + ahotel9 + "'"
             + ")";
        }


        int brandsucc = 0;
        brandsucc = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
        if (brandsucc > 0)
            scripthelp.AlertAndRedirect("操作成功!", "FY_Hotel_list.aspx", this.Page);
        else
            scripthelp.Alert("操作失败!", this.Page);
    }
    protected void btnf1_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f1))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic1.Value = dt.Rows[0]["pic1"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic1"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic1.Value = picurl;
                imgpro1.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }

    }
    protected void btnf2_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f2))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic2.Value = dt.Rows[0]["pic2"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic2"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic2.Value = picurl;
                imgpro2.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf3_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f3))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic3.Value = dt.Rows[0]["pic3"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic3"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic3.Value = picurl;
                imgpro3.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf4_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f4))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic4.Value = dt.Rows[0]["pic4"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic4"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic4.Value = picurl;
                imgpro4.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf5_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f5))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic5.Value = dt.Rows[0]["pic5"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic5"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic5.Value = picurl;
                imgpro5.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf6_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f6))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic6.Value = dt.Rows[0]["pic6"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic6"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic6.Value = picurl;
                imgpro6.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf7_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f7))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic7.Value = dt.Rows[0]["pic7"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic7"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic7.Value = picurl;
                imgpro7.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf8_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f8))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic8.Value = dt.Rows[0]["pic8"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic8"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic8.Value = picurl;
                imgpro8.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf9_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f9))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic9.Value = dt.Rows[0]["pic9"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Hotel_Pic where hotelId=" + hotelId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic9"].ToString();
                    }

                    if (File.Exists("/upload_photo" + pic1))
                    {
                        File.Delete("/upload_photo" + pic1);
                    }
                }
                hidpic9.Value = picurl;
                imgpro9.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }

    #region 上传通用方法
    /// <summary>
    /// 上传企业图片
    /// </summary>
    /// <param name="photo_url"></param>
    /// <returns></returns>
    private bool FileUploadOK(out string photo_url, string picPath, FileUpload f)
    {
        bool _ok = false;

        string _picExtension = string.Empty;//图片后缀

        string _physicPath = string.Empty;//物理路径

        string _picPath = string.Empty;//图片相对路径

        photo_url = "";

        string _picpathdata = string.Empty;//绝对路径；


        long maxSize = long.Parse(ConfigurationManager.AppSettings.Get("newsPicSize"));

        #region 生成文件夹

        string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");

        _picPath = "~/" + picPath + "/" + _time + "/";

        _picpathdata = picPath + "/" + _time + "/";

        _physicPath = Server.MapPath(_picPath);

        if (!Directory.Exists(_physicPath))
            Directory.CreateDirectory(_physicPath);

        #endregion

        //限制图片的大小
        if (f.PostedFile.ContentLength <= maxSize)
        {
            string _picName = getDistinctFilename();//图片随机名称

            if (f.HasFile)
            {

                #region 上传图片

                string _fileName = f.FileName; // 客户端文件路径

                //取得图片后缀

                _picExtension = GetFileExtends(_fileName);

                photo_url += _picpathdata + _picName + _picExtension;//图片绝对路径+图片随机名称+图片后缀

                f.SaveAs(_physicPath + _picName + _picExtension);//保存图片

                _ok = true;

                #endregion
            }
            else
            {
                #region 返回信息
                photo_url = string.Empty;
                _ok = false;
                #endregion
            }
        }
        else
        {
            #region 返回信息
            photo_url = string.Empty;
            _ok = false;
            #endregion
        }
        return _ok;
    }


    /// <summary>
    /// 取得文件后缀
    /// </summary>
    /// <param name="filename"></param>
    /// <returns></returns>
    public string GetFileExtends(string filename)
    {
        string ext = null;
        if (filename.IndexOf('.') > 0)
        {
            string[] fs = filename.Split('.');
            ext = fs[fs.Length - 1];
        }
        return "." + ext;
    }

    public string getDistinctFilename()
    {
        string FileDateTime = string.Format("{0:yyyy-MM-dd_HH-mm-ss_}", DateTime.Now);
        if (FileDateTime != preFileDateTime)
        {
            preFileDateTime = FileDateTime;
            preFileIndex = 0;
            return FileDateTime + "0000";
        }
        else
        {
            preFileIndex = preFileIndex + 1;
            string temp = "" + preFileIndex;
            if (temp.Length < 4) temp = new String('0', 4 - temp.Length) + temp;
            return FileDateTime + temp;
        }
    }
    #endregion
}