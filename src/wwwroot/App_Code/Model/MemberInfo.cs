using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;
using eap.share;



/// <summary>
/// 保存在Session中的
/// </summary>
public class MemberInfo
{
    //会员登录的信息
    public int id;                    //     递增整数
    public string username;          // 	 用户名称
    public string password;          // 	 登陆密码
    public string nickName;         //   	个人会员为呢称，企业会员为企业名称
    public string email;           //		邮箱，用来激活，和找回密码使用
    public int type;               //  	    0为企业会员，1为个人会员

    public DateTime regTime;      //		创建时间(日期&时间&毫秒)getdate()
    public DateTime lastLogin;    //		最后一次登陆时间(日期&时间&毫秒)
    public int loginTimes;       //		    登陆次数，初始值为0

    public string loginIp;      // 	        当前登陆IP
    public string record;      // 		    会员积分
    public string question;   // 		    问题
    public string answer;    //		       答案，用于密码找回
    public int isPass;      //  		   1为审核，0为尚未审核，初始值为0

    //总后台登录的信息
    public int adminId;
    public string adminName; //用户名
    public string adminPwd;  //登陆密码
    public int flag;         //管理员类型
    public string adminloginIp;   //当前登陆IP
    public int adminloginTimes;   //登陆次数，初始值为0

    /// <summary>
    /// 递增整数
    /// </summary>
    public int Id
    {
        set { id = value; }
        get { return id; }
    }
    /// <summary>
    /// 用户名称
    /// </summary>
    public string Username
    {
        set { username = value; }
        get { return username; }
    }

    /// <summary>
    /// 登陆密码
    /// </summary>
    public string Password
    {
        set { password = value; }
        get { return password; }
    }

    /// <summary>
    /// 个人会员为呢称，企业会员为企业名称
    /// </summary>
    public string NickName
    {
        set { nickName = value; }
        get { return nickName; }
    }
    /// <summary>
    /// 创建时间
    /// </summary>
    public DateTime RegTime
    {
        set { regTime = value; }
        get { return regTime; }
    }
    /// <summary>
    /// 邮箱，用来激活，和找回密码使用
    /// </summary>
    public string Email
    {
        set { email = value; }
        get { return email; }
    }
    /// <summary>
    /// 最后一次登陆时间
    /// </summary>
    public DateTime LastLogin
    {
        set { lastLogin = value; }
        get { return lastLogin; }
    }
    /// <summary>
    /// 0为企业会员，1为个人会员
    /// </summary>
    public int Type
    {
        set { type = value; }
        get { return type; }
    }
    /// <summary>
    /// 最后一次登陆时间
    /// </summary>
    public int LoginTimes
    {
        set { loginTimes = value; }
        get { return loginTimes; }
    }
    /// <summary>
    /// 当前登陆IP
    /// </summary>
    public string LoginIp
    {
        set { loginIp = value; }
        get { return loginIp; }
    }
    /// <summary>
    /// 会员积分
    /// </summary>
    public string Record
    {
        set { record = value; }
        get { return record; }
    }

    /// <summary>
    /// 问题
    /// </summary>
    public string Question
    {
        set { question = value; }
        get { return question; }
    }

    /// <summary>
    /// 答案，用于密码找回
    /// </summary>
    public string Answer
    {
        set { answer = value; }
        get { return answer; }
    }

    /// <summary>
    /// 1为审核，0为尚未审核，初始值为0
    /// </summary>
    public int IsPass
    {
        set { isPass = value; }
        get { return isPass; }
    }


    /// <summary>
    /// 递增整数
    /// </summary>
    public int AdminId
    {
        set { adminId = value; }
        get { return adminId; }
    }



    /// <summary>
    /// 管理员名称
    /// </summary>
    public string AdminName
    {
        set { adminName = value; }
        get { return adminName; }
    }

    /// <summary>
    /// 管理员密码
    /// </summary>
    public string AdminPwd
    {
        set { adminPwd = value; }
        get { return adminPwd; }
    }


    /// <summary>
    /// 管理员登录IP
    /// </summary>
    public string AdminLoginIp
    {
        set { adminloginIp = value; }
        get { return adminloginIp; }
    }


    /// <summary>
    /// 0系统管理员，1为普通管理员,2 操作员
    /// </summary>
    public int Flag
    {
        set { flag = value; }
        get { return flag; }
    }

    /// <summary>
    /// 登录次数
    /// </summary>
    public int AdminLoginTimes
    {
        set { adminloginTimes = value; }
        get { return adminloginTimes; }
    }


}
