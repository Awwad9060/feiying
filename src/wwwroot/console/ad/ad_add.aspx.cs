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

public partial class console_ad_ad_add : System.Web.UI.Page 
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
            //初始化页面

            DataSet ds = new DataSet();
            if (Request.QueryString["id"] != null)
            {
                id = Convert.ToInt32(Request.QueryString["id"].ToString());
                string str = "select * from FY_advertise where id=" + id;
                ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                txtadPosition.Value = ds.Tables[0].Rows[0]["adPosition"].ToString();
                txtadPx.Text = ds.Tables[0].Rows[0]["adPx"].ToString();
                this.txt_title.Value = ds.Tables[0].Rows[0]["title"].ToString();
                this.txt_linkUrl.Value = ds.Tables[0].Rows[0]["linkUrl"].ToString();
                this.txtadCompany.Value = ds.Tables[0].Rows[0]["adCompany"].ToString();
                this.txtadDetail.Text = ds.Tables[0].Rows[0]["adDetail"].ToString();
                this.isUploadPic.Text = "已上传：<img src=../../" + ds.Tables[0].Rows[0]["adPath"].ToString() + " height='80px' width='200px'>";
                this.oldPic.Value = ds.Tables[0].Rows[0]["adPath"].ToString();

                if (ds.Tables[0].Rows[0]["adKind"].ToString() == "1")
                {
                    yFlash.Checked = true;
                    nFlash.Checked = false;

                }
                else
                {
                    nFlash.Checked = true;
                    yFlash.Checked = false;
                }
                if (ds.Tables[0].Rows[0]["display"].ToString() == "0")
                {
                    this.yDisplay.Checked = true;
                    this.nDisplay.Checked = false;

                }
                else
                {
                    this.nDisplay.Checked = true;
                    this.yDisplay.Checked = false;
                }

                this.lblTitle.Text = "修改广告内容信息";
            }
            else
            {
                id = 0;
                this.lblTitle.Text = "添加广告内容信息";
                yFlash.Checked = true;
                nFlash.Checked = false;
                this.yDisplay.Checked = true;
                this.nDisplay.Checked = false;
                
            }
        }
    }


    /// <summary>
    ///添加（修改）操作
    /// </summary> 
    private void AddInfo()
    {
        string sql = "";

        int adKind = 0,display=0;
        if (yFlash.Checked == true) adKind = 1; else adKind = 0;
        if (nDisplay.Checked == true) display = 1; else display = 0;

        //品牌图片路径
        string[] uploadeAddress = null;

        //上传的文件名
        string[] filename = null;

        long maxSize = long.Parse(ConfigurationManager.AppSettings.Get("newsPicSize"));

        string message = CommMethod.uploadFile(HttpContext.Current.Server.MapPath("~/upload_pic"), null, ".jpg.gif.png.bmp.swf", maxSize, out uploadeAddress, out filename);

        string picurl = "upload_pic" + uploadeAddress[0];


        if (id == 0)
        {
            if (uploadeAddress[0] !=null)
            {
                sql = "insert into FY_advertise(adKind,adPath,adPx,adPosition,adDetail,adCompany,addtime,title,linkUrl,display) values(" + adKind + ",'" + Sys.filterSQLStr(picurl) + "','"
                     + Sys.filterSQLStr(txtadPx.Text.Trim()) + "','" + Sys.filterSQLStr(txtadPosition.Value.Trim()) + "','" + Sys.filterSQLStr(txtadDetail.Text.Trim()) + "','"
                     + Sys.filterSQLStr(txtadCompany.Value.Trim()) + "',getdate(),'" + Sys.filterSQLStr(this.txt_title.Value.Trim()) + "','" + Sys.filterSQLStr(this.txt_linkUrl.Value.Trim()) + "'," + display + ")";

                int succtag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, sql);

                if (succtag > 0)
                {
                    succtag = 1;
                    scripthelp.AlertAndRedirect("保存操作成功!", "ad_list.aspx", this.Page);
                }
                else
                {
                    scripthelp.Alert("保存操作失败!", this.Page);
                    return;
                }
            }
            else
            {
                scripthelp.Alert(message, this.Page);
                return;
            }
        }
        else
        {
            if (uploadeAddress[0]==null)
            {
                picurl = this.oldPic.Value;
                if (string.IsNullOrEmpty(picurl))
                {
                    scripthelp.Alert("上传的文件不能为空！", this.Page);
                    return;
                }
            }
            string str = "select * from FY_advertise where id=" + Convert.ToInt32(Request.QueryString["id"].ToString());

            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

            if (dt.Rows.Count < 0)
                return;
            else
            {
                string adPath = dt.Rows[0]["adPath"].ToString();

                if (File.Exists(Server.MapPath(adPath)))
                {
                    File.Delete(Server.MapPath(adPath));
                }
            }

            sql = "update FY_advertise set adKind=" + adKind + ",adPath='" + picurl + "',"
                  + "adPx='" + Sys.filterSQLStr(txtadPx.Text.Trim()) + "',adPosition='" + Sys.filterSQLStr(txtadPosition.Value.Trim()) + "',"
                  + "adDetail='" + Sys.filterSQLStr(txtadDetail.Text.Trim()) + "',adCompany='" + Sys.filterSQLStr(txtadCompany.Value.Trim()) + "',"
                  + "addtime=getdate(),title='" + Sys.filterSQLStr(txt_title.Value.Trim()) + "',linkUrl='" + Sys.filterSQLStr(txt_linkUrl.Value.Trim()) + "',display=" + display + "  where id =" + id + "";


            int succtag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, sql);

            if (succtag > 0)
            {
                succtag = 1;
                scripthelp.AlertAndRedirect("保存操作成功!", "ad_list.aspx", this.Page);
            }
            else
            {
                scripthelp.Alert("保存操作失败!", this.Page);
                return;
            }
        }

    }


    protected void btnSave_Click(object sender, EventArgs e)
    {
        AddInfo();
    }
}
