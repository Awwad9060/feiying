<%@ Page Language="C#" AutoEventWireup="true" CodeFile="login.aspx.cs" Inherits="login" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>用户登录 - 飞瀛网</title>
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/reg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" language="javascript" defer="defer">
  //表单验证
 function checklogin()
 {
    var perusername = document.getElementById("shortname");
    if(perusername.value=='')
    {
        alert('请填写您的用户名！');
        perusername.focus();
        return false;
    }
 
    var pwd1 = document.getElementById("pwd1");
    if(pwd1.value=='')
    {
        alert('请输入密码！');
        pwd1.focus();
        return false;
    }

 }
     </script>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
}
-->
</style>
</head>
<body>
    <div class="mainbody" >
    <form id="form1" runat="server">
      <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
     <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="http://www.fei580.com/login.aspx" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
    <%
        }
        else
        {
     %>
    <a href="http://www.fei580.com/person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="http://www.fei580.com/person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="">退出登录</a>
    <%}
         %> 
    </div>  <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com/" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
      <!--<li class="two"><a href="hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
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

 <div style=" margin:auto; width:972px; height:387px; background:url(http://www.fei580.com/images/login_bg.jpg) no-repeat; margin-top:68px;">
<div style="float:left; width:525px; height:320px; ">
<table width="510" height="285" border="0">
  <tr>
    <td width="202" height="88">&nbsp;</td>
    <td width="249">&nbsp;</td>
    <td width="45">&nbsp;</td>
  </tr>
  <tr>
    <td height="24px"><div align="right" class="STYLE1"><strong>登录名:</strong></div></td>
    <td><input name="login" type="text" id="shortname" runat="server" style="height:24px; width:175px;" /></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="24px"><div align="right" class="STYLE1">密码:</div></td>
    <td><input name="pw" type="password" id="pwd1" runat="server" style="height:24px;width:175px;"/></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35">&nbsp;</td>
    <td>
    <asp:Label ID="lblerrmes" runat="server" Text="" ForeColor="Red"></asp:Label>
  </td>
  <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="35">&nbsp;</td>
    <td valign="bottom"><asp:ImageButton ID="btnok" ImageUrl="http://www.fei580.com/images/login_btn.jpg"  OnClick="btnok_Click"  OnClientClick="return checklogin();" runat="server" />
    &nbsp;&nbsp;<a href="javascript:;" style="color:#666">忘记密码</a></td>
    <td>&nbsp;</td>
  </tr>
  <tr>
    <td height="38">&nbsp;</td>
    <td>&nbsp;</td>
    <td>&nbsp;</td>
  </tr>
</table>
</div>
<div style="float:left; width:430px; height:320px">
<table height="377" border="0">
  <tr>
    <td width="57" height="91">&nbsp;</td>
    <td width="282" valign="bottom" class="STYLE1">注册新会员；即可享受：</td>
    <td width="71">&nbsp;</td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td  style="width:px; height:278px; line-height:23px; vertical-align:top; padding-top:30px;">
	·注册即送50积分!<br>
·在飞瀛网与大家分享自己的旅游心得!<br>
·预订产品得积分,发布文章获积分，兑换惊喜礼品!<br>
·享受更加体贴的个性化服务!
<br><br>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="http://www.fei580.com/regAgree.aspx"><img src="http://www.fei580.com/images/reg_btn.jpg" border="0"></a>
	</td>
    <td>&nbsp;</td>
  </tr>
</table>


</div>
</div>
 
</form>
    <uc1:footControl ID="FootControl" runat="server" />
    </div>
</body>
</html>
