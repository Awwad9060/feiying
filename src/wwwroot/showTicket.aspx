<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showTicket.aspx.cs" Inherits="showticket" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta name="applicable-device" content="pc,mobile">
<meta name="MobileOptimized" content="width"/>
<meta name="HandheldFriendly" content="true"/>
<meta http-equiv="mobile-agent" content="format=xhtml;url=http://m.fei580.com/ticket_<%= id%>.htm">
<% if (ticketOne != null) { %><title>【<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票】往返特价机票_价格_预订 - 飞瀛网</title>
<meta name="Description"  content="【<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票】由飞瀛网(fei580.com)为您提供<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>特价机票价格实时查询,在线预订服务,单程或往返均为全网最低价！" />
<meta name="keywords" content="<%=ticketOne["toCityname"]%>机票,<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票,<%=ticketOne["toCityname"]%>往返特价机票,<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>预订" /><%} %>
<meta name="robots" content="index,follow" />
<link rel="canonical" href="http://www.fei580.com/ticket_<%= id%>.htm" />
<link rel="alternate" media="only screen and(max-width: 640px)"  href="http://m.fei580.com/ticket_<%= id%>.htm" >
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/hotcity.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/datepicker.css" rel="stylesheet" type="text/css"/>
<script type="text/javascript" src="http://www.fei580.com/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/postdata.js" type="text/javascript"></script>
<script type="text/javascript">
    //平台、设备和操作系统 
    var system = { 
        win: false, 
        mac: false, 
        xll: false, 
        ipad:false 
    }; 
    //检测平台 
    var p = navigator.platform; 
    system.win = p.indexOf("Win") == 0; 
    system.mac = p.indexOf("Mac") == 0; 
    system.x11 = (p == "X11") || (p.indexOf("Linux") == 0); 
    system.ipad = (navigator.userAgent.match(/iPad/i) != null)?true:false; 
    //跳转语句，如果是手机访问就自动跳转到wap.baidu.com页面 
    if (system.win || system.mac || system.xll||system.ipad) { 
 
    } else { 
        if(<%= id%>!=0) window.location.href = "http://m.fei580.com/ticket_<%= id%>.htm"; 
    }
    
    //获取当前url的参数值
	function getRequest(name){ 
		var url = document.referrer;  
		var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
		var paraObj = {};
		for (i=0; j=paraString[i]; i++){  
			paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
		}
		var returnValue = paraObj[name.toLowerCase()];  
		return typeof(returnValue)=="undefined" ? "" : returnValue;
	}

    $(document).ready(function() {
        //日期控件
        TripBackDate(document.getElementById("tripDate"), document.getElementById("backDate"));
        //日期控件
        TripBackDate(document.getElementById("fDate"), document.getElementById("tDate"));
        //调用不同的咨询链接
		var hmsr = getRequest("hmsr");
		//var source = getRequest("utm_source");
		var medium = getRequest("utm_medium");
		var campaign = getRequest("utm_campaign");
		var keywords = getRequest("utm_content");
		//var key = GetUrlRelativePath();
		if(hmsr==null || hmsr==""){hmsr = getRequest("utm_source");} else {hmsr = getRequest("hmsr");}
		if(keywords==null || keywords==""){keywords= "ticket_<%= id%>";}else{keywords = getRequest("utm_content");}
		if(medium==null || medium==""){medium = "PPC";} else {medium = getRequest("utm_medium");}
		if(campaign==null || campaign==""){campaign = "DetailChat";} else {campaign = getRequest("utm_campaign");}
		if(hmsr==null || hmsr==""){
			$("#chat").attr("href",function(i,origValue){ return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=BaiduBridge&utm_content=id_<%= id%>"; });
			$("#title").attr("value",function(i,origValue){ return origValue +" - ID<%= id%>"; });
			$("#ochat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#mchat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn1").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn2").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn3").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
		} else {
			$("#chat").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
			$("#form1").attr("action",function(i,origValue){ return origValue + "&utm_source="+hmsr+"&utm_medium="+medium+"&utm_content=id_<%= id%>"; });
			$("#title").attr("value",function(i,origValue){ return origValue +" - AD<%= id%>"; });
			$(".In_onlineultwo a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
			$(".In_tickTz .one a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
			$(".In_tickTz .two a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
			$(".ticketdoc_rightul a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
            $("#ochat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#mchat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn1").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn2").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn3").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
		}
    });
    //查询机型
    function SearchAifeiPlan(from, to, airline) {
        var url = "http://www.fei580.com/share/AifeiInfoRequest.aspx";
        $.ajax({
            type: "get",
            cache: false,
            url: url + "?from=" + from + "&to=" + to + "&airline=" + airline,
            success: function(data) {
                if (data == "false")
                    return;

                $("#ticketplan").html(data);
            },
            error: function() {
                return;
                //alert('验证数据异常！');
            }
        });
    }
</script>

</head>
<body>
<% if (ticketOne != null)
   { %>
<div class="mainbody" >
 <form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="home" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="mail" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
      <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/ticket_<%=id%>.htm" title="会员登录" rel="nofollow">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册" rel="nofollow">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务" rel="nofollow">关于飞瀛</a>
    <%
        }
        else
        {
     %>
    <a href="http://www.fei580.com/person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="http://www.fei580.com/person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="">退出登录</a>
    <%}
         %> 
    </div>   <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com" title="首页" rel="nofollow">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="one"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li-->
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证" rel="nofollow">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com/" target="_blank" title="国际酒店" rel="nofollow">国际酒店</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" rel="nofollow">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司" rel="nofollow">航空公司</a></li>
	      <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场" rel="nofollow">世界机场</a></li>
	      <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型" rel="nofollow">民航机型</a></li>
	      <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯" rel="nofollow">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="积分广场" rel="nofollow">积分广场</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
	<div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="飞瀛首页" rel="nofollow">飞瀛网</a>&gt;<a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票查询</a>&gt;&nbsp;<a href="http://www.fei580.com/ticket_<%=id%>.htm"><%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票</a></div>
  </div>
</div>
<!--header end-->

 <%
              string xingcheng = "往返";
		        if(ticketOne["tripType"].ToString()=="0"){
                xingcheng = "单程";
		   }      
		   %>
<div style="margin:0px auto;width:970px;position:relative;">


  <div class="In_inlinebutton"><a href="javascript:addCompare('<%=ticketOne["tId"]%>','<%=xingcheng%>  <%=ticketOne["fromCityname"]%>-<%=ticketOne["toCityname"]%>','￥<%=ticketOne["untaxPrice"]%>');" rel="nofollow">加入比较</a></div>
  <!--onlinebox start-->
  <div class="In_inlineonlinebox">
    <div class="In_onlineboxleftbg">
      <img src="http://www.fei580.com/images/In_inline02.jpg" alt="航线" style="float:left;" />
	  
	  <div class="In_onlineboxright">
		  <table cellpadding="0" cellspacing="0" class="In_onlinetable">
			<tr>
			  <th class="In_thclass" valign="top">
			  
				<table cellpadding="0" cellspacing="10" class="In_onlinetablethree">
				  <tr>
					<td class="hstrongtd" valign="top">
					  <h2><%=ticketOne["fromCityname"]%> (<%=ticketOne["fromCityCode"]%>)</h2>
					  <p><a href="http://www.fei580.com/airport/<%=ticketOne["fromPort"]%>.htm" title="<%=ticketOne["fAirportName"]%>(<%=ticketOne["fAirportCode"]%>)" target="_blank"><%=ticketOne["fAirportName"]%>(<%=ticketOne["fAirportCode"]%>)</a><br /><span><a href="http://www.fei580.com/airport/<%=ticketOne["fromPort"]%>.htm" title="<%=ticketOne["fAirportName"]%>介绍" target="_blank">机场简介</a></span><span><a href="http://www.fei580.com/airport/<%=ticketOne["fromPort"]%>.htm" title="<%=ticketOne["fAirportName"]%>地图" target="_blank" >机场地图</a></span><span><a href="http://www.fei580.com/airport/<%=ticketOne["fromPort"]%>.htm" title="<%=ticketOne["fAirportName"]%>交通" target="_blank" >机场交通</a></span></p>
					</td>
					<td rowspan="2">
				
					<img src="http://www.fei580.com/images/tripType<%=ticketOne["tripType"]%>.gif" alt="" style="vertical-align:middle;" />
					
					</td>
				  </tr>
				  <tr>
					<td  valign="top">
					<h2><%=ticketOne["toCityname"]%> (<%=ticketOne["toCityCode"]%>)</h2>
					  <p><a href="http://www.fei580.com/airport/<%=ticketOne["toPort"]%>.htm" title="<%=ticketOne["tAirportName"]%>(<%=ticketOne["tAirportCode"]%>)" target="_blank"><%=ticketOne["tAirportName"]%>(<%=ticketOne["tAirportCode"]%>)</a><br /><span><a href="http://www.fei580.com/airport/<%=ticketOne["toPort"]%>.htm" title="<%=ticketOne["tAirportName"]%>介绍" target="_blank">机场简介</a></span><span><a href="http://www.fei580.com/airport/<%=ticketOne["toPort"]%>.htm" title="<%=ticketOne["tAirportName"]%>地图" target="_blank">机场地图</a></span><span><a href="http://www.fei580.com/airport/<%=ticketOne["toPort"]%>.htm" title="<%=ticketOne["tAirportName"]%>交通" target="_blank">机场交通</a></span></p>					
					</td>
				  </tr>
				</table>
			  </th>
			  <td class="In_tdclass">
			   
			   <ul class="In_onlineul">
				 <li class="one"><img src="http://www.fei580.com/<%=ticketOne["logoPic"]%>" alt="<%=ticketOne["airname"]%>"  /></li>
				 <li class="two"><%=ticketOne["airname"]%></li>
				 <li class="three">机队情况：<%=ticketOne["planNum"]%>&nbsp;&nbsp;&nbsp;平均机龄：<%=ticketOne["age"]%></li>
				 <li class="three"><a href="http://www.fei580.com/airline/<%=ticketOne["airId"]%>.htm" title="进入航空公司专区"><%=ticketOne["airname"]%>官网</a></li>
			   </ul>
			  
			  </td>
			  <td class="In_tdclass">
			  
				<div class="In_onlinetabletwo">
				  <img src="http://www.fei580.com/images/In_inline012.jpg" alt="航线评分" style="float:left;" />
				  <ul>
				    <li class="one"><p>航线积分<code><%=ticketOne["score"]%>+<%=ticketOne["score"]%></code></p></li>
				    <li class="two">飞瀛人综评</li>
					<li class="three"><img src="http://www.fei580.com/images/In_inline_num_<%=ticketOne["zongping"]%>.jpg" alt="" /></li>
				    <li class="two">喜爱度</li>
					<li class="three"><img src="http://www.fei580.com/images/In_inline_num_<%=ticketOne["xiai"]%>.jpg" alt="" /></li>
				    <li class="two">消费度</li>
					<li class="three"><img src="http://www.fei580.com/images/In_inline_num_<%=ticketOne["xiaofei"]%>.jpg" alt="" /></li>
				    <li class="two">飞行满意度</li>
					<li class="three"><img src="http://www.fei580.com/images/In_inline_num_<%=ticketOne["manyi"]%>.jpg" alt="" /></li>
				    <li class="two">航空服务态度</li>
					<li class="three"><img src="http://www.fei580.com/images/In_inline_num_<%=ticketOne["fuwu"]%>.jpg" alt="" /></li>
				    <li class="four"><img src="http://www.fei580.com/images/In_inline05.jpg" alt="" /><a href="http://www.fei580.com/airline.aspx" title="搜索航空公司">国际航空公司</a><img src="http://www.fei580.com/images/In_inline05.jpg" alt="航空公司评价" /><a href="http://www.fei580.com/airline/<%=ticketOne["airId"]%>.htm" title="我要评价航空公司" ><%=ticketOne["airname"]%>评价</a></li>
				  </ul>
				</div>
			  
			  </td>
			</tr>
		  </table>
		  
		  <ul class="In_onlineultwo">
		    <%if (ticket_7.Count != 0)
        {
            string tickeAndAirlines = "";
             %>
		    <li class="one">7天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			    <%int j = 0; %>
			    <% for (int i = 0; i < ticket_7.Count; i++)
                {
                 
              System.Data.DataRow ticket_7_row = ticket_7[i];

              string tickeAndAirline = ticket_7_row["untaxPrice"].ToString() + ticket_7_row["airname"].ToString();
              if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
              {
              %>
               <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_7_row["ticketId"].ToString())%>.htm" target="_blank"><img src="http://www.fei580.com/<%=ticket_7_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_7_row["untaxPrice"].ToString())%></a></td>
			    <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
			
			<%if (ticket_14.Count != 0)
        {
            string tickeAndAirlines = "";
           
         %>
		    <li class="one">14天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			    <%int j = 0; %>
			    <% for (int i = 0; i < ticket_14.Count; i++)
                {
                  System.Data.DataRow ticket_14_row = ticket_14[i];
                  
                  string tickeAndAirline = ticket_14_row["untaxPrice"].ToString() + ticket_14_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
                    <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_14_row["ticketId"].ToString())%>.htm" target="_blank"><img src="http://www.fei580.com/<%=ticket_14_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_14_row["untaxPrice"].ToString())%></a></td>
			  <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     <%for (int i = 0; i < (tmax - j); i++)
                {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
			     
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
			
			
			
			
				<%if (ticket_30.Count != 0)
        {
            string tickeAndAirlines = "";
          %>
		    <li class="one">30天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0" >
			    <tr>
			    <%int j = 0; %>
			    <% for (int i = 0; i < ticket_30.Count; i++)
                {
                  System.Data.DataRow ticket_30_row = ticket_30[i];
                    string tickeAndAirline = ticket_30_row["untaxPrice"].ToString() + ticket_30_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
               <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_30_row["ticketId"].ToString())%>.htm" target="_blank"><img src="http://www.fei580.com/<%=ticket_30_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_30_row["untaxPrice"].ToString())%></a></td>
			    <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
			
			
			
				<%if (ticket_60.Count != 0)
        {
            string tickeAndAirlines = "";
          %>
		    <li class="one">60天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_60.Count; i++)
                {
                  System.Data.DataRow ticket_60_row = ticket_60[i];
                   string tickeAndAirline = ticket_60_row["untaxPrice"].ToString() + ticket_60_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_60_row["ticketId"].ToString())%>.htm" target="_blank"><img src="http://www.fei580.com/<%=ticket_60_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_60_row["untaxPrice"].ToString())%></a></td>
			   <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
             
             
             
				<%if (ticket_90.Count != 0)
        {   string tickeAndAirlines = "";
        
        %>
		    <li class="one">90天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_90.Count; i++)
                {
                    System.Data.DataRow ticket_90_row = ticket_90[i];
                       string tickeAndAirline = ticket_90_row["untaxPrice"].ToString() + ticket_90_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_90_row["ticketId"].ToString())%>.htm" target="_blank"><img src="http://www.fei580.com/<%=ticket_90_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_90_row["untaxPrice"].ToString())%></a></td>
			    <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
             
             		<%if (ticket_120.Count != 0)
        { string tickeAndAirlines = ""; 
        %>
		    <li class="one">120天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_120.Count; i++)
                {
                    System.Data.DataRow ticket_120_row = ticket_120[i];
                          string tickeAndAirline = ticket_120_row["untaxPrice"].ToString() + ticket_120_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_120_row["ticketId"].ToString())%>.htm" target="_blank"><img src="http://www.fei580.com/<%=ticket_120_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_120_row["untaxPrice"].ToString())%></a></td>
			   <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
             
             
             
				<%if (ticket_180.Count != 0)
        {
            string tickeAndAirlines = ""; 
          %>
		    <li class="one">180天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_180.Count; i++)
                {
                    System.Data.DataRow ticket_180_row = ticket_180[i];
                              string tickeAndAirline = ticket_180_row["untaxPrice"].ToString() + ticket_180_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_180_row["ticketId"].ToString())%>.htm" target="_blank"><img src="http://www.fei580.com/<%=ticket_180_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_180_row["untaxPrice"].ToString())%></a></td>
			  <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>"  style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
	
			
					<%if (ticket_365.Count != 0)
       {
           string tickeAndAirlines = ""; 
            %>
		    <li class="one">365天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_365.Count; i++)
                {
                    System.Data.DataRow ticket_365_row = ticket_365[i];
                  string tickeAndAirline = ticket_365_row["untaxPrice"].ToString() + ticket_365_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_365_row["ticketId"].ToString())%>.htm" target="_blank"><img src="http://www.fei580.com/<%=ticket_365_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_365_row["untaxPrice"].ToString())%></a></td>
			   <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
	
	
		  </ul>
		  
	  </div>
	  
	  
	  
	</div>
  </div>
  <!--onlinebox end-->
  
  
   <!--twolinebox start-->
    <div class="clearbox">
	  <div class="In_left">
	    <div class="In_lefttitle"><h1><%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票</h1></div>
		<table cellpadding="0" cellspacing="0" class="In_lefttable">
		 
		  
		  <tr>
		     <td align="right">行程</td>
			<td colspan="3">&nbsp;<%=xingcheng%></td>
		  </tr>
		 
		  <tr>
		    <td align="right">航空公司</td>
			<td colspan="3">&nbsp;<img src="<%=ticketOne["smallPic"]%>" alt="<%=ticketOne["airname"]%>" /><a href="http://www.fei580.com/airline/<%=ticketOne["airId"]%>.htm" target="_blank"><%=ticketOne["airname"]%></a></td>
		  </tr>
		  <% if (flight != null && flight.ft == "2")
       { %>
		  <tr>
		    <td align="right" style="font-weight:bold;color:Red;">去程</td>
			<td colspan="3">&nbsp;</td>
		  </tr>
		  <tr>
		    <td align="right">出发地</td>
			<td>&nbsp;<%=ticketOne["fromCityName"]%></td>
			<td align="right">目的地</td>
			<td>&nbsp;<%=ticketOne["toCityName"]%></td>
		  </tr>
		  <tr>
		    <td align="right">出发地机场</td>
			<td>&nbsp;<%=ticketOne["fAirportName"]%></td>
			<td align="right">目的地机场</td>
			<td>&nbsp;<%=ticketOne["tAirportName"]%></td>
		  </tr>
		  <asp:Panel ID="Panel1" runat="server" Visible="true" >
		  <tr>
		    <td align="right">出发时间</td>
			<td>&nbsp;<%=ticketOne["startTime"]%></td>
			<td align="right">到达时间</td>
			<td>&nbsp;<%=ticketOne["arriveTime"]%></td>
		  </tr>
		  </asp:Panel>
		  <tr>
		    <td align="right">中转机场</td>
			<td>&nbsp;<%=display_route(ticketOne["relayPort"].ToString())%></td>
		    <td align="right">机型</td>
			<td>&nbsp;<%=flight_fplan%></td>
		  </tr>
		  <tr>
		    <td align="right" style="font-weight:bold;color:Red;">回程</td>
			<td colspan="3">&nbsp;</td>
		  </tr>
		  <tr>
		    <td align="right">出发地</td>
			<td>&nbsp;<%=ticketOne["toCityName"]%></td>
			<td align="right">目的地</td>
			<td>&nbsp;<%=ticketOne["fromCityName"]%></td>
		  </tr>
		  <tr>
		    <td align="right">出发地机场</td>
			<td>&nbsp;<%=ticketOne["tAirportName"]%></td>
			<td align="right">目的地机场</td>
			<td>&nbsp;<%=ticketOne["fAirportName"]%></td>
		  </tr>
		  <asp:Panel ID="Panel2" runat="server" Visible="true" >
		  <tr>
		    <td align="right">出发时间</td>
			<td>&nbsp;<% = flight.arrroute.depdate + " " + flight.arrroute.deptime.Insert(2, ":")%></td>
			<td align="right">到达时间</td>
			<td>&nbsp;<% = flight.arrroute.arrdate + " " + flight.arrroute.arrtime.Insert(2, ":")%></td>
		  </tr>
		  </asp:Panel>
		  <tr>
		    <td align="right">中转机场</td>
			<td>&nbsp;<%=display_route(flight.arrroute.route)%></td>
		    <td align="right">机型</td>
			<td>&nbsp;<%=flight_tplan%></td>
		  </tr>
		  <%}
       else if(ticketOne["tripType"].ToString()=="1"){
           %>
		  <tr>
		    <td align="right" style="font-weight:bold;color:Red;">去程</td>
			<td colspan="3">&nbsp;</td>
		  </tr>
		  <tr>
		    <td align="right">出发地</td>
			<td>&nbsp;<%=ticketOne["fromCityName"]%></td>
			<td align="right">目的地</td>
			<td>&nbsp;<%=ticketOne["toCityName"]%></td>
		  </tr>
		  <tr>
		    <td align="right">出发地机场</td>
			<td>&nbsp;<%=ticketOne["fAirportName"]%></td>
			<td align="right">目的地机场</td>
			<td>&nbsp;<%=ticketOne["tAirportName"]%></td>
		  </tr>
		  <asp:Panel ID="Panel3" runat="server" Visible="true" >
		  <tr>
		    <td align="right">出发时间</td>
			<td>&nbsp;<%=readTimeFromCookie(ticketOne["fromCityCode"].ToString(), ticketOne["toCityCode"].ToString(), ticketOne["fAirportCode"].ToString(), "toDt", DateTime.Now.ToString("yyyy-MM-dd"))%></td>
			<td align="right">到达时间</td>
			<td>&nbsp;<%=readTimeFromCookie(ticketOne["fromCityCode"].ToString(), ticketOne["toCityCode"].ToString(), ticketOne["fAirportCode"].ToString(), "arriveDt", DateTime.Now.ToString("yyyy-MM-dd"))%></td>
		  </tr>
		  </asp:Panel>
		  <tr>
		    <td align="right">中转机场</td>
			<td>&nbsp;<%=display_route(ticketOne["relayPort"].ToString())%></td>
		    <td align="right">机型</td>
			<td>&nbsp;<%=flight_fplan%></td>
		  </tr>
		  <tr>
		    <td align="right" style="font-weight:bold;color:Red;">回程</td>
			<td colspan="3">&nbsp;</td>
		  </tr>
		  <tr>
		    <td align="right">出发地</td>
			<td>&nbsp;<%=ticketOne["toCityName"]%></td>
			<td align="right">目的地</td>
			<td>&nbsp;<%=ticketOne["fromCityName"]%></td>
		  </tr>
		  <tr>
		    <td align="right">出发地机场</td>
			<td>&nbsp;<%=ticketOne["tAirportName"]%></td>
			<td align="right">目的地机场</td>
			<td>&nbsp;<%=ticketOne["fAirportName"]%></td>
		  </tr>
		  <asp:Panel ID="Panel4" runat="server" Visible="true" >
		  <tr>
		    <td align="right">出发时间</td>
			<td>&nbsp;<%=readTimeBackCookie(ticketOne["fromCityCode"].ToString(), ticketOne["toCityCode"].ToString(),ticketOne["fAirportCode"].ToString(), "toDt", DateTime.Now.AddDays(1).ToString("yyyy-MM-dd"))%></td>
			<td align="right">到达时间</td>
			<td>&nbsp;<%=readTimeBackCookie(ticketOne["fromCityCode"].ToString(), ticketOne["toCityCode"].ToString(), ticketOne["fAirportCode"].ToString(), "arriveDt", DateTime.Now.AddDays(1).ToString("yyyy-MM-dd"))%></td>
		  </tr>
		  </asp:Panel>
		  <tr>
		    <td align="right">中转机场</td>
			<td>&nbsp;<%=display_route(ticketOne["relayPort"].ToString())%></td>
		    <td align="right">机型</td>
			<td>&nbsp;<%=flight_fplan%></td>
		  </tr>
           <%} else { %>
		  <tr>
		    <td align="right">出发地</td>
			<td>&nbsp;<%=ticketOne["fromCityName"]%></td>
			<td align="right">目的地</td>
			<td>&nbsp;<%=ticketOne["toCityName"]%></td>
		  </tr>
		  <tr>
		    <td align="right">出发地机场</td>
			<td>&nbsp;<%=ticketOne["fAirportName"]%></td>
			<td align="right">目的地机场</td>
			<td>&nbsp;<%=ticketOne["tAirportName"]%></td>
		  </tr>
		  <asp:Panel ID="pan_aifeitime" runat="server" Visible="true" >
		  <tr>
		    <td align="right">出发时间</td>
			<td>&nbsp;<%=ticketOne["startTime"]%></td>
			<td align="right">到达时间</td>
			<td>&nbsp;<%=ticketOne["arriveTime"]%></td>
		  </tr>
		  </asp:Panel>
		  <tr>
		    <td align="right">中转机场</td>
			<td>&nbsp;<%=display_route(ticketOne["relayPort"].ToString())%></td>
			<td align="right">免费行李额</td>
			<td>&nbsp;<%=ticketOne["bagPrice"]%></td>
		  </tr>
		  <tr>
		    <td align="right">机型</td>
			<td>&nbsp;<%=flight_fplan%></td>
			<td align="right">客票类型</td>
			<td>&nbsp;<%=ticketOne["engerTicket"]%></td>
		  </tr>
       <%} %>	  
		  <tr>
		    <td colspan="4"><div class="yutish">使用条款(请确认使用条款是否符合你的出行需求)</div></td>
		  </tr>
		  <tr>
		    <td align="right">舱位</td>
			<td>&nbsp;<%=ticketOne["seatShip"]%></td>
			<td align="right">不含税价格</td>
			<td>&nbsp;<strong><code style="font-size:18px; color:Red;">CNY<%=ticketOne["untaxPrice"]%></code></strong></td>
		  </tr>
		  <tr>
		    <td align="right">最短停留日期</td>
			<td>&nbsp;<%=ticketOne["shortstayDate"]%>天</td>
			<td align="right">旺季附加费</td>
			<td>&nbsp;<%=ticketOne["attPrice"]%></td>
		  </tr>
		  <tr>
		    <td align="right">最长停留日期</td>
			<td>&nbsp;<%=ticketOne["longstayDate"]%>天</td>
			<td align="right">儿童/婴儿/折扣价</td>
			<td>&nbsp;<%=ticketOne["childPrice"]%></td>
		  </tr>
		 
		  <tr>
		    <td align="right">开始售票日期</td>
			<td>&nbsp;<%=string.IsNullOrEmpty(ticketOne["fromsaleDate"].ToString()) ? string.Empty : Convert.ToDateTime(ticketOne["fromsaleDate"].ToString()).ToString("yyyy-MM-dd")%></td>
			<td align="right">结束售票日期</td>
			<td>&nbsp;<%=string.IsNullOrEmpty(ticketOne["tosaleDate"].ToString()) ? string.Empty : Convert.ToDateTime(ticketOne["tosaleDate"].ToString()).ToString("yyyy-MM-dd")%></td>
		  </tr>
		  <tr>
		    <td align="right">开始旅行日期</td>
			<td>&nbsp;<%=string.IsNullOrEmpty(ticketOne["fromtripDate"].ToString()) ? string.Empty : Convert.ToDateTime(ticketOne["fromtripDate"].ToString()).ToString("yyyy-MM-dd")%></td>
			<td align="right">最迟出发日期</td>
			<td>&nbsp;<%=string.IsNullOrEmpty(ticketOne["totripDate"].ToString()) ? string.Empty : Convert.ToDateTime(ticketOne["totripDate"].ToString()).ToString("yyyy-MM-dd")%></td>
		  </tr>
		  <tr>
		    <td align="right">退款条款</td>
			<td>&nbsp;<%=ticketOne["returnMoney"]%></td>
			<td align="right">改期条款</td>
			<td>&nbsp;<%=ticketOne["updateProvision"]%></td>
		  </tr>
		  <tr>
		    <td colspan="4"><div class="yutish">限制条款(机票限制条款非常重要，请详细阅读)</div></td>
		  </tr>
		  <tr>
		    <td colspan="4">
			<div class="yutishinfor">
			<!--<%=ticketOne["limitProvision"]%>-->
			<p>1．此票价为净价，不含税费</p>
			<p>2．票价与旅客的出行日期相关，以出票为准</p>
			<p>3．退改票手续 :视具体机票条款而定</p>
			<p>4．误机(NOSHOW) :需收取误机费</p>
			<p>5．更改订座 : 允许更改。乘客必须于出发日之前取消原订的航班，否则按照 '误机' 处理</p>
			<p>6．儿童票价 :成人票价的75%</p>
			<p>7．婴儿票价 :使用 IATA 公布成人票价的10%</p>
			</div>
			</td>
		  </tr>
		  <tr>
		    <td colspan="4">
			  <ul class="In_onlineulthree">
			    <li class="one">温馨提示：由于国际机票情况复杂、操作繁琐，<br />建议您先致电400-885-0663/020-38039589给我们的操作员再进行支付，谢谢！</li>
                <li class="two">
				  <a href="tencent://message/?uin=531658630&Site=飞瀛网&Menu=yes" target="_blank" rel="nofollow"><img src="http://www.fei580.com/images/qq.gif" alt="QQ" /></a><br />
				  <a id="chat" href="http://www.fei580.com/chat/" target="_blank"  rel="nofollow"><img src="http://www.fei580.com/images/msn.gif" alt="QQ" /></a>
				</li>
			  </ul>
			</td>
		  </tr> 
		</table>
	  </div>
	  
	  
	  <div class="In_right">
	    <div class="In_righttitle">快速预定</div>
		<div class="In_rightbox">
			<table cellpadding="0" cellspacing="12">
			  <tr>
			    <td align="right">机票</td>
				<td><input id="title" type="text" class="In_rightinput" name="title" value="[<%=(ticketOne["tripType"].ToString()=="1")?"往返":"单程"%>] <%=ticketOne["fromCityName"]%>-<%=ticketOne["toCityName"]%> (￥<%=ticketOne["untaxPrice"]%>)" />
				    <input id="tId" type="hidden" name="tId" value="<%=ticketOne["tId"].ToString()%>" /> 
				</td>
			  </tr>
			  <tr>
			    <td align="right">姓名</td>
				<td><input id="contact" type="text" class="In_rightinput" name="contact"/></td>
			  </tr>
			  <tr>
			    <td align="right">出发日期</td>
				<td><input id="tripDate" type="text" class="In_rightinput" style="width:120px" name="tripDate" /></td>
			  </tr>
			  <tr>
			    <td align="right">返回日期</td>
				<td><input id="backDate" type="text" class="In_rightinput" style="width:120px" name="backDate"  /></td>
			  </tr>
			  <tr>
			    <td align="right">联系电话</td>
				<td><input id="telephone" type="text" class="In_rightinput" name="telephone" /></td>
			  </tr>
			  <tr>
			    <td align="right">紧急预订</td>
				<td><select id="harryGrade" name="harryGrade">
				<option value="不着急">不着急</option>
				<option value="紧急">紧急</option>
				</select></td>
			  </tr>
			  <tr>
			    <td align="right" valign="top">留言</td>
				<td><textarea  id="otherMess" name="otherMess" cols="" rows=""></textarea></td>
			  </tr>
			  <tr>
			    <td align="right">预定数量</td>
				<td>
				 <select  id="num" name="num">
				 <option value="1" selected="selected">1</option>
				  <option value="2">2</option>
				   <option value="3">3</option>
				    <option value="4">4</option>
				     <option value="5">5</option>
				      <option value="6">6</option>
				       <option value="7">7</option>
				        <option value="8">8</option>
				         <option value="9">9</option>
				          <option value="10">10</option>
				 </select>
				</td>
			  </tr>
			  <tr>
			    <td colspan="2" align="center"><input type="button" class="In_rightsubmit" onclick="sendTicketBookMsg();" /></td>
			  </tr>
			   <tr>
			    <td colspan="2" align="center" class="vfontsize"><img src="http://www.fei580.com/images/In_inline032.jpg" alt="" />我们将尽快与你联系确认.</td>
			  </tr>
			</table>
		</div>
        <img src="http://www.fei580.com/images/In_inline030.jpg" style="float:left" alt="" />

	    <div class="ticketdoc_rightbox">
	      <div class="ticketdoc_righttitle"><strong>热门机票</strong><code>本周TOP10</code></div>
	       <%if (randowTicketF!=null && randowTicketF.Count != 0)
           { %>
	      <ul class="ticketdoc_rightul">
 	        <% for (int i = 0; i < randowTicketF.Count; i++)
                {
                    System.Data.DataRow randow_row = randowTicketF[i];%>
                          <li><a href="http://www.fei580.com/ticket_<%=Convert.ToInt32(randow_row["ticketId"].ToString())%>.htm" target="_blank" ><%=randow_row["fromCityName"]%>到<%=randow_row["toCityName"]%>机票</a><span>￥<%=randow_row["untaxPrice"]%></span></li>
                   <% }%>
	      </ul>
	      <%} %>
	    </div>

	  </div>
	  
	  
    </div>
   <!--twolinebox end-->
  
   
  <!--threelinebox start-->
    <h2 class="In_threeboxtitle"><%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票相关推荐&nbsp;-&nbsp;不含税价</h2>
	<div class="In_threeboxline In_tickTz">

		

     <%if (ticket_all.Count != 0)
        { %>
          <% for (int i = 0; i < ticket_all.Count; i++)
                {
                    System.Data.DataRow ticket_all_row = ticket_all[i];%>
	  <ul>
	    <li class="one"><a href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_all_row["ticketId"].ToString())%>.htm">[<%=(ticket_all_row["tripType"].ToString()=="1")?"往返":"单程"%>]<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票</a></li>
		<li class="two"><a href="http://www.fei580.com/ticket_<%=Convert.ToInt32(ticket_all_row["ticketId"].ToString())%>.htm" rel="nofollow"><%=ticket_all_row["untaxPrice"]%></a></li>
		<li class="three"><img src="http://www.fei580.com/<%=ticket_all_row["smallPic"]%>" alt="" /><a href="http://www.fei580.com/airline/<%=ticket_all_row["airId"]%>.htm"><%=ticket_all_row["airname"]%></a></li>
		<li class="four"><%=ticket_all_row["seatShip"]%></li>
		<li class="four">停留期<%=ticket_all_row["shortstayDate"]%>天-<%=ticket_all_row["longstayDate"]%>天</li>
		<li class="four">最迟出发时间&nbsp;<%=ticket_all_row["totripDate"]%></li>
		<li class="four">最迟出票时间&nbsp;<%=ticket_all_row["tosaleDate"]%></li>
	  </ul>
	  
	  
	   <% }
                }
             %>
	
	</div>
	<div class="ck_xg_b"></div>
  <!--threelinebox end-->
 
 <div class="clear"></div>
 <div id="duilianb02" style="display:none;">
  
 <div  id="tipbi1" style="width:242px;display:none;">
     <div class="dubi_boxtitle"><a href="javascript:showCompare('tipbi1')" rel="nofollow">收回&gt;&gt;</a></div>
     <div class="dubi_boxtwo">
	   <ul id="compareList">
	   </ul>
	   <p><input type="button" value="比较机票" onclick="window.open('http://www.fei580.com/contrast.aspx')" /> </p>
	 </div>
</div>


  <div class="dubi_box" id="compareBut">
   <a href="javascript:showCompare('tipbi1')">&nbsp;</a>
  <input onclick='closeCompareBut()' type="button" alt="" />
  </div>
  	    <script type="text/javascript">  	        Compare_show();</script>
</div>
<script src="http://www.fei580.com/js/scrolljs02.js" type="text/javascript"></script>
</div>
 <uc1:footControl ID="FootControl" runat="server" />
</form>
</div>

<script type="text/javascript">
    addHistory('<%=ticketOne["fromCityname"]%>-<%=ticketOne["toCityname"]%>', '￥<%=ticketOne["untaxPrice"]%>', 'http://www.fei580.com/ticket_<%=ticketOne["tId"]%>.htm')
</script>
<%} %>

 <div class="clear"></div>
<div id="duilian02" style="top:400px;left:0px;" class="kf_2012_box">
    <div class="kf_2012_lbox">
	    <img src="http://www.fei580.com/images/kf_l.gif" border="0" usemap="#Map3" />
        <map name="Map3" id="map4">
            <area style="cursor:pointer;" onclick='show(1)' shape="rect" coords="4,12,26,101" href="javascript:void(0);" />
            <area style="cursor:pointer;" onclick='show(2)' shape="rect" coords="3,110,26,201" href="javascript:void(0);" />
        </map>
    </div>
    <div id="tip4341" class="kf_2012_rbox1" style="display:block">
	    <img src="http://www.fei580.com/images/kf_r1.gif" border="0" usemap="#Map" />
	    <input id="eMsg_tel" type="text" class="kf_2012_input" />
        <map name="Map" id="map5">
            <area shape="rect" style="cursor:pointer;" coords="237,5,267,31" onclick='show("tip4341")' href="javascript:void(0);" />
            <area shape="rect" style="cursor:pointer;" coords="186,110,259,138" onclick="sendTelMsg()" href="javascript:void(0);"  />
            <area shape="rect" style="cursor:pointer;" coords="123,160,260,183" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '航班详情页','咨询','点击']);" id="ochat" rel="nofollow" target="_blank" title="在线客服" />
        </map>
    </div>
	<div id="tip4342" class="kf_2012_rbox2" style=" display:none" >
	    <img src="http://www.fei580.com/images/kf_r2.gif" border="0" usemap="#Map2" />
        <map name="Map2">
            <area shape="rect" style="cursor:pointer;" coords="237,5,267,31" onclick='show("tip4342")' href="javascript:void(0);" />
            <area shape="rect" style="cursor:pointer;" coords="83,36,256,62" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '航班详情页','咨询','点击']);" id="mchat" rel="nofollow" target="_blank" title="在线客服" />
            <area shape="rect" style="cursor: pointer;" coords="84,72,167,98" href="tencent://message/?uin=32335510&Site=飞瀛网&;Menu=yes" />
            <area shape="rect" style="cursor: pointer;" coords="84,100,167,123" href="tencent://message/?uin=937056717&Site=飞瀛网&Menu=yes" />
            <area shape="rect" style="cursor: pointer;" coords="83,127,167,147" href="tencent://message/?uin=531658630&Site=飞瀛网&Menu=yes" />
            <area shape="rect" style="cursor:pointer;" coords="173,71,258,96" id="msn1" href="http://www.fei580.com/chat/" target="_blank" />
            <area shape="rect" style="cursor:pointer;" coords="172,126,256,149" id="msn2" href="http://www.fei580.com/chat/" target="_blank" />
            <area shape="rect" style="cursor:pointer;" coords="173,99,256,122" id="msn3" href="http://www.fei580.com/chat/" target="_blank" />
        </map>
    </div>
</div>
<script type="text/javascript" src="http://www.fei580.com/js/datepicker.js"></script>
<script language="javascript" src="http://www.fei580.com/js/scrolljs.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/baidusubmit.js"></script>
</body>
</html>