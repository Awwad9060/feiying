<%@ Page Language="C#" AutoEventWireup="true" CodeFile="recommend.aspx.cs" Inherits="Recommend" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />  
<meta name="applicable-device" content="pc,mobile"> 
<meta name="MobileOptimized" content="width"/> 
<meta name="HandheldFriendly" content="true"/> 
<title>特价国际机票查询_国际特价机票预订：400-885-0663(免费) - 飞瀛网</title>
<meta name="keywords" content="特价机票,特价国际机票,国际机票查询,国际航班预订,国际实时航班" />
<meta name="Description"  content="飞瀛网为您提供广州,香港,澳门,上海,北京出发特价国际机票,打折国际机票,以及最新实时国际航班票价查询服务.免费热线：400-885-0663" />
<meta content="all" name="robots" />
<meta property="og:image" content="http://www.fei580.com/logo.jpg"/>
<link rel="Baidu-Search-icon" sizes="121x75" href="http://www.fei580.com/logo.jpg" />
<link rel="canonical" href="http://www.fei580.com/recommend.aspx" />
<link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/hotcity.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/datepicker.css" rel="stylesheet" type="text/css"/>
<link href="http://www.fei580.com/CityClient/CitySelector.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/index.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/JQuery.cookie.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/ticket.search.js"></script>
<script type="text/javascript" src="http://www.fei580.com/CityClient/CityData.js"></script>
<script type="text/javascript" src="http://www.fei580.com/CityClient/CitySelector.js"></script>
<script type="text/javascript"  >
    function getRequest(name) {
        var url = location.href;
        var paraString = url.substring(url.indexOf("?") + 1, url.length).split("&");
        var paraObj = {};
        for (i = 0; j = paraString[i]; i++) {
            paraObj[j.substring(0, j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=") + 1, j.length);
        }
        var returnValue = paraObj[name.toLowerCase()];
        return typeof (returnValue) == "undefined" ? "" : returnValue;
    }

    $(function() {
        var hmsr = getRequest("hmsr");
        var medium = getRequest("utm_medium");
        var campaign = getRequest("utm_campaign");
        var keywords = getRequest("utm_content");
        if (hmsr == null || hmsr == "") { hmsr = getRequest("utm_source"); } else { hmsr = getRequest("hmsr"); }
        if (keywords == null || keywords == "") { keywords = "Rencommend"; } else { keywords = getRequest("utm_content"); }
        if (medium == null || medium == "") { medium = "PPC"; } else { medium = getRequest("utm_medium"); }
        if (campaign == null || campaign == "") { campaign = getRequest("hmpl"); } else { campaign = getRequest("utm_campaign"); }
        if (hmsr == null || hmsr == "") {
            $(".msn_line a").attr("href", function(i, origValue) { return origValue + "&utm_source=PageLink&utm_medium=Organic&utm_content=" + keywords; });
            $("#ochat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#mchat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn1").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn2").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn3").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
        } else {
            $(".msn_line a").attr("href", function(i, origValue) { return origValue + "&utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#ochat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#mchat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn1").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn2").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn3").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
        }
    });
    $(document).ready(function() {
        //出发城市
        SetAllSelects.setAllSelectStyle();
        //目的城市
        var dx = new VSxClientCountrySelector('tocityName', CityData, 'right');
        dx.Init();
        //日期控件
        TripBackDate(document.getElementById("fromtripDate"), document.getElementById("backtripDate"));
        //日期控件
        TripBackDate(document.getElementById("ids_tripDate"), document.getElementById("ids_backDate"));
        $("#showcity").click(function() {
            $("#hotcityDiv").css({ "display": "block", "left": "180px", "top": "310px" });
        });
        $(".citylist li").click(function() {
            $("#hotcityDiv").css({  "left": "265px", "top": "121px" });
        });
        $(".close").click(function() {
            $("#hotcityDiv").css({ "left": "265px", "top": "121px" });
        });
    });
</script>
</head>
<body>
<div class="mainbody" >
<form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="Home" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="eMail" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="飞瀛网" /></a></div>
  <div class="headerbottom_right">
      <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="http://www.fei580.com/login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="会员登录" rel="nofollow">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册" rel="nofollow">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务" rel="nofollow">关于飞瀛</a>
    <%
        }
        else
        {
     %>
    <a href="http://www.fei580.com/person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="http://www.fei580.com/person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="">退出登录</a>
    <%}
         %> 
    </div> <ul class="menu_1">
      <li class="four"><a rel="nofollow" href="http://www.fei580.com/" title="首页">首&nbsp;页</a></li>
      <li class="one"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li-->
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a rel="nofollow" href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a rel="nofollow" href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="new" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司">航空公司</a></li>
	      <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
	      <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型">民航机型</a></li>
	      <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="积分广场">积分广场</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
	<div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="">飞瀛网</a>&gt;<a href="http://www.fei580.com/international.aspx" title="">国际机票</a></div>
  </div>
</div>
<!--header end-->

<div style="margin:0px auto;width:968px;position:relative;">

<!--onelinebox start-->
  <div class="Special_left">
  
  
  	<div class="International_rightboxtwo">
	  <ul class="International_rightul">
	    <li class="one" id="In_right1" onMouseOver="In_turnit(1);">1</li>
		<li class="two" id="In_right2" onMouseOver="In_turnit(2);">2</li>
		<li class="two" id="In_right3" onMouseOver="In_turnit(3);">3</li>
	  </ul>
	  <div class="International_rightboxthree">
	    <img src="http://www.fei580.com/images/International010.jpg" alt="" style="float:left;" />
		<p>
		   <!--hiddenone start-->
           <span id="In_rightChild1" class="nohidden">
		     <%
                if (picRecommendOne.Count != 0)
               {

                   for (int i = 0; i < picRecommendOne.Count; i++)
                {
                    System.Data.DataRow picRecommendOne_row = picRecommendOne[i];
                 %>
                  <a href="<%=picRecommendOne_row["ticketUrl"].ToString()%>" title="" rel="nofollow"><img src="http://www.fei580.com/<%=picRecommendOne_row["ticketPic"].ToString()%>" alt="" width="148px" height="148px" /></a>
			       <%
	              }
	              }
	            %>
			</span>
         <!--hiddenone end-->
        
        
        <!--hiddentwo start-->
           <span id="In_rightChild2" class="hidden">
		     <%
                if (picRecommendTwo.Count != 0)
               {

                   for (int i = 0; i < picRecommendTwo.Count; i++)
                {
                    System.Data.DataRow picRecommendTwo_row = picRecommendTwo[i];
                 %>
                  <a href="<%=picRecommendTwo_row["ticketUrl"].ToString()%>" title=""><img src="http://www.fei580.com/<%=picRecommendTwo_row["ticketPic"].ToString()%>" alt="" width="148px" height="148px" /></a>
			       <%
	              }
	              }
	            %>
		   </span>
         <!--hiddentwo end-->
		 
		 
		  <!--hiddenthree start-->
           <span id="In_rightChild3" class="hidden">
		    <%
                if (picRecommendThree.Count != 0)
               {

                   for (int i = 0; i < picRecommendThree.Count; i++)
                {
                    System.Data.DataRow picRecommendThree_row = picRecommendThree[i];
                 %>
                  <a href="<%=picRecommendThree_row["ticketUrl"].ToString()%>" title=""><img src="http://www.fei580.com/<%=picRecommendThree_row["ticketPic"].ToString()%>" alt="" width="148px" height="148px" /></a>
			       <%
	              }
	              }
	            %>
		   </span>
         <!--hiddenthree end-->
		 
		 
		</p>
		<img src="http://www.fei580.com/images/International011.jpg" alt="" style="float:left;" />
	  </div>
	</div>
	
	
	<div class="International_rightboxfour">
	  <img src="http://www.fei580.com/images/International09.jpg" alt="天天特价推荐" style="float:left;" />
	
		  <ul>
			  <% if (recommendEveryday.Count != 0)
               {
                   for (int i = 0; i < recommendEveryday.Count; i++)
                {
                    System.Data.DataRow recommendEveryday_row = recommendEveryday[i];
                 %>
			  <li onMouseOver="this.style.background='#E1F8FE'" onMouseOut="this.style.background=''">
			    <span class="International_one"><img src="http://www.fei580.com/images/In0<%=i+1%>.gif" alt="" /><a href="http://www.fei580.com/ticket_<%=recommendEveryday_row["tId"] %>.htm" title="<%=recommendEveryday_row["title"].ToString()%>" target="_blank"><%=recommendEveryday_row["title"].ToString()%></a></span>
				<span class="International_three"><a href="http://www.fei580.com/ticket_<%=recommendEveryday_row["tId"] %>.htm" title="<%=recommendEveryday_row["title"].ToString()%>" target="_blank"><code>￥<%=recommendEveryday_row["untaxPrice"].ToString()%></code></a></span>
				<span class="International_two"><img src="http://www.fei580.com/<%=recommendEveryday_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=recommendEveryday_row["airline"]%>.htm"><%=recommendEveryday_row["airname"].ToString()%></a></code></span>
				<span class="International_four"><%=Convert.ToDateTime(recommendEveryday_row["tosaleDate"].ToString()).ToShortDateString()%></span>
			  </li>
			      <%}}%>
		  </ul>
	  
	</div>
  
  
    <div class="International_rightbox">
	  <img src="http://www.fei580.com/images/International05.jpg" alt="" class="International_img" />
	  <div class="tablerightbox" style="position:relative;left:0;top:0;z-index:2;">
	    <ul class="tablerightbox_ul">
		  <li class="International_rightinputbox">
			<img src="http://www.fei580.com/images/International08.jpg" alt="行程" onclick="showTripType();" />
			<input type="text" value="行程" id="tripType_str" runat="server"/>
			<div id="typeList" class="jscss" style="display:none;"> 
				<div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';"  onclick="insertTypeValue('单程');">单程</div> 
				<div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';"  onclick="insertTypeValue('往返');">往返</div> 
			</div>
		  </li>
		  <li class="International_rightinputbox">
			  <img src="http://www.fei580.com/images/International08.jpg" alt="出发地" onclick="showFromcity()" />
			  <input type="text" value="出发地" id="fromcityStr" runat="server"/>
			  <div id="fromList" class="jscss" style="display:none;"> 
				<div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';"  onclick="insertCityValue('广州');">广州</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('北京');">北京</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('上海');">上海</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('香港');">香港</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('澳门');">澳门</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('深圳');">深圳</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('长沙');">长沙</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('杭州');">杭州</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('宁波');">宁波</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('南京');">南京</div> 
                <div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';" onclick="insertCityValue('南京');">武汉</div> 
			</div>
		  </li>
		  <li class="International_rightinputbox">
			 <img src="http://www.fei580.com/images/International08.jpg" alt="目的地" id="showcity" />
			 <input type="text" id="ids_tocity" value="目的地" runat="server" />
		  </li>
		  <li class="International_rightinputbox">
			  <img src="http://www.fei580.com/images/International08.jpg" alt="航空公司"  />
			   <input type="text" id="txtd" value="航空公司" />
		  </li>
		</ul>
		    
		<ul class="tablerightbox_ulright">
		    <li class="International_rightinputbox">
			  <img src="http://www.fei580.com/images/International081.jpg" alt="出发时间" style="float:left;"><input type="text" value="出发时间" id="ids_tripDate" />
			</li>
			 <li class="International_rightinputbox">
			  <img src="http://www.fei580.com/images/International081.jpg" alt="返回时间" style="float:left;"><input type="text"  value="返回时间" id="ids_backDate"  />
			</li>
			
			<li  class="two">  <asp:ImageButton ID="ImageButton1" ImageUrl="http://www.fei580.com/images/International06.jpg"  OnClick="IDS_Search" runat="server" OnClientClick="return checkIds();"/>
		</li>
		</ul>
		
	
	  </div>
	</div>
	
	
  <div class="Special_leftbox">
     
		<ul class="International_rightultwo">
	 <li><a href="http://www.fei580.com/recommend.aspx#Asia" class="white">亚洲专区</a></li>
	  <li><a href="http://www.fei580.com/recommend.aspx#Euro" class="white">欧洲专区</a></li>
	  <li><a href="http://www.fei580.com/recommend.aspx#NAmerica" class="white">北美洲专区</a></li>
	  <li><a href="http://www.fei580.com/recommend.aspx#Oceania" class="white">大洋洲专区</a></li>
	  <li><a href="http://www.fei580.com/recommend.aspx#Africa" class="white">非洲专区</a></li>
		</ul>
	</div>
	
	
 </div>
 
  
   <div class="Special_right">
  
     <div class="onelinebox_leftboxone">
      <ul class="onelinebox_leftboxonetitle onelinebox_leftboxonetitle_soso1">
        <li class="one" id="right1" >国际机票</li>
        <li class="two" onclick="window.location.href='http://hotel.fei580.com'" >国际酒店</li>
        <li class="three" onclick="window.location.href='http://www.fei580.com/visa.html'" >国际签证</li>
      </ul>
      <div class="onelinebox_leftboxonebg">
        <!--hiddenone start-->
        <div id="rightChild1" class="nohidden">
	        <table class="onelinebox_leftbgbox" cellpadding="0" cellspacing="5">
	          <tr>
	            <td colspan="2" align="center">
	            <input id="tripType1" type="radio" name="tripType" checked="checked" value="2" />全部
	            &nbsp;<input id="tripType2" type="radio" name="tripType" value="0" />单程
	            &nbsp;<input id="tripType3" type="radio" name="tripType" value="1" />往返
	            </td>
	          </tr>
	          <tr>
	            <th width="70px">出发地</th>
	            <td>
	            <input id="fromCityHidden" type="text" value="广州" class="input2_2012" />
	            <asp:DropDownList ID="fromCity" runat="server" CssClass="select"></asp:DropDownList>
	          </td>
	          </tr>
	          <tr>
	            <th>目的地</th>
	            <td><input type="text" class="input_2012" id="tocityName" /></td>
	          </tr>
	          <tr>
	            <th>出发日期</th>
	            <td><input id="fromtripDate" type="text" class="input_2012" runat="server" /></td>
	          </tr>
	          <tr id="backtripTr">
	            <th>回程日期</th>
	            <td><input id="backtripDate" type="text" class="input_2012"  runat="server"/></td>
	          </tr>
	          <tr>
	            <td colspan="2" style="padding-bottom:26px;"><input type="button" id="btnSearch" value="" class="onesubmitcss"  /></td>
	          </tr>
	        </table>
        </div>
        <!--hiddenone end-->
       <script type="text/javascript">
       var ts = TicketSearch();
       </script>
        
      </div>
      </div>
	
	<div id="hotcityDiv" style="position:absolute;z-index:999999; background-color:#f3fbff; display:none;">
	<div class="hotCityBox">
	<div class="close"><img src="http://www.fei580.com/images/i_close3.gif" onclick="closehotcity()" alt="" style="cursor:pointer" /></div>
	<div class="main">
		<div class="continent ">
			<ul>
				<li class="now" onclick="showStateCity(1)" id="state001"><span class="cn"><a href="javascript:void(0)" target="_self">亚洲</a></span><span class="en"><a href="javascript:void(0)" target="_self">Asia</a></span></li>
				<li  onclick="showStateCity(2)" id="state002"><span class="cn"><a href="javascript:void(0)" target="_self">欧洲</a></span><span class="en"><a href="javascript:void(0)" target="_self">Europe</a></span></li>
				<li  onclick="showStateCity(3)" id="state003"><span class="cn"><a href="javascript:void(0)" target="_self">北美</a></span><span class="en"><a href="javascript:void(0)" target="_self">N America</a></span></li>
				<li  onclick="showStateCity(4)" id="state004"><span class="cn"><a href="javascript:void(0)" target="_self">南美</a></span><span class="en"><a href="javascript:void(0)" target="_self">S America</a></span></li>
				<li  onclick="showStateCity(5)" id="state005"><span class="cn"><a href="javascript:void(0)" target="_self">澳洲</a></span><span class="en"><a href="javascript:void(0)" target="_self">Oceania</a></span></li>
				<li  onclick="showStateCity(6)" id="state006"><span class="cn"><a href="javascript:void(0)" target="_self">非洲</a></span><span class="en"><a href="javascript:void(0)" target="_self">Africa</a></span></li>
			</ul>
			<div class="clear"></div>
		</div>
		<div class="citylist" id="citylist001" style="display:block;">
			 <ul>
                                    <li><span class="iName"><a href="javascript:selectCity('新加坡')" target="_self" title="Singapore" rel="nofollow">
                                        <nobr>新加坡</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('曼谷')" target="_self" title="Bangkok" rel="nofollow">
                                        <nobr>曼谷</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('首尔')" target="_self" title="Seoul" rel="nofollow">
                                        <nobr>首尔</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('东京')" target="_self" title="Tokyo" rel="nofollow">
                                        <nobr>东京</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('大阪')" target="_self" title="Osaka" rel="nofollow">
                                        <nobr>大阪</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('吉隆坡')" target="_self" title="Kuala Lumpur" rel="nofollow">
                                        <nobr>吉隆坡</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('雅加达')" target="_self" title="Jakarta" rel="nofollow">
                                        <nobr>雅加达</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('马尼拉')" target="_self" title="Manila" rel="nofollow">
                                        <nobr>马尼拉</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('加德满都')" target="_self" title="Kathmandu" rel="nofollow">
                                        <nobr>加德满都</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('普吉')" target="_self" title="Phuket" rel="nofollow">
                                        <nobr>普吉</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('金边')" target="_self" title="Phnom Penh" rel="nofollow">
                                        <nobr>金边 </nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('迪拜')" target="_self" title="Dubai" rel="nofollow">
                                        <nobr>迪拜</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('河内')" target="_self" title="Hanoi" rel="nofollow">
                                        <nobr>河内</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('胡志明')" target="_self" title="Hu Zhiming" rel="nofollow">
                                        <nobr>胡志明 </nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('巴厘岛')" target="_self" title="Bali Island" rel="nofollow">
                                        <nobr>巴厘岛</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('暹粒')" target="_self" title="Bali" rel="nofollow">
                                        <nobr>暹粒</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('马尔代夫')" target="_self" title="Maldives" rel="nofollow">
                                        <nobr>马尔代夫</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('新德里')" target="_self" title="New Delhi" rel="nofollow">
                                        <nobr>新德里</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('高雄')" target="_self" title="Kaohsiung" rel="nofollow">
                                        <nobr>高雄</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('台北')" target="_self" title="Taipei" rel="nofollow">
                                        <nobr>台北</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('槟城')" target="_self" title="Penang" rel="nofollow">
                                        <nobr>槟城</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('仰光')" target="_self" title="Yangon" rel="nofollow">
                                        <nobr>仰光</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('釜山')" target="_self" title="Busan" rel="nofollow">
                                        <nobr>釜山</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('名古屋')" target="_self" title="Nagoya" rel="nofollow">
                                        <nobr>名古屋</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('札幌')" target="_self" title="Sapporo" rel="nofollow">
                                        <nobr>札幌</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('福冈')" target="_self" title="Fukuoka" rel="nofollow">
                                        <nobr>福冈</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('科伦坡')" target="_self" title="Colombo" rel="nofollow">
                                        <nobr>科伦坡</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('孟买')" target="_self" title="Mumbai" rel="nofollow">
                                        <nobr>孟买</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('沙巴')" target="_self" title="Sabah" rel="nofollow">
                                        <nobr>沙巴</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('清迈')" target="_self" title="Chiang Mai" rel="nofollow">
                                        <nobr>清迈</nobr>
                                    </a></span></li>
                                </ul>
		</div>
		
		<div class="citylist" id="citylist002" style="display:none;">
			<ul>
                                    <li><span class="iName"><a href="javascript:selectCity('巴黎')" target="_self" title="Paris" rel="nofollow">
                                        <nobr>巴黎</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('伦敦')" target="_self" title="London" rel="nofollow">
                                        <nobr>伦敦</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('法兰克福')" target="_self" title="Frankfurt" rel="nofollow">
                                        <nobr>法兰克福</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('罗马')" target="_self" title="Rome" rel="nofollow">
                                        <nobr>罗马</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('米兰')" target="_self" title="Milan" rel="nofollow">
                                        <nobr>米兰</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('莫斯科')" target="_self" title="Moscow" rel="nofollow">
                                        <nobr>莫斯科</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('阿姆斯特丹')" target="_self" title="Amsterdam" rel="nofollow">
                                        <nobr>阿姆斯特丹</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('柏林')" target="_self" title="Berlin" rel="nofollow">
                                        <nobr>柏林</nobr>
                                    </a></span></li> 
									<li><span class="iName"><a href="javascript:selectCity('伯明翰')" target="_self" title="Bermingham" rel="nofollow">
                                        <nobr>伯明翰</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('马德里')" target="_self" title="Madrid" rel="nofollow">
                                        <nobr>马德里</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('里昂')" target="_self" title="Leon" rel="nofollow">
                                        <nobr>里昂</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('雅典')" target="_self" title="Athens" rel="nofollow">
                                        <nobr>雅典</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('慕尼黑')" target="_self" title="Munich" rel="nofollow">
                                        <nobr>慕尼黑 </nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('苏黎世')" target="_self" title="Zurich" rel="nofollow">
                                        <nobr>苏黎世</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('哥本哈根')" target="_self" title="Copenhagen" rel="nofollow">
                                        <nobr>哥本哈根</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('赫尔辛基')" target="_self" title="Helsinki" rel="nofollow">
                                        <nobr>赫尔辛基</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('维也纳')" target="_self" title="Vienna" rel="nofollow">
                                        <nobr>维也纳</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('日内瓦')" target="_self" title="Geneva'" rel="nofollow">
                                        <nobr>日内瓦</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('爱丁堡')" target="_self" title="Edinburgh" rel="nofollow">
                                        <nobr>爱丁堡</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('布拉格')" target="_self" title="Prague" rel="nofollow">
                                        <nobr>布拉格</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('巴塞罗那')" target="_self" title="Barcelona" rel="nofollow">
                                        <nobr>巴塞罗那</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('斯德哥尔摩')" target="_self" title="Stockholm" rel="nofollow">
                                        <nobr>斯德哥尔摩</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('布达佩斯')" target="_self" title="Budapest" rel="nofollow">
                                        <nobr>布达佩斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('曼彻斯特')" target="_self" title="Manchester" rel="nofollow">
                                        <nobr>曼彻斯特</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('里斯本')" target="_self" title="Lisbon" rel="nofollow">
                                        <nobr>里斯本</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('威尼斯')" target="_self" title="Venice" rel="nofollow">
                                        <nobr>威尼斯</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('伊斯坦布尔')" target="_self" title="Istanbul" rel="nofollow">
                                        <nobr>伊斯坦布尔</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('格拉斯哥')" target="_self" title="Glasgow" rel="nofollow">
                                        <nobr>格拉斯哥</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('都柏林')" target="_self" title="Dublin" rel="nofollow">
                                        <nobr>都柏林</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('圣彼得堡')" target="_self" title="St Petersburg" rel="nofollow">
                                        <nobr>圣彼得堡</nobr>
                                    </a></span></li>
             </ul>
		</div>
		
		<div class="citylist" id="citylist003" style="display:none;">
			<ul>
                                    <li><span class="iName"><a href="javascript:selectCity('多伦多')" target="_self" title="Toronto" rel="nofollow">
                                        <nobr>多伦多</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('温哥华')" target="_self" title="Vancouver" rel="nofollow">
                                        <nobr>温哥华</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('纽约')" target="_self" title="New York" rel="nofollow">
                                        <nobr>纽约</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('洛杉矶')" target="_self" title="Losangeles" rel="nofollow">
                                        <nobr>洛杉矶</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('三藩市（旧金山）')" target="_self" title="San Francisco" rel="nofollow">
                                        <nobr>三藩市</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('芝加哥')" target="_self" title="Chicago" rel="nofollow">
                                        <nobr>芝加哥</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('波士顿')" target="_self" title="Boston" rel="nofollow">
                                        <nobr>波士顿</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('华盛顿')" target="_self" title="Washington" rel="nofollow">
                                        <nobr>华盛顿</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('西雅图')" target="_self" title="Seattle" rel="nofollow">
                                        <nobr>西雅图</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('蒙特利尔')" target="_self" title="Montreal" rel="nofollow">
                                        <nobr>蒙特利尔</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('亚特兰大')" target="_self" title="Atlanta" rel="nofollow">
                                        <nobr>亚特兰大 </nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('休斯顿')" target="_self" title="Houston" rel="nofollow">
                                        <nobr>休斯顿</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('底特律')" target="_self" title="Detroit" rel="nofollow">
                                        <nobr>底特律</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('夏威夷')" target="_self" title="Hawaii" rel="nofollow">
                                        <nobr>夏威夷</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('拉斯维加斯')" target="_self" title="Las Vegas" rel="nofollow">
                                        <nobr>拉斯维加斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('达拉斯')" target="_self" title="Dallas" rel="nofollow">
                                        <nobr>达拉斯</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('墨西哥城')" target="_self" title="Mexico" rel="nofollow">
                                        <nobr>墨西哥城</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('费城')" target="_self" title="Philadelphia" rel="nofollow">
                                        <nobr>费城</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('渥太华')" target="_self" title="Ottawa" rel="nofollow">
                                        <nobr>渥太华</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('迈阿密')" target="_self" title="Miami" rel="nofollow">
                                        <nobr>迈阿密</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('奥兰多')" target="_self" title="Orlando" rel="nofollow">
                                        <nobr>奥兰多</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('丹佛')" target="_self" title="Denver" rel="nofollow">
                                        <nobr>丹佛</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('塞班')" target="_self" title="Saipan" rel="nofollow">
                                        <nobr>塞班</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('埃德蒙顿')" target="_self" title="Edmonton" rel="nofollow">
                                        <nobr>埃德蒙顿</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('匹兹堡')" target="_self" title="Pittsburgh" rel="nofollow">
                                        <nobr>匹兹堡</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('明尼阿波利斯')" target="_self" title="Minneapolis" rel="nofollow">
                                        <nobr>明尼阿波利斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('卡尔加里')" target="_self" title="Calgary" rel="nofollow">
                                        <nobr>卡尔加里</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('圣路易斯')" target="_self" title="Saint Louis" rel="nofollow">
                                        <nobr>圣路易斯</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('温尼伯')" target="_self" title="Winnipeg" rel="nofollow">
                                        <nobr>温尼伯</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('盐湖城')" target="_self" title="Saline Lake" rel="nofollow">
                                        <nobr>盐湖城</nobr>
                                    </a></span></li>
             </ul>
		</div>
		
		
		<div class="citylist" id="citylist004" style="display:none;">
			<ul>
                                    
									<li><span class="iName"><a href="javascript:selectCity('圣保罗')" target="_self" title="St Paul" rel="nofollow">
                                        <nobr>圣保罗</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('布宜诺斯艾利斯')" target="_self" title="Buenos Aires" rel="nofollow">
                                        <nobr>布宜诺斯艾利斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('里约热内卢')" target="_self" title="Rio De Janeiro" rel="nofollow">
                                        <nobr>里约热内卢</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('哈瓦那')" target="_self" title="Havana" rel="nofollow">
                                        <nobr>哈瓦那</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('利马')" target="_self" title="Lima" rel="nofollow">
                                        <nobr>利马</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('圣地亚哥')" target="_self" title="Santiago" rel="nofollow">
                                        <nobr>圣地亚哥</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('加拉加斯')" target="_self" title="Caracas" rel="nofollow">
                                        <nobr>加拉加斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('波哥大')" target="_self" title="Bogota" rel="nofollow">
                                        <nobr>波哥大</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('巴西利亚')" target="_self" title="Brasilia" rel="nofollow">
                                        <nobr>巴西利亚</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('巴拿马')" target="_self" title="Panama" rel="nofollow">
                                        <nobr>巴拿马</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('基多')" target="_self" title="Quito" rel="nofollow">
                                        <nobr>基多 </nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('拉巴斯')" target="_self" title="La Paz" rel="nofollow">
                                        <nobr>拉巴斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('圣何塞')" target="_self" title="San Jose" rel="nofollow">
                                        <nobr>圣何塞</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('蒙得维的亚')" target="_self" title="Montevideo" rel="nofollow">
                                        <nobr>蒙得维的亚</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('瓜亚基尔')" target="_self" title="Guayaquil" rel="nofollow">
                                        <nobr>瓜亚基尔</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('麦德林')" target="_self" title="Medellin" rel="nofollow">
                                        <nobr>麦德林</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('帕拉马里博')" target="_self" title="Paramaribo" rel="nofollow">
                                        <nobr>帕拉马里博</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('瓜达拉哈拉')" target="_self" title="Hanoi" rel="nofollow">
                                        <nobr>瓜达拉哈拉</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('马纳瓜')" target="_self" title="Managua" rel="nofollow">
                                        <nobr>马纳瓜</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('马瑙斯')" target="_self" title="Manaus" rel="nofollow">
                                        <nobr>马瑙斯</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('太子港')" target="_self" title="Port au Prince" rel="nofollow">
                                        <nobr>太子港</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('危地马拉')" target="_self" title="Guatemala" rel="nofollow">
                                        <nobr>危地马拉</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('坎昆')" target="_self" title="Cancun" rel="nofollow">
                                        <nobr>坎昆</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('纳塔尔')" target="_self" title="Natal" rel="nofollow">
                                        <nobr>纳塔尔</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('亚松森')" target="_self" title="Asuncion" rel="nofollow">
                                        <nobr>亚松森</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('圣萨尔瓦多')" target="_self" title="San Salvador" rel="nofollow">
                                        <nobr>圣萨尔瓦多</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('苏克雷')" target="_self" title="Su Kelei" rel="nofollow">
                                        <nobr>苏克雷</nobr>
                                    </a></span></li> 
                                    <li><span class="iName"><a href="javascript:selectCity('库里提巴')" target="_self" title="Curitiba " rel="nofollow">
                                        <nobr>库里提巴</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('德古斯加巴')" target="_self" title="De Gus Gaba" rel="nofollow">
                                        <nobr>德古斯加巴</nobr>
                                    </a></span></li>
             </ul>
		</div>
		<div class="citylist" id="citylist005" style="display:none;">
			<ul>
                                    <li><span class="iName"><a href="javascript:selectCity('悉尼')" target="_self" title="Sydney" rel="nofollow">
                                        <nobr>悉尼</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('墨尔本')" target="_self" title="Melbourne" rel="nofollow">
                                        <nobr>墨尔本</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('奥克兰')" target="_self" title="Oakland" rel="nofollow">
                                        <nobr>奥克兰</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('布里斯班')" target="_self" title="Brisbane" rel="nofollow">
                                        <nobr>布里斯班</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('阿德莱德')" target="_self" title="Adelaide" rel="nofollow">
                                        <nobr>阿德莱德</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('珀斯')" target="_self" title="Perth" rel="nofollow">
                                        <nobr>珀斯</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('斐济')" target="_self" title="Fiji" rel="nofollow">
                                        <nobr>斐济</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('惠灵顿')" target="_self" title="Wellington" rel="nofollow">
                                        <nobr>惠灵顿</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('基督城')" target="_self" title="Christian City" rel="nofollow">
                                        <nobr>基督城</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('关岛')" target="_self" title="Guam" rel="nofollow">
                                        <nobr>关岛</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('堪培拉')" target="_self" title="Canberra" rel="nofollow">
                                        <nobr>堪培拉</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('凯恩斯')" target="_self" title="Keynes" rel="nofollow">
                                        <nobr>凯恩斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('黄金海岸')" target="_self" title="Gold Coast" rel="nofollow">
                                        <nobr>黄金海岸 </nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('达尔文')" target="_self" title="Darwin" rel="nofollow">
                                        <nobr>达尔文</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('莫尔兹比港')" target="_self" title="Port Moresby" rel="nofollow">
                                        <nobr>莫尔兹比港</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('皇后镇')" target="_self" title="Queen town" rel="nofollow">
                                        <nobr>皇后镇</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('达尼丁')" target="_self" title="Dunedin" rel="nofollow">
                                        <nobr>达尼丁</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('霍巴特')" target="_self" title="Hobart" rel="nofollow">
                                        <nobr>霍巴特</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('维拉港')" target="_self" title="Port Vila" rel="nofollow">
                                        <nobr>维拉港</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('朗塞斯顿')" target="_self" title="Ron Seth Don" rel="nofollow">
                                        <nobr>朗塞斯顿</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('努美阿')" target="_self" title="Noumea" rel="nofollow">
                                        <nobr>努美阿</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('黑德兰港')" target="_self" title="Port Hedland" rel="nofollow">
                                        <nobr>黑德兰港</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('帝力')" target="_self" title="Dili" rel="nofollow">
                                        <nobr>帝力</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('努库阿洛法')" target="_self" title="Nukualofa" rel="nofollow">
                                        <nobr>努库阿洛法</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('汤斯维尔')" target="_self" title="Townsville" rel="nofollow">
                                        <nobr>汤斯维尔</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('阳光海岸')" target="_self" title="Sunshine Coast" rel="nofollow">
                                        <nobr>阳光海岸</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('阿洛菲')" target="_self" title="Alof" rel="nofollow">
                                        <nobr>阿洛菲</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('奥班尼')" target="_self" title="Albany" rel="nofollow">
                                        <nobr>奥班尼</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('赫维湾')" target="_self" title="Hervey Bay" rel="nofollow">
                                        <nobr>赫维湾</nobr>
                                    </a></span></li>
             </ul>
		</div>
		
		<div class="citylist" id="citylist006" style="display:none;">
			 <ul>
                                    <li><span class="iName"><a href="javascript:selectCity('开罗')" target="_self" title="Cairo" rel="nofollow">
                                        <nobr>开罗</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('内罗毕')" target="_self" title="Nairobi" rel="nofollow">
                                        <nobr>内罗毕</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('约翰内斯堡')" target="_self" title="Johannesburg" rel="nofollow">
                                        <nobr>约翰内斯堡</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('毛里求斯')" target="_self" title="Mauritius" rel="nofollow">
                                        <nobr>毛里求斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('开普敦')" target="_self" title="Cape Town" rel="nofollow">
                                        <nobr>开普敦</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('亚的斯亚贝巴')" target="_self" title="Addisababa" rel="nofollow">
                                        <nobr>亚的斯亚贝巴</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('拉各斯')" target="_self" title="Lagos" rel="nofollow">
                                        <nobr>拉各斯</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('罗安达')" target="_self" title="Luanda" rel="nofollow">
                                        <nobr>罗安达 </nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('阿克拉')" target="_self" title="Accra" rel="nofollow">
                                        <nobr>阿克拉</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('达累斯萨拉姆')" target="_self" title="Dar Es Salaam" rel="nofollow">
                                        <nobr>达累斯萨拉姆</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('卢萨卡')" target="_self" title="Lusaka" rel="nofollow">
                                        <nobr>卢萨卡</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('安塔那那利佛')" target="_self" title="Antananarivo" rel="nofollow">
                                        <nobr>安塔那那利佛</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('阿尔及尔')" target="_self" title="Algiers" rel="nofollow">
                                        <nobr>阿尔及尔</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('阿布贾')" target="_self" title="Abuja" rel="nofollow">
                                        <nobr>阿布贾</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('卡萨布兰卡')" target="_self" title="Casablanca" rel="nofollow">
                                        <nobr>卡萨布兰卡</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('马普托')" target="_self" title="Maputo" rel="nofollow">
                                        <nobr>马普托</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('金沙萨')" target="_self" title="Kinshasa" rel="nofollow">
                                        <nobr>金沙萨</nobr>
                                    </a></span></li> 
									<li><span class="iName"><a href="javascript:selectCity('雅温得')" target="_self" title="Yaounde" rel="nofollow">
                                        <nobr>雅温得</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('哈拉雷')" target="_self" title="Harare" rel="nofollow">
                                        <nobr>哈拉雷</nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('喀土穆')" target="_self" title="Khartoum" rel="nofollow">
                                        <nobr>喀土穆 </nobr>
                                    </a></span></li>
									<li><span class="iName"><a href="javascript:selectCity('杜阿拉')" target="_self" title="Douala" rel="nofollow">
                                        <nobr>杜阿拉</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('的黎波里')" target="_self" title="Tripoli" rel="nofollow">
                                        <nobr>的黎波里</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('蒙罗维亚')" target="_self" title="Monrovia" rel="nofollow">
                                        <nobr>蒙罗维亚</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('洛美')" target="_self" title="Lome" rel="nofollow">
                                        <nobr>洛美</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('突尼斯')" target="_self" title="Tunisia" rel="nofollow">
                                        <nobr>突尼斯</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('巴马科')" target="_self" title="Bamako" rel="nofollow">
                                        <nobr>巴马科</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('马拉博')" target="_self" title="Malabo" rel="nofollow">
                                        <nobr>马拉博</nobr>
                                    </a></span></li> 
                                    <li><span class="iName"><a href="javascript:selectCity('达喀尔')" target="_self" title="Dakar" rel="nofollow">
                                        <nobr>达喀尔</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('坎帕拉')" target="_self" title="Kampala" rel="nofollow">
                                        <nobr>坎帕拉</nobr>
                                    </a></span></li>
                                    <li><span class="iName"><a href="javascript:selectCity('科托努')" target="_self" title="Cotonou" rel="nofollow">
                                        <nobr>科托努</nobr>
                                    </a></span></li>  
            </ul>
		</div>
	</div>
</div>
</div>
	
	  <div class="Special_righttitle" style="font-size:14px; padding-top:5px;">IDS限量特价</div>
	  <div class="Special_rightbox">
	    <div class="Special_rightad">
	    <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=259&height=92&id=3"></script>      
	    </div>
	    <ul class="Special_rightul">
	     
	       <%
             if (recommendIDS.Count != 0)
               {

                   for (int i = 0; i < recommendIDS.Count; i++)
                {
                    System.Data.DataRow recommendIDS_row = recommendIDS[i];
                 %>
	           <li><span><a href="<%=recommendIDS_row["ticketUrl"].ToString()%>" target="_blank" ><%=recommendIDS_row["title"].ToString()%></a></span><code>￥<%=recommendIDS_row["price"].ToString()%></code></li>
	              <%
	              }
	              }
	          %>
	          
	      
	    </ul>
	  </div>
	  <img src="http://www.fei580.com/images/Special01.jpg" alt="" style="float:left;" />
	
	
  </div>  
  
<!--onelinebox end-->

<!--twolinebox start-->


 <div style="margin:0px auto;width:968px;">

  <div class="twolinebox_title">
    <img src="http://www.fei580.com/images/bg02.jpg" style="float:left" />
    <img src="http://www.fei580.com/images/International016.jpg" style="float:left;position:relative;top:0px;left:6px;margin-top:-11px;" />
    <strong>精选特价机票</strong>
   
    <img src="images/bg03.jpg" style="float:right" />
  </div>
  
  <div class="twolinebox_box" style="width:966px;">
  
   <div class="International_rightboxfive" id="Asia"><h2>ASIA</h2><h3>亚洲精选</h3></div>
  
    
    
    <ul class="twolinebox_ulthree add_01">
     
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
      
      <% if (toAsia.Count != 0)
         {

             for (int i = 0; i < toAsia.Count; i++)
             {
                 
                 System.Data.DataRow toAsia_row = toAsia[i];
                 %>
            <%
          if (i == 6)
          {
          %>
          </ul><ul class="twolinebox_ulthree add_02">
          <li class="two">
          <span class="spanone">航空公司</span>
          <span class="spantwo">航线</span>
          <span class="spanthree">价格</span>
          <span class="spanfour">日期</span>
        </li>
          
          <%
          }
          %>     
                 
         <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=toAsia_row["smallPic"].ToString()%>" alt="<%=toAsia_row["airname"].ToString()%>" /><code><a href="http://www.fei580.com/airline/<%=toAsia_row["airline"]%>.htm"><%=toAsia_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=toAsia_row["tId"] %>.htm" title="">[<%=(toAsia_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=toAsia_row["fromCityname"].ToString()%>←→<%=toAsia_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree">￥<%=toAsia_row["untaxPrice"].ToString()%> </span>
        <span class="spanfour"><%=Convert.ToDateTime(toAsia_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
      
          <%
       
          
             }
      }
          
        %>
      
      
    </ul>
    

   
	<div class="International_rightboxfive" id="Euro"><h2>EURO</h2><h3>欧洲精选</h3></div>
	
      <ul class="twolinebox_ulthree add_01">
     
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
      
      <% if (toEuro.Count != 0)
         {

             for (int i = 0; i < toEuro.Count; i++)
             {

                 System.Data.DataRow toEuro_row = toEuro[i];
                 %>
            <%
          if (i == 6)
          {
          %>
          </ul><ul class="twolinebox_ulthree add_02">
          <li class="two">
          <span class="spanone">航空公司</span>
          <span class="spantwo">航线</span>
          <span class="spanthree">价格</span>
          <span class="spanfour">日期</span>
        </li>
          <%
          }
          %>     
                 
         <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=toEuro_row["smallPic"].ToString()%>" alt="<%=toEuro_row["airname"].ToString()%>" /><code><a href="http://www.fei580.com/airline/<%=toEuro_row["airline"]%>.htm"><%=toEuro_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=toEuro_row["tId"] %>.htm" title="">[<%=(toEuro_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=toEuro_row["fromCityname"].ToString()%>←→<%=toEuro_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree">￥<%=toEuro_row["untaxPrice"].ToString()%> </span>
        <span class="spanfour"><%=Convert.ToDateTime(toEuro_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
      
          <%
       
          
             }
      }
          
        %>
      
      
    </ul>
	
   
      <div class="International_rightboxfive" id="NAmerica"><h2>NORTH AMERICA</h2><h3>北美精选</h3></div>
     
	    <ul class="twolinebox_ulthree add_01">
     
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
      
      <% if (toNAmerica.Count != 0)
         {

             for (int i = 0; i < toNAmerica.Count; i++)
             {

                 System.Data.DataRow toNAmerica_row = toNAmerica[i];
                 %>
            <%
          if (i == 6)
          {
          %>
          </ul><ul class="twolinebox_ulthree add_02">
          <li class="two">
          <span class="spanone">航空公司</span>
          <span class="spantwo">航线</span>
          <span class="spanthree">价格</span>
          <span class="spanfour">日期</span>
        </li>
          <%
          }
          %>     
                 
         <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=toNAmerica_row["smallPic"].ToString()%>" alt="<%=toNAmerica_row["airname"].ToString()%>" /><code><a href="http://www.fei580.com/airline/<%=toNAmerica_row["airline"]%>.htm"><%=toNAmerica_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=toNAmerica_row["tId"] %>.htm" title="">[<%=(toNAmerica_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=toNAmerica_row["fromCityname"].ToString()%>←→<%=toNAmerica_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree">￥<%=toNAmerica_row["untaxPrice"].ToString()%> </span>
        <span class="spanfour"><%=Convert.ToDateTime(toNAmerica_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
      
          <%
       
          
             }
      }
          
        %>
      
      
    </ul>
	 
      <div class="International_rightboxfive" id="Oceania"><h2>OCEANIA</h2><h3>大洋洲精选</h3></div>
	  
	  
	  
       <ul class="twolinebox_ulthree add_01">
     
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
      
      <% if (toOceania.Count != 0)
         {

             for (int i = 0; i < toOceania.Count; i++)
             {

                 System.Data.DataRow toOceania_row = toOceania[i];
                 %>
            <%
          if (i == 6)
          {
          %>
          </ul><ul class="twolinebox_ulthree add_02">
          <li class="two">
          <span class="spanone">航空公司</span>
          <span class="spantwo">航线</span>
          <span class="spanthree">价格</span>
          <span class="spanfour">日期</span>
        </li>
          <%
          }
          %>     
                 
         <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=toOceania_row["smallPic"].ToString()%>" alt="<%=toOceania_row["airname"].ToString()%>" /><code><a href="http://www.fei580.com/airline/<%=toOceania_row["airline"]%>.htm"><%=toOceania_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=toOceania_row["tId"] %>.htm" title="">[<%=(toOceania_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=toOceania_row["fromCityname"].ToString()%>←→<%=toOceania_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree">￥<%=toOceania_row["untaxPrice"].ToString()%> </span>
        <span class="spanfour"><%=Convert.ToDateTime(toOceania_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
      
          <%
       
          
             }
      }
          
        %>
      
      
    </ul>
    
    
      <div class="International_rightboxfive" id="Africa"><h2>AFRICA</h2><h3>非洲精选</h3></div>
	  
	  
	  
       <ul class="twolinebox_ulthree add_01">
     
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
      
      <% if (toAfrica.Count != 0)
         {

             for (int i = 0; i < toAfrica.Count; i++)
             {

                 System.Data.DataRow toAfrica_row = toAfrica[i];
                 %>
            <%
          if (i == 6)
          {
          %>
          </ul><ul class="twolinebox_ulthree add_02">
          <li class="two">
          <span class="spanone">航空公司</span>
          <span class="spantwo">航线</span>
          <span class="spanthree">价格</span>
          <span class="spanfour">日期</span>
        </li>
          <%
          }
          %>     
                 
         <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=toAfrica_row["smallPic"].ToString()%>" alt="<%=toAfrica_row["airname"].ToString()%>" /><code><a href="http://www.fei580.com/airline/<%=toAfrica_row["airline"]%>.htm"><%=toAfrica_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=toAfrica_row["tId"] %>.htm" title="">[<%=(toAfrica_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=toAfrica_row["fromCityname"].ToString()%>←→<%=toAfrica_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree">￥<%=toAfrica_row["untaxPrice"].ToString()%> </span>
        <span class="spanfour"><%=Convert.ToDateTime(toAfrica_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
      
          <%
       
          
             }
      }
          
        %>
      
      
    </ul>
    
  </div>
  
  <div class="twolinebox_linetwo"></div>
  
  </div>
  
  <div class="twolinebox_linetwo"></div>
  
  <!--twolinebox end-->

  </div>

<div class="clear"></div>
<div id="duilian02" style="top:250px;left:0px;" class="kf_2012_box">
    <div class="kf_2012_lbox">
	    <img src="http://www.fei580.com/images/kf_l.gif" border="0" usemap="#Mapa" />
        <map name="Mapa" id="mapd">
            <area style="cursor:pointer;" onclick='show(1)' shape="rect" coords="4,12,26,101" href="javascript:void(0);" />
            <area style="cursor:pointer;" onclick='show(2)' shape="rect" coords="3,110,26,201" href="javascript:void(0);" />
        </map>
    </div>
    <div id="tip4341" class="kf_2012_rbox1" style="display:none">
	    <img src="http://www.fei580.com/images/kf_r1.gif" border="0" usemap="#Mapb" />
	    <input id="eMsg_tel" type="text" class="kf_2012_input" />
        <map name="Mapb" id="mape">
            <area shape="rect" style="cursor:pointer;" coords="237,5,267,31" onclick='show("tip4341")' href="javascript:void(0);" />
            <area shape="rect" style="cursor:pointer;" coords="186,110,259,138" onclick="sendTelMsg()" href="javascript:void(0);"  />
            <area shape="rect" style="cursor:pointer;" coords="123,160,260,183" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '特价机票首页','咨询','点击']);" id="ochat" rel="nofollow" target="_blank" title="在线客服" />
        </map>
    </div>
	<div id="tip4342" class="kf_2012_rbox2" style=" display:none" >
	    <img src="http://www.fei580.com/images/kf_r2.gif" border="0" usemap="#Mapc" />
        <map name="Mapc">
            <area shape="rect" style="cursor:pointer;" coords="237,5,267,31" onclick='show("tip4342")' href="javascript:void(0);" />
            <area shape="rect" style="cursor:pointer;" coords="83,36,256,62" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '特价机票首页','咨询','点击']);" id="mchat" rel="nofollow" target="_blank" title="在线客服" />
            <area shape="rect" style="cursor:pointer;" coords="84,72,167,98" href="tencent://message/?uin=32335510&Site=特价机票&Menu=yes" />
            <area shape="rect" style="cursor:pointer;" coords="84,100,167,123" href="tencent://message/?uin=937056717&Site=特价机票&Menu=yes" />
            <area shape="rect" style="cursor:pointer;" coords="83,127,167,147" href="tencent://message/?uin=531658630&Site=特价机票&Menu=yes" />
            <area shape="rect" style="cursor:pointer;" coords="173,71,258,96" id="msn1" href="http://www.fei580.com/chat/" target="_blank" />
            <area shape="rect" style="cursor:pointer;" coords="172,126,256,149" id="msn2" href="http://www.fei580.com/chat/" target="_blank" />
            <area shape="rect" style="cursor:pointer;" coords="173,99,256,122" id="msn3" href="http://www.fei580.com/chat/" target="_blank" />
        </map>
    </div>
    
</div>
<script language="javascript" type="text/javascript" src="http://www.fei580.com/js/datepicker.js"></script>
<script language="javascript" type="text/javascript" src="http://www.fei580.com/js/scrolljs.js" ></script> 
<uc1:footControl ID="FootControl" runat="server" />
</form>
</div>
<div id="msdiv" class="layout_box">
 <div class="ms_modal"></div>
 <div class="modal_body">
 <div class="wechat_qr">
 <h5>扫描关注我们</h5>
 <img src="http://open.weixin.qq.com/qr/code/?username=fei580_com" />
 <h5>随时随地查票</h5>
 </div>
 <!--div class="online_kf">
 <img src="source/footer_soft_img.png" />
 </div-->
 <div class="msn_line">
 <h5>找特价机票太花时间,联系我们专线客服</h5>
 <h4>免费电话查票 400-885-0663 更省心</h4>
 <div class="clear"></div>
 <a href="http://www.fei580.com/chat/?Area=Europe" target="_blank">欧洲线</a>
 <a href="http://www.fei580.com/chat/?Area=America" target="_blank">美洲线</a>
 <a href="http://www.fei580.com/chat/?Area=Oceania" target="_blank">澳洲线</a>
 <a href="http://www.fei580.com/chat/?Area=Africa" target="_blank">非洲线</a>
 <a href="http://www.fei580.com/chat/?Area=Asia" target="_blank">亚洲线</a>
 <a href="http://www.fei580.com/chat/?Area=Travel" target="_blank">自由行</a>
 </div>
 <a href="javascript:void(0)" class="msoff" onclick="_hmt.push(['_trackEvent', '浮动咨询框','点击','关闭']);_czc.push(['_trackEvent', '浮动咨询框','点击','关闭']);"></a>
 </div>
</div>
</body>
</html>
<script type="text/javascript">
    //定时弹出咨询框
    $(document).ready(function() {
        $(".msoff").click(function() {
            $('#msdiv').fadeOut("slow");
            window.setTimeout(function() {
                $("#msdiv").removeAttr("style");
            }, 20000);
            $('.kf_2012_rbox1').removeAttr("style");
        });
    });
</script>