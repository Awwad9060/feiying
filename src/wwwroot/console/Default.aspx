<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Default.aspx.cs" Inherits="console_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fei580.com后台管理系统</title>
<script language="javascript" type="text/javascript" src="js/JScript.js"></script>
    <script language="javascript" type="text/JavaScript">       

    function switchSysBar()
    {
        var obj = document.getElementById("switchPoint");
        if (obj.alt == "关闭左栏")
        {
            obj.alt = "打开左栏";
            document.getElementById("frmTitle").style.display="none";
            document.getElementById("main_right").style.width='1000px';  
        }
        else
        {
            obj.alt = "关闭左栏";
            document.getElementById("frmTitle").style.display="";
            document.getElementById("main_right").style.width='800px';
        }
    }

    </script>

    <link href="css/admin.css" type="text/css" rel="stylesheet" />
    <link href="css/MasterPage.css" type="text/css" rel="stylesheet" />
    <link href="css/Guide.css" type="text/css" rel="stylesheet" />
</head>
<body> 
<div style="width: 1000px; height: 909px" >
    <form id="form1" runat="server">
   
        <table border="0" cellpadding="0" cellspacing="0" style="width: 100%; height: 909px"  >
            <tr>
                <td colspan="3" style="height: 102px">
                    <!--  BigMenu  -->
                    <div id="content">
                        <ul id="ChannelMenuItems">
                        </ul>
                        <div id="SubMenu">
                            <!--  ChannelMenu_MenuMyDeskTop  -->
                            <div id="ChannelMenu_MenuMyDeskTop" style="width: 100%;">
                                <ul>
                            </ul>
                            </div>
                        </div>
                        <div id="Announce" style="top: 27px; width: 29%; height: 22px; text-align: left; left: 73%;">
                        您好：<span>【<strong><%=loginname%></strong>】</span>欢迎您！
                        <a href="admin/admin_edit.aspx?Oper=modpwd" target="main_right">修改密码</a>&nbsp;|&nbsp;<a href="login.aspx" title="安全退出">安全退出</a></div>
                    </div>
                </td>
            </tr>
            <tr style="vertical-align: top;">
                <td id="frmTitle" style="width: 195px; height: 819px;">
                    <iframe frameborder="0" id="left" name="left" scrolling="auto" src="<%=left_control%>" style="width: 100%;
                        height: 800px; visibility: inherit; z-index: 2;"></iframe>
                </td>
                <td onclick="switchSysBar()" class="but" style="width: 13px; height: 819px;">
                    <img id="switchPoint" src="images/butClose.gif"  alt="关闭左栏" style="border: 0px;
                        width: 12px;" />
                </td>
                <td style="width: 791px; height: 819px;">
                    <iframe frameborder="0" id="main_right" name="main_right" scrolling="yes" src="Right_Conn.aspx"
                        style="width: 100%; height: 800px; visibility: inherit; z-index: 2; overflow-x: hidden;">
                    </iframe>
                    <div class="clearbox2" />
                </td>
            </tr>
        </table>
    </form>
    </div>
</body>
</html>
