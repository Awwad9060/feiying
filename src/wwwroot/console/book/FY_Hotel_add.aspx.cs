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

public partial class console_book_FY_Hotel_add : System.Web.UI.Page
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
            this.txt_fromDate.Value = DateTime.Now.ToShortDateString();
            this.txt_toDate.Value = DateTime.Now.AddMonths(1).ToShortDateString();

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

                this.txt_fromDate.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["fromDate"]).ToShortDateString();
                this.txt_toDate.Value = Convert.ToDateTime(ds.Tables[0].Rows[0]["toDate"]).ToShortDateString();
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

                this.lblTitle.Text = "酒店基础信息";

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
                this.lblTitle.Text = "酒店基础信息";
            }
        }
    }

    /// <summary>
    /// 绑定城市
    /// </summary>
    private void setCityList()
    {
        string str = "select * from FY_HotelCity order by chName";

        DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select,CommandType.Text,str).Tables[0];

        this.sel_cityName.DataSource = dt;
        this.sel_cityName.DataTextField = "chName";
        this.sel_cityName.DataValueField = "tId";
        this.sel_cityName.DataBind();

        this.sel_cityName.Items.Insert(0, new ListItem(":::: 所属城市 :::: ", ""));
    }
}
