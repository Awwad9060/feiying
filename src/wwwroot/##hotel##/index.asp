<!--#include file="include/include.asp"-->
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<META http-equiv=Content-Type content="text/html; charset=gb2312">
<title>�Ƶ궩�� - �����</title>
<META content=�Ƶ궩�� - ����� name=keywords>
<META content=�Ƶ궩�� - ������� name=description>
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
						<IMG src="Images/k_xl1.gif" align="absMiddle"> <font class="SearchTitle">�Ƶ�Ԥ��</font>
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
								<TD align=center>��ѯ</TD>
								<TD align=center>ѡ��</TD>
								<TD align=center>Ԥ��</TD>
								<TD align=center>ȷ��</TD>
								<TD align=center>Ԥ��</TD>
								<TD align=center>���</TD>
							</TR>
						</TABLE>
					</TD>
				</TR>
			</TABLE>
			<!-- Hotel head -->
			<!-- �Ƶ��ѯ�� -->
			<TABLE cellSpacing="0" cellPadding="0" width="99%" border="0" ID="Table3" >
				<tr>
					<td >
						
						<FORM name="QueryHotelForm" action="HotelSearching.asp" method="Post" style="margin:0px;" target="_blank">
							<TABLE cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table7">
								<TR Height=30>
									<TD class="fontcontentorg" width="100%"><IMG height="13" src="images/hotel_icon1.gif" width="13">ѡ�����</TD>
								</TR>
								<TR>
									<TD style="PADDING-LEFT: 9px">
										<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table8" bgColor=#eff7ff>
											<TR>
												<TD vAlign="center" width="13%" height="28">Ŀ�ĳ��У�</TD>
												<TD vAlign="center" colSpan="5"><INPUT class="searchtext" id="freecitycode" style="WIDTH: 110px" onChange="inputCityChange(this)" value="PEK" name="freecitycode"> <INPUT id="freecityname" type="hidden" value="PEK" name="freecityname">
													<SELECT class="searchtext" style="WIDTH: 192px" onChange="selectChange(this);"  onpropertychange="selectChange(this);" name="citycode" ID="Select1">
														<OPTION value="PEK" selected>BEIJING����PEK</OPTION>
														<SCRIPT src="js/b2bcity.js"></SCRIPT>
													</SELECT><img src="../ticket/Images/tool.gif" align="absmiddle" style="CURSOR: hand" onClick="popUp('citycode')">
													<SCRIPT src="js/b2bcitychange.js"></SCRIPT>
												</TD>
											</TR>
											<TR>
												<TD vAlign="center" height="23">&nbsp;</TD>
												<TD vAlign="center" colSpan="5"><font color="red">(��������Ŀ�ĳ��е����ġ�ƴ��)</font></TD>
											</TR>
											<TR>
												<TD vAlign="center" height="23">���ó��У�</TD>
												<TD vAlign="center" width="5%"><INPUT onClick="concitysle('PEK')" type="radio" value="PEK"CHECKED  name="concity" ID="Radio1"></TD>
												<TD vAlign="center" width="15%">����</TD>
												<TD vAlign="center" width="5%"><INPUT onClick="concitysle('SHA')" type="radio" value="SHA" name="concity" ID="Radio2"></TD>
												<TD vAlign="center" width="14%">�Ϻ�</TD>
												<TD width="48%">
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table9">
														<TR>
															<TD vAlign="center" width="10%" height="23"><INPUT onClick="concitysle('CAN')" type="radio" value="CAN" name="concity" ID="Radio3"></TD>
															<TD vAlign="center" width="26%">����</TD>
															<TD vAlign="center" width="12%"><INPUT onClick="concitysle('SZX')" type="radio" value="SZX" name="concity" ID="Radio4"></TD>
															<TD vAlign="center" width="25%">����</TD>
															<TD vAlign="center" width="9%"><INPUT onClick="concitysle('HGH')" type="radio" value="HGH" name="concity" ID="Radio5"></TD>
															<TD vAlign="center" width="18%">����</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD height="23">&nbsp;</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('NKG')" type="radio" value="NKG" name="concity" ID="Radio6"></TD>
												<TD vAlign="center">�Ͼ�</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('CTU')" type="radio" value="CTU" name="concity" ID="Radio7"></TD>
												<TD vAlign="center">�ɶ�</TD>
												<TD>
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table10">
														<TR>
															<TD vAlign="center" width="10%" height="23"><INPUT onClick="concitysle('WUH')" type="radio" value="WUH" name="concity" ID="Radio8"></TD>
															<TD vAlign="center" width="26%">�人</TD>
															<TD vAlign="center" width="12%"><INPUT onClick="concitysle('TAO')" type="radio" value="TAO" name="concity" ID="Radio9"></TD>
															<TD vAlign="center" width="25%">�ൺ</TD>
															<TD vAlign="center" width="10%"><INPUT onClick="concitysle('DLC')" type="radio" value="DLC" name="concity" ID="Radio10"></TD>
															<TD vAlign="center" width="17%">����</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD height="23">&nbsp;</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('CKG')" type="radio" value="CKG" name="concity" ID="Radio11"></TD>
												<TD vAlign="center">����</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('TSN')" type="radio" value="TSN" name="concity" ID="Radio12"></TD>
												<TD vAlign="center">���</TD>
												<TD>
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table11">
														<TR>
															<TD vAlign="center" width="10%" height="23"><INPUT onClick="concitysle('SZV')" type="radio" value="SZV" name="concity" ID="Radio13"></TD>
															<TD vAlign="center" width="26%">����</TD>
															<TD vAlign="center" width="12%"><INPUT onClick="concitysle('NGB')" type="radio" value="NGB" name="concity" ID="Radio14"></TD>
															<TD vAlign="center" width="25%">����</TD>
															<TD vAlign="center" width="10%"><INPUT onClick="concitysle('SIA')" type="radio" value="SIA" name="concity" ID="Radio15"></TD>
															<TD vAlign="center" width="17%">����</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD height="23">&nbsp;</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('HRB')" type="radio" value="HRB" name="concity" ID="Radio16"></TD>
												<TD>������</TD>
												<TD vAlign="center"><INPUT onClick="concitysle('SYX')" type="radio" value="SYX" name="concity" ID="Radio17"></TD>
												<TD vAlign="center">����</TD>
												<TD>
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table12">
														<TR>
															<TD vAlign="center" width="10%" height="23"><INPUT onClick="concitysle('KMG')" type="radio" value="KMG" name="concity" ID="Radio18"></TD>
															<TD vAlign="center" width="26%">����</TD>
															<TD vAlign="center" width="12%"><INPUT onClick="concitysle('SHE')" type="radio" value="SHE" name="concity" ID="Radio19"></TD>
															<TD vAlign="center" width="25%">�c��</TD>
															<TD vAlign="center" width="10%"><INPUT onClick="concitysle('CSX')" type="radio" value="HKG" name="concity" ID="Radio20"></TD>
															<TD vAlign="center" width="17%">��ɳ</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR style="display:none;">
												<TD vAlign="center" height="23">��������</TD>
												<TD colSpan="5">
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table13">
														<TR>
															<TD vAlign="center" width="54%" height="23"><INPUT class="searchtext" style="WIDTH: 120px" name="regionCode" ID="Text1">
																<SELECT class="searchtext" id="regiondetail" style="WIDTH: 120px" onChange="selectChangeRegion(this)"
																	name="regiondetail">
																	<OPTION value="" selected>����</OPTION>
																</SELECT></TD>
															<TD vAlign="center" width="46%">(��������Ҳ�������б���ѡ��)</TD>
														</TR>
													</TABLE>
												</TD>
											</TR>
											<TR>
												<TD vAlign="center" height="23">����λ�ã�</TD>
												<TD colSpan="5">
													<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table14">
														<TR>
															<TD vAlign="center" width="54%" height="23"><INPUT class="searchtext" style="WIDTH: 120px" name="porCode" ID="Text2">
																<SELECT class="searchtext" style="WIDTH: 192px" id="pordetail" onChange="selectChangePor(this)"
																	name="pordetail">
																	<OPTION value="" selected>����</OPTION>
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
									<TD class="fontcontentorg"><IMG height="13" src="images/hotel_icon2.gif" width="13">��ס���������</TD>
								</TR>
								<TR>
									<TD style="PADDING-LEFT: 9px">
										<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table15" bgColor=#eff7ff>
											<TR>
												<TD height="20">��ס���ڣ�
												 &nbsp;<INPUT id="sdate" style="WIDTH: 80px" name="Start_date" value="<%=Format_Time(date()+2,2)%>">
													<a onClick="event.cancelBubble=true;" href="javascript:showCalendar('dimg1',false,'sdate',null,'setCheckInDate')">
					<img src="images/calendar.gif" name="dimg1" width=34 height=21 border=0 align=absmiddle id=dimg1></a>
													 &nbsp;		
													 ������ڣ�
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
									<TD class="fontcontentorg"><IMG height="13" src="images/hotel_icon3.gif" width="13">������������</TD>
								</TR>
								<TR>
									<TD style="PADDING-LEFT: 9px">
										<TABLE class="fontcontenttd" cellSpacing="0" cellPadding="0" width="100%" border="0" ID="Table16" bgColor=#eff7ff>
											<TR>
												<TD vAlign="center" height="20">�Ƶ����ƣ�
												   &nbsp;<INPUT class="searchtext" style="WIDTH: 120px" name="Hotel_Cname" ID="Text3">
													&nbsp;&nbsp;�۸�Χ��
													<select name="Price" id="PriceInfo" style="width:100px;">
														<option value="0">���޼۸�</option>
														<option value="0-250">250Ԫ����</option>
														<option value="250-400">250-400Ԫ</option>
														<option value="400-600">400-600Ԫ</option>
														<option value="600-800">600-800Ԫ</option>
														<option value="800">800Ԫ����</option>
													</select>
													&nbsp;�Ǽ���
													<SELECT class="searchtext" style="WIDTH: 80px" name="Star_ID" ID="Select2">
														<OPTION value="" selected>����</OPTION>
														<OPTION value="5">���Ǽ�</OPTION>
														<OPTION value="4">���Ǽ�</OPTION>
														<OPTION value="3">���Ǽ�</OPTION>
														<OPTION value="2">���Ǽ�</OPTION>
														<OPTION value="1">һ�Ǽ�</OPTION>
													</SELECT>
												</TD>
											</TR>
										</TABLE>
										<br>
										<div align=center>
											<input type="submit" value="��ѯ�Ƶ�" style="BORDER-RIGHT: #002D96 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #002D96 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#FFFFFF, EndColorStr=#E3E3E3); BORDER-LEFT: #002D96 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #002D96 1px solid">
										   &nbsp;&nbsp;&nbsp;&nbsp;<input type=reset value='��������' style="BORDER-RIGHT: #002D96 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: #002D96 1px solid; PADDING-LEFT: 2px; FONT-SIZE: 12px; FILTER: progid:DXImageTransform.Microsoft.Gradient(GradientType=0, StartColorStr=#FFFFFF, EndColorStr=#E3E3E3); BORDER-LEFT: #002D96 1px solid; CURSOR: hand; COLOR: black; PADDING-TOP: 2px; BORDER-BOTTOM: #002D96 1px solid">
										</div>
									</TD>
								</TR>
							</TABLE>
						</FORM>
					</td>
				</tr>
			</TABLE>
			<!-- �Ƶ��ѯ�� -->
		</td>
	</TR>
</TABLE>
<script language="javascript">
concitysle('PEK');
</script>
<!--#include file="footer.asp"-->
	</body>
</html>