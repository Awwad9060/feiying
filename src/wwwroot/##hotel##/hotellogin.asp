<%
From_url = Cstr(Request.ServerVariables("HTTP_REFERER")) 
Serv_url = Cstr(Request.ServerVariables("SERVER_NAME")) 
if mid(From_url,8,len(Serv_url)) <> Serv_url then 
Server.Transfer "err.asp"
response.end 
end if 
%>
<!--#include file="../ticket/include/conn.asp"-->
<!--#include file="../ticket/include/function.asp"-->
<%
PropertyID = request.Form("PropertyID")
hoteltitle = request.Form("hoteltitle")
Start_date = request.Form("Start_date")
End_date = request.Form("End_date")
hoteltype = request.Form("hoteltype")
moneyid = request.Form("moneyid")
Price = request.Form("Price")
MealZC = request.Form("MealZC")
add = request.Form("add")

arrPrice = split(Price,"|")
arrPriceMax = Ubound(arrPrice)
ArrMealZC = split(MealZC,"|")
'MealZcMax = Ubound(ArrMealZC)

PriceSum = 0
for i=1 to arrPriceMax 
PriceSum=PriceSum + arrPrice(i)
next
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=ZXLCompanyStr%>-�Ƶ�Ԥ��</title>
<link rel="stylesheet" href="images/style.css" type="text/css">
<link href="../Css/main_api.css" type="text/css" rel="stylesheet" />
<STYLE type=text/css>
			.inputbox1 {
	BORDER-RIGHT: #5D87E6 0px solid; BORDER-TOP: #003699 0px solid; FONT-SIZE: 12px; font-family: "Arial";BORDER-LEFT: #003699 0px solid;  BORDER-BOTTOM: #003699 0px solid; HEIGHT: 16px;  WIDTH:50px; BACKGROUND-COLOR: #F2F2F2; 
}
</STYLE>
<script language="javascript">
<!--//
	function checksignup() {

		if ( document.formSignUp.clientname1.value == '' ) {
			window.alert('����������һλ��ס�Ǽ���!!');
			document.formSignUp.clientname1.focus();
			return false;
		}
		if ( document.formSignUp.personcount.value == '' ) {
			window.alert('��������ס����!!');
			document.formSignUp.personcount.focus();
			return false;
		}
		if ( document.formSignUp.contactname.value == '' ) {
			alert('��������ϵ������!!');
		   formSignUp.contactname.focus();
		   return false;
			
		}
		if ( document.formSignUp.Phone.value == '' ) {
			window.alert('��������ϵ�绰!!');
			document.formSignUp.Phone.focus();
			return false;
		}
		
		if ( document.formSignUp.email.value == '' ) {
			window.alert('����������ʼ���ַ!!');
			document.formSignUp.email.focus();
			return false;
		}

		return true;
	}

	//-->
</script>
</head>
<body text="555555" link="555555" vlink="555555" alink="555555" leftmargin="0" topmargin="0" marginwidth="0" arginheight="0">
<!--#include file="header.asp"-->
<table width="980" border="0" align="center" cellpadding="0" cellspacing="1" bgcolor="#BDDDF9">
  <tr> 
    <td height="20" background="images/bg_listTitle01.gif" bgcolor="#FFFFFF"> 
      <div align="left">&nbsp;&nbsp;<img src="images/bz.jpg" width="12" height="12"> 
        &gt;&gt; <a href="index.asp">��ҳ</a> &gt;&gt; �Ƶ�Ԥ��</div></td>
  </tr>
</table>
    <table width="980" border="0" cellpadding="0" cellspacing="0" align="center">
      <tr>
        <td height="37"><div align="right"><img src="images/pic_schedule03.gif" width="200" height="26"></div></td>
      </tr>
    </table>
    <table id=zy width=980 border=1 cellPadding=3 cellSpacing=0 bordercolor=#BDDDF9 borderColorDark=#ffffff bgcolor=#FFFFFF align="center">
	<FORM ACTION="checkyd.asp" METHOD="POST" NAME="formSignUp" ONSUBMIT="javascript:return checksignup()" style=" margin:0px;">
      <TBODY>
        <tr  > 
          <TD height=30 colspan="2" background="images/bg_listTitle01.gif">&nbsp;&nbsp;<img src="images/1.jpg" width="11" height="11"> <font style="font-size:14px; color:#136CFF"><%=hoteltitle%> <input type=hidden name=hotelid value=<%=PropertyID%>><input type=hidden name=hotelname value=<%=hoteltitle%>></font></TD>
        </tr>
		<tr>
		<td colspan="2">
			<table width="980" border="0" cellpadding="0" cellspacing="1" bgcolor="#E1F0FF">
				<tr bgColor=#FFFFFF> 
				  <TD height=25 align="right"> ��ס���ڣ�</TD>
				  <TD width="281" height=25 style="padding-left:5px;"><% = Start_date%><input type="hidden" name=starttime value="<% = Start_date%>"></TD>
				  <TD width="94" height=25 align="right" bgColor=#FFFFFF> ������ڣ�</TD>
				  <TD width="276" height=25 style="padding-left:5px;"><% = End_date%><input type="hidden" name=deptime value="<% = End_date%>"> ��<b style="color:#FF8000"><%=arrPriceMax-1%></b>��</TD>
				</tr>
				<tr bgColor=#FFFFFF> 
				  <TD height=25 align="right">��&nbsp;&nbsp;&nbsp;&nbsp;ַ��</TD>
				  <TD height=25 style="padding-left:5px;"><% = add%><input name=add type="hidden" value="<% = add%>"></TD>
				  <TD height=25 align="right">��&nbsp;&nbsp;&nbsp;&nbsp;����</TD>
				  <TD height=25 style="padding-left:5px;"><input name=tel type=hidden value="<% = tel%>"></TD>
				</tr>
				<tr bgColor=#FFFFFF> 
				  <TD height=25 align="right">��&nbsp;&nbsp;&nbsp;&nbsp;�ͣ�</TD>
				  <TD height=25 style="padding-left:5px;"><% = hoteltype%><input type=hidden name=roomtype value=<%=hoteltype%>></TD>
				  <TD height=25 align="right">֧����ʽ��</TD>
				  <TD height=25 style="padding-left:5px;">����Ԥ��<input name=tel type=hidden value="����Ԥ��"></TD>
				</tr>
			</table>
		</td>
		</tr>
        <tr> 
          <TD height=25 align="right" bgColor=#FFFFFF colspan="2"></TD>
        </tr>
        <tr> 
          <TD height=30 colspan="2" background="images/bg_listTitle01.gif"> <p align="left">&nbsp;&nbsp;<img src="images/2.jpg" width="11" height="11"> 
               <font style="font-size:14px; color:#136CFF">������ϸ����</font></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF align="right">������ϸ���ϣ�</TD>
          <TD bgColor=#FFFFFF align="center">
		  	<table width="100%" border="0" cellspacing="1" cellpadding="0" align="center" bgcolor="#E0F4FF">
				<tr height="24" bgcolor="#52A6C6">
				<%
					for d = 0 to 6
					weekDate = CDate(request.Form("Start_date"))
					weekDate = weekDate+ d
					Format_week = weekdayname(weekday(weekDate))
					'Format_week = replace(Format_week,"����","��")
				%>
				<td class="pubHotels_col04 pubHotels_borRight" width="14%" align="center"><b style="color:#FFFFFF;"><%=Format_week%></b></td>
			<%next%>
				<%
					QianDate = CDate(request.Form("Start_date"))
					HuoDate = CDate(request.Form("End_date"))
					DateMax = DateDiff("d",QianDate,HuoDate)
					'response.write DateMax
				response.write "<tr bgcolor=""#FFF3E9"" height=""22"">"
				for d = 1 to arrPriceMax
					response.write "<td class=""pubHotels_col04 pubHotels_borRight"" width=""14%"" align=""center""><font style=""color:#FF0000;"">"&arrPrice(d)&"</font>/"&ArrMealZC(d)&"</td>"
					if d mod 7 = 0 then
						response.write "</tr><tr bgcolor=""#FFF3E9"" height=""22"">"
					End if
				next
				%>
				</tr>
			</table>
		  </TD>
        </tr>
        
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> �ܷ��ã�</TD>
          <TD height=25> <%=PriceSum %></TD>
          <input type=hidden name=price value="<%=PriceSum%>">
		  <input type=hidden name=pricelist value="<%=Price%>">
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> Ԥ��������</TD>
          <TD height=25> <select maxLength="2" name="Roomcount" >
              <option value=1 selected>1&nbsp; 
              <option value=2>2&nbsp; 
              <option value=3>3&nbsp; 
              <option value=4>4&nbsp; 
              <option value=5>5&nbsp; 
              <option value=6>6&nbsp; 
              <option value=7>7&nbsp; 
              <option value=8>8&nbsp; 
            </select>
            ��</TD>
        </tr>
        <tr> 
          <TD height=30 colspan="2" background="images/bg_listTitle01.gif"> <p align="left">&nbsp;&nbsp;<img src="images/3.jpg" width="11" height="11"> 
              <font style="font-size:14px; color:#136CFF">��ס����</font> </TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right">��ס������</TD>
          <TD height=25> <input type="text" name="personcount" size="5" value="1">
            ��</TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right">��ס����ݣ�</TD>
          <TD class=main2 height=25>
		   <select name="ClientComeFrom">
              <option value="�ڱ�(�ִ�½���֤"  selected >�ڱ�(�ִ�½���֤)</option>
              <option value="�۰�̨(�ֻ���֤\̨��֤��)" >�۰�̨(�ֻ���֤\̨��֤��)</option>
              <option value="�Ȱ�(���й�����)" >�Ȱ�(���й�����)</option>
              <option value="���й�����֤�����" >���й�����֤�����</option>
              <option value="���ձ����յ����" >���ձ����յ����</option>
              <option value="�ַ��ձ�������յ����" >�ַ��ձ�������յ����</option>
            </select></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right">��ס�Ǽ��ˣ�</TD>
          <TD height=25> <input name="clientname1" maxlength="20" align="left" size="8" value=<%=session("user_name")%>> 
            <input name="clientname2" maxlength="20" align="left" size="8" value=""> 
            <input name="clientname3" maxlength="20" align="left" size="8" value=""> 
            <input name="clientname4" maxlength="20" align="left" size="8" value=""> <font color="#ff0000">*(����д��ס����ʵ����!)</font>
            <br> <input name="clientname5" maxlength="20" align="left" size="8" value=""> 
            <input name="clientname6" maxlength="20" align="left" size="8" value=""> 
            <input name="clientname7" maxlength="20" align="left" size="8" value=""> 
            <input name="clientname8" maxlength="20" align="left" size="8" value=""></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> ����Ŀ�ĵط�ʽ��</TD>
          <TD height=25> <input name="ArrivalWay" value="" maxlength="30" size=20> 
            <font color="#ff0000">����д�����ĺ����(�𳵳���)���磺 MU501����ȣ�</font></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> ���絽��ʱ�䣺</TD>
          <TD height=25> <select name="EarlyArrivalTime">
              <option value="10:00" selected >10:00</option>
              <option value="10:30" >10:30</option>
              <option value="11:00" >11:00</option>
              <option value="11:30" >11:30</option>
              <option value="12:00" >12:00</option>
              <option value="12:30" >12:30</option>
              <option value="13:00" >13:00</option>
              <option value="13:30" >13:30</option>
              <option value="14:00">14:00</option>
              <option value="14:30" >14:30</option>
              <option value="15:00" >15:00</option>
              <option value="15:30" >15:30</option>
              <option value="16:00" >16:00</option>
              <option value="16:30" >16:30</option>
              <option value="17:00" >17:00</option>
              <option value="17:30" >17:30</option>
              <option value="18:00" >18:00</option>
              <option value="18:30" >18:30</option>
              <option value="19:00" >19:00</option>
              <option value="19:30" >19:30</option>
              <option value="20:00" >20:00</option>
              <option value="20:30" >20:30</option>
              <option value="21:00" >21:00</option>
              <option value="21:30" >21:30</option>
              <option value="22:00" >22:00</option>
            </select> <font color="#ff0000">����ʽHH:MM,��17:30��</font></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> ������ʱ�䣺</TD>
          <TD height=25> <select name="arrivalTime" >
              <option value="10:00" >10:00</option>
              <option value="10:30" >10:30</option>
              <option value="11:00" >11:00</option>
              <option value="11:30" >11:30</option>
              <option value="12:00" >12:00</option>
              <option value="12:30" >12:30</option>
              <option value="13:00" >13:00</option>
              <option value="13:30" >13:30</option>
              <option value="14:00" >14:00</option>
              <option value="14:30" >14:30</option>
              <option value="15:00" >15:00</option>
              <option value="15:30" >15:30</option>
              <option value="16:00" >16:00</option>
              <option value="16:30" >16:30</option>
              <option value="17:00" >17:00</option>
              <option value="17:30" >17:30</option>
              <option value="18:00" selected >18:00</option>
              <option value="18:30" >18:30</option>
              <option value="19:00" >19:00</option>
              <option value="19:30" >19:30</option>
              <option value="20:00" >20:00</option>
              <option value="20:30" >20:30</option>
              <option value="21:00" >21:00</option>
              <option value="21:30" >21:30</option>
              <option value="22:00" >22:00</option>
            </select> <font color="#ff0000">����ʽHH:MM,��17:30��</font></TD>
        </tr>
        <tr> 
          <TD height=30 colspan="2" background="images/bg_listTitle01.gif"> <p align="left">&nbsp;&nbsp;<img src="images/4.jpg" width="11" height="11"> 
              <font style="font-size:14px; color:#136CFF">��ϵ����</font></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> ��ϵ�ˣ�</TD>
          <TD height=25> <input maxlength="20" size=12 name="contactname" value=<%=session("user_name")%>></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> �ֻ���绰��</TD>
          <TD height=25> <input name="Phone" maxlength="30" size=25 value=<%=session("mobilephone")%>></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> �ڶ��ֻ���</TD>

          <TD height=25> <input name="fax" maxlength="30" size=25  value="<%=session("telephone")%>"> (��������д����Ŀ�ĵ��ֻ�����)</TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> Email��</TD>
          <TD height=25> <input name="email" maxlength="40" size=25 value=<%=session("cemail")%>></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right"> ȷ�Ϸ�ʽ��</TD>
          <TD height=25> <select name="ConfirmType" style="width:95; height:25">
              <option value="����ȷ��" selected >����ȷ��</option>
              <option value="�ֻ�����ȷ��" >�ֻ�����ȷ��</option>
              <option value="�绰ȷ��" >�绰ȷ��</option>
              <option value="Emailȷ��" >Emailȷ��</option>
            </select></TD>
        </tr>
        <tr> 
          <TD bgColor=#FFFFFF height=25 align="right">����˵����</TD>
          <TD height=25> <textarea rows="4" name="info" cols="44"></textarea></TD>
        </tr>
        <TR> 
          <TD colSpan=2 height="35" align="center">
              <INPUT TYPE=submit VALUE=" ȷ��Ԥ�� " CLASS="medium"  NAME="signup_submit">
              &nbsp;&nbsp; 
              <INPUT TYPE=RESET VALUE="�� ��" CLASS="medium" NAME="signup_reset">
          </TD>
        </TR>
      </TBODY>
	</form>
    </TABLE>
	<!--#include file="footer.asp"-->
</body>
</html>