<%@LANGUAGE="VBSCRIPT" CODEPAGE="936"%>
<%Response.Charset="Gb2312"%> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<html>
<title>酒店详细信息</title>
<style type="text/css">
body,td,th {
	font-size: 12px;
	color: #000000;
	line-height: 18px;
}
.textbotton1 {  border: 1px #999999 solid;BACKGROUND: #DBC0E4;FONT-SIZE: 12px;font-family: 宋体; text-align:center; padding-top:3px; color:#FF0000;}
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

'读取数据开始
jw_sendPath = "http://hotel.eiyang.com/HBE/servlet/tdplogicbookingcontroller" 
set objHTTP = Server.CreateObject("Microsoft.XMLHTTP") 
objHTTP.open "POST",jw_sendPath, false '' 
objHTTP.SetRequestHeader "Content-Type", "application/x-www-form-urlencoded" 
objHTTP.Send(mypostdata)  
Send_Result = objHTTP.responseText 'objHTTP.responsebody... 
set xmlDOC =Server.CreateObject("MSXML.DOMDocument") 
xmlDoc.loadxml(Send_Result)  

maxNum = xmlDoc.getElementsByTagName("Data/HotelsInfo/HotelNumber").item(0).text
set blogchild = xmlDoc.getElementsByTagName("Data/HotelsInfo/HotelList/PropertyLineItem") '获取NodeList 
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
						hotel_Rank="1星级"
					ElseIf hotel_Rank="1A" Then
						hotel_Rank="准一星"
					ElseIf hotel_Rank="2" Then
						hotel_Rank="2星级"
					ElseIf hotel_Rank="2A" Then
						hotel_Rank="准二星"
					ElseIf hotel_Rank="3" Then
						hotel_Rank="3星级"
					ElseIf hotel_Rank="3A" Then
						hotel_Rank="准三星"
					ElseIf hotel_Rank="4" Then
						hotel_Rank="4星级"
					ElseIf hotel_Rank="4A" Then
						hotel_Rank="准四星"
					ElseIf hotel_Rank="5" Then
						hotel_Rank="5星级"
					ElseIf hotel_Rank="5A" Then
						hotel_Rank="准五星"
					End If
				%><%If hotel_Rank<>"" then response.Write hotel_Rank%></td>
				<td width="10%" align="right"><strong>城市：</strong></td>
				<td width="12%"><%If hotel_City<>"" then response.Write GetCityName(hotel_City)%></td>
				<td width="12%"><strong>供应商：</strong></td>
				<td width="17%"><%If hotel_SplName<>"" then response.Write hotel_SplName%></td>
			  </tr>
			  <tr bgcolor="#FFFFFF">
				<td height="25" colspan="6">
				  <table width="556" border="0" align="center" cellpadding="3" cellspacing="1" bgcolor="#999999">
					<tr>
					  <td width="78" height="20" align="right" bgcolor="#F3F3F3"><strong>联系电话：</strong></td>
					  <td width="463" bgcolor="#FFFFFF">
					  <%
					  If hotel_TEL<>"" then hotel_contact=hotel_TEL
					  If hotel_FAX<>"" then hotel_contact="&nbsp;&nbsp;传真："&hotel_FAX
					  response.Write hotel_contact
					  %>
					  </td>
					</tr>
					<tr>
					  <td height="20" align="right" bgcolor="#F3F3F3"><strong>地址：</strong></td>
					  <td bgcolor="#FFFFFF"><%If hotel_Address<>"" then response.Write hotel_Address%></td>
					</tr>
					<tr>
					  <td height="20" align="right" bgcolor="#F3F3F3"><strong>简单介绍：</strong></td>
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
							  	<input name="Submit" type="submit" class="textbotton1" value="　预　订　">
							  </td>
							</tr>
							<tr bgcolor="#FFFFFF">
							  <td height="25" colspan="3" bgcolor="#F3F3F3"><table width="550" height="25" border="0" cellpadding="0" cellspacing="0">
								  <tr align="center">
									<td width="69" align="center" bgcolor="#F3F3F3"><strong>前台价格：</strong></td>
									<td width="57" align="left" bgcolor="#F3F3F3" class="red">
									    <%If room_DisplayRate<>"" then response.Write "￥"&room_DisplayRate%></td>
									<td width="68" align="center" bgcolor="#F3F3F3"><strong>销售价格：</strong></td>
									<td width="65" align="left" bgcolor="#F3F3F3" class="red">
									  <%If room_SaleRate<>"" then response.Write "￥"&room_SaleRate%></td>
									<td width="78" align="center" bgcolor="#F3F3F3"><strong>房态/房源：</strong></td>
									<td width="68" align="left" bgcolor="#F3F3F3" class="red">
									    <%
										If room_Availability<>"" then
											room_Availability=replace(room_Availability,"0","申请")
											room_Availability=replace(room_Availability,"1","关闭")
											room_Availability=replace(room_Availability,"2","配额")
											room_Availability=replace(room_Availability,"3","满房")
											room_Availability=replace(room_Availability,"4","房紧")
											response.Write room_Availability
										End if
									%>
							  	<!--<input name="room_Availability" type="hidden" value="< %'=room_Availability%>">-->
									</td>
									<td width="82" align="center" bgcolor="#F3F3F3"><strong>旅客类型：</strong></td>
									<td width="63" align="left" bgcolor="#F3F3F3" class="red">
									    <%
										If room_PassengerType<>"" then
											room_PassengerType=replace(room_PassengerType,"A","所有")
											room_PassengerType=replace(room_PassengerType,"D","内宾")
											room_PassengerType=replace(room_PassengerType,"F","外宾")
											response.Write room_PassengerType
										End if
									%>
							  	<!--input name="room_PassengerType" type="hidden" value="< %'=room_PassengerType%>"-->
									</td>
								  </tr>
							  </table></td>
							</tr>
							<tr bgcolor="#FFFFFF">
							  <td height="25" align="right" bgcolor="#F3F3F3"><strong>备注：</strong></td>
							  <td colspan="2">
								<%
								If room_MealPlan<>"" then
									room_MealPlan=replace(room_MealPlan,"0","无早餐")
									room_MealPlan=replace(room_MealPlan,"1","单早餐")
									room_MealPlan=replace(room_MealPlan,"2","双早餐")
									room_MealPlan="早餐情况："&room_MealPlan
									response.Write room_MealPlan
								End if
								%>
								<%
								If room_RateChanged<>"" then
									room_RateChanged=replace(room_RateChanged,"N","价格无变化")
									room_RateChanged=replace(room_RateChanged,"Y","价格有变化")
									room_RateChanged="；&nbsp;&nbsp;"&room_RateChanged
									response.Write room_RateChanged
								End if
								%>
							  	<!--input name="room_PassengerType" type="hidden" value="< %'=room_MealPlan&room_RateChanged%>"-->
							  </td>
							</tr>
							<tr bgcolor="#FFFFFF">
							  <td height="25" align="right" bgcolor="#F3F3F3"><strong>描述：</strong></td>
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
		citystring="ABA#阿坝州#ACH#阿城#AKU#阿克苏#AAT#阿勒泰#ATU#阿图什#ANJ#安吉#AKA#安康#ANL#安陆#AQG#安庆#ANS#安顺#AYN#安阳"&_
					"#AOG#鞍山#MFM#澳门#BAZ#巴中#BAC#白城#BAS#白山#BSI#百色#BFU#蚌埠#BAV#包头#BAJ#宝鸡#BAD#保定#BSD#保山#BEA#北安#BDH#北戴河"&_
					"#BHY#北海#PEK#北京#BEL#北流#BEN#北宁#BEX#本溪#BIJ#毕节#BIZ#滨州#BOZ#亳州#BOL#博乐#CAZ#沧州#CDA#昌都#CDU#昌都地区#CHJ#昌吉"&_
					"#CGQ#长春#CGE#长葛#CSX#长沙#CIH#长治#CGD#常德#CHN#常宁#CHS#常熟#CZX#常州#CHU#巢湖#CHG#朝阳#CHY#潮阳#CZH#潮州#CEZ#郴州"&_
					"#CTU#成都#CHD#承德#CHA#澄海#CZU#池州#CHB#赤壁#CIF#赤峰#CHZ#崇州#CUZ#滁州#CHX#楚雄#CIX#慈溪#COH#从化#DZH#达州#DAA#大安"&_
					"#DAF#大丰#DLU#大理#DLC#大连#DAQ#大庆#DAT#大同#DAX#大兴安岭#DYE#大冶#DDG#丹东#DAJ#丹江口#DYA#丹阳#DAZ#儋州#DAY#当阳"&_
					"#DEL#德令哈#DEY#德阳#DZO#德州#DEF#登封#DEZ#邓州#DIG#迪庆#DIQ#迪庆州#DXN#定西#DIX#定西地区#DOT#东台#DGM#东莞#DOX#东兴"&_
					"#DYN#东阳#DOY#东营#DOJ#都江堰#DUJ#都匀#DUH#敦化#DNH#敦煌#EMS#峨眉山#ERD#鄂尔多斯#EZH#鄂州#ENP#恩平#ENH#恩施#ERL#二连浩特"&_
					"#PAY#番禺#FAC#防城港#FEC#丰城#FEH#奉化#FUO#佛山#FUA#福安#FUD#福鼎#FUQ#福清#FOC#福州#FUS#抚顺#FUZ#抚州#FUK#阜康#FUX#阜新"&_
					"#FUG#阜阳#FUY#富阳#GAZ#甘孜州#GZH#赣州#GAM#高明#GAY#高邮#GAC#藁城#GOQ#格尔木#GEJ#个旧#GOY#巩义#GUA#广安#GHN#广汉#GUS#广水"&_
					"#GUY#广元#CAN#广州#GUG#贵港#GUX#贵溪#KWE#贵阳#KWL#桂林#GUP#桂平#HRB#哈尔滨#HMI#哈密#HDO#海东#HAD#海东地区#HAK#海口#HAL#海林"&_
					"#HAM#海门#HAN#海南州#HAI#海宁#HDN#邯郸#HAC#韩城#HCH#汉川#HZG#汉中#HGH#杭州#HFE#合肥#HEZ#合作#HTN#和田#HEC#河池#HEY#河源"&_
					"#HZE#菏泽#HZH#贺州#HEB#鹤壁#HEG#鹤岗#HSH#鹤山#HEK#黑河#HSU#衡水#HNY#衡阳#HOH#洪湖#HOM#侯马#HET#呼和浩特#HUL#呼伦贝尔#HZO#湖州"&_
					"#HLD#葫芦岛#HLI#虎林#HDU#花都#HUD#华甸#HYI#华阴#HZU#化州#HUH#怀化#HUA#淮安#HUB#淮北#HUI#淮南#HUG#黄冈#HYE#黄骅#HUN#黄南州"&_
					"#TXN#黄山#HUS#黄石#HYN#黄岩#HUC#晖春#HYA#惠阳#HUZ#惠州#JXI#鸡西#KNC#吉安#JIL#吉林#JSH#吉首#JMO#即墨#JIA#集安#JIN#集宁#TNA#济南"&_
					"#JNG#济宁#JYA#济源#JMU#佳木斯#JIX#嘉兴#JGN#嘉峪关#JID#建德#JIO#建瓯#JYG#建阳#JDU#江都#JIM#江门#JSA#江山#JIY#江阴#JYO#江油"&_
					"#JAN#姜堰#JNA#胶南#JIZ#胶州#JZU#焦作#JHE#蛟河#JYN#揭阳#JIS#界首#JCH#金昌#JHA#金华#JIT#金坛#JNZ#锦州#JIC#晋城#JJA#晋江#JZO#晋中"&_
					"#JMN#荆门#JZG#荆州#JGS#井冈山#JDZ#景德镇#JIH#景洪#JIJ#靖江#JIU#九江#JZH#九寨沟#CHW#酒泉#JUR#句容#KHG#喀什#KAF#开封#KAP#开平"&_
					"#KYA#开原#KAY#开远#KAL#凯里#KLY#克拉玛依#KRL#库尔勒#KUT#奎屯#KMG#昆明#KUS#昆山#LXA#拉萨#LAW#莱芜#LAY#莱阳#LZU#莱州#LAX#兰溪"&_
					"#LHW#兰州#LAF#廊坊#LAZ#阆中#LAH#老河口#LEC#乐昌#LEQ#乐清#LSA#乐山#LEZ#雷州#LES#冷水江#LSH#离石#LJG#丽江#LIJ#丽江地区#LIS#丽水"&_
					"#LYN#溧阳#LYG#连云港#LHO#连州#LYU#涟源#LIY#辽阳#LIU#辽源#LCN#聊城#LZI#林芝#LIZ#林芝地区#LZN#林州#LIA#临安#LCH#临沧"&_
					"#LIC#临沧地区#LIF#临汾#LHA#临海#LJN#临江#LIX#临夏#LYI#临沂#LIB#灵宝#LIH#凌海#LZH#柳州#LAN#六安#LIP#六盘水#LOJ#龙井"&_
					"#LOK#龙口#LOQ#龙泉#LOY#龙岩#LOD#娄底#LUZ#庐山#LZO#泸州#LUF#陆丰#LUX#潞西#LUD#罗定#LYA#洛阳#LUH#漯河#MAC#麻城#MAA"&_
					"#马鞍山#MAZ#满洲里#MAM#茂名#MES#眉山#MEH#梅河口#MZU#梅州#MEZ#孟州#MIQ#米泉#MIS#密山#MIG#绵阳#MIZ#绵竹#MDG#牡丹江"&_
					"#NEJ#内江#NAU#那曲#NAQ#那曲地区#NAA#南安#KHN#南昌#NAO#南充#NAH#南海#NKG#南京#NNG#南宁#NAP#南平#NTG#南通#NAX#南雄"&_
					"#NNY#南阳#NIA#宁安#NGB#宁波#NID#宁德#NIG#宁国#PZI#攀枝花#PAJ#盘锦#PEZ#彭州#PEL#蓬莱#PIZ#邳州#PDS#平顶山#PID#平度"&_
					"#PIH#平湖#PIL#平凉#PXA#凭祥#PIX#萍乡#PUT#莆田#PUY#濮阳#PUN#普宁#QIT#七台河#NDG#齐齐哈尔#QID#启东#QIH#千岛湖#QIJ"&_
					"#潜江#QZO#钦州#SHP#秦皇岛#QYA#沁阳#TAO#青岛#QIZ#青州#QYN#清远#IQN#庆阳#QIY#庆阳地区#QIL#邛崃#QHA#琼海#QUF#曲阜#QUJ#曲靖"&_
					"#JUZ#衢州#QUZ#泉州#REH#仁怀#REQ#任丘#RIK#日喀则#RIZ#日照#ROC#荣城#RUG#如皋#RUZ#汝州#RUS#乳山#RUA#瑞安#RUL#瑞丽#SAM#三门峡"&_
					"#SMI#三明#SAS#三水#SYX#三亚#SHG#山南#SHN#山南地区#SWA#汕头#SHW#汕尾#SHL#商洛#SHQ#商丘#SHA#上海#SHR#上饶#SYU#上虞#SZI#尚志"&_
					"#HSC#韶关#SHS#韶山#SWU#邵武#SYG#邵阳#SHX#绍兴#SZX#深圳#SNJ#神农架林区#SHE#沈阳#SZU#嵊州#SYA#十堰#SHH#石河子#SJW#石家庄"&_
					"#SHI#石狮#SSH#石首#SLA#舒兰#SHY#双鸭山#SHD#顺德#SHZ#朔州#SYM#思茅#SIH#四会#SIP#四平#SOY#松原#SOH#松滋#SOZ#松滋宾馆"&_
					"#SZV#苏州#XIQ#宿迁#XIO#宿州#SUF#绥芬河#SUH#绥化#SUZ#随州#SUN#遂宁#TCG#塔城#TSA#台山#TAZ#台州#TAC#太仓#TYN#太原#TAA#泰安"&_
					"#TAX#泰兴#TZU#泰州#TAS#唐山#TIC#天长#TSN#天津#TIM#天门#TIS#天水#TLI#铁力#TIL#铁岭#TNH#通化#TGO#通辽#TOS#通什#TOZ#通洲"&_
					"#TOL#同里#TOX#桐乡#TOC#铜川#TOG#铜陵#TOR#铜仁#TUL#吐鲁番#WAN#万宁#WEH#威海#WEF#潍坊#WEN#渭南#WEG#温岭#WEL#温蛉#WNZ#温州"&_
					"#WEC#文昌#WED#文登#WES#文山州#WHA#乌海#HLH#乌兰浩特#URC#乌鲁木齐#WUX#无锡#WJI#吴江#WHU#芜湖#WUZ#梧州#XZS#五指山#WUH#武汉"&_
					"#WUJ#武进#WUW#武威#WXI#武穴#WUS#武夷山#SIA#西安#XIC#西昌#XNN#西宁#JHG#西双版纳#XIL#锡林浩特#XMN#厦门#XIA#仙桃#XAN#咸宁"&_
					"#XIY#咸阳#HKG#香港#XIG#香格里拉#XIT#湘潭#XFN#襄樊#XCH#项城#XGN#孝感#XIU#忻州#XIH#新会#XIM#新密#XIX#新乡#XIN#新沂#XYU#新余"&_
					"#XYA#信阳#XYI#信宜#XEN#兴城#XYN#兴义#XNT#邢台#XUZ#徐州#XCA#许昌#XUC#宣城#YAA#雅安#YNT#烟台#ENY#延安#YNJ#延吉#YNZ#盐城"&_
					"#YZH#兖州#YAS#偃师#YAD#雁荡山#YAZ#扬中#YZO#扬州#YAC#阳春#YAJ#阳江#YAQ#阳泉#YAH#阳朔#YCH#伊春#YIN#伊宁#YIZ#仪征#YBP#宜宾"&_
					"#YIH#宜昌#YIC#宜春#YIX#宜兴#YZU#宜州#YIW#义乌#YIY#益阳#INC#银川#YIT#鹰潭#XYG#荥阳#YIK#营口#YOA#永安#YOK#永康#YOZ#永州"&_
					"#YUA#余姚#UYN#榆林#YUZ#禹州#YUL#玉林#YUM#玉门#YUS#玉树州#YUX#玉溪#YUY#岳阳#YNF#云浮#YUC#运城#ZAY#枣阳#ZAZ#枣庄#ZHL"&_
					"#扎兰屯#ZHA#湛江#ZHJ#张家港#DYG#张家界#ZJK#张家口#ZHY#张掖#ZHP#漳平#ZHZ#漳州#ZAT#昭通#ZHQ#肇庆#ZJA#镇江#CGO#郑州#ZIS#中山"&_
					"#ZHX#钟祥#CKG#重庆#HSN#舟山#ZHK#周口#ZHN#周庄#ZHO#株州#ZHC#株洲#ZUH#珠海#ZJI#诸暨#ZHM#驻马店#ZHU#涿州#ZIX#资兴#ZIY#资阳"&_
					"#ZIB#淄博#ZIG#自贡#ZOC#邹城#ZHH#遵化#ZYI#遵义"
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