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

public partial class cms_airline_airline_add : System.Web.UI.Page 
{

    static int id = 0;

    public int ofpass=0;


    protected void Page_Load(object sender, EventArgs e)
    {
        //判断是否登录，如果未登陆，则跳到登陆页面
        MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];

        if (adminmerinfo == null)
        {
            ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
            Response.Redirect("~/console/login.aspx", true);
        }

        if (!IsPostBack)
        {
            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string str = "select * from FY_Airline where aId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                txt_airCode.Value = ds.Tables[0].Rows[0]["airlineCode"].ToString();
                txt_enName.Value = ds.Tables[0].Rows[0]["enName"].ToString();
                txt_chName.Value = ds.Tables[0].Rows[0]["chName"].ToString();
                txt_nation.Value = ds.Tables[0].Rows[0]["nation"].ToString();
                txt_planNum.Value = ds.Tables[0].Rows[0]["planNum"].ToString();
                txt_age.Value = ds.Tables[0].Rows[0]["age"].ToString();
                txt_mainBase.Value = ds.Tables[0].Rows[0]["mainBase"].ToString();
                txt_score.Value = ds.Tables[0].Rows[0]["score"].ToString();

                txt_webUrl.Value = ds.Tables[0].Rows[0]["webUrl"].ToString();
                txt_tel.Value = ds.Tables[0].Rows[0]["tel"].ToString();
                txt_bkUrl.Value = ds.Tables[0].Rows[0]["bkUrl"].ToString();


                this.isUploadPic.Text = "已上传：<img style=\"width:80px; height: 80px;\" src=../../" + ds.Tables[0].Rows[0]["logoPic"].ToString() + " >";
                this.oldPic.Value = ds.Tables[0].Rows[0]["logoPic"].ToString();

                this.isUploadPic1.Text = "已上传：<img style=\"width:60px; height:60px;\" src=../../" + ds.Tables[0].Rows[0]["smallPic"].ToString() + " >";
                this.oldPic1.Value = ds.Tables[0].Rows[0]["smallPic"].ToString();

                this.isUploadPic2.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic2"].ToString() + " >";
                this.oldPic2.Value = ds.Tables[0].Rows[0]["Pic2"].ToString();

                this.isUploadPic0.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["airlinePic"].ToString() + " >";
                this.oldPic0.Value = ds.Tables[0].Rows[0]["airlinePic"].ToString();

                this.isUploadPic3.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic3"].ToString() + " >";
                this.oldPic3.Value = ds.Tables[0].Rows[0]["Pic3"].ToString();

                this.isUploadPic4.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic4"].ToString() + " >";
                this.oldPic4.Value = ds.Tables[0].Rows[0]["Pic4"].ToString();

                this.isUploadPic5.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic5"].ToString() + " >";
                this.oldPic5.Value = ds.Tables[0].Rows[0]["Pic5"].ToString();

                this.isUploadPic6.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic6"].ToString() + " >";
                this.oldPic6.Value = ds.Tables[0].Rows[0]["Pic6"].ToString();

                this.isUploadPic7.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic7"].ToString() + " >";
                this.oldPic7.Value = ds.Tables[0].Rows[0]["Pic7"].ToString();

                this.isUploadPic8.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic8"].ToString() + " >";
                this.oldPic8.Value = ds.Tables[0].Rows[0]["Pic8"].ToString();

                this.isUploadPic9.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic9"].ToString() + " >";
                this.oldPic9.Value = ds.Tables[0].Rows[0]["Pic9"].ToString();

                this.isUploadPic10.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic10"].ToString() + " >";
                this.oldPic10.Value = ds.Tables[0].Rows[0]["Pic10"].ToString();

                this.isUploadPic11.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic11"].ToString() + " >";
                this.oldPic11.Value = ds.Tables[0].Rows[0]["Pic11"].ToString();

                FCKeditor1.Value = ds.Tables[0].Rows[0]["description"].ToString();
                FCKeditor2.Value = ds.Tables[0].Rows[0]["baggageTerm"].ToString();

                this.lblTitle.Text = "修改航空公司信息";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加航空公司信息";
            }
        }
    }

    /// <summary>
    ///添加或修改航空公司信息
    /// </summary> 
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string picPath = string.Empty;

        string picPath1 = "";
        string picPath2 = "";
        string picPath0 = "";

        string picPath3 = "";
        string picPath4 = "";
        string picPath5 = "";
        string picPath6 = "";
        string picPath7 = "";
        string picPath8 = "";
        string picPath9 = "";
        string picPath10 = "";
        string picPath11 = "";

        if (FileUpload_picPath1.HasFile)
        {
            FileUploadOK1(out picPath1);
        }else
            picPath1 = this.oldPic1.Value;

        if (FileUpload_picPath2.HasFile)
        {
            FileUploadOK2(out picPath2);
        }
        else
            picPath2 = this.oldPic2.Value;

        if (FileUpload_picPath0.HasFile)
        {
            FileUploadOK0(out picPath0);
        }
        else
            picPath0 = this.oldPic0.Value;


        if (FileUpload_picPath.HasFile)
        {
            FileUploadOK(out picPath);
        }
        else
            picPath = this.oldPic.Value;

        if (FileUpload_picPath3.HasFile)
        {
            FileUploadOK3(out picPath3);
        }
        else
            picPath3 = this.oldPic3.Value;

        if (FileUpload_picPath4.HasFile)
        {
            FileUploadOK4(out picPath4);
        }
        else
            picPath4 = this.oldPic4.Value;

        if (FileUpload_picPath5.HasFile)
        {
            FileUploadOK5(out picPath5);
        }
        else
            picPath5 = this.oldPic5.Value;

        if (FileUpload_picPath6.HasFile)
        {
            FileUploadOK6(out picPath6);
        }
        else
            picPath6 = this.oldPic6.Value;

        if (FileUpload_picPath7.HasFile)
        {
            FileUploadOK7(out picPath7);
        }
        else
            picPath7 = this.oldPic7.Value;

        if (FileUpload_picPath8.HasFile)
        {
            FileUploadOK8(out picPath8);
        }
        else
            picPath8 = this.oldPic8.Value;

        if (FileUpload_picPath9.HasFile)
        {
            FileUploadOK9(out picPath9);
        }
        else
            picPath9 = this.oldPic9.Value;

        if (FileUpload_picPath10.HasFile)
        {
            FileUploadOK10(out picPath10);
        }
        else
            picPath10 = this.oldPic10.Value;

        if (FileUpload_picPath11.HasFile)
        {
            FileUploadOK11(out picPath11);
        }
        else
            picPath11 = this.oldPic11.Value;


        if (id == 0)
        {
            string str = "insert into FY_Airline(airlineCode,enName,chName,nation,planNum,age,mainBase,score,logoPic,smallPic,pic2,pic3,pic4,pic5,pic6,pic7,pic8,pic9,pic10,pic11,description,baggageTerm,airlinePic,webUrl,tel,bkUrl)";
                    str += " values('" + Sys.filterSQLStr(txt_airCode.Value.Trim()) + "','" + Sys.filterSQLStr(txt_enName.Value.Trim()) + "',";
                    str += "'" + Sys.filterSQLStr(txt_chName.Value.Trim()) + "', '" + Sys.filterSQLStr(txt_nation.Value.Trim()) + "','" + Sys.filterSQLStr(txt_planNum.Value.Trim()) + "',";
                    str += "'" + Sys.filterSQLStr(txt_age.Value.Trim()) + "','" + Sys.filterSQLStr(txt_mainBase.Value.Trim()) + "','" + Sys.filterSQLStr(txt_score.Value.Trim()) + "','" + picPath.Trim() + "','" + picPath1.Trim() + "','" + picPath2.Trim() + "','" + picPath3.Trim() + "','" + picPath4.Trim() + "','" + picPath5.Trim() + "','" + picPath6.Trim() + "','" + picPath7.Trim() + "','" + picPath8.Trim() + "','" + picPath9.Trim() + "','" + picPath10.Trim() + "','" + picPath11.Trim() + "','" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "','" + Sys.filterSQLStr(FCKeditor2.Value.Trim()) + "','" + picPath0 + "',";
                    str += "'" + Sys.filterSQLStr(txt_webUrl.Value.Trim()) + "','" + Sys.filterSQLStr(txt_tel.Value.Trim()) + "','" + Sys.filterSQLStr(txt_bkUrl.Value.Trim()) + "')";
            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='airline_list.aspx'</script>");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");
        }
        else
        {
            string str = "update FY_Airline set  airlineCode='" + Sys.filterSQLStr(txt_airCode.Value.Trim()) + "',enName='" + Sys.filterSQLStr(txt_enName.Value.Trim()) + "',logoPic='" + picPath.Trim() + "',smallPic='" + picPath1.Trim() + "',pic2='" + picPath2.Trim() + "',pic3='" + picPath3.Trim() + "',pic4='" + picPath4.Trim() + "',pic5='" + picPath5.Trim() + "',pic6='" + picPath6.Trim() + "',pic7='" + picPath7.Trim() + "',pic8='" + picPath8.Trim() + "',pic9='" + picPath9.Trim() + "',pic10='" + picPath10.Trim() + "',pic11='" + picPath11.Trim() + "',";
                    str += "chName='" + Sys.filterSQLStr(txt_chName.Value.Trim()) + "',nation='" + Sys.filterSQLStr(txt_nation.Value.Trim()) + "',planNum='" + Sys.filterSQLStr(txt_planNum.Value.Trim()) + "',";
                    str += "age='" + Sys.filterSQLStr(txt_age.Value.Trim()) + "',mainBase='" + Sys.filterSQLStr(txt_mainBase.Value.Trim()) + "',score='" + Sys.filterSQLStr(txt_score.Value.Trim()) + "' ,description='" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "',baggageTerm='" + Sys.filterSQLStr(FCKeditor2.Value.Trim()) + "',airlinePic='" + picPath0 + "',webUrl='" + Sys.filterSQLStr(txt_webUrl.Value.Trim()) + "',tel='" + Sys.filterSQLStr(txt_tel.Value.Trim()) + "',bkUrl='" + Sys.filterSQLStr(txt_bkUrl.Value.Trim()) + "' where aId=" + id + "";                  
                   
            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='airline_list.aspx'</script>");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");
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
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath="upload_web/" + _time + "/";
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

    private bool FileUploadOK1(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath1.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath1.FileName; // 客户端文件路径
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

                FileUpload_picPath1.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK2(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath2.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath2.FileName; // 客户端文件路径
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

                FileUpload_picPath2.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK3(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath3.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath3.FileName; // 客户端文件路径
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

                FileUpload_picPath3.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK4(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath4.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath4.FileName; // 客户端文件路径
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

                FileUpload_picPath4.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK5(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath5.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath5.FileName; // 客户端文件路径
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

                FileUpload_picPath5.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK6(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath6.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath6.FileName; // 客户端文件路径
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

                FileUpload_picPath6.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK7(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath7.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath7.FileName; // 客户端文件路径
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

                FileUpload_picPath7.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK8(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath8.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath8.FileName; // 客户端文件路径
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

                FileUpload_picPath8.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK9(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath9.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath9.FileName; // 客户端文件路径
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

                FileUpload_picPath9.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK10(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath10.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath10.FileName; // 客户端文件路径
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

                FileUpload_picPath10.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK11(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath11.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath11.FileName; // 客户端文件路径
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

                FileUpload_picPath11.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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

    private bool FileUploadOK0(out string picPath)
    {
        bool _ok = false;
        string _picName = Sys.getDistinctFilename();//图片随机名称
        string _picExtension = string.Empty;//图片后缀
        string _physicPath = string.Empty;//物理路径
        string _picPath = string.Empty;//图片相对路径
        string _dbpicPath = string.Empty;
        string fname = "";

        if (FileUpload_picPath0.HasFile)
        {
            #region 生成文件夹
            string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");
            _picPath = "../../upload_web/" + _time + "/";
            _dbpicPath = "upload_web/" + _time + "/";
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
                string _fileName = FileUpload_picPath0.FileName; // 客户端文件路径
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

                FileUpload_picPath0.SaveAs(_physicPath + _picName + _picExtension);//保存图片
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
