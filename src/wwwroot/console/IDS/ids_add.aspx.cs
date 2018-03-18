using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Collections.Generic;
using System.Web;
using System.Text;
using System.IO;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;


public partial class console_IDS_ids_add : System.Web.UI.Page
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
            //出发城市设置
            {
                //绑定出发城市 
                string commandText3 = "select * from FY_FromCity";
                DataSet ds3 = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, commandText3);
                if (ds3 != null)
                {
                    fromCity.DataSource = ds3;
                    fromCity.DataTextField = "chName";
                    fromCity.DataValueField = "fid";
                    fromCity.DataBind();
                }
            }


            //初始化页面
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string str = "select * from FY_IDS where iId=" + id;
                DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                fromCity.Value = ds.Tables[0].Rows[0]["fromId"].ToString();
                txtSearch_tocity.Value = getToCityById(Convert.ToInt32(ds.Tables[0].Rows[0]["toId"].ToString()));
                txt_idsYear.Value = ds.Tables[0].Rows[0]["idsYear"].ToString();
                txt_lowMonth.Value = ds.Tables[0].Rows[0]["lowMonth"].ToString();
                txt_lowPrice.Value = ds.Tables[0].Rows[0]["lowPrice"].ToString();
                txt_heightMonth.Value = ds.Tables[0].Rows[0]["heightMonth"].ToString();
                txt_heightPrice.Value = ds.Tables[0].Rows[0]["heightPrice"].ToString();
                txt_comment.Value = ds.Tables[0].Rows[0]["comment"].ToString();
                txt_idsPrice.Value = ds.Tables[0].Rows[0]["idsPrice"].ToString();
                txt_idsComment.Value = ds.Tables[0].Rows[0]["idsComment"].ToString();
                txt_remai.Value = ds.Tables[0].Rows[0]["remai"].ToString();
                txt_manyi.Value = ds.Tables[0].Rows[0]["manyi"].ToString();

                this.isUploadPic.Text = "已上传：<img src=../../" + ds.Tables[0].Rows[0]["idsPic"].ToString() + " height='90' width='200'>";
                this.oldPic.Value = ds.Tables[0].Rows[0]["idsPic"].ToString();

                this.lblTitle.Text = "修改IDS服务";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加IDS服务";
            }


        }

        AjaxPro.Utility.RegisterTypeForAjax(typeof(console_IDS_ids_add));
    }


    private string getToCityById(int id)
    {
        string cityName = "";
        string str = "select (cityCode+'-'+chName) as cityName from FY_ToCity where tId=" + id;
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds != null)
        {
            if (ds.Tables[0].Rows.Count > 0)
            {
                cityName = ds.Tables[0].Rows[0]["cityName"].ToString();
            }
        }
        return cityName;
    }

    [AjaxPro.AjaxMethod(AjaxPro.HttpSessionStateRequirement.Read)]
    public string GetCity_to(string name)
    {
        string sql = "select * from FY_ToCity where chName like '%" + name + "%' or cityCode like  '" + name + "%'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, sql);
        try
        {
            List<string> list = new List<string>();
            #region
            for (int i = 0; i < ds.Tables[0].Rows.Count; i++)
            {
                list.Add(ds.Tables[0].Rows[i]["cityCode"].ToString() + "-" + ds.Tables[0].Rows[i]["chName"].ToString());
            }
            #endregion
            List<string> l1 = list.FindAll(delegate(string ss) { return ss.Contains(name); });
            string str = "[";
            foreach (string s in l1)
            {
                str += "\"" + s + "\"" + ",";
            }
            str = str.TrimEnd(',') + "]";
            return str;
        }
        catch (Exception ex)
        {
            throw ex;
        }

    }


    private int getToCityIdByName(string name)
    {
        int aId = 0;
        string[] codeName = name.Split('-');
        if (codeName.Length > 0)
        {
            string code = codeName[0].ToString();

            string str = "select tId,cityCode,chName from FY_ToCity where cityCode='" + code + "'";
            DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
            if (ds != null && ds.Tables.Count > 0)
            {
                if (ds.Tables[0].Rows.Count >0)
                    if (codeName[1] == ds.Tables[0].Rows[0]["chName"].ToString())
                        aId = Convert.ToInt32(ds.Tables[0].Rows[0]["tId"].ToString());
            }
        }
        return aId;
    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        int toId = getToCityIdByName(txtSearch_tocity.Value);
        if (toId <= 0)
        {
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('请输入并选择目的城市！')</script>");
            return;
        }

        if (string.IsNullOrEmpty(txt_idsYear.Value))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('请输入年份！')</script>");
            return;
        }

        if (string.IsNullOrEmpty(txt_lowMonth.Value))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('请输入最低月份！')</script>");
            return;
        }
        if (string.IsNullOrEmpty(txt_lowPrice.Value))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('请输入最低价格！')</script>");
            return;
        }
        if (string.IsNullOrEmpty(txt_heightMonth.Value))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('请输入最高月份！')</script>");
            return;
        }
        if (string.IsNullOrEmpty(txt_heightPrice.Value))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('请输入最高价格！')</script>");
            return;
        }
        if (string.IsNullOrEmpty(txt_idsPrice.Value))
        {
            ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('请输入IDS评价价格！')</script>");
            return;
        }

        string picPath = string.Empty;
        if (id == 0)
        {
            string str = "";
            if (FileUpload_picPath.HasFile)
            {
                FileUploadOK(out picPath);
            }

            str = "insert into FY_IDS(fromId,toId,idsYear,lowMonth,lowPrice,heightMonth,heightPrice,comment,idsPrice,idsComment,remai,manyi,idsPic,addTime)";
            str += " values('" + Sys.filterSQLStr(fromCity.Value) + "','" + toId + "','" + Sys.filterSQLStr(txt_idsYear.Value) + "','" + Sys.filterSQLStr(txt_lowMonth.Value) + "','" + Sys.filterSQLStr(txt_lowPrice.Value) + "','" + Sys.filterSQLStr(txt_heightMonth.Value) + "','" + Sys.filterSQLStr(txt_heightPrice.Value) + "','" + Sys.filterSQLStr(txt_comment.Value) + "','" + Sys.filterSQLStr(txt_idsPrice.Value) + "','" + Sys.filterSQLStr(txt_idsComment.Value) + "','" + Sys.filterSQLStr(txt_remai.Value) + "','" + Sys.filterSQLStr(txt_manyi.Value) + "','" + picPath.Trim() + "',getdate())";
            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='ids_list.aspx'</script>");
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
                str = "update FY_IDS set  fromId='" + Sys.filterSQLStr(fromCity.Value) + "',toId='" + toId + "',idsYear='" + Sys.filterSQLStr(txt_idsYear.Value.Trim()) + "',lowMonth='" + Sys.filterSQLStr(txt_lowMonth.Value.Trim()) + "',lowPrice='" + Sys.filterSQLStr(txt_lowPrice.Value.Trim()) + "',heightMonth='" + Sys.filterSQLStr(txt_heightMonth.Value.Trim()) + "',heightPrice='" + Sys.filterSQLStr(txt_heightPrice.Value.Trim()) + "',comment='" + Sys.filterSQLStr(txt_comment.Value.Trim()) + "',idsPrice='" + Sys.filterSQLStr(txt_idsPrice.Value.Trim()) + "',idsComment='" + Sys.filterSQLStr(txt_idsComment.Value.Trim()) + "',remai='" + Sys.filterSQLStr(txt_remai.Value.Trim()) + "',manyi='" + Sys.filterSQLStr(txt_manyi.Value.Trim()) + "',idsPic='" + picPath.Trim() + "' where iId=" + id + "";
            }
            else
            {

                str = "update FY_IDS set  fromId='" + Sys.filterSQLStr(fromCity.Value) + "',toId='" + toId + "',idsYear='" + Sys.filterSQLStr(txt_idsYear.Value.Trim()) + "',lowMonth='" + Sys.filterSQLStr(txt_lowMonth.Value.Trim()) + "',lowPrice='" + Sys.filterSQLStr(txt_lowPrice.Value.Trim()) + "',heightMonth='" + Sys.filterSQLStr(txt_heightMonth.Value.Trim()) + "',heightPrice='" + Sys.filterSQLStr(txt_heightPrice.Value.Trim()) + "',comment='" + Sys.filterSQLStr(txt_comment.Value.Trim()) + "',idsPrice='" + Sys.filterSQLStr(txt_idsPrice.Value.Trim()) + "',idsComment='" + Sys.filterSQLStr(txt_idsComment.Value.Trim()) + "',remai='" + Sys.filterSQLStr(txt_remai.Value.Trim()) + "',manyi='" + Sys.filterSQLStr(txt_manyi.Value.Trim()) + "' where iId=" + id + "";
            }
            int inserttag = 0;

            inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

            if (inserttag > 0)
            {
                Response.Write("<script>alert('操作成功！');location.href='ids_list.aspx'</script>");
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
