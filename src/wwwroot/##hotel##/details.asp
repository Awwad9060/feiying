<!--#include file="include/cfg.asp"-->
<!--#include file="../ticket/include/conn.asp"-->
<!--#include file="../ticket/include/function.asp"-->
<%
dim PropertyID,Start_date,End_date
From_url = Cstr(Request.ServerVariables("HTTP_REFERER")) 
Serv_url = Cstr(Request.ServerVariables("SERVER_NAME")) 
if mid(From_url,8,len(Serv_url)) <> Serv_url then 
Server.Transfer "err.asp"
response.end 
end if 
PropertyID = request.Form("PropertyID")
Start_date = Replace(request.Form("Start_date"), "-", "")
End_date = Replace(request.Form("End_date"), "-", "")
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>酒店订房 - <%=ZXLCompanyStr%></title>
<META content=酒店订房 - 飞瀛网 name=keywords>
<META content=酒店订房 - 飞瀛网。 name=description>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"> 
<link href="html/public_global.css" rel="stylesheet" type="text/css" />
<link href="html/public_hotels.css" rel="stylesheet" type="text/css" />
<link href="html/private_hotels_choice.css" rel="stylesheet" type="text/css" />
<link href="../Css/main_api.css" type="text/css" rel="stylesheet" />
</head> 
<body text="555555" link="555555" vlink="555555" alink="555555" leftmargin="0" topmargin="0" marginwidth="0" arginheight="0">
<!--#include file="header.asp"-->
<TABLE cellSpacing="0" cellPadding="0" width="980" border="0" align="center">
	<TR>
		<td valign=top width="980">
			<!-- hotel head -->
<%
mypostdata = "request=" &_ 
"<OTRequest>" &_
"<TransactionName>SingleHotelSearch</TransactionName>" &_
"<Header>" &_
"<SessionID>1111111111</SessionID>" &_
"<Invoker>HBE</Invoker>" &_
"</Header>" &_
"<IdentityInfo>" &_
"<OfficeID>"&Pimdb(1)&"</OfficeID>" &_
"<UserID>"&Pimdb(2)&"</UserID>" &_
"<Password>"&Pimdb(3)&"</Password>" &_
"</IdentityInfo>" &_
"<ScrollingInfo>" &_
"<DisplayReq>50</DisplayReq>" &_
"<PageItems>10</PageItems>" &_
"<PageNo>1</PageNo>" &_
"</ScrollingInfo>" &_
"<SearchConditions>" &_
"<CheckInDate>"&Start_date&"</CheckInDate>" &_
"<CheckOutDate>"&End_date&"</CheckOutDate>" &_
"<PropertyID>"&PropertyID&"</PropertyID>" &_
"<RoomTypeCode></RoomTypeCode>" &_
"</SearchConditions>" &_
"</OTRequest>"
jw_sendPath = Pimdb(0) 
set objHTTP = Server.CreateObject("Microsoft.XMLHTTP") 
objHTTP.open "POST",jw_sendPath, false '' 
objHTTP.SetRequestHeader "Content-Type", "application/x-www-form-urlencoded" 
objHTTP.Send(mypostdata)  
Send_Result = objHTTP.responseText 'objHTTP.responsebody... 
set xmlDOC =Server.CreateObject("MSXML.DOMDocument") 
xmlDoc.loadxml(Send_Result)  
set objOHOrders = xmlDoc.getElementsByTagName("Data/HotelInfo")
HotelName = objOHOrders.item(i).selectSingleNode("HotelName").text
RankCode = objOHOrders.item(i).selectSingleNode("RankCode").text
Address = objOHOrders.item(i).selectSingleNode("Address").text
TrafficInfo = objOHOrders.item(i).selectSingleNode("TrafficInfo").text
Telephone = objOHOrders.item(i).selectSingleNode("Telephone").text
BasicInfo = objOHOrders.item(i).selectSingleNode("BasicInfo").text
GuaranteePolicy = objOHOrders.item(i).selectSingleNode("GuaranteePolicy").text
FAX = objOHOrders.item(i).selectSingleNode("FAX").text
%>
<div id="pubGlobal_main" style="width:980px;">
    <div id="pubGlobal_main_conBlock" style="width:980px;">
		<div id="pubGlobal_main_conBlock_content" style="width:980px;">
		    <div class="pubGlobal_contentblk01">
        <div class="pubGlobal_contentblk01_lt"></div>
        <div class="pubGlobal_contentblk01_rt"></div>
				<div class="pubGlobal_contentblk01_content">
				  <div id="pubHotels_conTitle01"> 
					<div id="pubHotels_conTitle01_title"><% = HotelName %></div>
				  </div>
<div class="pubGlobal_segment01" >
<div class="pubGlobal_segment01_lt"></div>
<div class="pubGlobal_segment01_rt"></div>
<div class="pubGlobal_segment01_content">
<div class="priHtlChoice_hotList01" style="width:920px;">
<div style="font-size:12px; color:#1171AD; padding-bottom:5px;"> <font style="color:#1171AD">入住日期：<%=request.Form("Start_date")%>   离店日期：<%=request.Form("End_date")%></font></div>
<div style="font-size:12px; color:#1171AD"><hr style="height:1px; width:670px; color:#CCCCCC; "></div>
<div style="font-size:12px; color:#1171AD">星级：<img src=images/<%=RankCode%>xing.gif> &nbsp;&nbsp; 电话：<%=Telephone%></div>
<div style="font-size:12px; color:#1171AD"><hr style="height:1px; width:670px; color:#CCCCCC; "></div>
<div style="font-size:12px; color:#1171AD; padding-bottom:5px;">地理位置：<%=Address%></div>
<div class="priHtlChoice_hotList01_sumBigPic01" >
  <div class="priHtlChoice_sumBigPic01" style = "text-align: center;width:920px;">
	<table width="650" border="0" align="center" cellpadding="0" cellspacing="0">
		<tr align="center">
		<td width="25"></td>
		<td width="130">
			<TABLE style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; BORDER-BOTTOM: gray 1px solid" height=110 cellSpacing=0 cellPadding=0 width=130 bgColor=#ffffff border=0>
			<TBODY><TR><TD width="130" align=middle vAlign=center><IMG src="http://219.142.127.25/TDPWeb/htl/images/imagesHotel/<%=right(PropertyID,3)%>/WJ/<%=right(PropertyID,3)%>WJ01.jpg" onerror=javascript:this.src="images/no_img.gif" width=120 height=95 border=0></TD></TR></TBODY>
			</TABLE>
		</td>
		<td width="130">
			<TABLE style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; BORDER-BOTTOM: gray 1px solid" height=110 cellSpacing=0 cellPadding=0 width=130 bgColor=#ffffff border=0>
			<TBODY><TR><TD width="130" align=middle vAlign=center><IMG src="http://219.142.127.25/TDPWeb/htl/images/imagesHotel/<%=right(PropertyID,3)%>/DT/<%=right(PropertyID,3)%>DT01.jpg" onerror=javascript:this.src="images/no_img.gif" width=120 height=95 border=0></TD></TR></TBODY>
			</TABLE>
		</td>
		<td width="130">
			<TABLE style="BORDER-RIGHT: gray 1px solid; BORDER-TOP: gray 1px solid; BORDER-LEFT: gray 1px solid; BORDER-BOTTOM: gray 1px solid" height=110 cellSpacing=0 cellPadding=0 width=130 bgColor=#ffffff border=0>
			<TBODY><TR><TD width="130" align=middle vAlign=center><IMG src="http://219.142.127.25/TDPWeb/htl/images/imagesHotel/<%=right(PropertyID,3)%>/KF/<%=right(PropertyID,3)%>KF01.jpg" onerror=javascript:this.src="images/no_img.gif" width=120 height=95 border=0></TD></TR></TBODY>
			</TABLE>
		</td>
		</tr>
		<tr align="center"><td width="25"></td><td width="128" height="25" style="padding-top:3px; font-size:12px">酒店外景</td><td width="128" height="25" style="padding-top:3px; font-size:12px;">酒店大厅</td><td width="128" height="25" style="padding-top:3px ;font-size:12px;">酒店客房</td></tr>
	</table>
</div>
<div class="priHtlChoice_hotList01_summary">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=BasicInfo%></div>
</div>
</div>
</div>
</div>		    
  <div class="pubGlobal_segment01"> 
	<div class="pubGlobal_segment01_lt"></div>
	<div class="pubGlobal_segment01_rt"></div>
	<div class="pubGlobal_segment01_content" style="width:920px;"> 
	  <p class="pubHotels_segmenttitle01">酒店房型、房价</p>
	 <table class="pubHotels_romList01" style=" width:920px;" cellpadding="0" cellspacing="0">
		<thead>
		  <tr> 
			<th class="pubHotels_col04 pubHotels_borRight" style="width:100px;font-size:14px">房型</th>
			<th class="pubHotels_col03 pubHotels_borRight" style="width:85px;font-size:14px">门市价</th>
<%
	for d = 0 to 6
	weekDate = CDate(request.Form("Start_date"))
	weekDate = weekDate+ d
	Format_week = weekdayname(weekday(weekDate))
	Format_week = replace(Format_week,"星期","周")
%>
			<th class="pubHotels_col03 pubHotels_borRight" style="width:85px;font-size:14px" align="center"><%=Format_week%></th>
		<%next%>
			<th class="pubHotels_col06" style="width:85px;font-size:14px">预订</th>
		  </tr>
		</thead>
<%
set hotelobjInfo = xmlDoc.getElementsByTagName("Data/HotelInfo/RoomTypes/RoomType")
for j = 0 to hotelobjInfo.length - 1
	RoomName = hotelobjInfo.item(j).selectSingleNode("RoomName").text
	BedType = hotelobjInfo.item(j).selectSingleNode("BedType").text	
	Internet = hotelobjInfo.item(j).selectSingleNode("Internet").text
	RateAmount = hotelobjInfo.item(j).selectSingleNode("RoomRates/RoomRate/RateAmount").text
	BalPrice = hotelobjInfo.item(j).selectSingleNode("RoomRates/RoomRate/BalPrice").text
	BedType = hotelobjInfo.item(j).selectSingleNode("BedType").text
	Availability = hotelobjInfo.item(j).selectSingleNode("RoomRates/RoomRate/RoomQuotas/RoomQuota/CurrentNum").text
	Availability = ABS(Availability)
	RoomTypeDesc = hotelobjInfo.item(j).selectSingleNode("RoomTypeDesc").text
	'response.write RoomTypeDesc
	select case abs(Availability)
		case 0 
		Availability = "申请"
		case 1
		Availability = "余房"&Availability
		case 2
		Availability = "有房"
		case 3
		Availability = "满房"
		case 4
		Availability = "紧张"
	end select
%>
	<tbody>
		<tr>
			<td class="pubHotels_borRight" style="padding-left:10px; text-align:left; font-size:12px;"><%=RoomName%></td>
			<td class="pubHotels_borRight" style=" font-size:12px;"><STRIKE><%=RateAmount%></STRIKE></td>
			<td colspan="7" align="left">
				<table cellpadding="0" cellspacing="0"  width="640">
					<tr height="100%">
						<%
						'多房
						p = 0
						QianDate = CDate(request.Form("Start_date"))
						HuoDate = CDate(request.Form("End_date"))
						DateMax = DateDiff("d",QianDate,HuoDate)
						priceJG = ""
						MealZC = ""
						'response.write DateMax
						set hotelFx = hotelobjInfo.item(j).getElementsByTagName("RoomRates/RoomRate")
							For e = 0 to hotelFx.length - 1
								set hoteldate = hotelFx.item(e).getElementsByTagName("RoomQuotas/RoomQuota")
								For u = 0 to hoteldate.length - 1
									RateAmount = hotelFx.item(e).selectSingleNode("RateAmount").text
									Meal = hotelFx.item(e).selectSingleNode("Meal").text
									'response.write Meal 
									CurrentNum = hoteldate.item(u).selectSingleNode("CurrentNum").text
									p = p + 1
									response.write "<td class=""pubHotels_borRight"" style=""width:85px; font-size:12px;"" align=center>"&RateAmount&"<br>"&Breakfast(Meal)&"</td>"
									priceJG = priceJG&"|"&RateAmount
									MealZC = MealZC&"|"&Breakfast(Meal)
									if p mod 7 = 0 then
										response.write "</tr><tr>"
									End if
								next
							next
							If DateMax < 7 then
									td = 7 - DateMax
									for jj = 0 to td - 1
										response.write "<td class=""pubHotels_borRight"" style=""width:85px; font-size:12px;"">&nbsp;</td>"
									Next
										response.write "</tr><tr>"
								Elseif DateMax > 7 and DateMax mod 7 <> 0 then
									td = 7 - (DateMax mod 7)
									for jj = 0 to td -1
										response.write "<td class=""pubHotels_borRight"" style=""width:85px; font-size:12px;"">&nbsp;</td>"
									Next
										response.write "</tr><tr>"
							End if
						%>
					</tr>
				</table>
			</td>
			<%if Availability = "满房" then%>
			<td><a style="cursor: hand;" onClick="alert('提示：此房型当前已无可预订空房，请更换其它房型预订')"><img src=images/nofau.gif width=40 height=17 border=0></a></td>
			<%else%>
			<td>
			<a href="javascript:play('<%=RoomName%>','<%=priceJG%>','<%=MealZC%>')"><img src=images/order.gif width=37 height=19 border=0></a>			</td>
			<%end if%>
		<tr>
		<tr><td colspan="10" align="left"> <b style="font-size:12px;">房型信息：</b><font style="font-size:12px;"><%=RoomTypeDesc%></font></td></tr>
	</tbody>
<%
Next
%>
</table>
	  </div>
	<div class="pubGlobal_segment01_lb"></div>
	<div class="pubGlobal_segment01_rb"></div>
  </div>
<div class="pubGlobal_segment01">
		<div class="pubGlobal_segment01_lt"></div><div class="pubGlobal_segment01_rt"></div>
		<div class="pubGlobal_segment01_content">
<%
set yldobjInfo = xmlDoc.getElementsByTagName("Data/HotelInfo/Establishs/Establish") 
for j = 0 to yldobjInfo.length-1
	EstablishCategory = yldobjInfo.item(j).selectSingleNode("EstablishCategory").text
	EstablishNam = yldobjInfo.item(j).selectSingleNode("EstablishNam").text
	Comments = yldobjInfo.item(j).selectSingleNode("Comments").text
	if EstablishCategory = 0 then fytitle = "<span>宾馆餐饮</span>设施"
	if EstablishCategory = 1 then fytitle = "<span>宾馆会议</span>设施"
	if EstablishCategory = 2 then fytitle = "<span>宾馆娱乐与健身</span>设施"
	if EstablishCategory = 3 then fytitle = "<span>宾馆服务</span>项目"
%>
	<p class="priHtlChoice_segTitle01"><%=fytitle%></p>
	 <div class="priHtlChoice_assInfo01"><%=EstablishNam&" "&Comments%></div>
<%next%>
	<p class="priHtlChoice_segTitle01">可接受<span>信用卡</span>类型</p>
<%
set carddobjInfo = xmlDoc.getElementsByTagName("Data/HotelInfo/Features/Feature") 
for j = 0 to carddobjInfo.length - 1
	Category = carddobjInfo.item(j).selectSingleNode("Category").text
	Descriptions = carddobjInfo.item(j).selectSingleNode("Description").text
	'response.write Category
	if Category = "信用卡信息" then
%>
<div class="priHtlChoice_assInfo02"><%=Descriptions%></div>
<%
else
end if

next
set xmlDOC = nothing 
set objHTTP = nothing
%>
		</div>
	</div>  
</div>
	<div class="pubGlobal_contentblk01_lb"></div>
	<div class="pubGlobal_contentblk01_rb"></div>	
		</div> 		
		</div> 
	</div>
</div>
		</td>
	</TR>
</TABLE>
<!--#include file="footer.asp"-->
<form method="Post" name="HotelForm" action="hotellogin.asp" target="_blank">
	<input type="hidden" name="officeid" value="<%=PropertyID%>">
	<input type="hidden" name="hotelname" value="<%=HotelName%>">
	<input type="hidden" name="hoteltype" value="">
	<input type="hidden" name="Price" value="">
	<input type="hidden" name="MealZC" value="">
	<input type="hidden" name="add" value="<%=Address%>">
	<input type="hidden" name="tel" value="<%=Telephone%>">
	<input type="hidden" name="Start_date" value="<%=request.Form("Start_date")%>">
	<input type="hidden" name="End_date" value="<%=request.Form("End_date")%>">
</form>
<script language="javascript" type="text/javascript">
function play(hoteltype,Price,MealZC)
{
	var id,hotelname,hoteltype,Price,add,tel;
	window.document.HotelForm.hoteltype.value=hoteltype;
	window.document.HotelForm.Price.value=Price;
	window.document.HotelForm.MealZC.value=MealZC;
	document.HotelForm.submit();
}
</script>
</body>
</html>