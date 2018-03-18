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
using Fei580.Model;
using Fei580.Model;

    public partial class console_Left_Conn : System.Web.UI.Page
    {
        protected void Page_Load(object sender, EventArgs e)
        {
            //判断是否登录，如果未登陆，则跳到登陆页面
            MemberInfo adminmerinfo = (MemberInfo)Session["adminmerinfo"];
            if (adminmerinfo == null)
            {
                ClientScript.RegisterStartupScript(ClientScript.GetType(), "t", "<script>displaymenu();</script>");
                Response.Redirect("~/console/login.aspx", true);
            }

            if (adminmerinfo.Flag == 1)
            {
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
            }
            else if (adminmerinfo.Flag == 2)
            {
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
            }
            else if (adminmerinfo.Flag == 3)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                //this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 4)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                //this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 5)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                //this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 6)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                //this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 7)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                //this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 8)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                //this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 9)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                //this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 10)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 11)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
                this.pan_20.Visible = false;
            }
            else if (adminmerinfo.Flag == 12)
            {
                this.pan_1.Visible = false;
                this.pan_2.Visible = false;
                this.pan_3.Visible = false;
                this.pan_4.Visible = false;
                this.pan_5.Visible = false;
                this.pan_6.Visible = false;
                this.pan_7.Visible = false;
                this.pan_8.Visible = false;
                this.pan_9.Visible = false;
                this.pan_10.Visible = false;
                this.pan_11.Visible = false;
                this.pan_12.Visible = false;
                this.pan_13.Visible = false;
                this.pan_14.Visible = false;
                this.pan_15.Visible = false;
                this.pan_16.Visible = false;
                //this.pan_17.Visible = false;
                this.pan_18.Visible = false;
                this.pan_19.Visible = false;
            }
        }
    }

