<!--#include file="include/include.asp"-->
<HTML>
	<HEAD>
		<META http-equiv=Content-Type content="text/html; charset=gb2312">
		<title>酒店订房 - 易扬科技</title>
		<LINK href="css/StyleProgress.Css" rel="StyleSheet">
	</HEAD>
	<body>
		    <br><br>
			<TABLE height="250" cellSpacing="0" cellPadding="0" width="770" align="center" border="0">
				<TR>
					<TD align="center" bgcolor=#FFFFFF>
					<!--<IMG src="../ticket/images/sologo.gif" align="absMiddle" border="0"><br><br>-->
					    <br>
					    <br>
						<FONT style="font-size:22px;font-weight:bold;color:#CC6600"><b>正在为您查询即时酒店信息，请稍候……</b></FONT><br>
						<br>
						<br>
						<br>
						<marquee direction="right" scrollamount="8" scrolldelay="100">
							<span class="progressBarHandle-0"></span><span class="progressBarHandle-1"></span>
							<span class="progressBarHandle-2"></span><span class="progressBarHandle-3"></span>
							<span class="progressBarHandle-4"></span><span class="progressBarHandle-5"></span>
							<span class="progressBarHandle-6"></span><span class="progressBarHandle-7"></span>
							<span class="progressBarHandle-8"></span><span class="progressBarHandle-9"></span>
						</marquee>
					</TD>
				</TR>
			</TABLE>
<form name="startForm" action="eiyang_hotel.asp" method="post">
	<input type="hidden" name="freecityname" value="<%=request.form("freecityname")%>">
	<input type="hidden" name="Start_date" value="<%=Format_Time(request.form("Start_date"),2)%>">
	<input type="hidden" name="End_date" value="<%=Format_Time(request.form("End_date"),2)%>">
	<input type="hidden" name="Hotel_Cname" value="<%=request.form("Hotel_Cname")%>">
	<input type="hidden" name="porCode" value="<%=request.form("porCode")%>">
	<input type="hidden" name="Price" value="<%=request.form("Price")%>">
	<input type="hidden" name="Star_ID" value="<%=request.form("Star_ID")%>">
	<input type="hidden" name="page" value="<%=request.form("page")%>">
</form>
<script language="javascript">
	document.startForm.action = "eiyang_hotel.asp" ;
	document.startForm.submit() ;
</script>
	</body>
</HTML>