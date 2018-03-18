<%@LANGUAGE="VBSCRIPT" CODEPAGE="65001"%> 
<!--#include file="../../include/conn.asp"-->
<!--#include file="../../ticket/Admin-manager/Admin_include.asp"-->
<!--#include file="../../ticket/Admin-manager/public/function.asp"-->
<%
	if not IsPassed() then response.Redirect(""&Request.ServerVariables("script_name")&"/../")
	if not IsPower(session("UserPower"),"HT") then
		response.Write("<script lanaguage=javascript>alert('提示：\n\n對不起，您沒有管理此欄目的權限\n\n請聯系管理員！');history.back(-1);</script>")
		response.End()
	end if
%>
<%
if trim(request("action"))="delete" then
k=request("deleteid")
deleteid=split(request("deleteid"))
for i=0 to ubound(deleteid)
deleteid(i)=replace(deleteid(i),",","")
'删除记录！
sql="delete from indexAD where id ="&deleteid(i)
conn.execute(sql)
next
action=""
msg_ok="群组删除成功！id共"&i&"个，分别是"&k
end if
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<title>航空公司管理</title>
<link rel="stylesheet" href="../../ticket/css/Admin_STYLE.CSS">
<script language="javascript">
function dele(){
if(confirm('确认需要删除选中的城市吗？')){ 
document.all("action").value="delete" ;
 myform.submit(); }
else{
return false; }
}
function modify(aa){
modify_mem.adm_id.value=aa;
modify_mem.submit();
}
function sltall(){
var nn=self.document.all.item("deleteid");
for(j=0;j<nn.length;j++){
self.document.all.item("deleteid",j).checked=true;
  }
}
function escall(){
var nn=self.document.all.item("deleteid");
for(j=0;j<nn.length;j++){
self.document.all.item("deleteid",j).checked=false;
  }
}
</script>
<style type="text/css">
<!--
.style1 {font-size: 12px}
.style2 {color: #FFFFFF}
body {
	margin-left: 0px;
	margin-top: 0px;
}
-->
</style>
</head>
<body leftmargin="0" topmargin="0" marginwidth="0" marginheight="0">
<table width="98%" border="0" align="center" cellpadding="0" cellspacing="0" bordercolor="#eff3f7">
  <tr> 
    <td>
<%
  search_word=trim(request("search_word"))
  set rs=server.CreateObject("adodb.recordset")
  if search_word="" then
  sql="select * from orderb where flag=0 order by id"
   else
  sql="select * from orderb where title like '%"&search_word&"%' order by id"
  end if
  rs.open sql,conn,3,1
  page_flag="false"
  if rs.recordcount>0 then
  page_flag="true"
  rs.pagesize=5
  ipage=trim(request("page"))
  if not isnumeric(ipage) then ipage=1
  if ipage<1 then ipage=1
  if cint(ipage)>rs.pagecount then ipage=rs.pagecount
  rs.movefirst
  for i=1  to rs.pagesize*(ipage-1)
  rs.movenext
  next
  end if
  %>    
    </td></tr>
	  <tr><td>
      <form action="indexrightAD.asp" method="post" name="frmsearch" id="frmsearch">
        <table width="100%" class="b-12">
          <tr> 
            <td width="33%"><span class="style1">按廣告名稱 關鍵字</span><font size="2">：
                  <input name="search_word" type="text" class="b-14" id="search_word" size="15" maxlength="15" >
            </font></td>
            <td width="11%"><font size="2"> 
              <input name="Submit" type="submit" class="submenu" value="查找">
              </font></td>
            <td width="56%" align="right"></td>
          </tr>
        </table>
      </form>  
	  </td></tr>
	  <tr><td>
            <table width="99%" border=1 align="center" cellPadding=0 cellSpacing=0 bordercolor="#009286" borderColorDark=#ffffff bgcolor="#F9F9F9">
              <tr class="topbg" align="center">
                <td width="5%" height="25">编号</td>
                <td width="8%">帐号</td>
                <td width="7%"> 姓名</td>
                <td width="12%">联系电话</td>
                <td width="16%"> 电子邮件</td>
                <td width="21%"> 预定酒店</td>
                <td width="11%"> 预定房型</td>
                <td width="8%"> 确认方式</td>
                <td width="12%">操作</td>
              </tr>
<% 
   if page_flag="false" then
 %>
          <tr align="center"> 
            <td colspan="5" bgcolor="#99CCFF"><font color="#FF0000">没有数据</font></td>
            <td bgcolor="#99CCFF">&nbsp;</td>
          </tr>
          <%else
          for i=1 to rs.pagesize
           if not rs.eof then
		   adm_id=rs("id")	
		    %>
		  <tr align="center">
			<td width="5%" height="23"><%=rs("id")%></td>
			<td width="8%"><%=rs("userid")%>&nbsp;</td>
			<td width="7%"><%=rs("username")%></td>
			<td width="12%"><%=rs("mobiletel")%></td>
			<td width="16%"><%=rs("email")%></td>
			<td width="21%"><%=rs("c_id")%></td>
			<td width="11%"><%=rs("roomtype")%></td>
			<td width="8%"><%=rs("affirmtype")%></td>
			<td width="12%" align="center" height="23">
			  <input name="button" type="button" onClick=" window.location='orderdetail.asp?id=<%=rs("id")%>'"value="详情">
			  <input name="button" type="button" onClick="if (confirm('确实要此条记录吗？')) window.location='Orderinfodel.asp?id=<%=rs("id")%>'" value="删除"></td>
		  </tr>
          <%
		  rs.movenext
		  else
		  %><tr align="center" bgcolor="#F3F3F3" class="soti04"> 
            <td height="20">&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
            <td>&nbsp;</td>
          </tr>
		  <%
		  end if
		  next
  		end if
              %>
        </table>
		<table width="100%" border="0" cellspacing="0">
          <tr>
            <td class="soti02"></td>
          </tr>
          <tr class="soti07">
            <td align="right"><span class="bu-12"><%=pages()%></span></td>
          </tr>
        </table>
	  </td></tr>
  </tr>
</table>
</body>
</html>
<form method="post" name="productsearch" action="indexrightAD.asp">
<input type="hidden" name="page" value="<%=ipage%>">
<input type="hidden" name="search_word" value="<%=search_word%>">
</form>