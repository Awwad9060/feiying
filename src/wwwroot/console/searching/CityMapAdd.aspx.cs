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

    public partial class CityMapAdd : System.Web.UI.Page
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
            ddlPriceDirect.Attributes.Add("onchange", "selectChangedPrice(this);");
            ddlPriceDirectB.Attributes.Add("onchange", "selectChangedPriceB(this);"); 
            if (!IsPostBack)
            {
                if (Request.QueryString["id"] != null)
                {
                    id = Convert.ToInt32(Request.QueryString["id"].ToString());
                    string str = "select * from FY_CityMap where id=" + id;
                    DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
                    cbHasLineInter.Checked = (bool)ds.Tables[0].Rows[0]["lineInter"];
                    cbHasLine.Checked = (bool)ds.Tables[0].Rows[0]["lineInside"];
                    txtCityName.Value = ds.Tables[0].Rows[0]["cityName"].ToString();
                    txtTop.Value = ds.Tables[0].Rows[0]["positionTop"].ToString();
                    txtLeft.Value = ds.Tables[0].Rows[0]["positionLeft"].ToString();

                    txtTop_Price.Value = ds.Tables[0].Rows[0]["priceTop"].ToString();
                    txtLeft_Price.Value = ds.Tables[0].Rows[0]["priceLeft"].ToString();
                    ddlPriceDirect.SelectedValue = ds.Tables[0].Rows[0]["priceDirect"].ToString();

                    txtTopB.Value = ds.Tables[0].Rows[0]["positionTopB"].ToString();
                    txtLeftB.Value = ds.Tables[0].Rows[0]["positionLeftB"].ToString();

                    txtTopB_Price.Value = ds.Tables[0].Rows[0]["priceTopB"].ToString();
                    txtLeftB_Price.Value = ds.Tables[0].Rows[0]["priceLeftB"].ToString();
                    ddlPriceDirectB.SelectedValue = ds.Tables[0].Rows[0]["priceDirectB"].ToString();

                    if (ddlPriceDirect.SelectedValue == "左边")
                    {
                        imgPrice.Src = "../images/airline_price_bkg_left.png";
                    }
                    else
                    {
                        imgPrice.Src = "../images/airline_price_bkg.png";
                    }


                    if (ddlPriceDirectB.SelectedValue == "左边")
                    {
                        imgPriceB.Src = "../images/airline_price_bkg_left.png";
                    }
                    else
                    {
                        imgPriceB.Src = "../images/airline_price_bkg.png";
                    }

                    this.lblTitle.Text = "修改";


                }
                else
                {
                    id = 0;
                    this.lblTitle.Text = "添加";
                }
            }
        }


        protected void btnSave_Click(object sender, EventArgs e)
        {
            int lineInter = cbHasLineInter.Checked == true ? 1 : 0;
            int lineInside = cbHasLine.Checked == true ? 1 : 0;
            string cityName = Sys.filterSQLStr(txtCityName.Value.Trim());
            string top = Sys.filterSQLStr(txtTop.Value.Trim());
            string left = Sys.filterSQLStr(txtLeft.Value.Trim());
            string top_price = Sys.filterSQLStr(txtTop_Price.Value.Trim());
            string left_price = Sys.filterSQLStr(txtLeft_Price.Value.Trim());
            string price_direct = ddlPriceDirect.SelectedValue;
            string topB = Sys.filterSQLStr(txtTopB.Value.Trim());
            string leftB = Sys.filterSQLStr(txtLeftB.Value.Trim());
            string topB_price = Sys.filterSQLStr(txtTopB_Price.Value.Trim());
            string leftB_price = Sys.filterSQLStr(txtLeftB_Price.Value.Trim());
            string priceB_direct = ddlPriceDirectB.SelectedValue;

            if (id == 0)
            {
                string str = "";

                str = "insert into FY_CityMap(lineInter,lineInside,cityName,positionTop,positionLeft,priceTop,priceLeft,priceDirect,positionTopB,positionLeftB,priceTopB,priceLeftB,priceDirectB)";
                str += " values(" + lineInter.ToString() + " "; 
                str += "        ," + lineInside.ToString() + " ";
                str += "        ,'" + cityName + "' ";
                str += "        ," + top + " ";
                str += "        ," + left + " ";
                str += "        ," + top_price + " ";
                str += "        ," + left_price + " ";
                str += "        ,'" + price_direct + "' ";
                str += "        ," + topB + " ";
                str += "        ," + leftB + " ";
                str += "        ," + topB_price + " ";
                str += "        ," + leftB_price + " ";
                str += "        ,'" + priceB_direct + "' )";
                int inserttag = 0;

                inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                if (inserttag > 0)
                {
                    Response.Write("<script>alert('操作成功！');location.href='CityMapList.aspx';</script>");
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");

            }
            else
            {
                string str = "";

                str = "update FY_CityMap set ";
                str += " lineInter=" + lineInter + " ";
                str += " ,lineInside=" + lineInside + " ";
                str += " ,cityName='" + cityName + "' ";
                str += " ,positionTop=" + top + " ";
                str += " ,positionLeft=" + left + " ";
                str += " ,priceTop=" + top_price + " ";
                str += " ,priceLeft=" + left_price + " ";
                str += " ,priceDirect='" + price_direct + "' ";
                str += " ,positionTopB=" + topB + " ";
                str += " ,positionLeftB=" + leftB + " ";
                str += " ,priceTopB=" + topB_price + " ";
                str += " ,priceLeftB=" + leftB_price + " ";
                str += " ,priceDirectB='" + priceB_direct + "' ";
                str += " where id= " + id + "; ";
                int inserttag = 0;

                inserttag = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);

                if (inserttag > 0)
                {
                    Response.Write("<script>alert('操作成功！');location.href='CityMapList.aspx';</script>");
                }
                else
                    ClientScript.RegisterStartupScript(this.GetType(), "t", "<script>window.alert('操作失败！')</script>");

            }
            
        }
    }