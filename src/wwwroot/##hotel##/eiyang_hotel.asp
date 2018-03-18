<!--#include file="include/cfg.asp"-->
<!--#include file="../ticket/include/conn.asp"-->
<!--#include file="../ticket/include/function.asp"-->
<%
dim page,city_name,City,Star_ID,Price,Start_date,End_date,Hotel_Cname,pagenam
From_url = Cstr(Request.ServerVariables("HTTP_REFERER")) 
Serv_url = Cstr(Request.ServerVariables("SERVER_NAME")) 
if mid(From_url,8,len(Serv_url)) <> Serv_url then 
	Server.Transfer "err.asp"
	response.end 
end if 

if request.form("Price") <> "0" then
	Price = Split(request.form("Price"),"-")
	RateMin = Price(0)
	RateMax = Price(1)
end if

Hotel_City = request.form("freecityname")

page = request.form("page")
If page = "" then page = "1"
Star_ID = request.form("Star_ID")
Start_date = Replace(request.form("Start_date"), "-", "")
End_date = Replace(request.form("End_date"), "-", "")
Hotel_Cname = Server.URLencode(Trim(request.form("Hotel_Cname")))
porCode = Server.URLencode(Trim(request.form("porCode")))
pagenam = 15
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>酒店订房 - <%=ZXLCompanyStr%></title>
<META content=酒店订房 - 飞瀛网 name=keywords>
<META content=酒店订房 - 飞瀛网。 name=description>
<link href="html/public_global.css" rel="stylesheet" type="text/css" />
<link href="html/public_hotels.css" rel="stylesheet" type="text/css" />
<link href="html/private_hotels_choice.css" rel="stylesheet" type="text/css" />
<link href="../Css/main_api.css" type="text/css" rel="stylesheet" />
</head> 
<body text="555555" link="555555" vlink="555555" alink="555555" leftmargin="0" topmargin="0" marginwidth="0" arginheight="0">
<!--#include file="header.asp"-->
<TABLE cellSpacing="0" cellPadding="0" width="980" border="0" ID="Table1" align="center">
	<TR>
		<td width="980">
			<div id="pubGlobal_main" style="width:980px;">
				<div id="pubGlobal_main_conBlock" style="width:980px;">
					<div id="pubGlobal_main_conBlock_content">
						<div class="pubGlobal_contentblk01">
					<div class="pubGlobal_contentblk01_lt"></div>
					<div class="pubGlobal_contentblk01_rt"></div>
							<div class="pubGlobal_contentblk01_content" >
							  <div id="pubHotels_conTitle01"> 
								<div id="pubHotels_conTitle01_title"> <% = getCity(Hotel_City) %> <b style="font-size:14px; color:#333399;">入住日期：<% = Request("Start_date")%> 离店日期：<% = Request("End_date")%></b> </div>
							  </div>
			
			<%
			mypostdata = "request=" &_ 
			"<OTRequest>" &_
			"<TransactionName>HotelSearch</TransactionName>" &_
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
			"<DisplayReq>30</DisplayReq>" &_
			"<PageItems>"&pagenam&"</PageItems>" &_
			"<PageNo>"&page&"</PageNo>" &_
			"</ScrollingInfo>" &_
			"<SearchConditions>" &_
			"<GDS></GDS>" &_
			"<CheckInDate>"&Start_date&"</CheckInDate>" &_
			"<CheckOutDate>"&End_date&"</CheckOutDate>" &_
			"<PropertyDetail>" &_
			"<CityCode>"&Hotel_City&"</CityCode>" &_
			"<Supplier></Supplier>" &_
			"<PropertyName>"&Hotel_Cname&"</PropertyName>" &_
			"<Transportation/>" &_
			"<PorName>"&porCode&"</PorName>" &_
			"<AreaCode/>" &_
			"<RankCode>"&Star_ID&"</RankCode>" &_
			"</PropertyDetail>" &_
			"<RateDetail>" &_
			"<PaymentType/>" &_
			"<Currency></Currency>" &_
			"<RateMin>"&RateMin&"</RateMin>" &_
			"<RateMax>"&RateMax&"</RateMax>" &_
			"<RateCode/>" &_
			"</RateDetail>" &_
			"<RoomDetail></RoomDetail>" &_
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
			maxNum = xmlDoc.getElementsByTagName("Data/HotelsInfo/HotelNumber").item(0).text
			if maxNum = 0 then
				response.write "对不起，没有找到相关酒店"
			End if
			set objOHOrders = xmlDoc.getElementsByTagName("Data/HotelsInfo/HotelList/PropertyLineItem")
			for i = 0 to objOHOrders.length - 1 
			PropertyID = objOHOrders.item(i).selectSingleNode("PropertyID").text
			NameS = objOHOrders.item(i).selectSingleNode("Name").text
			Rank = objOHOrders.item(i).selectSingleNode("Rank").text
			TEL = objOHOrders.item(i).selectSingleNode("TEL").text
			Address = objOHOrders.item(i).selectSingleNode("Address").text
			BasicInfo = objOHOrders.item(i).selectSingleNode("HotelFeatures/BasicInfo").text
			TrafficInfo = objOHOrders.item(i).selectSingleNode("HotelFeatures/TrafficInfo").text
			RoomName = objOHOrders.item(i).selectSingleNode("RoomRateDetail/RoomName").text
			SaleRate = objOHOrders.item(i).selectSingleNode("RoomRateDetail/SaleRate").text
			'response.End() 
			%>
			<div class="pubGlobal_segment01">
			<div class="pubGlobal_segment01_lt"></div>
			<div class="pubGlobal_segment01_rt"></div>
			<div class="pubGlobal_segment01_content">
			<div class="priHtlChoice_hotList01" style="width:920px;">
			<div class="priHtlChoice_hotList01_title"><a href="javascript:golist('<%=PropertyID%>')"><%=NameS%></a></div>
			<div style="font-size:12px; color:#1171AD">星级：<img src=images/<%= Rank %>xing.gif>&nbsp;&nbsp;&nbsp;电话：<%= TEL %> &nbsp;&nbsp;&nbsp;位置：<%= Address %></div>
			<div class="priHtlChoice_hotList01_summary"><img class="priHtlChoice_sumPic" src='http://219.142.127.25/TDPWeb/htl/images/imagesHotel/<%=right(PropertyID,3)%>/WJ/<%=right(PropertyID,3)%>WJ01.jpg' onerror=javascript:this.src="images/no_img.gif" width='60' height='60' border='0'><div>&nbsp;&nbsp;&nbsp;&nbsp;<%= BasicInfo%></div></div>
			<table class="pubHotels_romList01" cellpadding="0" cellspacing="0">
			<thead>
				<tr>
					<th class="pubHotels_col01 pubHotels_borRight" style="font-size:14px;">&nbsp;</th>
					<th class="pubHotels_col04 pubHotels_borRight" style="font-size:14px;">房型</th>
					<th class="pubHotels_col03 pubHotels_borRight" style="font-size:14px;">门市价</th>
					<th class="pubHotels_col03 pubHotels_borRight" style="font-size:14px;">会员价</th>
					<th class="pubHotels_col06 pubHotels_borRight" style="font-size:14px;">早餐</th>
					<th class="pubHotels_col06 pubHotels_borRight" style="font-size:14px;">首日房态</th>
					<th class="pubHotels_col06" style="font-size:14px;">预订</th>
				</tr>
			</thead>
			<%
			set objHotel = objOHOrders.item(i).getElementsByTagName("RoomRateDetail")
			for j = 0 to objHotel.length - 1
				if j > 2 then
					exit for 
				end if 
			RoomName = objHotel.item(j).selectSingleNode("RoomName").text
			DescriptionS = objHotel.item(j).selectSingleNode("Description").text
			SaleRate = objHotel.item(j).selectSingleNode("SaleRate").text
			DisplayRate = objHotel.item(j).selectSingleNode("DisplayRate").text
			SaleRate = objHotel.item(j).selectSingleNode("SaleRate").text
			MealPlan = objHotel.item(j).selectSingleNode("MealPlan").text
				select case MealPlan 
					case 0 
					MealPlan = "无早"
					case 1
					MealPlan = "单早"
					case 2
					MealPlan = "双早"
					case 3
					MealPlan = "双早"
				end select
			Availability = objHotel.item(j).selectSingleNode("Availability").text
				select case abs(Availability)
					case 0 
					Availability = "申请"
					case 1
					Availability = "关闭"
					case 2
					Availability = "多房"
					case 3
					Availability = "满房"
					case 4
					Availability = "紧张"
				end select
			%>
			<tbody>
				<tr>
				<td class="pubHotels_borRight" style="font-size:12px;">&nbsp;</td>
				<td class="pubHotels_borRight" align="left" style="font-size:12px;"><% =RoomName %></td>
				<td class="pubHotels_borRight pubGlobal_decStyle02" style="font-size:12px;"><%=DisplayRate%></td>
				<td class="pubHotels_borRight" style="font-size:12px;color:#FF6600"><b><%=SaleRate%></b></td>
				<td class="pubHotels_borRight" style="font-size:12px;color:#008000"><%= MealPlan %></td>
				<td class="pubHotels_borRight" style="font-size:12px;"> <%= Availability %></td>
				<td><a href="javascript:golist('<%=PropertyID%>')"><img src=images/order.gif width=37 height=19 border=0></a></td>
			</tr>
			</tbody>
			<%
			next
			%>
			</table>
			<div class="priHtlChoice_allRoom">
			<div class="priHtlChoice_segBtn01"> <a href="javascript:golist('<%=PropertyID%>')">全部房型</a></div>
			</div>
			</div>
			</div>
			<div class="pubGlobal_segment01_lb"></div>
			<div class="pubGlobal_segment01_rb"></div>
			</div>
			<%
			next 
			response.Write "<div style=""text-align:right;width:950px;"">"
			response.Write "当前第<font color=red> "&page&" </font> 页&nbsp;&nbsp;&nbsp;&nbsp;"
			response.Write "共找到 "&maxNum&" 条记录&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;"
			m = cint ( maxNum / pagenam )
			for d = 1 to m + 1
			response.write "<a href=""javascript:gopage("&d&")"">"&d&"页</a>"
			next
			response.Write "</div>"
			set xmlDOC = nothing 
			set objHTTP = nothing
			%>
			</div>		    
				<div class="pubGlobal_contentblk01_lb"></div>
				<div class="pubGlobal_contentblk01_rb"></div>	
					</div> 		
					</div> 
				</div>
			</div>
		</td>
	</tr>
</table>
		
<!--#include file="footer.asp"-->
<form method="Post" name="startForm" action="HotelSearching.asp">
	<input type="hidden" name="freecityname" value="<%=Hotel_City%>">
	<input type="hidden" name="Start_date" value="<%=request.form("Start_date")%>">
	<input type="hidden" name="End_date" value="<%=request.form("End_date")%>">
	<input type="hidden" name="Hotel_Cname" value="<%=Trim(request.form("Hotel_Cname"))%>">
	<input type="hidden" name="Price" value="<%=request.form("Price")%>">
	<input type="hidden" name="Star_ID" value="<%=request.form("Star_ID")%>">
	<input type="hidden" name="page" value="">
</form>
<form method="Post" name="hotelList" action="HotelListSearching.asp" target="_blank">
	<input type="hidden" name="Start_date" value="<%=request.form("Start_date")%>">
	<input type="hidden" name="End_date" value="<%=request.form("End_date")%>">
	<input type="hidden" name="PropertyID" value="">
</form>
<script language="javascript" type="text/javascript">
function gopage(page)
{
	var page; 
	window.document.startForm.page.value=page;
	document.startForm.submit();
}
function golist(id)
{
	var id; 
	window.document.hotelList.PropertyID.value=id;
	document.hotelList.submit();
}
</script>
</body>
</html>