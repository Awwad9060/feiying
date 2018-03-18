<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="console_login" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fei580.com后台管理系统</title>
    <style type="text/css">
body {
	font-size:12px;
	margin:0;
	padding:0;
	background-color: #3467B4;
	background-image: url(images/bg.gif);
	background-repeat:repeat-x;
	line-height: 20px;
	color: #FFFFFF;
}
.box, .box2 {
	margin:0;
	padding:0;
	width:150px;
	height:20px;
	line-height:20px;
	border: 1px solid #006699;
	text-indent:3px;
}
.box{
	width:150px;
}
.box2{
	width:80px;
}
.new {
	font-size:12px;
}
.bbk {
	height:88px !important;
	height:69px;
}

</style>
</head>
<body>
    <form id="form1" runat="server">
        <div>
            <table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
                <tr>
                    <td width="263" valign="top">
                        <br>
                        <br>
                        <br />
                        <br />
                        <br />
                        <br>
                        <br>
                        <br>
                        <img src="images/titlesss.gif" width="355" height="74" border="0" /></td>
                    <td width="537">
                        <br />
                        <br />
                        <br />
                        <br />
                        <table border="0" cellpadding="0" cellspacing="0" width="536">
                            <tr>
                                <td>
                                    <img src="images/spacer.gif" width="37" height="1" border="0" alt="" /></td>
                                <td style="width: 275px">
                                    <img src="images/spacer.gif" width="274" height="1" border="0" alt="" /></td>
                                <td>
                                    <img src="images/spacer.gif" width="17" height="1" border="0" alt="" /></td>
                                <td style="width: 209px">
                                    <img src="images/spacer.gif" width="208" height="1" border="0" alt="" /></td>
                                <td>
                                    <img src="images/spacer.gif" width="1" height="1" border="0" alt="" /></td>
                            </tr>
                            <tr>
                                <td colspan="3">
                                    <img name="My_login_r1_c1" src="images/My_login_r1_c1.jpg" width="328" height="52"
                                        border="0" id="My_login_r1_c1" alt="" /></td>
                                <td rowspan="2" style="width: 209px">
                                    <asp:ImageButton ID="btn_login" runat="server" ImageUrl="images/My_login_r1_c4.jpg" OnClick="btn_login_Click" /></td>
                                <td>
                                    <img src="images/spacer.gif" width="1" height="52" border="0" alt="" /></td>
                            </tr>
                            <tr>
                                <td rowspan="3">
                                    <img name="My_login_r2_c1" src="images/My_login_r2_c1.jpg" width="37" height="207"
                                        border="0" id="My_login_r2_c1" alt="" /></td>
                                <td rowspan="2" style="background-image: url(images/My_login_r2_c2.jpg); width: 275px;">
                                    <table border="0" cellpadding="0" cellspacing="0" align="center">
                                        <tr>
                                            <td class="title" style="height: 24px">
                                                用户名：</td>
                                            <td align="left" style="height: 24px">
                                                <input id="Txt_Username" type="text" name="textfield" runat="server" style="width: 147px;" /></td>
                                        </tr>
                                        <tr>
                                            <td>
                                                密 &nbsp;&nbsp; 码：</td>
                                            <td>
                                                <input id="Txt_pwd" type="password" name="textfield2" runat="server" style="width: 147px;" /></td>
                                        </tr>
                                        <tr>
                                            <td align="left">
                                                验证码：</td>
                                            <td align="left">
                                                <input id="txtCheckCode" type="text" name="textfield22" runat="server" style="width: 65px;" />
                                                <img src="../share/VerifyImagePage.aspx?time=0" id="vcodeimg" onclick="this.src='../share/verifyimagepage.aspx?time=' + Math.random();"
                                                    style="width: 90px; height: 25px;" />
                                            </td>
                                        </tr>
                                        <tr>
                                            <td colspan="2" style="height: 40px">
                                                <br />
                                                <asp:Label ID="lblMessage" runat="server" ForeColor="Red"></asp:Label>
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                                <td rowspan="3">
                                    <img name="My_login_r2_c3" src="images/My_login_r2_c3.jpg" width="17" height="207"
                                        border="0" id="My_login_r2_c3" alt="" /></td>
                                <td>
                                    <img src="images/spacer.gif" width="1" height="107" border="0" alt="" /></td>
                            </tr>
                            <tr>
                                <td rowspan="2" style="width: 209px">
                                    <img name="My_login_r3_c4" src="images/My_login_r3_c4.jpg" width="208" height="100"
                                        border="0" id="My_login_r3_c4" alt="" /></td>
                                <td>
                                    <img src="images/spacer.gif" width="1" height="31" border="0" alt="" /></td>
                            </tr>
                            <tr>
                                <td style="width: 275px">
                                    <img name="My_login_r4_c2" src="images/My_login_r4_c2.jpg" width="274" height="69"
                                        border="0" id="My_login_r4_c2" alt="" /></td>
                                <td>
                                    <img src="images/spacer.gif" width="1" height="69" border="0" alt="" /></td>
                            </tr>
                            <tr>
                                <td colspan="2">
                                    <img name="My_login_r5_c1" src="images/My_login_r5_c1.jpg" width="311" height="153"
                                        border="0" id="My_login_r5_c1" alt="" /></td>
                                <td colspan="2">
                                    <img name="My_login_r5_c3" src="images/My_login_r5_c3.jpg" width="225" height="153"
                                        border="0" id="My_login_r5_c3" alt="" /></td>
                                <td>
                                    <img src="images/spacer.gif" width="1" height="153" border="0" alt="" /></td>
                            </tr>
                        </table>
                    </td>
                </tr>
            </table>
        </div>
    </form>
</body>
</html>
