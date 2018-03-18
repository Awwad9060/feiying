<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myticketDownLoad.aspx.cs" Inherits="person_myticketDownLoad" %>
<%@ Register Src="../share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="../share/footControl.ascx" TagName="footControl" TagPrefix="uc2" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>我的电子机票-飞瀛网</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../css/person.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript">
     function searchfocus(){
	    if (document.getElementById("txtsearch").value == "请联系你的客服获取编号") {
		    document.getElementById("txtsearch").value ="";
		    document.getElementById("txtsearch").className ="txtunserchcolor";
	    }
     }

    function searchblur(){
	    if (document.getElementById("txtsearch").value == "") {
		    document.getElementById("txtsearch").value ="请联系你的客服获取编号";
		    document.getElementById("txtsearch").className ="txtserchcolor";
	    }
    }
    </script>
</head>
<div class="mainbody" >
<form id="form1" runat="server">

  <!--header start-->
<div class="headertop"><span><img src="../images/home.jpg" alt="飞瀛网" /><img src="../images/homeinfor.jpg" alt="国际机票专家" />国际、国内机票服务热线：4008-850-663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com" title="飞瀛网"><img src="../images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
    <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="../login.aspx" title="">会员登录</a>|<a href="../regAgree.aspx" title="会员注册">会员注册</a>
    <%
        }
        else
        {
     %>
    <a href="../person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="../person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="../person/myinfo.aspx" title="">个人中心</a>|<a href="../logout.aspx" title="">退出登录</a>
    <%}
         %> 
    </div>
    <ul class="menu_1">
      <li class="two"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="../recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="../international.aspx" title="国际机票">国际机票</a></li>
      <li class="two"><a href="../ticket" title="国内机票">国内机票</a></li>
      <li class="two"><a href="../hotel" title="特价酒店">特价酒店</a></li>
      <li class="two"><a href="../quan.aspx"title="飞瀛圈" target="_blank">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="/sm/" title="飞瀛服务">飞瀛服务</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="../images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="../airline.aspx" title="航空公司">航空公司</a></li>
	      <li class="two"><a href="../airport.aspx" title="世界机场">世界机场</a></li>
	      <li class="two"><a href="../airplane.aspx" title="民航机型">民航机型</a></li>
	      <li class="two"><a href="../news.aspx" title="">新闻资讯</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
  </div>
</div>

<div style=" margin:auto; width:920px; height:280px; background:url(../images/dzjp_bg.jpg) no-repeat; margin-top:10px; font-size:14px;position:relative;">
<div style="width:260px; height:30px;position:absolute; left:152px; top:100px; color:#FFFFFF; font-size:18px; font-weight:bold">请填写你的电子机票下载号:</div>
<input id="txtsearch" runat="server"  class="txtserchcolor"  onfocus="searchfocus()" onblur="searchblur()"  value="请联系你的客服获取编号" type="text" style="width:245px; height:25px;position:absolute; left:155px; top:135px; font-size:18px; border:0;">
<asp:ImageButton ID="butt_search" ImageUrl="../images/btn.gif" style="width:178px; height:33px;position:absolute; left:463px; top:128px;border:0;"  OnClick="butt_search_Click"  runat="server"  />
<img src="../images/btn.gif" style="width:30px; height:30px;position:absolute; left:720px; top:168px;border:0;" alt="帮助">
<div style="width:50px; height:16px;position:absolute; left:750px; top:200px; color:#FFFFFF; font-size:12px;">帮助</div>
</div>

 
</form>
    <uc2:footControl ID="FootControl" runat="server" />
    </div>
</body>
</html>