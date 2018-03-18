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
using Fei580.Model;

    public partial class NowSearchingAdd : System.Web.UI.Page
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
                    string str = "select * from FY_Searching where id=" + id;
                    DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                    ddlLineType.SelectedValue = ds.Tables[0].Rows[0]["lineType"].ToString();
                    txtFromCity.Value = ds.Tables[0].Rows[0]["fromCity"].ToString();
                    txtToCity.Value = ds.Tables[0].Rows[0]["toCity"].ToString();
                    //txtDate.Value = (DateTime)ds.Tables[0].Rows[0]["flyDate"].ToString("yyyy-MM-dd");
                    ddlToward.SelectedValue = ds.Tables[0].Rows[0]["toward"].ToString();
                    txtAirline.Value = ds.Tables[0].Rows[0]["airline"].ToString();
                    txtPrice.Value = ds.Tables[0].Rows[0]["price"].ToString();
                    txtPrice2.Value = ds.Tables[0].Rows[0]["price2"].ToString();
                    txtPrice3.Value = ds.Tables[0].Rows[0]["price3"].ToString();
                    txtPrice4.Value = ds.Tables[0].Rows[0]["price4"].ToString();
                    txtPrice5.Value = ds.Tables[0].Rows[0]["price5"].ToString();

                    this.lblTitle.Text = "修改";


                }
                else
                {
                    //txtDate.Value = DateTime.Now.ToString("yyyy-MM-dd");
                    id = 0;
                    this.lblTitle.Text = "添加";
                }
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            


            if (id == 0)
            {
                string str = "";

                //str = "insert into FY_Searching(lineType,fromCity,toCity,flyDate,toward,airline,price,price2,price3,price4,price5)";
                str = "insert into FY_Searching(lineType,fromCity,toCity,toward,airline,price,price2,price3,price4,price5)";
                str += " values('" + Sys.filterSQLStr(ddlLineType.SelectedValue.Trim()) + "'";
                str += ",'" + Sys.filterSQLStr(txtFromCity.Value.Trim()) + "'";
                str += ",'" + Sys.filterSQLStr(txtToCity.Value.Trim()) + "'";
                //str += ",'" + Sys.filterSQLStr(txtDate.Value.Trim()) + "'";
                str += ",'" + ddlToward.SelectedValue + "'";
                str += ",'" + Sys.filterSQLStr(txtAirline.Value.Trim()) + "'";
                str += "," + Sys.filterSQLStr(txtPrice.Value.Trim()) + "'";
                str += "," + Sys.filterSQLStr(txtPrice2.Value.Trim()) + "'";
                str += "," + Sys.filterSQLStr(txtPrice3.Value.Trim()) + "'";
                str += "," + Sys.filterSQLStr(txtPrice4.Value.Trim()) + "'";
                str += "," + Sys.filterSQLStr(txtPrice5.Value.Trim()) + ")";
                int inserttag = 0;

                inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                if (inserttag > 0)
                {
                    Response.Write("<script>alert('操作成功！');location.href='NowSearchingList.aspx';</script>");
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");

            }
            else
            {
                string str = "";

                str = "update FY_Searching set ";
                str += "  lineType='" + Sys.filterSQLStr(ddlLineType.SelectedValue.Trim()) + "' ";
                str +=" ,fromCity='" + Sys.filterSQLStr(txtFromCity.Value.Trim()) + "' ";
                str +=" ,toCity='" + Sys.filterSQLStr(txtToCity.Value.Trim()) + "' ";
                //str +=" ,flyDate='" + Sys.filterSQLStr(txtDate.Value.Trim()) + "' ";
                str +=" ,toward='" + Sys.filterSQLStr(ddlToward.SelectedValue.Trim()) + "'  ";
                str +=" ,airline='" + Sys.filterSQLStr(txtAirline.Value.Trim()) + "' ";
                str +=" ,price=" + Sys.filterSQLStr(txtPrice.Value.Trim()) + " ";
                str += ",price2=" + Sys.filterSQLStr(txtPrice2.Value.Trim()) + " ";
                str +=" ,price3=" + Sys.filterSQLStr(txtPrice3.Value.Trim()) + " ";
                str +=" ,price4=" + Sys.filterSQLStr(txtPrice4.Value.Trim()) + " ";
                str +=" ,price5=" + Sys.filterSQLStr(txtPrice5.Value.Trim()) + " ";
                str +=" where id=" + id + "";
                int inserttag = 0;

                inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                if (inserttag > 0)
                {
                    Response.Write("<script>alert('操作成功！');location.href='NowSearchingList.aspx';</script>");
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");

            }
            
        }
    }
