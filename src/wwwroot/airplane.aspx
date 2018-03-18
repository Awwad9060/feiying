<%@ Page Language="C#" AutoEventWireup="true" CodeFile="airplane.aspx.cs" Inherits="airplane" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
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
<title>民航机型 - 飞瀛网</title>
<meta name="keywords" content="民航机型" />
<meta name="Description"  content="飞瀛网为您提供最新的航空公司机型图片，民航机型参数等信息。" />
<meta name="robots" content="index,follow" />
<link rel="canonical" href="http://www.fei580.com/airplane.aspx" />
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
<script type="text/javascript">
function $111(id) { return document.getElementById(id); }
function addLoadEvent(func){
	var oldonload = window.onload;
	if (typeof window.onload != 'function') {
		window.onload = func;
	} else {
		window.onload = function(){
			oldonload();
			func();
		}
	}
}

function moveElement(elementID,final_x,final_y,interval) {
  if (!document.getElementById) return false;
  if (!document.getElementById(elementID)) return false;
  var elem = document.getElementById(elementID);
  if (elem.movement) {
    clearTimeout(elem.movement);
  }
  if (!elem.style.left) {
    elem.style.left = "0px";
  }
  if (!elem.style.top) {
    elem.style.top = "0px";
  }
  var xpos = parseInt(elem.style.left);
  var ypos = parseInt(elem.style.top);
  if (xpos == final_x && ypos == final_y) {
		return true;
  }
  if (xpos < final_x) {
    var dist = Math.ceil((final_x - xpos)/10);
    xpos = xpos + dist;
  }
  if (xpos > final_x) {
    var dist = Math.ceil((xpos - final_x)/10);
    xpos = xpos - dist;
  }
  if (ypos < final_y) {
    var dist = Math.ceil((final_y - ypos)/10);
    ypos = ypos + dist;
  }
  if (ypos > final_y) {
    var dist = Math.ceil((ypos - final_y)/10);
    ypos = ypos - dist;
  }
  elem.style.left = xpos + "px";
  elem.style.top = ypos + "px";
  var repeat = "moveElement('"+elementID+"',"+final_x+","+final_y+","+interval+")";
  elem.movement = setTimeout(repeat,interval);
}

function classNormal(iFocusBtnID,iFocusTxID){
	var iFocusBtns= $111(iFocusBtnID).getElementsByTagName('li');
	var iFocusTxs = $111(iFocusTxID).getElementsByTagName('li');
	for(var i=0; i<iFocusBtns.length; i++) {
		iFocusBtns[i].className='normal';
		iFocusTxs[i].className='normal';
	}
}

function classCurrent(iFocusBtnID,iFocusTxID,n){
	var iFocusBtns= $111(iFocusBtnID).getElementsByTagName('li');
	var iFocusTxs = $111(iFocusTxID).getElementsByTagName('li');
	iFocusBtns[n].className='current';
	iFocusTxs[n].className='current';
}

function iFocusChange() {
	if(!$111('ifocus')) return false;
	$111('ifocus').onmouseover = function(){atuokey = true};
	$111('ifocus').onmouseout = function(){atuokey = false};
	var iFocusBtns = $111('ifocus_btn').getElementsByTagName('li');
	var listLength = iFocusBtns.length;
	iFocusBtns[0].onmouseover = function() {
		moveElement('ifocus_piclist',0,0,5);
		classNormal('ifocus_btn','ifocus_tx');
		classCurrent('ifocus_btn','ifocus_tx',0);
	}
	if (listLength>=2) {
		iFocusBtns[1].onmouseover = function() {
			moveElement('ifocus_piclist',0,-225,5);
			classNormal('ifocus_btn','ifocus_tx');
			classCurrent('ifocus_btn','ifocus_tx',1);
		}
	}
	if (listLength>=3) {
		iFocusBtns[2].onmouseover = function() {
			moveElement('ifocus_piclist',0,-450,5);
			classNormal('ifocus_btn','ifocus_tx');
			classCurrent('ifocus_btn','ifocus_tx',2);
		}
	}
	if (listLength>=4) {
		iFocusBtns[3].onmouseover = function() {
			moveElement('ifocus_piclist',0,-675,5);
			classNormal('ifocus_btn','ifocus_tx');
			classCurrent('ifocus_btn','ifocus_tx',3);
		}
	}
}

setInterval('autoiFocus()',3000);
var atuokey = false;
function autoiFocus() {
	if(!$111('ifocus')) return false;
	if(atuokey) return false;
	var focusBtnList = $111('ifocus_btn').getElementsByTagName('li');
	var listLength = focusBtnList.length;
	for(var i=0; i<listLength; i++) {
		if (focusBtnList[i].className == 'current') var currentNum = i;
	}
	if (currentNum==0&&listLength!=1 ){
		moveElement('ifocus_piclist',0,-225,5);
		classNormal('ifocus_btn','ifocus_tx');
		classCurrent('ifocus_btn','ifocus_tx',1);
	}
	if (currentNum==1&&listLength!=2 ){
		moveElement('ifocus_piclist',0,-450,5);
		classNormal('ifocus_btn','ifocus_tx');
		classCurrent('ifocus_btn','ifocus_tx',2);
	}
	if (currentNum==2&&listLength!=3 ){
		moveElement('ifocus_piclist',0,-675,5);
		classNormal('ifocus_btn','ifocus_tx');
		classCurrent('ifocus_btn','ifocus_tx',3);
	}
	if (currentNum==3 ){
		moveElement('ifocus_piclist',0,0,5);
		classNormal('ifocus_btn','ifocus_tx');
		classCurrent('ifocus_btn','ifocus_tx',0);
	}
	if (currentNum==1&&listLength==2 ){
		moveElement('ifocus_piclist',0,0,5);
		classNormal('ifocus_btn','ifocus_tx');
		classCurrent('ifocus_btn','ifocus_tx',0);
	}
	if (currentNum==2&&listLength==3 ){
		moveElement('ifocus_piclist',0,0,5);
		classNormal('ifocus_btn','ifocus_tx');
		classCurrent('ifocus_btn','ifocus_tx',0);
	}
}
addLoadEvent(iFocusChange);
</script>
<script type="text/javascript" src="http://www.fei580.com/CityClient/CityData.js"></script>
<script type="text/javascript" src="http://www.fei580.com/CityClient/CitySelector.right.js"></script>
<script type="text/javascript"  >
    $(document).ready(function() {
        //出发城市
        SetAllSelects.setAllSelectStyle();
        //目的城市
        var dx = new VSxClientCountrySelector('tocityName', CityData);
        dx.Init();
        //日期控件
        TripBackDate(document.getElementById("fromtripDate"), document.getElementById("backtripDate"));
   });
</script>
</head>
<body>
<div class="mainbody">
<form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="Home" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="eMail" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="飞瀛网" /></a></div>
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
      <li class="four"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司">航空公司</a></li>
	      <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
	      <li class="one"><a href="http://www.fei580.com/airplane.aspx" title="民航机型">民航机型</a></li>
	      <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="积分广场">积分广场</a></li>
	    </ul>
	   
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
  </div>
</div>
<!--header end-->


<div style="margin:0px auto;width:956px;position:relative;">
   
<!--onlinebox start-->  
  <div class="clearbox" style="padding-top:4px;">
  
   <div class="cad_left">
	  <div class="cad_lefttitle"><strong>中国南方航空</strong><a href="http://www.fei580.com/airline/358.htm" title="">更多</a></div>
	  <div class="cad_leftbox">
	   <img src="http://www.fei580.com/images/cad03.jpg" alt="" />
	   <p>
	     中国南方航空股份有限公司(SSE:600029)是一家总部设在广州的中国最大的国有航空企业之一，代码为CZ，简称「南航」。是以原先之中国南方航空公司为基础......
	   </p>
	  </div>
	  <div class="cad_leftline"><img src="http://www.fei580.com/images/cad01.gif" style="float:right;position:relative;bottom:-1px;right:-1px;margin-top:-69px;z-index:999;" /></div>
	</div>
	
	<div class="cad_right">
	  <div class="cad_righttitle">航空快讯</div>
	  <div class="cad_rightbox">
	  
	  
	    <div id="ifocus"> 
	         <div id="ifocus_pic"> 
		           <div id="ifocus_piclist">
		              <ul>
		              <%if(focuNews.Count!=0) %>
		              <%{ %>
		                  <% for (int i = 0; i < focuNews.Count; i++)
                            {
                                System.Data.DataRow focuNews_row = focuNews[i];%>
                          <li><a href="http://www.fei580.com/news_<%=focuNews_row["id"].ToString()%>.htm" target="_blank"><img src='http://www.fei580.com/<%=focuNews_row["newsPic"] %>' alt="<%=focuNews_row["title"] %>" /></a></li>
                           <%} %>
		             <%} %>
			            </ul>
		            </div>
		            <div id="ifocus_opdiv"></div>
		            <div id="ifocus_tx">
		              <ul>
		              <%if(focuNews.Count!=0) %>
		              <%{ %>
		                  <% for (int i = 0; i < focuNews.Count; i++)
                            {
                                System.Data.DataRow focuNews_row = focuNews[i];%>
                                <%if (i == 0)
                                  { %>
                                <li class="current"><%=focuNews_row["title"]%></li>
                                <%}else{ %>
                                <li class="normal"><%=focuNews_row["title"]%></li>
                                <%} %>
                           <%} %>
		             <%} %>
			            </ul>
		            </div>
	         </div>
	        
	        <div id="ifocus_btn">
	         <ul>
	                <%if(focuNews.Count!=0) %>
		              <%{ %>
		                  <% for (int i = 0; i < focuNews.Count; i++)
                            {
                                System.Data.DataRow focuNews_row = focuNews[i];%>
                          <li class="current"><img src='http://www.fei580.com/<%=focuNews_row["newsPic"] %>' alt="<%=focuNews_row["title"] %>" width="10px" height="10px" /></li>
                           <%} %>
		             <%} %>
			        			
		        </ul>
	        </div>
	    
	    </div>
	  
	  
	  </div>
	  <img src="http://www.fei580.com/images/cad05.jpg" alt="cad05" style="float:left;" />
	</div>
	
  </div>
<!--onlinebox end-->
  
<!--twolinebox start-->  
  <div class="clearbox"> 
 
   <div class="cad_lefttwo">
     <div class="cad_lefttwotitle">民航机型</div>
	 <div class="cad_lefttwobox">
	   <!--div class="cad_lefttwoboxtop"><a href="http://www.fei580.com/" title="波音系列">波音</a>|<a href="http://www.fei580.com/" title="麦道系列">麦道</a>|<a href="http://www.fei580.com/" title="空客系列">空客</a>|<a href="http://www.fei580.com/" title="图波列夫系列">图波列夫</a>|<a href="http://www.fei580.com/" title="伊留申系列">伊留申</a>|<a href="http://www.fei580.com/" title="庞巴边系列">庞巴迪</a></div-->
	   
	   <div class="cad_lefttwoboxtwo">机型：<input type="text" class="cad_text" id="txtsearch" runat="server"/>
	   <asp:Button ID="Button1" runat="server" Text="" CssClass="cad_submit" /></div>
	   <div class="cad_lefttwoboxthree">常见机型</div>
	   <asp:Repeater ID="rptshopnews" runat="server">
	    <ItemTemplate>
	   <ul class="cad_lefttwoul">
	     <li class="one"><%#Eval("chName")%></li>
		 <li class="two"><a href="http://www.fei580.com/airplane/<%#Eval("pId")%>.htm"><img src="http://www.fei580.com/<%#Eval("planPic")%>" alt="<%#Eval("chName")%>" width="174" height="127" /></a></li>
		 <li class="three">FEI580.COM</li>
         <%--<li class="four"><%#Eval("chName")%></li>--%>
	   </ul>
	   </ItemTemplate>
	   </asp:Repeater>
	   
	 </div>
	  <div class="cad_lefttwoline">
	    <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页" NextPageText="下一页" PageSize="12" PrevPageText="上一页" ShowPageIndexBox="Always"   SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" UrlPaging="true" AlwaysShow="True"></webdiyer:AspNetPager>
	   </div>
	    </div>
 
  <div class="cad_righttwo">
  
    <div class="onelinebox_leftboxone">
      <ul class="onelinebox_leftboxonetitle onelinebox_leftboxonetitle_soso1">
        <li class="one" id="right1" >国际机票</li>
        <li class="two" id="right2" >国际酒店</li>
        <li class="three" id="right3" >国际签证</li>
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
    <div class="cad_righttwobox">
	  <h2>国际航空推荐</h2>
	  <ul>
	   <%if(goodairline.Count!=0) %>
      <%{ %>
          <% for (int i = 0; i < goodairline.Count; i++)
            {
                System.Data.DataRow goodairline_info = goodairline[i];%>
           <li><img src="http://www.fei580.com/<%=goodairline_info["smallPic"]%>" width="24px" height="18px" alt="<%=goodairline_info["chName"]%>" /><a href="http://www.fei580.com/airline/<%=goodairline_info["aId"]%>.htm" title="<%=goodairline_info["chName"]%>"><%=eap.share.Sys.truncate(goodairline_info["chName"].ToString(),20,"...")%></a></li>
           <%} %>
     <%} %>
	  </ul>
	</div>
	<div class="cad_rightad"><a href="http://www.fei580.com/"><img src="http://www.fei580.com/images/cad013.jpg" alt="" /></a></div>
  </div>
   
</div>
<!--twolinebox end-->  
 </div> 
 <script type="text/javascript" src="http://www.fei580.com/js/datepicker.js"></script>
</form>
  <uc1:footControl ID="FootControl" runat="server" />
  </div>
</body>
</html>
