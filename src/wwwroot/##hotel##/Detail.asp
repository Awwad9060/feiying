<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Response.Charset="Gb2312"%> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<html>
<title>�Ƶ���ϸ��Ϣ</title>
<style type="text/css">
body,td,th {
	font-size: 12px;
	color: #000000;
	line-height: 18px;
}
.textbotton1 {  border: 1px #999999 solid;BACKGROUND: #DBC0E4;FONT-SIZE: 12px;font-family: ����; text-align:center; padding-top:3px; color:#FF0000;}
.red{color:#FF3300}
</style>
<body>
<%
dim the_text : the_text=""
dim key : key=Request.Querystring("Key")

mypostdata = "request=" &_ 
"<OTRequest>" &_
	"<TransactionName>SingleHotelSearch</TransactionName>" &_
	"<Header>" &_
		"<SessionID>1111111111</SessionID>" &_
		"<Invoker>HBE</Invoker>" &_
	"</Header>" &_
	"<IdentityInfo>" &_
		"<OfficeID>NATEST</OfficeID>" &_
		"<UserID>aaa</UserID>" &_
		"<Password></Password>" &_
	"</IdentityInfo>" &_
	"<ScrollingInfo>" &_
		"<DisplayReq>50</DisplayReq>" &_
		"<PageItems>10</PageItems>" &_
		"<PageNo>1</PageNo>" &_
	"</ScrollingInfo>" &_
	"<SearchConditions>" &_
		"<CheckInDate>200804081</CheckInDate>" &_
		"<CheckOutDate>20080803</CheckOutDate>" &_
		"<PropertyID>1E644</PropertyID>" &_
		"<RoomTypeCode></RoomTypeCode>" &_
	"</SearchConditions>" &_
"</OTRequest>"

response.write key 
'set blogdom=server.createobject("Microsoft.XMLDOM")
'blogdom.async=false
'blogdom.load Server.MapPath("reXml.xml")
'set blogchild=blogdom.getElementsByTagName("PropertyLineItem")
'for i=0 to blogchild.length-1

'��ȡ���ݿ�ʼ
jw_sendPath = "http://hotel.eiyang.com/HBE/servlet/tdplogicbookingcontroller" 
set objHTTP = Server.CreateObject("Microsoft.XMLHTTP") 
objHTTP.open "POST",jw_sendPath, false '' 
objHTTP.SetRequestHeader "Content-Type", "application/x-www-form-urlencoded" 
objHTTP.Send(mypostdata)  
Send_Result = objHTTP.responseText 'objHTTP.responsebody... 
set xmlDOC =Server.CreateObject("MSXML.DOMDocument") 
xmlDoc.loadxml(Send_Result)  

maxNum = xmlDoc.getElementsByTagName("Data/HotelsInfo/HotelNumber").item(0).text
set blogchild = xmlDoc.getElementsByTagName("Data/HotelsInfo/HotelList/PropertyLineItem") '��ȡNodeList 
for i = 0 to blogchild.length - 1 


	if blogchild.item(i).childnodes.item(0).text=key then
		for j=0 to blogchild.item(i).childnodes.length-1
			if blogchild.item(i).childnodes.item(j).nodeName="Name" then hotel_name=blogchild.item(i).childnodes.item(j).text
			if blogchild.item(i).childnodes.item(j).nodeName="Rank" then hotel_Rank=blogchild.item(i).childnodes.item(j).text
			if blogchild.item(i).childnodes.item(j).nodeName="CityCode" then hotel_City=blogchild.item(i).childnodes.item(j).text
			if blogchild.item(i).childnodes.item(j).nodeName="SplName" then hotel_SplName=blogchild.item(i).childnodes.item(j).text
			if blogchild.item(i).childnodes.item(j).nodeName="TEL" then hotel_TEL=blogchild.item(i).childnodes.item(j).text
			if blogchild.item(i).childnodes.item(j).nodeName="FAX" then hotel_FAX=blogchild.item(i).childnodes.item(j).text
			if blogchild.item(i).childnodes.item(j).nodeName="Address" then hotel_Address=blogchild.item(i).childnodes.item(j).text
			if blogchild.item(i).childnodes.item(j).nodeName="HotelFeatures" then hotel_HotelFeatures=blogchild.item(i).childnodes.item(j).text
		next
			%>
			<table width="570"  border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#999999" style="border:5px solid #ffffff;">
			  <tr align="center" bgcolor="#f3f3f3">
				<td width="40%" height="25" style="color:#FF6600;"><strong><%If hotel_name<>"" then response.Write hotel_name%></strong></td>
				<td width="9%" style="color:#FF3300;">
				<%
					If hotel_Rank="1" Then
						hotel_Rank="1�Ǽ�"
					ElseIf hotel_Rank="1A" Then
						hotel_Rank="׼һ��"
					ElseIf hotel_Rank="2" Then
						hotel_Rank="2�Ǽ�"
					ElseIf hotel_Rank="2A" Then
						hotel_Rank="׼����"
					ElseIf hotel_Rank="3" Then
						hotel_Rank="3�Ǽ�"
					ElseIf hotel_Rank="3A" Then
						hotel_Rank="׼����"
					ElseIf hotel_Rank="4" Then
						hotel_Rank="4�Ǽ�"
					ElseIf hotel_Rank="4A" Then
						hotel_Rank="׼����"
					ElseIf hotel_Rank="5" Then
						hotel_Rank="5�Ǽ�"
					ElseIf hotel_Rank="5A" Then
						hotel_Rank="׼����"
					End If
				%><%If hotel_Rank<>"" then response.Write hotel_Rank%></td>
				<td width="10%" align="right"><strong>���У�</strong></td>
				<td width="12%"><%If hotel_City<>"" then response.Write GetCityName(hotel_City)%></td>
				<td width="12%"><strong>��Ӧ�̣�</strong></td>
				<td width="17%"><%If hotel_SplName<>"" then response.Write hotel_SplName%></td>
			  </tr>
			  <tr bgcolor="#FFFFFF">
				<td height="25" colspan="6">
				  <table width="556" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#999999">
					<tr>
					  <td width="78" height="20" align="right" bgcolor="#F3F3F3"><strong>��ϵ�绰��</strong></td>
					  <td width="463" bgcolor="#FFFFFF">
					  <%
					  If hotel_TEL<>"" then hotel_contact=hotel_TEL
					  If hotel_FAX<>"" then hotel_contact="&nbsp;&nbsp;���棺"&hotel_FAX
					  response.Write hotel_contact
					  %>
					  </td>
					</tr>
					<tr>
					  <td height="20" align="right" bgcolor="#F3F3F3"><strong>��ַ��</strong></td>
					  <td bgcolor="#FFFFFF"><%If hotel_Address<>"" then response.Write hotel_Address%></td>
					</tr>
					<tr>
					  <td height="20" align="right" bgcolor="#F3F3F3"><strong>�򵥽��ܣ�</strong></td>
					  <td bgcolor="#FFFFFF"><%If hotel_HotelFeatures<>"" then response.Write hotel_HotelFeatures%></td>
					</tr>
				  </table>
			<%
			for k=0 to blogchild.item(i).childnodes.length-1
				if blogchild.item(i).childnodes.item(k).nodeName="RoomRateDetail" then
					for n=0 to blogchild.item(i).childnodes.item(k).childnodes.length-1
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="RoomType" then room_RoomType=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="RoomName" then room_RoomName=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="DisplayRate" then room_DisplayRate=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="SaleRate" then room_SaleRate=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="Availability" then room_Availability=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="PassengerType" then room_PassengerType=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="Description" then room_Description=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="MealPlan" then room_MealPlan=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
						if blogchild.item(i).childnodes.item(k).childnodes.item(n).nodeName="RateChanged" then room_RateChanged=blogchild.item(i).childnodes.item(k).childnodes.item(n).text
					next
						%>
						  <br>
						  <table width="558" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#999999">
						  <form name="form<%=k%>" method="post" action="../roomdetail2.asp" target="_blank">
							<tr bgcolor="#F3F3F3">
							  <td width="70" height="25" style="color:#FF6600; padding-left:15px;"><strong>
							  	<%If room_RoomName<>"" then response.Write room_RoomName%>
							  </strong></td>
							  <td width="388" height="25">
							  	<input name="hotel_ProportyID" type="hidden" value="<%=request.QueryString("key")%>">
							  	<input name="hotel_name" type="hidden" value="<%=hotel_name%>">
							  	<input name="hotel_City" type="hidden" value="<%=GetCityName(hotel_City)%>">
							  	<input name="hotel_contact" type="hidden" value="<%=hotel_contact%>">
							  	<!--<input name="hotel_Rank" type="hidden" value="< %'=hotel_Rank%>">
							  	<input name="hotel_SplName" type="hidden" value="< %'=hotel_SplName%>">
							  	<input name="hotel_contact" type="hidden" value="< %'=hotel_contact%>">
							  	<input name="hotel_Address" type="hidden" value="< %'=hotel_Address%>">
							  	<input name="hotel_HotelFeatures" type="hidden" value="< %'=hotel_HotelFeatures%>">
								-->
							  	<input name="room_RoomName" type="hidden" value="<%=room_RoomName%>">
							  	<input name="room_RoomType" type="hidden" value="<%=room_RoomType%>">
							  	<input name="room_guestType" type="hidden" value="<%=room_PassengerType%>">
							  	<!--
							  	<input name="room_Description" type="hidden" value="< %'=room_Description%>">-->
								<input name="room_DisplayRate" type="hidden" value="<%=room_DisplayRate%>">
							  	<input name="room_SaleRate" type="hidden" value="<%=room_SaleRate%>">
							  &nbsp;</td>
							  <td width="78" align="center">
							  	<input name="Submit" type="submit" class="textbotton1" value="��Ԥ������">
							  </td>
							</tr>
							<tr bgcolor="#FFFFFF">
							  <td height="25" colspan="3" bgcolor="#F3F3F3"><table width="550" height="25" border="0" cellpadding="0" cellspacing="0">
								  <tr align="center">
									<td width="69" align="center" bgcolor="#F3F3F3"><strong>ǰ̨�۸�</strong></td>
									<td width="57" align="left" bgcolor="#F3F3F3" class="red">
									    <%If room_DisplayRate<>"" then response.Write "��"&room_DisplayRate%></td>
									<td width="68" align="center" bgcolor="#F3F3F3"><strong>���ۼ۸�</strong></td>
									<td width="65" align="left" bgcolor="#F3F3F3" class="red">
									  <%If room_SaleRate<>"" then response.Write "��"&room_SaleRate%></td>
									<td width="78" align="center" bgcolor="#F3F3F3"><strong>��̬/��Դ��</strong></td>
									<td width="68" align="left" bgcolor="#F3F3F3" class="red">
									    <%
										If room_Availability<>"" then
											room_Availability=replace(room_Availability,"0","����")
											room_Availability=replace(room_Availability,"1","�ر�")
											room_Availability=replace(room_Availability,"2","���")
											room_Availability=replace(room_Availability,"3","����")
											room_Availability=replace(room_Availability,"4","����")
											response.Write room_Availability
										End if
									%>
							  	<!--<input name="room_Availability" type="hidden" value="< %'=room_Availability%>">-->
									</td>
									<td width="82" align="center" bgcolor="#F3F3F3"><strong>�ÿ����ͣ�</strong></td>
									<td width="63" align="left" bgcolor="#F3F3F3" class="red">
									    <%
										If room_PassengerType<>"" then
											room_PassengerType=replace(room_PassengerType,"A","����")
											room_PassengerType=replace(room_PassengerType,"D","�ڱ�")
											room_PassengerType=replace(room_PassengerType,"F","���")
											response.Write room_PassengerType
										End if
									%>
							  	<!--input name="room_PassengerType" type="hidden" value="< %'=room_PassengerType%>"-->
									</td>
								  </tr>
							  </table></td>
							</tr>
							<tr bgcolor="#FFFFFF">
							  <td height="25" align="right" bgcolor="#F3F3F3"><strong>��ע��</strong></td>
							  <td colspan="2">
								<%
								If room_MealPlan<>"" then
									room_MealPlan=replace(room_MealPlan,"0","�����")
									room_MealPlan=replace(room_MealPlan,"1","�����")
									room_MealPlan=replace(room_MealPlan,"2","˫���")
									room_MealPlan="��������"&room_MealPlan
									response.Write room_MealPlan
								End if
								%>
								<%
								If room_RateChanged<>"" then
									room_RateChanged=replace(room_RateChanged,"N","�۸��ޱ仯")
									room_RateChanged=replace(room_RateChanged,"Y","�۸��б仯")
									room_RateChanged="��&nbsp;&nbsp;"&room_RateChanged
									response.Write room_RateChanged
								End if
								%>
							  	<!--input name="room_PassengerType" type="hidden" value="< %'=room_MealPlan&room_RateChanged%>"-->
							  </td>
							</tr>
							<tr bgcolor="#FFFFFF">
							  <td height="25" align="right" bgcolor="#F3F3F3"><strong>������</strong></td>
							  <td colspan="2"><%If room_Description<>"" then response.Write room_Description%></td>
							</tr>
					  	  </form>
				  </table>
						<%
				End IF
			next
			%>
				</td>
			  </tr>
			</table>
			<%
	end If
next 
%>
<%
function GetCityName(vstr)
		citystring="ABA#������#ACH#����#AKU#������#AAT#����̩#ATU#��ͼʲ#ANJ#����#AKA#����#ANL#��½#AQG#����#ANS#��˳#AYN#����"&_
					"#AOG#��ɽ#MFM#����#BAZ#����#BAC#�׳�#BAS#��ɽ#BSI#��ɫ#BFU#����#BAV#��ͷ#BAJ#����#BAD#����#BSD#��ɽ#BEA#����#BDH#������"&_
					"#BHY#����#PEK#����#BEL#����#BEN#����#BEX#��Ϫ#BIJ#�Ͻ�#BIZ#����#BOZ#����#BOL#����#CAZ#����#CDA#����#CDU#��������#CHJ#����"&_
					"#CGQ#����#CGE#����#CSX#��ɳ#CIH#����#CGD#����#CHN#����#CHS#����#CZX#����#CHU#����#CHG#����#CHY#����#CZH#����#CEZ#����"&_
					"#CTU#�ɶ�#CHD#�е�#CHA#�κ�#CZU#����#CHB#���#CIF#���#CHZ#����#CUZ#����#CHX#����#CIX#��Ϫ#COH#�ӻ�#DZH#����#DAA#��"&_
					"#DAF#���#DLU#����#DLC#����#DAQ#����#DAT#��ͬ#DAX#���˰���#DYE#��ұ#DDG#����#DAJ#������#DYA#����#DAZ#����#DAY#����"&_
					"#DEL#�����#DEY#����#DZO#����#DEF#�Ƿ�#DEZ#����#DIG#����#DIQ#������#DXN#����#DIX#��������#DOT#��̨#DGM#��ݸ#DOX#����"&_
					"#DYN#����#DOY#��Ӫ#DOJ#������#DUJ#����#DUH#�ػ�#DNH#�ػ�#EMS#��üɽ#ERD#������˹#EZH#����#ENP#��ƽ#ENH#��ʩ#ERL#��������"&_
					"#PAY#��خ#FAC#���Ǹ�#FEC#���#FEH#�#FUO#��ɽ#FUA#����#FUD#����#FUQ#����#FOC#����#FUS#��˳#FUZ#����#FUK#����#FUX#����"&_
					"#FUG#����#FUY#����#GAZ#������#GZH#����#GAM#����#GAY#����#GAC#޻��#GOQ#���ľ#GEJ#����#GOY#����#GUA#�㰲#GHN#�㺺#GUS#��ˮ"&_
					"#GUY#��Ԫ#CAN#����#GUG#���#GUX#��Ϫ#KWE#����#KWL#����#GUP#��ƽ#HRB#������#HMI#����#HDO#����#HAD#��������#HAK#����#HAL#����"&_
					"#HAM#����#HAN#������#HAI#����#HDN#����#HAC#����#HCH#����#HZG#����#HGH#����#HFE#�Ϸ�#HEZ#����#HTN#����#HEC#�ӳ�#HEY#��Դ"&_
					"#HZE#����#HZH#����#HEB#�ױ�#HEG#�׸�#HSH#��ɽ#HEK#�ں�#HSU#��ˮ#HNY#����#HOH#���#HOM#����#HET#���ͺ���#HUL#���ױ���#HZO#����"&_
					"#HLD#��«��#HLI#����#HDU#����#HUD#����#HYI#����#HZU#����#HUH#����#HUA#����#HUB#����#HUI#����#HUG#�Ƹ�#HYE#����#HUN#������"&_
					"#TXN#��ɽ#HUS#��ʯ#HYN#����#HUC#�ʹ�#HYA#����#HUZ#����#JXI#����#KNC#����#JIL#����#JSH#����#JMO#��ī#JIA#����#JIN#����#TNA#����"&_
					"#JNG#����#JYA#��Դ#JMU#��ľ˹#JIX#����#JGN#������#JID#����#JIO#���#JYG#����#JDU#����#JIM#����#JSA#��ɽ#JIY#����#JYO#����"&_
					"#JAN#����#JNA#����#JIZ#����#JZU#����#JHE#�Ժ�#JYN#����#JIS#����#JCH#���#JHA#��#JIT#��̳#JNZ#����#JIC#����#JJA#����#JZO#����"&_
					"#JMN#����#JZG#����#JGS#����ɽ#JDZ#������#JIH#����#JIJ#����#JIU#�Ž�#JZH#��կ��#CHW#��Ȫ#JUR#����#KHG#��ʲ#KAF#����#KAP#��ƽ"&_
					"#KYA#��ԭ#KAY#��Զ#KAL#����#KLY#��������#KRL#�����#KUT#����#KMG#����#KUS#��ɽ#LXA#����#LAW#����#LAY#����#LZU#����#LAX#��Ϫ"&_
					"#LHW#����#LAF#�ȷ�#LAZ#����#LAH#�Ϻӿ�#LEC#�ֲ�#LEQ#����#LSA#��ɽ#LEZ#����#LES#��ˮ��#LSH#��ʯ#LJG#����#LIJ#��������#LIS#��ˮ"&_
					"#LYN#����#LYG#���Ƹ�#LHO#����#LYU#��Դ#LIY#����#LIU#��Դ#LCN#�ĳ�#LZI#��֥#LIZ#��֥����#LZN#����#LIA#�ٰ�#LCH#�ٲ�"&_
					"#LIC#�ٲ׵���#LIF#�ٷ�#LHA#�ٺ�#LJN#�ٽ�#LIX#����#LYI#����#LIB#�鱦#LIH#�躣#LZH#����#LAN#����#LIP#����ˮ#LOJ#����"&_
					"#LOK#����#LOQ#��Ȫ#LOY#����#LOD#¦��#LUZ#®ɽ#LZO#����#LUF#½��#LUX#º��#LUD#�޶�#LYA#����#LUH#���#MAC#���#MAA"&_
					"#��ɽ#MAZ#������#MAM#ï��#MES#üɽ#MEH#÷�ӿ�#MZU#÷��#MEZ#����#MIQ#��Ȫ#MIS#��ɽ#MIG#����#MIZ#����#MDG#ĵ����"&_
					"#NEJ#�ڽ�#NAU#����#NAQ#��������#NAA#�ϰ�#KHN#�ϲ�#NAO#�ϳ�#NAH#�Ϻ�#NKG#�Ͼ�#NNG#����#NAP#��ƽ#NTG#��ͨ#NAX#����"&_
					"#NNY#����#NIA#����#NGB#����#NID#����#NIG#����#PZI#��֦��#PAJ#�̽�#PEZ#����#PEL#����#PIZ#����#PDS#ƽ��ɽ#PID#ƽ��"&_
					"#PIH#ƽ��#PIL#ƽ��#PXA#ƾ��#PIX#Ƽ��#PUT#����#PUY#���#PUN#����#QIT#��̨��#NDG#�������#QID#����#QIH#ǧ����#QIJ"&_
					"#Ǳ��#QZO#����#SHP#�ػʵ�#QYA#����#TAO#�ൺ#QIZ#����#QYN#��Զ#IQN#����#QIY#��������#QIL#����#QHA#��#QUF#����#QUJ#����"&_
					"#JUZ#����#QUZ#Ȫ��#REH#�ʻ�#REQ#����#RIK#�տ���#RIZ#����#ROC#�ٳ�#RUG#���#RUZ#����#RUS#��ɽ#RUA#��#RUL#����#SAM#����Ͽ"&_
					"#SMI#����#SAS#��ˮ#SYX#����#SHG#ɽ��#SHN#ɽ�ϵ���#SWA#��ͷ#SHW#��β#SHL#����#SHQ#����#SHA#�Ϻ�#SHR#����#SYU#����#SZI#��־"&_
					"#HSC#�ع�#SHS#��ɽ#SWU#����#SYG#����#SHX#����#SZX#����#SNJ#��ũ������#SHE#����#SZU#����#SYA#ʮ��#SHH#ʯ����#SJW#ʯ��ׯ"&_
					"#SHI#ʯʨ#SSH#ʯ��#SLA#����#SHY#˫Ѽɽ#SHD#˳��#SHZ#˷��#SYM#˼é#SIH#�Ļ�#SIP#��ƽ#SOY#��ԭ#SOH#����#SOZ#���̱���"&_
					"#SZV#����#XIQ#��Ǩ#XIO#����#SUF#��Һ�#SUH#�绯#SUZ#����#SUN#����#TCG#����#TSA#̨ɽ#TAZ#̨��#TAC#̫��#TYN#̫ԭ#TAA#̩��"&_
					"#TAX#̩��#TZU#̩��#TAS#��ɽ#TIC#�쳤#TSN#���#TIM#����#TIS#��ˮ#TLI#����#TIL#����#TNH#ͨ��#TGO#ͨ��#TOS#ͨʲ#TOZ#ͨ��"&_
					"#TOL#ͬ��#TOX#ͩ��#TOC#ͭ��#TOG#ͭ��#TOR#ͭ��#TUL#��³��#WAN#����#WEH#����#WEF#Ϋ��#WEN#μ��#WEG#����#WEL#����#WNZ#����"&_
					"#WEC#�Ĳ�#WED#�ĵ�#WES#��ɽ��#WHA#�ں�#HLH#��������#URC#��³ľ��#WUX#����#WJI#�⽭#WHU#�ߺ�#WUZ#����#XZS#��ָɽ#WUH#�人"&_
					"#WUJ#���#WUW#����#WXI#��Ѩ#WUS#����ɽ#SIA#����#XIC#����#XNN#����#JHG#��˫����#XIL#���ֺ���#XMN#����#XIA#����#XAN#����"&_
					"#XIY#����#HKG#���#XIG#�������#XIT#��̶#XFN#�差#XCH#���#XGN#Т��#XIU#����#XIH#�»�#XIM#����#XIX#����#XIN#����#XYU#����"&_
					"#XYA#����#XYI#����#XEN#�˳�#XYN#����#XNT#��̨#XUZ#����#XCA#���#XUC#����#YAA#�Ű�#YNT#��̨#ENY#�Ӱ�#YNJ#�Ӽ�#YNZ#�γ�"&_
					"#YZH#����#YAS#��ʦ#YAD#�㵴ɽ#YAZ#����#YZO#����#YAC#����#YAJ#����#YAQ#��Ȫ#YAH#��˷#YCH#����#YIN#����#YIZ#����#YBP#�˱�"&_
					"#YIH#�˲�#YIC#�˴�#YIX#����#YZU#����#YIW#����#YIY#����#INC#����#YIT#ӥ̶#XYG#����#YIK#Ӫ��#YOA#����#YOK#����#YOZ#����"&_
					"#YUA#��Ҧ#UYN#����#YUZ#����#YUL#����#YUM#����#YUS#������#YUX#��Ϫ#YUY#����#YNF#�Ƹ�#YUC#�˳�#ZAY#����#ZAZ#��ׯ#ZHL"&_
					"#������#ZHA#տ��#ZHJ#�żҸ�#DYG#�żҽ�#ZJK#�żҿ�#ZHY#��Ҵ#ZHP#��ƽ#ZHZ#����#ZAT#��ͨ#ZHQ#����#ZJA#��#CGO#֣��#ZIS#��ɽ"&_
					"#ZHX#����#CKG#����#HSN#��ɽ#ZHK#�ܿ�#ZHN#��ׯ#ZHO#����#ZHC#����#ZUH#�麣#ZJI#����#ZHM#פ���#ZHU#����#ZIX#����#ZIY#����"&_
					"#ZIB#�Ͳ�#ZIG#�Թ�#ZOC#�޳�#ZHH#��#ZYI#����"
		citycode=split(citystring,"#",-1)
		for vk=0 to ubound(citycode)-1 step 2
			if citycode(vk)=vstr then
				GetCityName=citycode(vk+1)
			end if
		next
End function
%>
</body>
</html>