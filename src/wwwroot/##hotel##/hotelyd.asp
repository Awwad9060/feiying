<!--#include file="include/cfg.asp"-->
<!--#include file="../ticket/include/conn.asp"-->
<!--#include file="../ticket/include/function.asp"-->
<!--#include file="include/md5.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link rel="stylesheet" href="images/style.css" type="text/css">
<STYLE type=text/css>
			.inputbox1 {
	BORDER-RIGHT: #5D87E6 0px solid; BORDER-TOP: #003699 0px solid; FONT-SIZE: 12px; font-family: "Arial";BORDER-LEFT: #003699 0px solid;  BORDER-BOTTOM: #003699 0px solid; HEIGHT: 16px;  WIDTH:50px; BACKGROUND-COLOR: #F2F2F2; 
}
</STYLE>
<title><%=ZXLCompanyStr%>--提示您：请您先登陆或注册</title>
<%
From_url = Cstr(Request.ServerVariables("HTTP_REFERER")) 
Serv_url = Cstr(Request.ServerVariables("SERVER_NAME")) 
if mid(From_url,8,len(Serv_url)) <> Serv_url then 
	Server.Transfer "err.asp"
	response.end 
end if 

PropertyID = request.Form("officeid")
hoteltitle = request.Form("hotelname")
Start_date = request.Form("Start_date")
End_date = request.Form("End_date")
hoteltype = request.Form("hoteltype")
moneyid = request.Form("moneyid")
Price = request.Form("Price")
MealZC = request.Form("MealZC")
add = request.Form("add")

Function getIP() 
Dim strIPAddr 
	If Request.ServerVariables("HTTP_X_FORWARDED_FOR") = "" OR InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), "unknown") > 0 Then 
		strIPAddr = Request.ServerVariables("REMOTE_ADDR") 
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",") > 0 Then 
		strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ",")-1) 
		actforip=Request.ServerVariables("REMOTE_ADDR") 
	ElseIf InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";") > 0 Then 
		strIPAddr = Mid(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), 1, InStr(Request.ServerVariables("HTTP_X_FORWARDED_FOR"), ";")-1) 
		actforip=Request.ServerVariables("REMOTE_ADDR") 
	Else 
		strIPAddr = Request.ServerVariables("HTTP_X_FORWARDED_FOR") 
		actforip=Request.ServerVariables("REMOTE_ADDR") 
	End If 
		getIP = Trim(Mid(strIPAddr, 1, 30)) 
End Function
%>
<%
admin_session = request("admin_session")
'response.write session("mem_name")
if session("mem_name") <> "" then
	response.write "<form name=""startForm"" action=""hotellogin.asp"" method=""post"">"
	response.write "<input type=""hidden"" name=""PropertyID"" value="&PropertyID&">"
	response.write "<input type=""hidden"" name=""hoteltitle"" value="&hoteltitle&">"
	response.write "<input type=""hidden"" name=""Start_date"" value="&Start_date&">"
	response.write "<input type=""hidden"" name=""End_date"" value="&End_date&">"
	response.write "<input type=""hidden"" name=""hoteltype"" value="&hoteltype&">"
	response.write "<input type=""hidden"" name=""moneyid"" value="&moneyid&">"
	response.write "<input type=""hidden"" name=""Price"" value="&Price&">"
	response.write "<input type=""hidden"" name=""MealZC"" value="&MealZC&">"
	response.write "<input type=""hidden"" name=""add"" value="&add&">"
	response.write "</form>"
	response.write "<script language=""javascript"">"
	response.write "document.startForm.action = ""hotellogin.asp"" ;"
	response.write "document.startForm.submit() ;"
	response.write "</script>"
	response.End()
end if

if admin_session = "eiyang" then
mem_loginname=trim(request("mem_loginname"))
mem_loginpasd=trim(request("mem_loginpasd"))
	if mem_loginname ="" or mem_loginpasd = "" then
		response.write "<script language=""javascript"">"
		response.write "alert('请输入用户名或密码');"
		response.write "window.history.back(-1);"
		response.write "</script>"
		response.end()
	end if

msg=""

mem_loginname=replace(mem_loginname,"'","")
mem_loginname=replace(mem_loginname,"and","")
mem_loginname=replace(mem_loginname,"exec","")
mem_loginname=replace(mem_loginname,"insert","")
mem_loginname=replace(mem_loginname,"select","")
mem_loginname=replace(mem_loginname,"delete","")
mem_loginname=replace(mem_loginname,"update","")
mem_loginname=replace(mem_loginname,"count","")
mem_loginname=replace(mem_loginname,"%","")
mem_loginname=replace(mem_loginname,"*","")
mem_loginname=replace(mem_loginname,"chr","")
mem_loginname=replace(mem_loginname,"mid","")
mem_loginname=replace(mem_loginname,"master","")
mem_loginname=replace(mem_loginname,"truncate","")
mem_loginname=replace(mem_loginname,"char","")
mem_loginname=replace(mem_loginname,"declare","")
mem_loginname=replace(mem_loginname,"(","")
mem_loginname=replace(mem_loginname,")","")
mem_loginname=replace(mem_loginname,"&","")
mem_loginname=replace(mem_loginname,"%20","")

set rs=server.CreateObject("adodb.recordset")
sql="select * from tmember where mem_loginname = '"&mem_loginname&"'"

rs.open sql,conn,3,1
	if not rs.eof then
			password=rs("mem_loginpasd")
			'response.Write rs("mem_loginpasd")

				if trim(password)<>md5(trim(mem_loginpasd)) then
					   msg="用户密码错误！"
					   response.write "<script language=""javascript"">"
					   response.write "alert('"&msg&"');"
					   response.write "window.history.back(-1);"
					   response.write "</script>"
					   response.end
					else
					  session("mem_name")=mem_loginname
					  session("mem_safe")="@#^*#@@#3%@@324"
					  session("mem_login")=mem_loginname
					  session("mem_grade")=rs("mem_grade")
					  session("mem_money")=rs("mem_money")
							  mem_power_bak=rs("mem_power")
							  customerText = rs("Mem_Name")		'联系人名
					  session("user_name") = customerText
					  session("telephone") = rs("Mem_Tel")			'联系人电话
					  session("mobilephone") = rs("Mem_Mobile")	'联系人手机
					  session("cemail") = rs("Mem_Email")			'邮箱
					  session("telephone1") = rs("Mem_Mobile")		'联系人手机又为紧急电话 
					  'response.End
					  thetime=now()
					  theip=getIP()
						sqls="update tmember set mem_lastlogintime='"&thetime&"',mem_lastloginip='"&theip&"',mem_logins=mem_logins+1 where mem_loginname = '"&mem_loginname&"'"
						   set rss=server.CreateObject("adodb.recordset")
						   rss.open sqls,conn,1,3
								if isnull(mem_power_bak) or isempty(mem_power_bak) then
									mem_power_bak="0"
									session("mem_power")=mem_power_bak
									msg="成功登陆！"
								end if
				end if
		response.write "<form name=""startForm"" action=""hotellogin.asp"" method=""post"">"
		response.write "<input type=""hidden"" name=""PropertyID"" value="&PropertyID&">"
		response.write "<input type=""hidden"" name=""hoteltitle"" value="&hoteltitle&">"
		response.write "<input type=""hidden"" name=""Start_date"" value="&Start_date&">"
		response.write "<input type=""hidden"" name=""End_date"" value="&End_date&">"
		response.write "<input type=""hidden"" name=""hoteltype"" value="&hoteltype&">"
		response.write "<input type=""hidden"" name=""moneyid"" value="&moneyid&">"
		response.write "<input type=""hidden"" name=""Price"" value="&Price&">"
		response.write "<input type=""hidden"" name=""MealZC"" value="&MealZC&">"
		response.write "<input type=""hidden"" name=""add"" value="&add&">"
		response.write "</form>"
		response.write "<script language=""javascript"">"
		response.write "document.startForm.action = ""hotellogin.asp"" ;"
		response.write "document.startForm.submit() ;"
		response.write "</script>"
	else
		   response.write "<script language=""javascript"">"
		   response.write "alert('用户名或密码错，但不排除没有该用户名。');"
		   response.write "window.history.back(-1);"
		   response.write "</script>"
		   response.end

	end if
else
%>
<script>
function trans(s)
{  
    var menuidobj = form2.document.getElementById('usernamestr');	
    menuidobj.value=s+'：';
    
}
</script>
</head>
<body text="555555" link="555555" vlink="555555" alink="555555" leftmargin="0" topmargin="0" marginwidth="0" arginheight="0">
<table width="800" border="0" align="center" cellpadding="0" cellspacing="0">
        <tr> 
          <td> <table width="100%" border="0" cellspacing="0" cellpadding="0">
              <tr> 
                <td height="40"><table width="100%" border="0" cellpadding="8" cellspacing="1" bgcolor="C4C4C4">
                    <tr> 
                      <td width="51%" bgcolor="F2F2F2"> <strong><span class="style14"><img src="images/M.gif" width="13" height="13" hspace="9">会员请先登录</span></strong><br> 
                        <br> <table width="100%" border="0" cellspacing="2" cellpadding="0">
                          <form name="form2" method="post" action="hotelyd.asp" onSubmit="return validateForm(this.login_type ,'SelectValid' ,'1to1' ,
												 this.username ,'LengthRange' ,'2to20' ,
				                                 this.userpass ,'LengthRange' ,'4to16' ,
												 this.admin_r ,'LengthRange' ,'4to4')">
                            <tr> 
                              <td width="31%" height="25" align="right">登录方式：</td>
                              <td width="69%" height="25" colspan="2"> <select name=login_type1   onchange="javascript:trans(this.options[this.selectedIndex].text)" size="1" style="font:12px;FONT-FAMILY:Pmingliu;height:18px; BACKGROUND-COLOR: #F2F2F2; ">
                                    <option value="2" >用户名</option>
                                    <option value="1" >会员卡</option>
                                    <option value="3" >手机号</option>
                                  </select></td>
                            </tr>
                            <tr> 
                              <td height="25"> <div align="right"><input type=text  id="usernamestr"  value="用户名：" class="inputbox1" readonly=true /></div></td>
                              <td height="25" colspan="2"> <input name="mem_loginname" type="text" style="width:120px; height:18px;" title="号码" value=""></td>
                            </tr>
                            <tr> 
                              <td height="25"> <div align="right">密 码：</div></td>
                              <td height="25" colspan="2"> <input name="mem_loginpasd" type="password" style="width:120px; height:18px;" title="密码" value=""></td>
                            </tr>
                            <tr> 
                              <td height="30" align="right">&nbsp; </td>
                              <td height="25"> <input type=submit value=" 登 录 " name=Submit2> 
                              </td>
                              <td> <input name=Reset type=reset id="Reset2" value=" 重 置 "></td>
                            </tr>
							<input type="hidden" name="PropertyID" value="<%=PropertyID%>">
							<input type="hidden" name="hoteltitle" value="<%=hoteltitle%>">
							<input type="hidden" name="Start_date" value="<%=Start_date%>">
							<input type="hidden" name="End_date" value="<%=End_date%>">
							<input type="hidden" name="hoteltype" value="<%=hoteltype%>">
							<input type="hidden" name="moneyid" value="<%=moneyid%>">
							<input type="hidden" name="Price" value="<%=Price%>">
							<input type="hidden" name="MealZC" value="<%=MealZC%>">
							<input type="hidden" name="add" value="<%=add%>">
							<input type="hidden" name="admin_session" value="eiyang">
                          </form>
                          <tr valign="bottom"> 
                            <td height="30" colspan="3">还没有<%=ZXLCompanyStr%>账号？ 立即<a href="../ticket/register/"><font color=red><u>免费注册</u></font></a>&nbsp;&nbsp;&nbsp; 
                              </td>
                          </tr>
                        </table></td>
                      <td width="49%" bgcolor="#FFFFFF"><img src="images/ek_adv.jpg" width="390" height="245"></td>
                    </tr>
                  </table></td>
              </tr>
            </table></td>
        </tr>
      </table>
<div style="text-align:center; padding-top:30px; font-size:14px; color:#333333;">注册会员的好处：预订产品得积分，兑换超值礼品和<%=ZXLCompanyStr%>产品！</div>
<div style="text-align:center; padding-top:15px; font-size:14px; color:#333333;"><font style="color:#FF0000; font-weight:bold; font-size:16px">直接预订</font>：如果您不是我们的会员请点击下面的按钮继续↓</div>
<div style="text-align:center; padding-top:10px; font-size:14px; color:#333333;">
<form action="hotellogin.asp" method="post">
	<form name="startForm" action="hotellogin.asp" method="post">
	<input type="hidden" name="PropertyID" value="<%=PropertyID%>">
	<input type="hidden" name="hoteltitle" value="<%=hoteltitle%>">
	<input type="hidden" name="Start_date" value="<%=Start_date%>">
	<input type="hidden" name="End_date" value="<%=End_date%>">
	<input type="hidden" name="hoteltype" value="<%=hoteltype%>">
	<input type="hidden" name="moneyid" value="<%=moneyid%>">
	<input type="hidden" name="Price" value="<%=Price%>">
	<input type="hidden" name="MealZC" value="<%=MealZC%>">
	<input type="hidden" name="add" value="<%=add%>">
	<input name="eiyang" type="image" src="images/Direct_book.gif">
</form>
</div>
</body>
<%end if%>
</html>