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

public partial class cms_airport_airport_add : System.Web.UI.Page 
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
                string str = "select * from FY_Airport where apId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                txt_airCode.Value = ds.Tables[0].Rows[0]["airPortCode"].ToString();
                txt_enName.Value = ds.Tables[0].Rows[0]["enName"].ToString();
                txt_chName.Value = ds.Tables[0].Rows[0]["chName"].ToString();
                txt_address.Value = ds.Tables[0].Rows[0]["address"].ToString();
                txt_telphone.Value = ds.Tables[0].Rows[0]["telphone"].ToString();
                txt_website.Value = ds.Tables[0].Rows[0]["website"].ToString();
                txt_timezone.Value = ds.Tables[0].Rows[0]["timezone"].ToString();
                txt_lang.Value = ds.Tables[0].Rows[0]["lang"].ToString();
                txt_grade.Value = ds.Tables[0].Rows[0]["grade"].ToString();
                txt_score.Value = ds.Tables[0].Rows[0]["score"].ToString();
                txt_lat.Value = ds.Tables[0].Rows[0]["lat"].ToString();
                txt_lng.Value = ds.Tables[0].Rows[0]["lng"].ToString();
                txt_paodao.Value = ds.Tables[0].Rows[0]["paodao"].ToString();
                txt_height.Value = ds.Tables[0].Rows[0]["height"].ToString();
                txt_jiaotong.Value = ds.Tables[0].Rows[0]["jiaotong"].ToString();
                txt_hangzhanlou.Value = ds.Tables[0].Rows[0]["hangzhanlou"].ToString();
                txt_bkUrl.Value = ds.Tables[0].Rows[0]["bkUrl"].ToString();

                this.isUploadPic.Text = "已上传：<img src=../../" + ds.Tables[0].Rows[0]["portPic"].ToString() + " height='80' width='80'>";
                this.oldPic.Value = ds.Tables[0].Rows[0]["portPic"].ToString();

                FCKeditor1.Value = ds.Tables[0].Rows[0]["description"].ToString();

                this.lblTitle.Text = "修改机场信息";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加机场信息";
            }
        }
    }

    /// <summary>
    ///添加或修改机场信息
    /// </summary> 
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string picPath = string.Empty;

        if (id == 0)
        {
            string str = "";
            if (FileUpload_picPath.HasFile)
            {
                if (FileUploadOK(out picPath))
                {

                    str = "insert into FY_Airport(airPortCode,enName,chName,address,telphone,website,timezone,lang,grade,paodao,height,jiaotong,hangzhanlou,score,portPic,description,lat,lng,bkUrl)";
                    str += " values('" + Sys.filterSQLStr(txt_airCode.Value.Trim()) + "','" + Sys.filterSQLStr(txt_enName.Value.Trim()) + "','" + Sys.filterSQLStr(txt_chName.Value.Trim()) + "','" + Sys.filterSQLStr(txt_address.Value.Trim()) + "', '" + Sys.filterSQLStr(txt_telphone.Value.Trim()) + "','" + Sys.filterSQLStr(txt_website.Value.Trim()) + "','" + Sys.filterSQLStr(txt_timezone.Value.Trim()) + "','" + Sys.filterSQLStr(txt_lang.Value.Trim()) + "','" + Sys.filterSQLStr(txt_grade.Value.Trim()) + "',";
                    str += "'" + Sys.filterSQLStr(txt_paodao.Value.Trim()) + "', '" + Sys.filterSQLStr(txt_height.Value.Trim()) + "','" + Sys.filterSQLStr(txt_jiaotong.Value.Trim()) + "',";
                    str += "'" + Sys.filterSQLStr(txt_hangzhanlou.Value.Trim()) + "','" + Sys.filterSQLStr(txt_score.Value.Trim()) + "','" + picPath.Trim() + "','" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "','" + this.txt_lat.Value + "','" + this.txt_lng.Value + "','"+this.txt_bkUrl.Value+"')";
                    int inserttag = 0;

                    inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                    if (inserttag > 0)
                    {
                        Response.Write("<script>alert('操作成功！');location.href='airport_list.aspx'</script>");
                    }
                    else
                        ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");
                }
                else
                {
                    scripthelp.Alert("保存上传图片文件操作失败!", this.Page);
                    return;
                }
            }
            else
            {

                str = "insert into FY_Airport(airPortCode,enName,chName,address,telphone,website,timezone,lang,grade,paodao,height,jiaotong,hangzhanlou,score,description,lat,lng,bkUrl)";
                str += " values('" + Sys.filterSQLStr(txt_airCode.Value.Trim()) + "','" + Sys.filterSQLStr(txt_enName.Value.Trim()) + "','" + Sys.filterSQLStr(txt_chName.Value.Trim()) + "','" + Sys.filterSQLStr(txt_address.Value.Trim()) + "', '" + Sys.filterSQLStr(txt_telphone.Value.Trim()) + "','" + Sys.filterSQLStr(txt_website.Value.Trim()) + "','" + Sys.filterSQLStr(txt_timezone.Value.Trim()) + "','" + Sys.filterSQLStr(txt_lang.Value.Trim()) + "','" + Sys.filterSQLStr(txt_grade.Value.Trim()) + "',";
                str += "'" + Sys.filterSQLStr(txt_paodao.Value.Trim()) + "', '" + Sys.filterSQLStr(txt_height.Value.Trim()) + "','" + Sys.filterSQLStr(txt_jiaotong.Value.Trim()) + "',";
                str += "'" + Sys.filterSQLStr(txt_hangzhanlou.Value.Trim()) + "','" + Sys.filterSQLStr(txt_score.Value.Trim()) + "','" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "','" + this.txt_lat.Value + "','" + this.txt_lng.Value + "','" + this.txt_bkUrl.Value + "')";
                 
                int inserttag = 0;

                inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                if (inserttag > 0)
                {
                    Response.Write("<script>alert('操作成功！');location.href='airport_list.aspx'</script>");
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");
            }
           
        }
        else
        {
            string str = "";
            if (FileUpload_picPath.HasFile)
            {
                if (FileUploadOK(out picPath))
                {
                    str = "update FY_Airport set  airPortCode='" + Sys.filterSQLStr(txt_airCode.Value.Trim()) + "',enName='" + Sys.filterSQLStr(txt_enName.Value.Trim()) + "',portPic='" + picPath.Trim() + "',";
                    str += "chName='" + Sys.filterSQLStr(txt_chName.Value.Trim()) + "',address='" + Sys.filterSQLStr(txt_address.Value.Trim()) + "',telphone='" + Sys.filterSQLStr(txt_telphone.Value.Trim()) + "',";
                    str += "website='" + Sys.filterSQLStr(txt_website.Value.Trim()) + "',timezone='" + Sys.filterSQLStr(txt_timezone.Value.Trim()) + "',grade='" + Sys.filterSQLStr(txt_grade.Value.Trim()) + "',paodao='" + Sys.filterSQLStr(txt_paodao.Value.Trim()) + "',height='" + Sys.filterSQLStr(txt_height.Value.Trim()) + "',jiaotong='" + Sys.filterSQLStr(txt_jiaotong.Value.Trim()) + "' ,hangzhanlou='" + Sys.filterSQLStr(txt_hangzhanlou.Value.Trim()) + "' ,score='" + Sys.filterSQLStr(txt_score.Value.Trim()) + "', description='" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "',lat='" + this.txt_lat.Value + "',lng='" + this.txt_lng.Value + "',bkUrl='"+this.txt_bkUrl.Value+"' where apId=" + id + "";                  
                   
                    int inserttag = 0;

                    inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                    if (inserttag > 0)
                    {
                        Response.Write("<script>alert('操作成功！');location.href='airport_list.aspx'</script>");
                    }
                    else
                        ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");
                }
                else
                {
                    scripthelp.Alert("保存上传图片文件操作失败!", this.Page);
                    return;
                }
            }
            else
            {

                str = "update FY_Airport set  airPortCode='" + Sys.filterSQLStr(txt_airCode.Value.Trim()) + "',enName='" + Sys.filterSQLStr(txt_enName.Value.Trim()) + "',";
                str += "chName='" + Sys.filterSQLStr(txt_chName.Value.Trim()) + "',address='" + Sys.filterSQLStr(txt_address.Value.Trim()) + "',telphone='" + Sys.filterSQLStr(txt_telphone.Value.Trim()) + "',";
                str += "website='" + Sys.filterSQLStr(txt_website.Value.Trim()) + "',timezone='" + Sys.filterSQLStr(txt_timezone.Value.Trim()) + "',grade='" + Sys.filterSQLStr(txt_grade.Value.Trim()) + "',paodao='" + Sys.filterSQLStr(txt_paodao.Value.Trim()) + "',height='" + Sys.filterSQLStr(txt_height.Value.Trim()) + "',jiaotong='" + Sys.filterSQLStr(txt_jiaotong.Value.Trim()) + "' ,hangzhanlou='" + Sys.filterSQLStr(txt_hangzhanlou.Value.Trim()) + "' ,score='" + Sys.filterSQLStr(txt_score.Value.Trim()) + "', description='" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "',lat='" + this.txt_lat.Value + "',lng='" + this.txt_lng.Value + "',bkUrl='" + this.txt_bkUrl.Value + "'  where apId=" + id + "";                  
                     
                int inserttag = 0;

                inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                if (inserttag > 0)
                {
                    Response.Write("<script>alert('操作成功！');location.href='airport_list.aspx'</script>");
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");
            }
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
