﻿using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Collections;
using System.Web;
using System.Text;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;
using Fei580.Model;
using Fei580.Model;

    public partial class NowSearchingList : System.Web.UI.Page
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
            else
            {
                if (adminmerinfo.Flag == 2)
                {
                    btndel.Visible = false;
                }
            }
            if (!IsPostBack)
            {
                //获取列表
                GetSearchingReclist();

            }

        }


        protected void GetSearchingReclist()
        {

            DataSet ds = new DataSet();


            string str = @"select top  100 percent * from FY_Searching  order by lineType asc, toptime desc,id desc ";


            SqlParameter[] parameters = {
                    new SqlParameter("@sql", SqlDbType.NVarChar,4000),
                    new SqlParameter("@currentpage", SqlDbType.Int),
                    new SqlParameter("@pagesize", SqlDbType.Int)};

            parameters[0].Value = str;
            parameters[1].Value = Pager.CurrentPageIndex;
            parameters[2].Value = Pager.PageSize;


            ds = SqlHelper.ExecuteDataset(SqlHelper.ConnString_select, CommandType.StoredProcedure, "p_splitpage", parameters);


            Pager.RecordCount = Convert.ToInt32(ds.Tables[2].Rows[0][0]);

            Pager.CustomInfoHTML = "&nbsp;第" + Pager.CurrentPageIndex.ToString() + "页/共" + Pager.PageCount.ToString() + "页 总记录数：" + Pager.RecordCount.ToString();

            rptshopnews.DataSource = ds.Tables[1];

            rptshopnews.DataBind();

        }

        /// <summary>
        /// 分页事件
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void Pager_PageChanged(object sender, EventArgs e)
        {
            GetSearchingReclist();
        }


        /// <summary>
        /// 删除操作
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btndel_Click(object sender, EventArgs e)
        {
            StringBuilder str = new StringBuilder();

            str.Append("delete from FY_Searching where id in (" + Request.Form["chk"] + ");");


            SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);

            conn.Open();

            using (SqlTransaction trans = conn.BeginTransaction())
            {
                try
                {

                    SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                    trans.Commit();
                    scripthelp.AlertAndRedirect("操作成功！", "NowSearchingList.aspx", this.Page);
                }
                catch
                {
                    trans.Rollback();
                    scripthelp.AlertAndRedirect("操作失败！", "NowSearchingList.aspx:", this.Page);
                }
                finally
                {
                    conn.Close();
                }
            }
        }

        /// <summary>
        /// 置顶操作
        /// </summary>
        /// <param name="sender"></param>
        /// <param name="e"></param>
        protected void btnTop_Click(object sender, EventArgs e)
        {
            string id = topId.Value;

            StringBuilder str = new StringBuilder();

            str.Append("update FY_Searching set toptime = getdate() where id = " + id + ";");


            SqlConnection conn = new SqlConnection(SqlHelper.ConnString_insert);

            conn.Open();

            using (SqlTransaction trans = conn.BeginTransaction())
            {
                try
                {

                    SqlHelper.ExecuteNonQuery(trans, CommandType.Text, str.ToString());
                    trans.Commit();
                    scripthelp.AlertAndRedirect("操作成功！", "NowSearchingList.aspx", this.Page);
                }
                catch
                {
                    trans.Rollback();
                    scripthelp.AlertAndRedirect("操作失败！", "NowSearchingList.aspx:", this.Page);
                }
                finally
                {
                    conn.Close();
                }
            }
        }
    }
