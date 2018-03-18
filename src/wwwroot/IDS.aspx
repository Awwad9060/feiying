<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IDS.aspx.cs" Inherits="IDS" %>

<%@ Register Assembly="Microsoft.ReportViewer.WebForms, Version=9.0.0.0, Culture=neutral, PublicKeyToken=b03f5f7f11d50a3a"
    Namespace="Microsoft.Reporting.WebForms" TagPrefix="rsweb" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<%@ Register Assembly="am.Charts" Namespace="am.Charts" TagPrefix="cc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<title><%=fromcity%>-<%=tocity%> - IDS服务 - 飞瀛网</title>
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/ids.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/plugin/js/jquery-1.4.2.min.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/postdata.js" type="text/javascript"></script>
<script type="text/javascript">
	function getRequest(name){
	    var url = document.referrer; ;  
		var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
		var paraObj = {};
		for (i=0; j=paraString[i]; i++){  
			paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
		}
		var returnValue = paraObj[name.toLowerCase()];  
		return typeof(returnValue)=="undefined" ? "" : returnValue;
	}

	function GetUrlRelativePath(){
　　　　var url = document.location.toString();
　　　　var arrUrl = url.split("//");
　　　　var start = arrUrl[1].indexOf("/");
　　　　var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符
　　　　if(relUrl.indexOf("?") != -1){
　　　　　　relUrl = relUrl.split("?")[0];
　　　　}
　　　　return relUrl;
　　}

    $(function() {
		var hmsr = getRequest("hmsr");
		//var source = getRequest("utm_source");
		var medium = getRequest("utm_medium");
		var campaign = getRequest("utm_campaign");
		var keywords = getRequest("utm_content");
		//var key = GetUrlRelativePath();
		if(hmsr==null || hmsr==""){hmsr = getRequest("utm_source");} else {hmsr = getRequest("hmsr");}
		if(keywords==null || keywords==""){keywords="<%=tocity%>";}else{keywords = getRequest("utm_content");}
		if(medium==null || medium==""){medium = "PPC";} else {medium = getRequest("utm_medium");}
		if(campaign==null || campaign==""){campaign = getRequest("hmpl");} else {campaign = getRequest("utm_campaign");}
		if(hmsr==null || hmsr==""){
		    $(".ids_alink_qq").attr("href", function(i, origValue) { return origValue + "?utm_source=IDSLink&utm_medium=Organic&utm_campaign=BaiduBridge&utm_content=" + keywords; });
		} else {
		    $(".ids_alink_qq").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
		    $(".friendbox a").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_content=" + keywords; });
		}
    });</script>
</head>
<body>
<div class="mainbody">
 <form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
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
    </div>    <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="one"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
      <!--li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
       <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
     <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
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
	<div class="header_nav">您现在位置：<a href="http://www.fei580.com" title="">飞瀛首页</a>&gt;IDS服务</div>
  </div>
</div>
<!--header end-->

<div style="margin:0px auto;width:965px;position:relative;">

  <div class="idsboxone">
    <img src="http://www.fei580.com/images/IDS_01.jpg" alt="IDS服务" class="idsimg_one" />
	<h1><%= fromcity%>-<%=tocity%></h1>
	<p><input type="button" onclick="window.location.href = 'http://www.fei580.com/IDS.aspx?fromcity=<%=fromcity %>&tocity=<%=tocity %>&year=<% =preYear %>'" class="but_back" /><%= Year %>年<input type="button" onclick="window.location.href = 'http://www.fei580.com/IDS.aspx?fromcity=<%=fromcity %>&tocity=<%=tocity %>&year=<% =nextYear %>'" class="but_next" /></p>
  </div>
  
  <div class="idslineone"></div>
  <div class="idsboxtwo">
    <div class="idsboxthree">
    <cc1:ColumnChart runat="server" ID="columnChart" ></cc1:ColumnChart>
	</div>

	<div class="clearfix">
	  <ul class="idsulone">
	    <li class="idslione">最低走势[<%=minMonth%>月]<strong>￥<%=minPrice%></strong>最高走势[<%=maxMonth%>月]<strong>￥<%=maxPrice%></strong></li>
		<li class="idslitwo"><strong><%= (resultOne == null ? "本季度走势尚算平稳" : resultOne["comment"])%></strong></li>
	  </ul>

	  <ul class="idsultwo">
	    <li class="idslione"><strong>IDS</strong>平均价格<strong>￥<%=Convert.ToInt32(subPrice/12)%></strong></li>
		<li class="idslitwo"><strong><%= (resultOne == null ? "本季度价格走势尚有平稳10%的下调空间" : resultOne["idsComment"])%></strong></li>
	  </ul>
	</div>

    <div class="clearfix">
      <div class="idsboxfour">
	    <h2>航线热卖度</h2>
		<input type="button" class="but_duzhuai" value="<%= (resultOne == null ? "3": resultOne["remai"])%>" style="margin-left:30px;" />
		<p></p>
		<ul>
		  <li class="one">1分<br />非常不满</li>
		  <li class="two">2分<br />不满意</li>
		  <li class="three">3分<br />一般</li>
		  <li class="four">4分<br />满意</li>
		  <li class="five">5分<br />非常满意</li>
		</ul>
	  </div>

	  <div class="idsboxfour">
	    <h2>价格满意度</h2>
		<input type="button" class="but_duzhuai" value="<%= (resultOne == null ? "5": resultOne["manyi"])%>" style="margin-left:30px;" />
		<p></p>
		<ul>
		  <li class="one">1分<br />非常不满</li>
		  <li class="two">2分<br />不满意</li>
		  <li class="three">3分<br />一般</li>
		  <li class="four">4分<br />满意</li>
		  <li class="five">5分<br />非常满意</li>
		</ul>
	  </div>
    </div>

    <div class="ids_tips_box">
	  <p>贴心提示：</p>
	  <ul class="ids_tips_list">
	    <li>飞瀛网IDS分析结果由航空公司数据、销售统计、客户反馈等数据综合所得，具备良好的参考性。</li>
		<li>各位商旅人从中可以得知你的目的地票价走势，更好掌握购票时间。</li>
		<li>建议大家尽快与客服顾问联系沟通，以取得更加专业的分析结果。</li>
		<li>欢迎拨打飞瀛网热线400-885-0663 或 020-22382632查询。</li>
		<li>资料内容为飞瀛网专属，严禁以任何方式采用，飞瀛网保留法律追究权利！</li>
	  </ul>
	</div>

  </div>
  <div class="idslinetwo"><input type="button" value="打印" class="ids_but_print"  onclick='window.print();' /><a href="http://www.fei580.com/chat/" class="ids_alink_qq">在线咨询</a><a href="tencent://message/?uin=32335510&Site=<%= fromcity%>to<%=tocity%>&Menu=yes" class="ids_alink_msn">QQ咨询</a></div>

</div>
 <uc1:footControl ID="FootControl" runat="server" />
</form>
</div>
</body>
</html>
