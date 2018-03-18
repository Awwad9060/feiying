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

public partial class console_ticket_ticketRec_add : System.Web.UI.Page
{
    static int id = 0;
    protected string rType = "今期特价推荐";
    protected void Page_Load(object sender, EventArgs e)
    {
        if (Request.QueryString["rType"] != null)
        {
            rType = Request.QueryString["rType"].ToString().Trim();
        }
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
                string str = "select * from FY_Recommend where rId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                txt_title.Value = ds.Tables[0].Rows[0]["title"].ToString();
                txt_price.Value = ds.Tables[0].Rows[0]["price"].ToString();
                txt_ticketUrl.Value = ds.Tables[0].Rows[0]["ticketUrl"].ToString();
                this.isUploadPic.Text = "已上传：<img src=../../" + ds.Tables[0].Rows[0]["ticketPic"].ToString() + " height='120' width='100'>";
                this.oldPic.Value = ds.Tables[0].Rows[0]["ticketPic"].ToString();

                int star_old = Convert.ToInt32(ds.Tables[0].Rows[0]["rStar"].ToString());

                if (star_old == 1)
                {
                    star1.Checked = true;
                    star2.Checked = false;
                    star3.Checked = false;
                    star4.Checked = false;
                    star5.Checked = false;
  
                }
                if (star_old == 2)
                {
                    star1.Checked = false;
                    star2.Checked = true;
                    star3.Checked = false;
                    star4.Checked = false;
                    star5.Checked = false;
                }

                if (star_old ==3)
                {
                    star1.Checked = false;
                    star2.Checked = false;
                    star3.Checked = true;
                    star4.Checked = false;
                    star5.Checked = false;
                }

                if (star_old == 4)
                {
                    star1.Checked = false;
                    star2.Checked = false;
                    star3.Checked = false;
                    star4.Checked = true;
                    star5.Checked = false;
                }

                if (star_old == 5)
                {
                    star1.Checked = false;
                    star2.Checked = false;
                    star3.Checked = false;
                    star4.Checked = false;
                    star5.Checked = true;
                }


                this.lblTitle.Text = "修改" + rType;


            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加"+ rType;
            }
        }
    }

     /// <summary>
    ///添加或修改机场信息
    /// </summary> 
    protected void btnSave_Click(object sender, EventArgs e)
    {
        string picPath = string.Empty;
        int starflag = 3;

        if (star1.Checked)
        {
            starflag = 1;
        }

        if (star2.Checked)
        {
            starflag = 2;
        }


        if (star3.Checked)
        {
            starflag = 3;
        }

        if (star4.Checked)
        {
            starflag = 4;
        }

        if (star5.Checked)
        {
            starflag = 5;
        }


        if (id == 0)
        {
            string str = "";
            if (FileUpload_picPath.HasFile)
            {
                FileUploadOK(out picPath);
            }

            str = "insert into FY_Recommend(title,price,ticketUrl,rType,ticketPic,rStar)";
            str += " values('" + Sys.filterSQLStr(txt_title.Value.Trim()) + "','" + Sys.filterSQLStr(txt_price.Value.Trim()) + "','" + Sys.filterSQLStr(txt_ticketUrl.Value.Trim()) + "','"+rType+"','" + picPath.Trim() + "',"+starflag+")";
                    int inserttag = 0;

                    inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                    if (inserttag > 0)
                    {
                        Response.Write("<script>alert('操作成功！');location.href='ticketRec_list.aspx?rType="+rType+"'</script>");
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
                str = "update FY_Recommend set  title='" + Sys.filterSQLStr(txt_title.Value.Trim()) + "',price='" + Sys.filterSQLStr(txt_price.Value.Trim()) + "',ticketUrl='" + Sys.filterSQLStr(txt_ticketUrl.Value.Trim()) + "',ticketPic='" + picPath.Trim() + "',rStar=" +starflag + " where rId=" + id + "";
            }
            else
            {

                str = "update FY_Recommend set  title='" + Sys.filterSQLStr(txt_title.Value.Trim()) + "',price='" + Sys.filterSQLStr(txt_price.Value.Trim()) + "',ticketUrl='" + Sys.filterSQLStr(txt_ticketUrl.Value.Trim()) + "',rStar=" + starflag + "  where rId=" + id + "";
            }
            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='ticketRec_list.aspx?rType=" + rType + "'</script>");
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
