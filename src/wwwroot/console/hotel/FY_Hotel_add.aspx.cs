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

public partial class console_hotel_FY_Hotel_add : System.Web.UI.Page
{
    static int id = 0;

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
            //this.txt_fromDate.Value = DateTime.Now.ToShortDateString();
            //this.txt_toDate.Value = DateTime.Now.AddMonths(1).ToShortDateString();

            setCityList();

            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string str = "select * from FY_Hotel where hId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);

                this.txt_HotelName.Value = ds.Tables[0].Rows[0]["HotelName"].ToString();
                this.sel_cityName.Value = ds.Tables[0].Rows[0]["cityId"].ToString();

                if (Convert.ToInt32(ds.Tables[0].Rows[0]["region"].ToString()) == 1)
                {
                    this.isRegion1.Checked = true;
                    this.isRegion0.Checked = false;
                }
                else
                {
                    this.isRegion1.Checked = false;
                    this.isRegion0.Checked = true;
                }

                DateTime t1,t2;
                if (DateTime.TryParse(ds.Tables[0].Rows[0]["fromDate"].ToString(), out t1))
                {
                    this.txt_fromDate.Value = t1.ToShortDateString();
                }
                else
                    this.txt_fromDate.Value = "";

                if (DateTime.TryParse(ds.Tables[0].Rows[0]["toDate"].ToString(), out t2))
                {
                    this.txt_toDate.Value = t2.ToShortDateString();
                }
                else
                    this.txt_toDate.Value = "";

                this.txt_Price.Value = ds.Tables[0].Rows[0]["Price"].ToString();
                this.sel_RoomNum.Value = ds.Tables[0].Rows[0]["RoomNum"].ToString();

                this.txt_address.Value = ds.Tables[0].Rows[0]["address"].ToString();
                this.sel_rate.Value = ds.Tables[0].Rows[0]["rate"].ToString();
                this.txt_intro.Value = ds.Tables[0].Rows[0]["intro"].ToString();
                this.txt_zhonghesheshi.Value = ds.Tables[0].Rows[0]["zhonghesheshi"].ToString();
                this.txt_fuwuxiangmu.Value = ds.Tables[0].Rows[0]["fuwuxiangmu"].ToString();
                this.txt_internet.Value = ds.Tables[0].Rows[0]["internet"].ToString();
                this.txt_tingchesheshi.Value = ds.Tables[0].Rows[0]["tingchesheshi"].ToString();
                this.txt_jiudianzhengce.Value = ds.Tables[0].Rows[0]["jiudianzhengce"].ToString();
                this.txt_ruzhushouxu.Value = ds.Tables[0].Rows[0]["ruzhushouxu"].ToString();
                this.txt_tuifangshouxu.Value = ds.Tables[0].Rows[0]["tuifangshouxu"].ToString();
                this.txt_quxiaoyuding.Value = ds.Tables[0].Rows[0]["quxiaoyuding"].ToString();
                this.txt_ertongjiachuang.Value = ds.Tables[0].Rows[0]["ertongjiachuang"].ToString();
                this.txt_yajin.Value = ds.Tables[0].Rows[0]["yajin"].ToString();
                this.txt_chongwu.Value = ds.Tables[0].Rows[0]["chongwu"].ToString();
                this.txt_xinyongka.Value = ds.Tables[0].Rows[0]["xinyongka"].ToString();

                this.isUploadPic.Text = "已上传：<img src=../../" + ds.Tables[0].Rows[0]["picPath"].ToString() + " height='80' width='80'>";
                this.oldPic.Value = ds.Tables[0].Rows[0]["picPath"].ToString();

                if (Convert.ToInt32(ds.Tables[0].Rows[0]["isTop"].ToString()) == 1)
                {
                    radisTop1.Checked = true;
                    radisTop0.Checked = false;
                }
                else
                {
                    radisTop0.Checked = true;
                    radisTop1.Checked = false;
                }

                if (Convert.ToInt32(ds.Tables[0].Rows[0]["isRecom"].ToString()) == 1)
                {
                    radisRecom1.Checked = true;
                    radisRecom0.Checked = false;
                }
                else
                {
                    radisRecom0.Checked = true;
                    radisRecom1.Checked = false;
                }

                this.isUploadPic2.Text = "已上传：<img style=\"width:100px; height: 100px;\" src=../../" + ds.Tables[0].Rows[0]["Pic2"].ToString() + " >";
                this.oldPic2.Value = ds.Tables[0].Rows[0]["Pic2"].ToString();

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


                this.lblTitle.Text = "修改酒店基础信息";

                if (!string.IsNullOrEmpty(ds.Tables[0].Rows[0]["toDate"].ToString()))
                {
                    DateTime dt1 = Convert.ToDateTime(DateTime.Now.ToShortDateString());
                    DateTime dt2 = Convert.ToDateTime(ds.Tables[0].Rows[0]["toDate"]);
                
                    if (DateTime.Compare(dt1, dt2) > 0)
                    {
                        this.labdate.Text = "该时间段已经过期！";
                    }
                }
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加酒店基础信息";
            }
        }
    }

    /// <summary>
    /// 绑定城市
    /// </summary>
    private void setCityList()
    {
        string str = "select * from FY_HotelCity order by chName";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

        this.sel_cityName.Items.Insert(0, new ListItem(":::: 所属城市 :::: ", ""));
        if (dt != null)
        {
            int i = 1;
            foreach (DataRow dr in dt.Rows)
            {
                string p = StringTools.GetFirstkPY(dr["chName"].ToString());
                this.sel_cityName.Items.Insert(i, new ListItem(p+"  "+dr["chName"].ToString().Trim(), dr["tId"].ToString().Trim()));
                i++;
            }
        }
        //读取cookie
        HttpCookie hc = Request.Cookies["HotelCityKey"];
        if (hc != null)
            this.sel_cityName.Value = hc.Values["CityId"];
    }

    /// <summary>
    /// 修改或添加
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string picPath = string.Empty;
        string picPath2 = string.Empty;
        string picPath3 = string.Empty;
        string picPath4 = string.Empty;
        string picPath5 = string.Empty;
        string picPath6 = string.Empty;
        string picPath7 = string.Empty;
        string picPath8 = string.Empty;
        string picPath9 = string.Empty;
        string picPath10 = string.Empty;
        string picPath11 = string.Empty;

        if (FileUpload_picPath.HasFile)
        {
            FileUploadOK(out picPath);
        }else
            picPath = this.oldPic.Value;

        if (FileUpload_picPath2.HasFile)
        {
            FileUploadOK2(out picPath2);
        }
        else
            picPath2 = this.oldPic2.Value;

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

        int istop = 0, isrecom = 0,isregion=0;

        if (radisTop1.Checked == true) istop = 1; else istop = 0;
        if (radisRecom1.Checked == true) isrecom = 1; else isrecom = 0;
        if (this.isRegion1.Checked == true) isregion = 1; else isregion = 0;

        if(string.IsNullOrEmpty(this.txt_HotelName.Value))
        {
            scripthelp.Alert("请输入酒店名称！",this.Page);
            return;
        }
        if(string.IsNullOrEmpty(this.sel_cityName.Value))
        {
            scripthelp.Alert("请选择酒店所属城市！",this.Page);
            return;
        }

        //记录cookie
        HttpCookie hc = new HttpCookie("HotelCityKey");
        hc.Values["CityId"] =this.sel_cityName.Value;
        hc.Expires = DateTime.Now.AddDays(5);
        Response.Cookies.Add(hc);

        if (id == 0)
        {
            string str = "insert into FY_Hotel(HotelName,cityId,Price,address,rate,intro,zhonghesheshi,fuwuxiangmu,internet,tingchesheshi,jiudianzhengce,ruzhushouxu,tuifangshouxu,quxiaoyuding,ertongjiachuang,yajin,chongwu,xinyongka,isRecom,isTop,picPath,region,fromDate,toDate,RoomNum,pic2,pic3,pic4,pic5,pic6,pic7,pic8,pic9,pic10,pic11)";
            str += " values('" + Sys.filterSQLStr(this.txt_HotelName.Value) + "','" + Sys.filterSQLStr(this.sel_cityName.Value) + "','" + Sys.filterSQLStr(this.txt_Price.Value) + "','" + Sys.filterSQLStr(this.txt_address.Value) + "','" + Sys.filterSQLStr(this.sel_rate.Value) + "',";
            str += " '" + Sys.filterSQLStr(this.txt_intro.Value) + "','" + Sys.filterSQLStr(this.txt_zhonghesheshi.Value) + "','" + Sys.filterSQLStr(this.txt_fuwuxiangmu.Value) + "','" + Sys.filterSQLStr(this.txt_internet.Value) + "','" + Sys.filterSQLStr(this.txt_tingchesheshi.Value) + "',";
            str += " '" + Sys.filterSQLStr(this.txt_jiudianzhengce.Value) + "','" + Sys.filterSQLStr(this.txt_ruzhushouxu.Value) + "','" + Sys.filterSQLStr(this.txt_tuifangshouxu.Value) + "','" + Sys.filterSQLStr(this.txt_quxiaoyuding.Value) + "','" + Sys.filterSQLStr(this.txt_ertongjiachuang.Value) + "',";
            str += " '" + Sys.filterSQLStr(this.txt_yajin.Value) + "','" + Sys.filterSQLStr(this.txt_chongwu.Value) + "','" + Sys.filterSQLStr(this.txt_xinyongka.Value) + "',";
            str += "" + isrecom + "," + istop + ",'" + picPath.Trim() + "'," + isregion + ",'" + Sys.filterSQLStr(this.txt_fromDate.Value) + "','" + Sys.filterSQLStr(this.txt_toDate.Value) + "','" + Sys.filterSQLStr(this.sel_RoomNum.Value) + "','" + picPath2.Trim() + "','" + picPath3.Trim() + "','" + picPath4.Trim() + "','" + picPath5.Trim() + "','" + picPath6.Trim() + "','" + picPath7.Trim() + "','" + picPath8.Trim() + "','" + picPath9.Trim() + "','" + picPath10.Trim() + "','" + picPath11.Trim() + "')";

            int inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='FY_Hotel_list.aspx'</script>");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");
        }
        else
        {
            string str = "update FY_Hotel set HotelName='" + Sys.filterSQLStr(this.txt_HotelName.Value) + "',cityId='" + Sys.filterSQLStr(this.sel_cityName.Value) + "',Price='" + Sys.filterSQLStr(this.txt_Price.Value) + "',address='" + Sys.filterSQLStr(this.txt_address.Value) + "',picPath='" + picPath + "',pic2='" + picPath2.Trim() + "',pic3='" + picPath3.Trim() + "',pic4='" + picPath4.Trim() + "',pic5='" + picPath5.Trim() + "',pic6='" + picPath6.Trim() + "',pic7='" + picPath7.Trim() + "',pic8='" + picPath8.Trim() + "',pic9='" + picPath9.Trim() + "',pic10='" + picPath10.Trim() + "',pic11='" + picPath11.Trim() + "',";
            str += " rate='" + Sys.filterSQLStr(this.sel_rate.Value) + "',intro='" + Sys.filterSQLStr(this.txt_intro.Value) + "',zhonghesheshi='" + Sys.filterSQLStr(this.txt_zhonghesheshi.Value) + "',fuwuxiangmu='" + Sys.filterSQLStr(this.txt_fuwuxiangmu.Value) + "',internet='" + Sys.filterSQLStr(this.txt_internet.Value) + "',";
            str += " tingchesheshi='" + Sys.filterSQLStr(this.txt_tingchesheshi.Value) + "',jiudianzhengce='" + Sys.filterSQLStr(this.txt_jiudianzhengce.Value) + "',ruzhushouxu='" + Sys.filterSQLStr(this.txt_ruzhushouxu.Value) + "',tuifangshouxu='" + Sys.filterSQLStr(this.txt_tuifangshouxu.Value) + "',";
            str += " quxiaoyuding='" + Sys.filterSQLStr(this.txt_quxiaoyuding.Value) + "',ertongjiachuang='" + Sys.filterSQLStr(this.txt_ertongjiachuang.Value) + "',yajin='" + Sys.filterSQLStr(this.txt_yajin.Value) + "',chongwu='" + Sys.filterSQLStr(this.txt_chongwu.Value) + "',xinyongka='" + Sys.filterSQLStr(this.txt_xinyongka.Value) + "',";
            str += " isRecom=" + isrecom + ",isTop=" + istop + ",region=" + isregion + ",fromDate='" + Sys.filterSQLStr(this.txt_fromDate.Value) + "',toDate='" + Sys.filterSQLStr(this.txt_toDate.Value) + "',RoomNum='" + Sys.filterSQLStr(this.sel_RoomNum.Value) + "' where hId=" + id + "";

            int inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='FY_Hotel_list.aspx'</script>");
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
