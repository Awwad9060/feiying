<!--#include file="include/include.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>酒店订房 - 飞瀛网</title>
<META content=酒店订房 - 飞瀛网 name=keywords>
<META content=酒店订房 - 飞瀛网。 name=description>
<LINK href="../ticket/css/indexcss.css" rel="StyleSheet">
<link href="../Css/main_api.css" type="text/css" rel="stylesheet" />
<SCRIPT src="js/city.js"></SCRIPT>
<SCRIPT src="js/autocity.js"></SCRIPT>
<SCRIPT src="js/QueryHotel.js"></SCRIPT>
<SCRIPT src="js/calendar.js"></SCRIPT>
<SCRIPT src="js/CitySearch.js"></SCRIPT>
</HEAD>
<body text="555555" link="555555" vlink="555555" alink="555555" leftmargin="0" topmargin="0" marginwidth="0" arginheight="0">
<!--#include file="header.asp"-->
<TABLE cellSpacing="0" cellPadding="0" width="950" border="0" ID="Table1" align="center">
	<TR>
		<td valign=top width="950">
			<!-- hotel head -->
			<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0" ID="Table5">
				<TR>
				   <td>
						<IMG src="Images/k_xl1.gif" align="absMiddle"> <font class="SearchTitle">酒店预订</font>
					</td>
					<TD style="PADDING-RIGHT: 5px" align="right">
						<TABLE height="9" cellSpacing="1" cellPadding="0" width="258" bgColor="#b7c8dd" border="0"
							ID="Table2">
							<TR bgColor="#e8f0fa">
								<TD bgColor="#4270bd"></TD>
								<TD></TD>
								<TD></TD>
								<TD></TD>
								<TD></TD>
								<TD></TD>
							</TR>
						</TABLE>
						<TABLE height="9" cellSpacing="0" cellPadding="0" width="258" border="0"
							ID="Table2">
							<TR height=18>
								<TD align=center>查询</TD>
								<TD align=center>选择</TD>
								<TD align=center>预订</TD>
								<TD align=center>确认</TD>
								<TD align=center>预付</TD>
								<TD align=center>完成</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<!-- Hotel head -->
			<!-- 酒店查询框 -->
			<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0" ID="Table3" >
				<tr>
					<td >
						
						<FORM name="QueryHotelForm" action="HotelSearching.asp" method="Post" style="margin:0px;" target="_blank">
							<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table7">
								<TR Height=30>
									<TD class="fontcontentorg" width="100%"><IMG height="13" src="images/hotel_icon1.gif" width="13">选择城市</TD>
								</TR>
								<TR>
									<TD style="PADDING-LEFT: 9px">
										<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table8" bgColor=#eff7ff>
											<TR>
												<TD vAlign="center" width="13%" height="28">目的城市：</TD>
												<TD vAlign="center" colSpan="5"><INPUT class="searchtext" id="freecitycode" style="WIDTH: 110px" onChange="inputCityChange(this)" value="PEK" name="freecitycode"> <INPUT id="freecityname" type="hidden" value="PEK" name="freecityname">
													<SELECT class="searchtext" style="WIDTH: 192px" onChange="selectChange(this);"  onpropertychange="selectChange(this);" name="citycode" ID="Select1">
														<OPTION value="PEK" selected>BEIJING北京PEK</OPTION>
														<SCRIPT src="js/b2bcity.js"></SCRIPT>
													</SELECT><img src="../ticket/Images/tool.gif" align="absmiddle" style="CURSOR: hand" onClick="popUp('citycode')">
													<SCRIPT src="js/b2bcitychange.js"></SCRIPT>
												</TD>
											</TR>
											<TR>
												<TD vAlign="center" height="23">&nbsp;</TD>
												<TD vAlign="center" colSpan="5"><font color="red">(可以输入目的城市的中文、拼音)</font></TD>
											</TR>
											<TR>
												<TD vAlign="center" height="23">常用城市：</TD>
												<TD vAlign="center" width="5%"><INPUT onClick="concitysle('PEK')" type="radio" value="PEK"CHECKED  name="concity" ID="Radio1"></TD>
												<TD vAlign="center" width="15%">北京</TD>
												<TD vAlign="center" width="5%"><INPUT onClick="concitysle('SHA')" type="radio" value="SHA" name="concity" ID="Radio2"></TD>
												<TD vAlign="center" width="14%">上海</TD>
												<TD width="48%">
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table9">
														<TR>
															<TD vAlign="center" width="10%" height="23"><INPUT onClick="concitysle('CAN')" type="radio" value="CAN" name="concity" ID="Radio3"></TD>
															<TD vAlign="center" width="26%">广州</TD>
															<TD vAlign="center" width="12%"><INPUT onClick="concitysle('SZX')" type="radio" value="SZX" name="concity" ID="Radio4"></TD>
															<TD vAlign="center" width="25%">深圳</TD>
															<TD vAlign="center" width="9%"><INPUT onClick="concitysle('HGH')" type="radio" value="HGH" name="concity" ID="Radio5"></TD>
															<TD vAlign="center" width="18%">杭州</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD height="23">&nbsp;</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('NKG')" type="radio" value="NKG" name="concity" ID="Radio6"></TD>
												<TD vAlign="center">南京</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('CTU')" type="radio" value="CTU" name="concity" ID="Radio7"></TD>
												<TD vAlign="center">成都</TD>
												<TD>
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table10">
														<TR>
															<TD vAlign="center" width="10%" height="23"><INPUT onClick="concitysle('WUH')" type="radio" value="WUH" name="concity" ID="Radio8"></TD>
															<TD vAlign="center" width="26%">武汉</TD>
															<TD vAlign="center" width="12%"><INPUT onClick="concitysle('TAO')" type="radio" value="TAO" name="concity" ID="Radio9"></TD>
															<TD vAlign="center" width="25%">青岛</TD>
															<TD vAlign="center" width="10%"><INPUT onClick="concitysle('DLC')" type="radio" value="DLC" name="concity" ID="Radio10"></TD>
															<TD vAlign="center" width="17%">大连</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD height="23">&nbsp;</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('CKG')" type="radio" value="CKG" name="concity" ID="Radio11"></TD>
												<TD vAlign="center">重庆</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('TSN')" type="radio" value="TSN" name="concity" ID="Radio12"></TD>
												<TD vAlign="center">天津</TD>
												<TD>
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table11">
														<TR>
															<TD vAlign="center" width="10%" height="23"><INPUT onClick="concitysle('SZV')" type="radio" value="SZV" name="concity" ID="Radio13"></TD>
															<TD vAlign="center" width="26%">苏州</TD>
															<TD vAlign="center" width="12%"><INPUT onClick="concitysle('NGB')" type="radio" value="NGB" name="concity" ID="Radio14"></TD>
															<TD vAlign="center" width="25%">寧波</TD>
															<TD vAlign="center" width="10%"><INPUT onClick="concitysle('SIA')" type="radio" value="SIA" name="concity" ID="Radio15"></TD>
															<TD vAlign="center" width="17%">西安</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD height="23">&nbsp;</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('HRB')" type="radio" value="HRB" name="concity" ID="Radio16"></TD>
												<TD>哈尔滨</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('SYX')" type="radio" value="SYX" name="concity" ID="Radio17"></TD>
												<TD vAlign="center">三亚</TD>
												<TD>
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table12">
														<TR>
															<TD vAlign="center" width="10%" height="23"><INPUT onClick="concitysle('KMG')" type="radio" value="KMG" name="concity" ID="Radio18"></TD>
															<TD vAlign="center" width="26%">昆明</TD>
															<TD vAlign="center" width="12%"><INPUT onClick="concitysle('SHE')" type="radio" value="SHE" name="concity" ID="Radio19"></TD>
															<TD vAlign="center" width="25%">瀋阳</TD>
															<TD vAlign="center" width="10%"><INPUT onClick="concitysle('CSX')" type="radio" value="HKG" name="concity" ID="Radio20"></TD>
															<TD vAlign="center" width="17%">长沙</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR style="display:none;">
												<TD vAlign="center" height="23">行政区：</TD>
												<TD colSpan="5">
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table13">
														<TR>
															<TD vAlign="center" width="54%" height="23"><INPUT class="searchtext" style="WIDTH: 120px" name="regionCode" ID="Text1">
																<SELECT class="searchtext" id="regiondetail" style="WIDTH: 120px" onChange="selectChangeRegion(this)"
																	name="regiondetail">
																	<OPTION value="" selected>不限</OPTION>
																</SELECT></TD>
															<TD vAlign="center" width="46%">(可以输入也可以在列表中选择)</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD vAlign="center" height="23">地理位置：</TD>
												<TD colSpan="5">
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table14">
														<TR>
															<TD vAlign="center" width="54%" height="23"><INPUT class="searchtext" style="WIDTH: 120px" name="porCode" ID="Text2">
																<SELECT class="searchtext" style="WIDTH: 192px" id="pordetail" onChange="selectChangePor(this)"
																	name="pordetail">
																	<OPTION value="" selected>不限</OPTION>
																</SELECT></TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
																		<tr>
								   <td colspan=2 height=8></td>
								</tr>
								<TR Height=30>
									<TD class="fontcontentorg"><IMG height="13" src="images/hotel_icon2.gif" width="13">入住和离店日期</TD>
								</TR>
								<TR>
									<TD style="PADDING-LEFT: 9px">
										<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table15" bgColor=#eff7ff>
											<TR>
												<TD height="20">入住日期：
												 &nbsp;<INPUT id="sdate" style="WIDTH: 80px" name="Start_date" value="<%=Format_Time(date()+2,2)%>">
													<a onClick="event.cancelBubble=true;" href="javascript:showCalendar('dimg1',false,'sdate',null,'setCheckInDate')">
					<img src="images/calendar.gif" name="dimg1" width=34 height=21 border=0 align=absmiddle id=dimg1></a>
													 &nbsp;		
													 离店日期：
													 <INPUT id="edate" style="WIDTH:80px" name="End_date" value="<%=Format_Time(date()+4,2)%>">
													<a onClick="event.cancelBubble=true;" href="javascript:showCalendar('dimg2',false,'edate','sdate')">
					<img src="images/calendar.gif" name="dimg2" width=34 height=21 border=0 align=absmiddle id=dimg2></a>
												</TD>
											</TR>
										</TABLE>
									</TD>
								</TR>
								<tr>
								   <td colspan=2 height=8></td>
								</tr>
								<TR Height=30>
									<TD class="fontcontentorg"><IMG height="13" src="images/hotel_icon3.gif" width="13">更多搜索条件</TD>
								</TR>
								<TR>
									<TD style="PADDING-LEFT: 9px">
										<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table16" bgColor=#eff7ff>
											<TR>
												<TD vAlign="center" height="20">酒店名称：
												   &nbsp;<INPUT class="searchtext" style="WIDTH: 120px" name="Hotel_Cname" ID="Text3">
													&nbsp;&nbsp;价格范围：
													<select name="Price" id="PriceInfo" style="width:100px;">
														<option value="0">不限价格</option>
														<option value="0-250">250元以下</option>
														<option value="250-400">250-400元</option>
														<option value="400-600">400-600元</option>
														<option value="600-800">600-800元</option>
														<option value="800">800元以上</option>
													</select>
													&nbsp;星级：
													<SELECT class="searchtext" style="WIDTH: 80px" name="Star_ID" ID="Select2">
														<OPTION value="" selected>不限</OPTION>
														<OPTION value="5">五星级</OPTION>
														<OPTION value="4">四星级</OPTION>
														<OPTION value="3">三星级</OPTION>
														<OPTION value="2">二星级</OPTION>
														<OPTION value="1">一星级</OPTION>
													</SELECT>
												</TD>
											</TR>
										</TABLE>
										<br>
										<div align=center>
											<input type="submit" value="查询酒店" style="BORDER-RIGHT: #002D96 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #002D96 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#FFFFFF, EndColorStr=#E3E3E3); BORDER-LEFT: #002D96 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #002D96 1px solid">
										   &nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value='重新输入' style="BORDER-RIGHT: #002D96 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #002D96 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#FFFFFF, EndColorStr=#E3E3E3); BORDER-LEFT: #002D96 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #002D96 1px solid">
										</div>
									</TD>
								</TR>
							</TABLE>
						</FORM>
					</td>
				</tr>
			</TABLE>
			<!-- 酒店查询框 -->
		</td>
	</TR>
</TABLE>
<script language="javascript">
concitysle('PEK');
</script>
<!--#include file="footer.asp"-->
	</body>
</html>