using System;
using System.Data;
using System.Configuration;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using System.Web.UI.HtmlControls;

/// <summary>
/// MemberItem 的摘要说明
/// </summary>
public class MemberItem
{
    public MemberItem()
    {
        //
        // TODO: 在此处添加构造函数逻辑
        //
    }

    /// <summary>
    /// 用户名
    /// </summary>
    private string mem_LoginName;

    /// <summary>
    /// 用户名
    /// </summary>
    public string Mem_LoginName
    {
        get { return mem_LoginName; }
        set { mem_LoginName = value; }
    }

    /// <summary>
    /// 用户名
    /// </summary>
    private string mem_Name;

    /// <summary>
    /// 用户名
    /// </summary>
    public string Mem_Name
    {
        get { return mem_Name; }
        set { mem_Name = value; }
    }

    /// <summary>
    /// 用户ID
    /// </summary>
    private string mem_ID;

    /// <summary>
    /// 用户ID
    /// </summary>
    public string Mem_ID
    {
        get { return mem_ID; }
        set { mem_ID = value; }
    }

    /// <summary>
    /// 用户积分
    /// </summary>
    private string mem_Money;

    /// <summary>
    /// 用户积分
    /// </summary>
    public string Mem_Money
    {
        get { return mem_Money; }
        set { mem_Money = value; }
    }

    /// <summary>
    /// 用户别名
    /// </summary>
    private string mem_Biming;

    /// <summary>
    /// 用户别名
    /// </summary>
    public string Mem_Biming
    {
        get { return mem_Biming; }
        set { mem_Biming = value; }
    }

    /// <summary>
    /// 用户email
    /// </summary>
    private string mem_Email;

    /// <summary>
    /// 用户email
    /// </summary>
    public string Mem_Email
    {
        get { return mem_Email; }
        set { mem_Email = value; }
    }

    /// <summary>
    /// 用户sex
    /// </summary>
    private string mem_Sex;

    /// <summary>
    /// 用户sex
    /// </summary>
    public string Mem_Sex
    {
        get { return mem_Sex; }
        set { mem_Sex = value; }
    }

    /// <summary>
    /// 用户city
    /// </summary>
    private string mem_City;

    /// <summary>
    /// 用户city
    /// </summary>
    public string Mem_City
    {
        get { return mem_City; }
        set { mem_City = value; }
    }

    /// <summary>
    /// 用户地址
    /// </summary>
    private string mem_Addr;

    /// <summary>
    /// 用户地址
    /// </summary>
    public string Mem_Addr
    {
        get { return mem_Addr; }
        set { mem_Addr = value; }
    }

    /// <summary>
    /// 用户电话
    /// </summary>
    private string mem_Tel;

    /// <summary>
    /// 用户电话
    /// </summary>
    public string Mem_Tel
    {
        get { return mem_Tel; }
        set { mem_Tel = value; }
    }

    /// <summary>
    /// 用户手机
    /// </summary>
    private string mem_Mobile;

    /// <summary>
    /// 用户手机
    /// </summary>
    public string Mem_Mobile
    {
        get { return mem_Mobile; }
        set { mem_Mobile = value; }
    }

    /// <summary>
    /// Mem_CardID
    /// </summary>
    private string mem_CardID;

    /// <summary>
    /// mem_CardID
    /// </summary>
    public string Mem_CardID
    {
        get { return mem_CardID; }
        set { mem_CardID = value; }
    }

    /// <summary>
    /// Mem_IDcard
    /// </summary>
    private string mem_IDcard;

    /// <summary>
    /// mem_IDcard
    /// </summary>
    public string Mem_IDcard
    {
        get { return mem_IDcard; }
        set { mem_IDcard = value; }
    }

    /// <summary>
    /// Mem_Grade
    /// </summary>
    private string mem_Grade;

    /// <summary>
    /// mem_Grade
    /// </summary>
    public string Mem_Grade
    {
        get { return mem_Grade; }
        set { mem_Grade = value; }
    }

    /// <summary>
    /// Mem_Status
    /// </summary>
    private string mem_Status;

    /// <summary>
    /// mem_Status
    /// </summary>
    public string Mem_Status
    {
        get { return mem_Status; }
        set { mem_Status = value; }
    }

    /// <summary>
    /// Mem_RegistDate
    /// </summary>
    private string mem_RegistDate;

    /// <summary>
    /// mem_RegistDate
    /// </summary>
    public string Mem_RegistDate
    {
        get { return mem_RegistDate; }
        set { mem_RegistDate = value; }
    }

    /// <summary>
    /// Mem_Remark
    /// </summary>
    private string mem_Remark;

    /// <summary>
    /// mem_Remark
    /// </summary>
    public string Mem_Remark
    {
        get { return mem_Remark; }
        set { mem_Remark = value; }
    }

    /// <summary>
    /// mem_province
    /// </summary>
    private string mem_province;

    /// <summary>
    /// mem_province
    /// </summary>
    public string Mem_province
    {
        get { return mem_province; }
        set { mem_province = value; }
    }

    /// <summary>
    /// mem_zip
    /// </summary>
    private string mem_zip;

    /// <summary>
    /// mem_zip
    /// </summary>
    public string Mem_zip
    {
        get { return mem_zip; }
        set { mem_zip = value; }
    }

    /// <summary>
    /// mem_power
    /// </summary>
    private string mem_power;

    /// <summary>
    /// mem_power
    /// </summary>
    public string Mem_power
    {
        get { return mem_power; }
        set { mem_power = value; }
    }

    /// <summary>
    /// mem_fax
    /// </summary>
    private string mem_fax;

    /// <summary>
    /// mem_fax
    /// </summary>
    public string Mem_fax
    {
        get { return mem_fax; }
        set { mem_fax = value; }
    }

    /// <summary>
    /// mem_both
    /// </summary>
    private string mem_both;

    /// <summary>
    /// mem_both
    /// </summary>
    public string Mem_both
    {
        get { return mem_both; }
        set { mem_both = value; }
    }

    /// <summary>
    /// mem_cid
    /// </summary>
    private string mem_cid;

    /// <summary>
    /// mem_cid
    /// </summary>
    public string Mem_cid
    {
        get { return mem_cid; }
        set { mem_cid = value; }
    }

    /// <summary>
    /// mem_company
    /// </summary>
    private string mem_company;

    /// <summary>
    /// mem_company
    /// </summary>
    public string Mem_company
    {
        get { return mem_company; }
        set { mem_company = value; }
    }

    /// <summary>
    /// mem_ifActive
    /// </summary>
    private string mem_ifActive;

    /// <summary>
    /// mem_ifActive
    /// </summary>
    public string Mem_ifActive
    {
        get { return mem_ifActive; }
        set { mem_ifActive = value; }
    }

    /// <summary>
    /// mem_bank
    /// </summary>
    private string mem_bank;

    /// <summary>
    /// mem_bank
    /// </summary>
    public string Mem_bank
    {
        get { return mem_bank; }
        set { mem_bank = value; }
    }

    /// <summary>
    /// mem_lastlogintime
    /// </mem_lastlogintime>
    private string mem_lastlogintime;

    /// <summary>
    /// mem_lastlogintime
    /// </summary>
    public string Mem_lastlogintime
    {
        get { return mem_lastlogintime; }
        set { mem_lastlogintime = value; }
    }

    /// <summary>
    /// mem_logins
    /// </summary>
    public string mem_logins;

    /// <summary>
    /// mem_logins
    /// </summary>
    public string Mem_logins
    {
        get { return mem_logins; }
        set { mem_logins = value; }
    }

    /// <summary>
    /// mem_lastloginip
    /// </summary>
    private string mem_lastloginip;

    /// <summary>
    /// mem_lastloginip
    /// </summary>
    public string Mem_lastloginip
    {
        get { return mem_lastloginip; }
        set { mem_lastloginip = value; }
    }

    /// <summary>
    /// mem_bankxiao
    /// </summary>
    private string mem_bankxiao;

    /// <summary>
    /// mem_bankxiao
    /// </summary>
    public string Mem_bankxiao
    {
        get { return mem_bankxiao; }
        set { mem_bankxiao = value; }
    }

    /// <summary>
    /// 生日
    /// </summary>
    private string mem_birthday;

    /// <summary>
    /// 生日
    /// </summary>
    public string Mem_birthday
    {
        get { return mem_birthday; }
        set { mem_birthday = value; }
    }


    
    /// <summary>
    /// qq
    /// </summary>
    private string mem_qq;

    /// <summary>
    /// qq
    /// </summary>
    public string Mem_qq
    {
        get { return mem_qq; }
        set { mem_qq = value; }
    }

    /// <summary>
    /// mem_msn
    /// </summary>
    private string mem_msn;

    /// <summary>
    /// mem_msn
    /// </summary>
    public string Mem_msn
    {
        get { return mem_msn; }
        set { mem_msn = value; }
    }

    /// <summary>
    /// mem_pic
    /// </summary>
    private string mem_pic;

    /// <summary>
    /// mem_pic
    /// </summary>
    public string Mem_pic
    {
        get { return mem_pic; }
        set { mem_pic = value; }
    }

    /// <summary>
    /// Mem_LoginPasd
    /// </summary>
    private string mem_LoginPasd;

    /// <summary>
    /// Mem_LoginPasd
    /// </summary>
    public string Mem_LoginPasd
    {
        get { return mem_LoginPasd; }
        set { mem_LoginPasd = value; }
    }



    /// <summary>
    /// Mem_LoginPasd
    /// </summary>
    private string mem_type;

    /// <summary>
    /// Mem_LoginPasd
    /// </summary>
    public string Mem_type
    {
        get { return mem_type; }
        set { mem_type = value; }
    }


}

