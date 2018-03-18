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

public partial class cms_airline_airline_pic : System.Web.UI.Page 
{
    private string preFileDateTime = "";

    private int preFileIndex = 0;

    public int airId = 0;

    private bool isInt = false;

    protected void Page_Load(object sender, EventArgs e)
    {
        airId = Convert.ToInt32(Request.QueryString["airId"]);

        string str = "select * from FY_Airline where aId=" + airId;
        DataSet ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str);
        this.lblTitle.Text = ds.Tables[0].Rows[0]["chName"].ToString()+"图片集";

        isInt=CheckAirPic(airId);

        if (!isInt && !IsPostBack)
            GetProInfo();
    }

    /// <summary>
    /// 对数据库进行检测(true不存在，false存在)
    /// </summary>
    /// <param tId="friendId"></param>
    protected bool CheckAirPic(int airId)
    {
        string str = "if not exists (select id from FY_Airline_Pic where airlineId=" + airId + ") select 1 else select 0";

        if (SqlHelper.ExecuteScalar(SqlHelper.ConnString_select, CommandType.Text, str).ToString() == "0")
            return false;
        else
            return true;
    }

    /// <summary>
    /// 获取要修改图片的信息
    /// </summary>
    protected void GetProInfo()
    {
        string str = "select * from FY_Airline_Pic where airlineId=" + airId;
        SqlDataReader dr = SqlHelper.ExecuteReader(SqlHelper.ConnString_select, CommandType.Text, str);
        while (dr.Read())
        {
            if (dr["pic1"].ToString() != "")
                imgpro1.ImageUrl = "../../" + dr["pic1"].ToString();
            this.txt_air1.Value = dr["air1"].ToString();

            if (dr["pic2"].ToString() != "")
                imgpro2.ImageUrl = "../../" + dr["pic2"].ToString();
            this.txt_air2.Value = dr["air2"].ToString();

            if (dr["pic3"].ToString() != "")
                imgpro3.ImageUrl = "../../" + dr["pic3"].ToString();
            this.txt_air3.Value = dr["air3"].ToString();
        
            if (dr["pic4"].ToString() != "")
      
                imgpro4.ImageUrl = "../../" + dr["pic4"].ToString();
            this.txt_air4.Value = dr["air4"].ToString();
     
            if (dr["pic5"].ToString() != "")
       
                imgpro5.ImageUrl = "../../" + dr["pic5"].ToString();
            this.txt_air5.Value = dr["air5"].ToString();
        
            if (dr["pic6"].ToString() != "")
        
                imgpro6.ImageUrl = "../../" + dr["pic6"].ToString();
            this.txt_air6.Value = dr["air6"].ToString();
       
            if (dr["pic7"].ToString() != "")
     
                imgpro7.ImageUrl = "../../" + dr["pic7"].ToString();
            this.txt_air7.Value = dr["air7"].ToString();
      
            if (dr["pic8"].ToString() != "")
      
                imgpro8.ImageUrl = "../../" + dr["pic8"].ToString();
            this.txt_air8.Value = dr["air8"].ToString();
   
            if (dr["pic9"].ToString() != "")
     
                imgpro9.ImageUrl = "../../" + dr["pic9"].ToString();
            this.txt_air9.Value = dr["air9"].ToString();
   
            if (dr["pic10"].ToString() != "")
      
                imgpro10.ImageUrl = "../../" + dr["pic10"].ToString();
            this.txt_air10.Value = dr["air10"].ToString();
      
            if (dr["pic11"].ToString() != "")
        
                imgpro11.ImageUrl = "../../" + dr["pic11"].ToString();
            this.txt_air11.Value = dr["air11"].ToString();

       
            if (dr["pic12"].ToString() != "")
       
                imgpro12.ImageUrl = "../../" + dr["pic12"].ToString();
            this.txt_air12.Value = dr["air12"].ToString();
      
            if (dr["pic13"].ToString() != "")
          
                imgpro13.ImageUrl = "../../" + dr["pic13"].ToString();
            this.txt_air13.Value = dr["air13"].ToString();
          
            if (dr["pic14"].ToString() != "")
        
                imgpro14.ImageUrl = "../../" + dr["pic14"].ToString();
            this.txt_air14.Value = dr["air14"].ToString();
       
            if (dr["pic15"].ToString() != "")
       
                imgpro15.ImageUrl = "../../" + dr["pic15"].ToString();
            this.txt_air15.Value = dr["air15"].ToString();
       
        }

    }

    /// <summary>
    /// 添加（修改）信息 
    /// </summary>
    /// <param name="sender"></param>
    /// <param name="e"></param>
    protected void btnok_Click(object sender, EventArgs e)
    {
        string str = string.Empty;
        string ppic1 = string.Empty;
        string ppic2 = string.Empty;
        string ppic3 = string.Empty;
        string ppic4 = string.Empty;
        string ppic5 = string.Empty;
        string ppic6 = string.Empty;
        string ppic7 = string.Empty;
        string ppic8 = string.Empty;
        string ppic9 = string.Empty;
        string ppic10 = string.Empty;
        string ppic11 = string.Empty;
        string ppic12 = string.Empty;
        string ppic13 = string.Empty;
        string ppic14 = string.Empty;
        string ppic15 = string.Empty;

        string aair1 = string.Empty;
        string aair2 = string.Empty;
        string aair3 = string.Empty;
        string aair4 = string.Empty;
        string aair5 = string.Empty;
        string aair6 = string.Empty;
        string aair7 = string.Empty;
        string aair8 = string.Empty;
        string aair9 = string.Empty;
        string aair10 = string.Empty;
        string aair11 = string.Empty;
        string aair12 = string.Empty;
        string aair13 = string.Empty;
        string aair14 = string.Empty;
        string aair15 = string.Empty;

        if (!isInt)
        {
            str = "select * from FY_Airline_Pic where airlineId=" + airId;

            DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

            if (dt.Rows.Count < 0)
                return;
            else
            {
                ppic1 = dt.Rows[0]["pic1"].ToString();
                ppic2 = dt.Rows[0]["pic2"].ToString();
                ppic3 = dt.Rows[0]["pic3"].ToString();
                ppic4 = dt.Rows[0]["pic4"].ToString();
                ppic5 = dt.Rows[0]["pic5"].ToString();
                ppic6 = dt.Rows[0]["pic6"].ToString();
                ppic7 = dt.Rows[0]["pic7"].ToString();
                ppic8 = dt.Rows[0]["pic8"].ToString();
                ppic9 = dt.Rows[0]["pic9"].ToString();
                ppic10 = dt.Rows[0]["pic10"].ToString();
                ppic11 = dt.Rows[0]["pic11"].ToString();
                ppic12 = dt.Rows[0]["pic12"].ToString();
                ppic13 = dt.Rows[0]["pic13"].ToString();
                ppic14 = dt.Rows[0]["pic14"].ToString();
                ppic15 = dt.Rows[0]["pic15"].ToString();
            }

            aair1 = this.txt_air1.Value.Trim();
            aair2 = this.txt_air2.Value.Trim();
            aair3 = this.txt_air3.Value.Trim();
            aair4 = this.txt_air4.Value.Trim();
            aair5 = this.txt_air5.Value.Trim();
            aair6 = this.txt_air6.Value.Trim();
            aair7 = this.txt_air7.Value.Trim();
            aair8 = this.txt_air8.Value.Trim();
            aair9 = this.txt_air9.Value.Trim();
            aair10 = this.txt_air10.Value.Trim();
            aair11 = this.txt_air11.Value.Trim();
            aair12 = this.txt_air12.Value.Trim();
            aair13 = this.txt_air13.Value.Trim();
            aair14 = this.txt_air14.Value.Trim();
            aair15 = this.txt_air15.Value.Trim();

            if (hidpic1.Value == "")
            {
                hidpic1.Value = ppic1;
            }

            if (hidpic2.Value == "")
            {
                hidpic2.Value = ppic2;
            }

            if (hidpic3.Value == "")
            {
                hidpic3.Value = ppic3;
            }

            if (hidpic4.Value == "")
            {
                hidpic4.Value = ppic4;
            }

            if (hidpic5.Value == "")
            {
                hidpic5.Value = ppic5;
            }

            if (hidpic6.Value == "")
            {
                hidpic6.Value = ppic6;
            }

            if (hidpic7.Value == "")
            {
                hidpic7.Value = ppic7;
            }

            if (hidpic8.Value == "")
            {
                hidpic8.Value = ppic8;
            }
            if (hidpic9.Value == "")
            {
                hidpic9.Value = ppic9;
            }

            if (hidpic10.Value == "")
            {
                hidpic10.Value = ppic10;
            }

            if (hidpic11.Value == "")
            {
                hidpic11.Value = ppic11;
            }

            if (hidpic12.Value == "")
            {
                hidpic12.Value = ppic12;
            }
            if (hidpic13.Value == "")
            {
                hidpic13.Value = ppic13;
            }

            if (hidpic14.Value == "")
            {
                hidpic14.Value = ppic14;
            }

            if (hidpic15.Value == "")
            {
                hidpic15.Value = ppic15;
            }
            str = "update FY_Airline_Pic set airlineId = " + airId + ","
                      + "pic1='" + Sys.filterSQLStr(hidpic1.Value) + "',pic2='" + Sys.filterSQLStr(hidpic2.Value) + "',pic3='" + Sys.filterSQLStr(hidpic3.Value) + "',pic4='" + Sys.filterSQLStr(hidpic4.Value) + "',"
                      + "pic5='" + Sys.filterSQLStr(hidpic5.Value) + "',pic6='" + Sys.filterSQLStr(hidpic6.Value) + "',pic7='" + Sys.filterSQLStr(hidpic7.Value) + "',pic8='" + Sys.filterSQLStr(hidpic8.Value) + "',"
                      + "pic9='" + Sys.filterSQLStr(hidpic9.Value) + "',pic10='" + Sys.filterSQLStr(hidpic10.Value) + "',pic11='" + Sys.filterSQLStr(hidpic11.Value) + "',pic12='" + Sys.filterSQLStr(hidpic12.Value) + "',"
                      + "pic13='" + Sys.filterSQLStr(hidpic13.Value) + "',pic14='" + Sys.filterSQLStr(hidpic14.Value) + "',pic15='" + Sys.filterSQLStr(hidpic15.Value) + "',"
                      + "air1='" + aair1 + "',air2='" + aair2 + "',air3='" + aair3 + "',air4='" + aair4 + "',air5='" + aair5 + "',"
                      + "air6='" + aair6 + "',air7='" + aair7 + "',air8='" + aair8 + "',air9='" + aair9 + "',air10='" + aair10 + "',"
                      + "air11='" + aair11 + "',air12='" + aair12 + "',air13='" + aair13 + "',air14='" + aair14 + "',air15='" + aair15 + "'"
                      + " where airlineId=" + airId;
        }
        else
        {
            str = "insert into FY_Airline_Pic(airlineId,pic1,pic2,pic3,pic4,pic5,pic6,pic7,pic8,pic9,pic10,pic11,pic12,pic13,pic14,pic15,air1,air2,air3,air4,air5,air6,air7,air8,air9,air10,air11,air12,air13,air14,air15)"
             + "values(" + airId + ","
             + "'" + Sys.filterSQLStr(hidpic1.Value) + "','" + Sys.filterSQLStr(hidpic2.Value) + "','" + Sys.filterSQLStr(hidpic3.Value) + "','" + Sys.filterSQLStr(hidpic4.Value) + "',"
             + "'" + Sys.filterSQLStr(hidpic5.Value) + "','" + Sys.filterSQLStr(hidpic6.Value) + "','" + Sys.filterSQLStr(hidpic7.Value) + "','" + Sys.filterSQLStr(hidpic8.Value) + "',"
             + "'" + Sys.filterSQLStr(hidpic9.Value) + "','" + Sys.filterSQLStr(hidpic10.Value) + "','" + Sys.filterSQLStr(hidpic11.Value) + "','" + Sys.filterSQLStr(hidpic12.Value) + "',"
             + "'" + Sys.filterSQLStr(hidpic13.Value) + "','" + Sys.filterSQLStr(hidpic14.Value) + "','" + Sys.filterSQLStr(hidpic15.Value) + "',"
             + "'" + aair1 + "','" + aair2 + "','" + aair3 + "','" + aair4 + "','" + aair5 + "','" + aair6 + "','" + aair7 + "','" + aair8 + "','" + aair9 + "','" + aair10 + "',"
             + "'" + aair11 + "','" + aair12 + "','" + aair13 + "','" + aair14 + "','" + aair15 + "',"
             + ")";
        }


        int brandsucc = 0;
        brandsucc = SqlHelper.ExecuteNonQuery(SqlHelper.ConnString_insert, CommandType.Text, str);
        if (brandsucc > 0)
            scripthelp.AlertAndRedirect("操作成功!", "airline_list.aspx", this.Page);
        else
            scripthelp.Alert("操作失败!", this.Page);
    }
    protected void btnf1_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f1))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic1.Value = dt.Rows[0]["pic1"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic1"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic1.Value = picurl;
                imgpro1.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }

    }
    protected void btnf2_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f2))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic2.Value = dt.Rows[0]["pic2"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic2"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic2.Value = picurl;
                imgpro2.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf3_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f3))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic3.Value = dt.Rows[0]["pic3"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic3"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic3.Value = picurl;
                imgpro3.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf4_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f4))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic4.Value = dt.Rows[0]["pic4"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic4"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic4.Value = picurl;
                imgpro4.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf5_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f5))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic5.Value = dt.Rows[0]["pic5"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic5"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic5.Value = picurl;
                imgpro5.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf6_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f6))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic6.Value = dt.Rows[0]["pic6"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic6"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic6.Value = picurl;
                imgpro6.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf7_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f7))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic7.Value = dt.Rows[0]["pic7"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic7"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic7.Value = picurl;
                imgpro7.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf8_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f8))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic8.Value = dt.Rows[0]["pic8"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic8"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic8.Value = picurl;
                imgpro8.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf9_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f9))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic9.Value = dt.Rows[0]["pic9"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic9"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic9.Value = picurl;
                imgpro9.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf10_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f10))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic10.Value = dt.Rows[0]["pic10"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic10"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic10.Value = picurl;
                imgpro10.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf11_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f11))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic11.Value = dt.Rows[0]["pic11"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic1"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic11.Value = picurl;
                imgpro11.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf12_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f12))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic12.Value = dt.Rows[0]["pic12"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic12"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic12.Value = picurl;
                imgpro12.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf13_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f13))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic13.Value = dt.Rows[0]["pic13"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic13"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic13.Value = picurl;
                imgpro13.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf14_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f14))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic14.Value = dt.Rows[0]["pic14"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic14"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic14.Value = picurl;
                imgpro14.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }
    protected void btnf15_Click(object sender, EventArgs e)
    {
        string picurl = "", pic1 = "";

        if (FileUploadOK(out picurl, "upload_photo", f15))
        {
            if (picurl == "")
            {
                string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                if (dt.Rows.Count < 0)
                    return;
                else
                {
                    hidpic15.Value = dt.Rows[0]["pic15"].ToString();
                }
            }
            else
            {
                if (!isInt)
                {
                    string str = "select * from FY_Airline_Pic where airlineId=" + airId;

                    DataTable dt = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.Text, str).Tables[0];

                    if (dt.Rows.Count < 0)
                        return;
                    else
                    {
                        pic1 = dt.Rows[0]["pic15"].ToString();
                    }

                    if (File.Exists(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1))
                    {
                        File.Delete(System.Configuration.ConfigurationManager.AppSettings["upfilePath"] + pic1);
                    }
                }
                hidpic15.Value = picurl;
                imgpro15.ImageUrl = "../../" + picurl;
            }
        }
        else
        {
            scripthelp.Alert("上传图片失败", this.Page);
            return;
        }
    }  

    #region 上传通用方法
    /// <summary>
    /// 上传企业图片
    /// </summary>
    /// <param name="photo_url"></param>
    /// <returns></returns>
    private bool FileUploadOK(out string photo_url, string picPath, FileUpload f)
    {
        bool _ok = false;

        string _picExtension = string.Empty;//图片后缀

        string _physicPath = string.Empty;//物理路径

        string _picPath = string.Empty;//图片相对路径

        photo_url = "";

        string _picpathdata = string.Empty;//绝对路径；


        long maxSize = long.Parse(ConfigurationManager.AppSettings.Get("newsPicSize"));

        #region 生成文件夹

        string _time = DateTime.Now.ToString("yyyy-MM-dd").Replace("-", "/");

        _picPath = "~/" + picPath + "/" + _time + "/";

        _picpathdata = picPath + "/" + _time + "/";

        _physicPath = Server.MapPath(_picPath);

        if (!Directory.Exists(_physicPath))
            Directory.CreateDirectory(_physicPath);

        #endregion

        //限制图片的大小
        if (f.PostedFile.ContentLength <= maxSize)
        {
            string _picName = getDistinctFilename();//图片随机名称

            if (f.HasFile)
            {

                #region 上传图片

                string _fileName = f.FileName; // 客户端文件路径

                //取得图片后缀

                _picExtension = GetFileExtends(_fileName);

                photo_url += _picpathdata + _picName + _picExtension;//图片绝对路径+图片随机名称+图片后缀

                f.SaveAs(_physicPath + _picName + _picExtension);//保存图片

                _ok = true;

                #endregion
            }
            else
            {
                #region 返回信息
                photo_url = string.Empty;
                _ok = false;
                #endregion
            }
        }
        else
        {
            #region 返回信息
            photo_url = string.Empty;
            _ok = false;
            #endregion
        }
        return _ok;
    }


    /// <summary>
    /// 取得文件后缀
    /// </summary>
    /// <param name="filename"></param>
    /// <returns></returns>
    public string GetFileExtends(string filename)
    {
        string ext = null;
        if (filename.IndexOf('.') > 0)
        {
            string[] fs = filename.Split('.');
            ext = fs[fs.Length - 1];
        }
        return "." + ext;
    }




    public string getDistinctFilename()
    {
        string FileDateTime = string.Format("{0:yyyy-MM-dd_HH-mm-ss_}", DateTime.Now);
        if (FileDateTime != preFileDateTime)
        {
            preFileDateTime = FileDateTime;
            preFileIndex = 0;
            return FileDateTime + "0000";
        }
        else
        {
            preFileIndex = preFileIndex + 1;
            string temp = "" + preFileIndex;
            if (temp.Length < 4) temp = new String('0', 4 - temp.Length) + temp;
            return FileDateTime + temp;
        }
    }
    #endregion
}