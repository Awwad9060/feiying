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
public partial class console_prizes_prizes_add : System.Web.UI.Page
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
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string str = "select * from FY_Prizes where pId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                txt_pName.Value = ds.Tables[0].Rows[0]["pName"].ToString();
                txt_needScore.Value = ds.Tables[0].Rows[0]["needScore"].ToString();
                txt_lotteryScore.Value = ds.Tables[0].Rows[0]["lotteryScore"].ToString();
                FCKeditor1.Value = ds.Tables[0].Rows[0]["description"].ToString();
                type.Value = ds.Tables[0].Rows[0]["type"].ToString();
                this.isUploadPic.Text = "已上传：<img src=../../" + ds.Tables[0].Rows[0]["picPath"].ToString() + " height='100' width='100'>";
                this.oldPic.Value = ds.Tables[0].Rows[0]["picPath"].ToString();

                if (Convert.ToInt32(ds.Tables[0].Rows[0]["isRec"].ToString()) == 1)
                {
                    isRecom1.Checked = true;
                    isRecom2.Checked = false;
                }
                else
                {
                    isRecom1.Checked = false;
                    isRecom2.Checked = true;
                }

                this.lblTitle.Text = "修改奖品";

            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加奖品";
            }
        }
    }

    protected void btnSave_Click(object sender, EventArgs e)
    {
        int isRecom = 0;


        if (isRecom1.Checked)
        {
            isRecom = 1;
        }
        else
        {
            isRecom = 2;
        }

        string picPath = string.Empty;
        if (id == 0)
        {
            string str = "";
            if (FileUpload_picPath.HasFile)
            {
                FileUploadOK(out picPath);
            }

            str = "insert into FY_Prizes(pName,type,description,needScore,lotteryScore,isRec,getNum,picPath)";
            str += " values('" + Sys.filterSQLStr(txt_pName.Value.Trim()) + "','" + type.Value + "','" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "','" + Sys.filterSQLStr(txt_needScore.Value.Trim()) + "','" + Sys.filterSQLStr(txt_lotteryScore.Value.Trim()) + "'," + isRecom + ",0,'" + picPath.Trim() + "')";
            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='prizes_list.aspx'</script>");
            }
            else
                ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");

        }
        else
        {
            string str = "";
            if (FileUpload_picPath.HasFile)
            {
                FileUploadOK(out picPath);
            }
            if (picPath != "")
            {
                str = "update FY_Prizes set  pName='" + Sys.filterSQLStr(txt_pName.Value.Trim()) + "',needScore='" + Sys.filterSQLStr(txt_needScore.Value.Trim()) + "',lotteryScore='" + Sys.filterSQLStr(txt_lotteryScore.Value.Trim()) + "',description='" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "',isRec=" + isRecom + ",picPath='" + picPath.Trim() + "' where pId=" + id + "";
            }
            else
            {

                str = "update FY_Prizes set  pName='" + Sys.filterSQLStr(txt_pName.Value.Trim()) + "',needScore='" + Sys.filterSQLStr(txt_needScore.Value.Trim()) + "',lotteryScore='" + Sys.filterSQLStr(txt_lotteryScore.Value.Trim()) + "',description='" + Sys.filterSQLStr(FCKeditor1.Value.Trim()) + "',isRec=" + isRecom + " where pId=" + id + "";
            }
            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='prizes_list.aspx'</script>");
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
