using System;
using System.Data;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;
using System.Data.SqlClient;
using System.IO;

public partial class person_myinfo : System.Web.UI.Page
{
    //用户对象
    protected MemberItem memberitem = new MemberItem();

    protected string Mem_LoginName = string.Empty;
    protected string Mem_ID = string.Empty;
    protected string Mem_Money = string.Empty;
    protected DataRowCollection recommendThree = null;
    protected DataRowCollection recommendFour = null;

    protected void Page_Load(object sender, EventArgs e)
    {
        //判断登陆
        if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null || Session["Mem_Money"] == null)
            Response.Redirect("../index.aspx");
        else
        {
            Mem_LoginName = Session["Mem_LoginName"].ToString();
            Mem_ID = Session["Mem_ID"].ToString();
            Mem_Money = Session["Mem_Money"].ToString();

            memberitem=getMyInfo(Mem_ID);

            if(!IsPostBack)
                if (memberitem != null)
                {
                    username.Value = memberitem.Mem_LoginName;
                    nickname.Value = memberitem.Mem_Name;
                    tel.Value = memberitem.Mem_Tel;
                    email.Value = memberitem.Mem_Email;
                    company.Value = memberitem.Mem_company;
                    qq.Value = memberitem.Mem_qq;
                    msn.Value = memberitem.Mem_msn;
                    if (memberitem.Mem_Sex.Trim().Equals("M"))
                        sexm.Checked = true;
                    else
                        sexr.Checked = true;
                    if(!string.IsNullOrEmpty(memberitem.Mem_birthday))
                        date.Value = Convert.ToDateTime(memberitem.Mem_birthday.Trim()).ToString("yyyy-MM-dd");
                    post.Value = memberitem.Mem_Addr;
                }

            recommendThree = getRecommendInfo("本周图片推荐", 3);
            recommendFour = getRecommendInfo("精选图片推", 3);
        }
    }


    protected DataRowCollection getRecommendInfo(string rType, int num)
    {
        DataRowCollection Rerow = null;

        string str = @"select top " + num + "  * from FY_Recommend where rType='" + rType + "' order by rId desc";
        try
        {
            Rerow = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0].Rows;
        }
        catch (Exception err)
        {
            HttpContext.Current.Response.Write(err.Message);
            HttpContext.Current.Response.End();
        }
        return Rerow;

    }


    /// <summary>
    /// 获取个人信息
    /// </summary>
    /// <param name="menberId"></param>
    protected MemberItem getMyInfo(string menberId)
    {
        if(string.IsNullOrEmpty(menberId))
            return null;

        MemberItem mitem = new MemberItem();

        string str = "select top 1 * from tmember where Mem_ID='" +menberId.Trim() + "'";
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        if (ds != null)
        {
            DataRow dr = ds.Tables[0].Rows[0];

            mitem.Mem_ID = dr["Mem_ID"].ToString();
            mitem.Mem_LoginName = dr["Mem_LoginName"].ToString();
            mitem.Mem_Biming = dr["Mem_Biming"].ToString();
            mitem.Mem_Email = dr["Mem_Email"].ToString();
            mitem.Mem_Sex = dr["Mem_Sex"].ToString();
            mitem.Mem_City = dr["Mem_City"].ToString();
            mitem.Mem_Name = dr["Mem_Name"].ToString();
            mitem.Mem_Addr = dr["Mem_Addr"].ToString();
            mitem.Mem_Tel = dr["Mem_Tel"].ToString();
            mitem.Mem_Mobile = dr["Mem_Mobile"].ToString();
            mitem.Mem_CardID = dr["Mem_CardID"].ToString();
            mitem.Mem_IDcard = dr["Mem_IDcard"].ToString();
            mitem.Mem_Grade = dr["Mem_Grade"].ToString();
            mitem.Mem_Status = dr["Mem_Status"].ToString();
            mitem.Mem_Money = dr["Mem_Money"].ToString();
            mitem.Mem_RegistDate = dr["Mem_RegistDate"].ToString();
            mitem.Mem_Remark = dr["Mem_Remark"].ToString();
            mitem.Mem_province = dr["mem_province"].ToString();
            mitem.Mem_zip = dr["mem_zip"].ToString();
            mitem.Mem_power = dr["mem_power"].ToString();
            mitem.Mem_fax = dr["mem_fax"].ToString();
            mitem.Mem_both = dr["mem_both"].ToString();
            mitem.Mem_cid = dr["mem_cid"].ToString();
            mitem.Mem_company = dr["mem_company"].ToString();
            mitem.Mem_ifActive = dr["mem_ifActive"].ToString();
            mitem.Mem_lastlogintime = dr["mem_lastlogintime"].ToString();
            mitem.Mem_logins = dr["mem_logins"].ToString();
            mitem.Mem_lastloginip = dr["mem_lastloginip"].ToString();
            mitem.Mem_bankxiao = dr["mem_bankxiao"].ToString();
            mitem.Mem_birthday = dr["mem_birthday"].ToString();
            mitem.Mem_qq = dr["mem_qq"].ToString();
            mitem.Mem_msn = dr["mem_msn"].ToString();
            mitem.Mem_pic = dr["mem_pic"].ToString();
        }

        return mitem;
    }

    /// <summary>
    /// 提交修改个人资料
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void But_update_Click(object sender, EventArgs e)
    {
        try
        {

            DateTime dt1;

            if (!string.IsNullOrEmpty(date.Value))
            {
                if (!DateTime.TryParse(date.Value, out dt1))
                {
                    scripthelp.Alert("出生日期格式错误!", this.Page);
                    return;
                }
            }

            string sexv = "M";
            if (sexr.Checked)
                sexv = "W";
            string picPath = string.Empty;

            if (FileUpload_picPath.HasFile)
            {
                if (FileUploadOK(out picPath))
                {
                    string str = "UPDATE tmember SET Mem_LoginName = '" + username.Value + "',Mem_Name='" + nickname.Value + "',Mem_Tel='" + tel.Value + "',Mem_Email='" + email.Value + "',Mem_company='" + company.Value + "',Mem_qq='" + qq.Value + "',Mem_msn='" + msn.Value + "',Mem_Sex='" + sexv + "',Mem_birthday='" + date.Value + "',Mem_Addr='" + post.Value + "',mem_pic='" + picPath.Trim() + "' WHERE Mem_ID = " + Mem_ID + "";

                    int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
                    if (count > 0)
                        scripthelp.AlertAndRedirect("更新资料成功！", "myinfo.aspx", this.Page);
                    else
                        scripthelp.Alert("更新资料失败！", this.Page);

                }
                else
                {
                    scripthelp.Alert("保存上传图片文件操作失败!", this.Page);
                    return;
                }
            }
            else
            {
                string str = "UPDATE tmember SET Mem_LoginName = '" + username.Value + "',Mem_Name='" + nickname.Value + "',Mem_Tel='" + tel.Value + "',Mem_Email='" + email.Value + "',Mem_company='" + company.Value + "',Mem_qq='" + qq.Value + "',Mem_msn='" + msn.Value + "',Mem_Sex='" + sexv + "',Mem_birthday='" + date.Value + "',Mem_Addr='" + post.Value + "' WHERE Mem_ID = " + Mem_ID + "";

                int count = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
                if (count > 0)
                    scripthelp.AlertAndRedirect("更新资料成功！", "myinfo.aspx", this.Page);
                else
                    scripthelp.Alert("更新资料失败！", this.Page);
            }
        }
        catch (Exception ex)
        {
            throw ex;
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
            _picPath = "../upload_web/" + _time + "/";
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
