<%@ Page Language="C#" AutoEventWireup="true" CodeFile="memberReg.aspx.cs" Inherits="memberReg" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>会员注册 - 飞瀛网</title>
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/reg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/register.js"></script>
<script src="http://www.fei580.com/js/jquery-1.2.6.js" type="text/javascript"></script>
<script type="text/javascript" src="http://www.fei580.com/js/postdata.js"></script>
<script type="text/javascript" language="javascript" defer="defer">
  //表单验证
 function checkperregister()
 {
    if(!checkusername('per')){
        document.getElementById('shortname').focus();
        return false;
    }
 
    if(!checkpwd()){
        document.getElementById('pwd1').focus();
        return false;
    }
    
    if(!confirmpwd()){
        document.getElementById('pwd2').focus();
        return false;
    }
    
    if(!checkTruename()){
        document.getElementById('trueName').focus();
        return false;
    }
    
    if(!chkTel('tel','errTel')){
        document.getElementById('tel').focus();
        return false;
    }
    
    if(!checkemail()){
        document.getElementById('emailusername').focus();
        return false;
    }
    return true; 
 }
     </script>
</head>
<body>
    <div class="mainbody" >
    <form id="form1" runat="server">
    <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
    <div class="headerbottom">
      <div class="headerbottom_left"><a href="http://www.fei580.com" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
      <div class="headerbottom_right">
         <div class="headerbottom_rightone">
        <% if (Session["Mem_LoginName"] == null)
           { %>
        <a href="http://www.fei580.com/login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
        <%
            }
            else
            {
         %>
        <a href="http://www.fei580.com/person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="http://www.fei580.com/person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="">退出登录</a>
        <%}
             %> 
        </div>   <ul class="menu_1">
          <li class="four"><a href="http://www.fei580.com/" title="首页">首&nbsp;页</a></li>
          <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
          <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
          <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
          <!--li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li-->
          <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
          <li class="two"><a rel="nofollow" href="http://hotel.fei580.com/" target="_blank" title="国际酒店">国际酒店</a></li>
          <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
          <li class="two"><a href="http://www.fei580.com/quan.aspx"title="飞瀛圈" target="_blank">飞瀛圈</a></li>
          <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
          <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
        </ul>
        <div class="menubottom">
	        <ul class="nohidden">
	          <li class="two"><a href="http://www.fei580.com/airline.aspx" title="">航空公司</a></li>
	          <li class="two"><a href="http://www.fei580.com/airport.aspx" title="">世界机场</a></li>
	          <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="">民航机型</a></li>
	          <li class="two"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	          <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	        </ul>
                <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
      </div>
    </div>
    <div class="fuwu_rightbox">
        <div id="fuwurightChild1" class="nohidden">
	        <div class="fuwu_rightboxcenter">
	         <table cellpadding="0" cellspacing="10" class="fuwu_tablecss" align="center" >
      <tr>
        <th></th>
        <td>带有*的必填项</td>
      </tr>
      <tr>
        <th>*用 户 名</th>
        <td height="40"><input class="typeinput" type="text" id="shortname" runat="server" onblur="checkusername('per');"/>&nbsp;&nbsp;<span id="peruser">*6-18位英文字符(如：welcome)</span></td>
      </tr>
      
      <tr>
        <th>*密&nbsp;&nbsp;&nbsp;&nbsp;码</th>
        <td height="40"><input class="typeinput" type="password" id="pwd1" runat="server" onblur="checkpwd();"/>&nbsp;&nbsp;<span id="errpwd">*长度为6个字符以上</span></td>
      </tr>
      
      <tr>
        <th>*确认密码</th>
        <td height="40"><input class="typeinput" type="password" id="pwd2" runat="server"  name="chkpwd" onblur="confirmpwd();"/>&nbsp;&nbsp;<span id="errchkpwd">*请再次输入密码</span></td>
      </tr>
      
      <tr>
        <th> 性&nbsp;&nbsp;&nbsp;&nbsp;别</th>
        <td height="40"><input type="radio" id="sex1" name="sex"  value="m" runat="server" checked/>男 <input  id="sex2" type="radio" name="sex"  value="w" runat="server"/>女 </td>
      </tr>
      
       <tr>
        <th> 真实姓名</th>
        <td height="40"><input class="typeinput" type="text" id="trueName" runat="server" onblur="checkTruename();"/>&nbsp;&nbsp;<span id="errTrueName">*由于机票采用实名制,请填写真实姓名</span></td>
      </tr>
        
       <tr>
        <th> 联系电话</th>
        <td height="40"><input class="typeinput" type="text" id="tel" runat="server" onblur="chkTel('tel','errTel');"/>&nbsp;&nbsp;<span id="errTel">*方便与您取得联系</span></td>
      </tr>
        
        
        <tr>
        <th> 电子邮件</th>
        <td height="40"><input class="typeinput" type="text" id="emailusername" runat="server" onblur="checkemail();"/>&nbsp;&nbsp;<span id="erremail">*请填写邮件</span></td>
      </tr>
      <tr>
        <th></th>
        <td height="40"><br />
    <asp:Button ID="btnok" runat="server" Text="提交注册信息" OnClick="btnok_Click"  OnClientClick="return checkperregister();"  />
    </td></tr>
    </table>
    <br />
	        </div>
	      </div>
      </div>
    </form>
    <uc1:footControl ID="FootControl" runat="server" />
    </div>
</body>
</html>
