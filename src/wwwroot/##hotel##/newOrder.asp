<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<meta http-equiv="refresh" content="120">
<link rel="stylesheet" href="../ticket/css/Admin_STYLE.CSS">
<title>查看国内机票订单信息s</title>
</head>
<body topmargin="0" scroll="no" ondragstart=window.event.returnValue=false oncontextmenu=window.event.returnValue=false onselectstart=event.returnValue=false>
<!--#include file="../ticket/EiyangSystem/Admin_include.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(request.Cookies("UserPower"),"JA") then
		response.Write("<script lanaguage=javascript>alert('您无权限查看此页面.');history.back(-1);</script>")
		response.End()
	end if
%>
<!--#include file="include/conn.asp"-->
<%
	dim method
	method=ucase(request.ServerVariables("REQUEST_METHOD"))
	if method="GET" then
		ProcList "","1","All"
	else
		formHat=trim(request.QueryString("hat"))
		select case formHat
			case "pg"		'文章分页
				page=trim(request.QueryString("page"))
				ProcList "",page,"look"
			case "update"
				order_id = request.QueryString("id")
				set rs=server.CreateObject("adodb.recordset")
				sql="select * from ordertext where order_id='"&order_id&"'"
				rs.open sql,Conn,2,3
				if not rs.eof then
					rs("OrderState")=1
					rs("order_name")=request.Cookies("Admin_Name")
					rs.update
					hhh="订单处理成功！"
				end if
				rs.close
				set rs = nothing
				response.Write("<script lanaguage=javascript>alert('"& hhh &"');</script>")
				ProcList str,"1","First"
		end select
	end if
%>
<%
sub ProcList(Str,Apage,typeStr)		'Str:条件；Apage：页数；typeStr：操作类型
	sql="select * from ordertext where OrderState='0' and tag='0'order by order_date desc" 
	if typeStr="All" then
		response.cookies("Str")=""		''request.Cookies("Str"):ProcForming形成的条件
	else
		if trim(Str)<>"" then request.Cookies("Str")= "OrderState='0' and tag='0' and " & Str
		if request.Cookies("Str")<>"" then sql="select * from ordertext where "&request.Cookies("Str")
	end if
	currentpage = cint(Apage)
	set rsList=server.createobject("adodb.recordset")
	rsList.open sql,conn,1,1
		if rsList.eof and rsList.bof then
			response.cookies("Str")=""
		end if
  '数据库中文章数totalput 	
	totalPut=rsList.recordcount 
		if currentpage<1 then
			  currentpage=1 
		end if 
  '统计总页数currentpage 
	if (currentpage-1)*MaxPerPage>totalput then 
		if (totalPut mod MaxPerPage)=0 then 
			 currentpage= totalPut \ MaxPerPage 
  		else 
 		 currentpage= totalPut \ MaxPerPage + 1 
  		end if 
	end if 
	rsList.close
	set rsList=nothing
%>
<form  method="post"  name="emptyform" action=""></form>
<table width="100%" height="33" border="0" align="center" cellpadding="0" cellspacing="0">
<tr>
  <td align="center" height=30>提示：订单编号黑色字体为不进行语音提示的订单，红色字体为有语单提示！</td>
</tr>
<tr><td>
<table width="100%" cellspacing="1" cellpadding="1" bordercolor="#FFFFFF" class="border">
  <tr align="center" valign="middle" class="topbg" height="25">
    <td>订单号</td>
    <td>客户名称</td>
	<td>会员名</td>
    <td>航班号</td>
    <td>出发时间</td>
    <td>送票时间</td>
    <td>金额</td>
    <td>支付方式</td>
    <td>支付状态</td>
	<td>语音提示</td>
    <td>操作</td>
  </tr>
<%
	if currentPage=1 then
	    	showContent sql,"",MaxPerPage
		 	showpage totalput,MaxPerPage,currentpage
	else 
			 if (currentPage-1)*MaxPerPage<totalPut then 
				 moveRS=(currentPage-1)*MaxPerPage
				 showContent sql,moveRS,MaxPerPage
				 showpage totalput,MaxPerPage,currentpage
			 else
  				 currentPage=1 
                 showContent sql,"",MaxPerPage
				 showpage totalput,MaxPerPage,currentpage
 			 end if
	end if
%>  
</table>
</td></tr>
</table>
<%
end sub
%>
</body>
</html>
<%sub showContent(sql,moveRS,MaxPerPage)
	dim i 
	i=0 
	set rsList=server.createobject("adodb.recordset")
	rsList.open sql,conn,1,1
	if trim(cstr(moveRS))<>"" then rsList.move moveRS
	do while not rsList.eof
		if rsList("tag_back")=0 then
			Flight_id=rsList("Flight_id")
			Flightdate=rsList("Flightdate")			  
		else
			Flight_id=rsList("Flight_id")
			flight=split(flight_id,"#")
			flight_id = flight(0)
			fdate=rsList("Flightdate")
			f_date=split(fdate,"#")
			Flightdate=f_date(0)
		end if

		str="<a href=javascript:clicks('"&trim(rsList("order_id"))&"');>处理</a>"
		
		'response.Write trim(rsList("msn"))
		MisicOffandOn = trim(rsList("msn"))
		'response.end
			if MisicOffandOn = "0" then
					bianhao = "style=""color:#FF0000"""
					MisicOffandOn = "<a href=""MisicOffandOn.asp?Music=off&url=newOrder.asp&order_id="& trim(rsList("order_id")) &"""><font color=red>语音关</font></a>"
				elseif MisicOffandOn = "1" then
					bianhao = ""
					MisicOffandOn = "<a href=""MisicOffandOn.asp?Music=on&url=newOrder.asp&order_id="& trim(rsList("order_id")) &""">语音开</a>"
				else
					MisicOffandOn = ""
			end if
			userid = trim(rsList("userid"))
			if userid = "" then
				userid = "游客"
			end if
			
		response.Write("<tr height=23 align=center valign=middle bgcolor=#F3F3F3 class=soti04 onMouseOver =this.style.backgroundColor='#66CCFF' onMouseOut =this.style.backgroundColor='#F3F3F3'>")
		response.Write("<td ><a href='#' "&bianhao&" onclick=javascript:window.open('order_viewedit.asp?order_id="& trim(rsList("order_id")) &"','','width=720,height=530,scrollbars=yes')>"&trim(rsList("order_id"))&"</a></td>")
		response.Write("<td >"&trim(rsList("username"))&"</td>")
		response.Write("<td >"&userid&"</td>")
		response.Write("<td >"& Flight_id &"</td>")
		response.Write("<td >"& Flightdate &"</td>")
		response.Write("<td >"&trim(rsList("send_date"))&"</td>")
		response.Write("<td >"&trim(rsList("totalPrice"))&"</td>")
		response.Write("<td >"& trim(rsList("pay_method")) &"</td>")
		response.Write("<td >"& trim(rsList("bian")) &"</td>")
		response.Write("<td>"&MisicOffandOn&"</td>")
		response.Write("<td>"&str&"</td>")
		response.write("</tr>")
		i=i+1 
 		if i>=MaxPerPage then exit do 
 		rsList.movenext 
	loop
	rsList.close
	set rsList=nothing
end sub

function showpage(totalnumber,MaxPerPage,currentpage)
	'求出当每页8篇文章时总共的页数 
  	dim n 
 	if totalnumber mod MaxPerPage=0 then 
 	n= totalnumber\MaxPerPage 
  	else 
  	n= totalnumber\MaxPerPage+1 
  	end if 
  	'显示页数链接的条件 
	response.Write("<tr align=right valign=middle >")
	response.Write("<td height=20 colspan=5 class=style1>")
	response.write (" <span class=style1>共<font color=red>"&totalnumber&"</font>条订单&nbsp;·&nbsp;<font color=#0033FF>"&MaxPerPage&"</font>条/页 ·&nbsp;</span>")
	if CurrentPage<2 then 
  		response.write ("首页&nbsp;&nbsp;上一页&nbsp;")
	else   
 		response.write ("<a href=javascript:gopage(1) class=a1>首页</a>&nbsp;&nbsp;")
        response.write ("<a href=javascript:gopage("&currentPage-1&") class=a1>上一页</a>&nbsp;") 
    end if 
    if n-currentpage<1 then 
        response.write ("下一页&nbsp;&nbsp;尾页&nbsp;·&nbsp;")
    else 
        response.write ("<a href=javascript:gopage("&(currentPage+1)&") class=a1 >下一页</a>&nbsp;&nbsp;<a href=javascript:gopage("&n&") class=a1>尾页</a>&nbsp;·&nbsp;") 
    end if 
	response.write "<span class=style1>页次:<font color=red>"&currentPage&"</font>/<font color=#0033FF>"&n&"</font>页</span>" 
	response.Write("</td></tr>")
end function
%>
<script language="javascript" type="text/javascript">
function clicks(id)
{
document.emptyform.action='<%=request.ServerVariables("PATH_INFO")%>?hat=update&id='+id;
document.emptyform.submit();
}
function gopage(page)
{
	document.emptyform.action='<%=request.ServerVariables("PATH_INFO")%>?hat=pg&page='+page;
	document.emptyform.submit();
}
function String.prototype.Trim() {return this.replace(/(^\s*)|(\s*$)/g,"");}
function String.prototype.Ltrim(){return this.replace(/(^\s*)/g, "");}
function String.prototype.Rtrim(){return this.replace(/(\s*$)/g, "");}
var popUpWin=0;
function openURL(URLStr,width,height)
{
  if(popUpWin)
  {
    if(!popUpWin.closed) popUpWin.close();
  }
  //popUpWin = open(URLStr, 'popUpWin', 'toolbar=no,location=no,directories=no,status=no,menubar=no,scrollbar=yes,resizable=no,copyhistory=yes,width='+width+',height='+height+',left=0, top=0');
  popUpWin = window.showModalDialog(URLStr, "","dialogHeight:"+height+"px; dialogWidth:"+width+"px;menubar:yes; status: No");
}

</script>