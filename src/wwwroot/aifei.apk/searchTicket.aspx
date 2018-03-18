<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchTicket.aspx.cs" EnableViewState="false" Inherits="searchTicket" %>
<%@ Register Src="~/share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="~/share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<title>国际机票查询-飞瀛网</title>
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/search.css" rel="stylesheet" type="text/css" />
<link href="css/hotcity.css" rel="stylesheet" type="text/css" />
<link href="css/datepicker.css" rel="stylesheet" type="text/css"/>
<meta name="Description"  content="飞瀛商旅提供最新广州国际机票查询,实时国际航班查询,网上订购系统,提供预定国际机票,国际酒店及东南亚签证服务" />
<meta name="keywords" content="国际机票查询" />
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/search.min.js" type="text/javascript"></script>
<script src="js/postdata.min.js" type="text/javascript"></script>
<script type="text/javascript" src="js/JQuery.cookie.min.js"></script>
<script type="text/javascript" src="js/ticket.search.min.js"></script>
<link href="CityClient/CitySelector.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="CityClient/CityData.js"></script>
<script type="text/javascript" src="CityClient/CitySelector.min.js"></script>
<script type="text/javascript"  >
    $(document).ready(function() {
        //出发城市
        SetAllSelects.setAllSelectStyle();
        //目的城市
        var dx = new VSxClientCountrySelector('tocityName', CityData);
        dx.Init();
        //日期控件
        TripBackDate(document.getElementById("fromtripDate"), document.getElementById("backtripDate"));
        //日期控件
        TripBackDate(document.getElementById("tripDate"), document.getElementById("backDate"));
    });
</script>
<script>
        //声明_czc对象:
        var _czc = _czc || [];
        //绑定siteid，请用您的siteid替换下方"XXXXXXXX"部分
        _czc.push(["_setAccount", "3579146"]);
</script>
</head>
<body>
<div class="mainbody" >
<form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="images/home.jpg" alt="" /><img src="images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com" title=""><img src="images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
     <div class="headerbottom_rightone">
    <a href="login.aspx?url=http://www.fei580.com/" title="会员登录" target="_blank" rel="nofollow">会员登录</a>|<a href="regAgree.aspx" title="会员注册" target="_blank" rel="nofollow">会员注册</a>|<a href="/sm/" title="飞瀛服务" target="_blank" rel="nofollow">关于飞瀛</a>
    </div>     <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com" title="首页" rel="nofollow">首&nbsp;页</a></li>
      <li class="two"><a href="recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="one"><a href="international.aspx" title="国际机票">国际机票</a></li>
      <li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>
      <!--<li class="two"><a href="/visa.html" title="国际签证">国际签证</a></li>-->
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
      <li class="two"><a href="quan.aspx" title="飞瀛圈" rel="nofollow">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="airline.aspx" title="航空公司">航空公司</a></li>
	      <li class="two"><a href="airport.aspx" title="世界机场">世界机场</a></li>
	      <li class="two"><a href="airplane.aspx" title="民航机型">民航机型</a></li>
	      <li class="two"><a href="news.aspx" title="新闻资讯">新闻资讯</a></li>
	      <li class="two"><a href="prizes.aspx" title="积分广场">积分广场</a></li>
	    </ul>
        <div class="menu_rightinput">
            <input name="SearchControl1$searchkey" type="text" id="SearchControl1_searchkey" onfocus="searchkeyfocus()" onblur="searchkeyblur()" value="搜索旅行攻略" class="headerinput serchcolor" onkeypress="if(event.keyCode==13){document.all.SearchControl1_buttSearch.click();return false;}" />
            <input name="SearchControl1$buttSearch" type="button" id="SearchControl1_buttSearch" class="heaersubmit" onclick="buttSearchNews()" />
        </div>
    </div>
	<div class="header_nav">您现在位置：<a href="http://www.fei580.com" title="飞瀛网" rel="nofollow">飞瀛首页</a>&gt;<a href="international.aspx" title="国际机票">国际机票查询</a>&gt;&nbsp;机票查询列表</div>
  </div>
</div>
<!--header end-->
  <!-- 爱飞机票计数 -->
  <input type="hidden" id="hidd_aifeinum" name="hidd_aifeinum" value="0" runat="server" />
  <div style="margin:10px auto 0px auto;width:990px; position:relative;">
  <!--searchleft start-->
  <div class="searchside">
   <div class="searchleft">
      <div class="research"></div>
      <div class="searchleftbox">
        <!--hiddenone start-->
        <div id="rightChild1" class="nohidden">
	        <table class="searchlefttable" cellpadding="0" cellspacing="5">
             <tbody><tr>
	            <td height="45" colspan="2" align="center" valign="middle">
	            <input id="tripType1" runat="server" type="radio" name="tripType" value="2" />全部&nbsp;
	            <input id="tripType2" runat="server" type="radio" name="tripType" value="0" />单程&nbsp;
	            <input id="tripType3" runat="server" type="radio" name="tripType" value="1" />往返
	            </td>
	          </tr>
	          
	          <tr>
	            <th width="70" align="left" valign="middle" >出发地</th>
	            <td width="150" height="30" valign="top">
                <input id="fromCityHidden" type="text" value="广州" runat="server" class="searchl_input2" />
	                <asp:DropDownList ID="fromCity" runat="server" CssClass="select2"></asp:DropDownList>
                </td>
	          </tr>
	          <tr>
	            <th width="70" align="left" valign="middle" >目的地</th>
	            <td width="150" valign="middle">
	                <input type="text" class="searchl_input" runat="server" id="tocityName" />
	            </td>
	          </tr>
	          <tr>
	            <th width="70" align="left" valign="middle" >出发日期</th>
	            <td width="150" valign="middle">
	                <input id="fromtripDate" type="text" class="searchl_input" runat="server" />
	            </td>
	          </tr>
	          <tr>
	            <th width="70" align="left" valign="middle" >回程日期</th>
	            <td width="150" valign="middle">
	                <input id="backtripDate" type="text" class="searchl_input"  runat="server"/>
	            </td>
	          </tr>
	          <tr>
	            <td colspan="2" style="padding-bottom:26px;"><input type="button" id="btnSearch" value="" class="searchmitcss"  /></td>
	          </tr>
	        </tbody></table>
        </div>
        <!--hiddenone end-->
        <script type="text/javascript">
            var ts = TicketSearch();
        </script>
      </div>
      <div class="clear"></div><!-- add by xulingjue 2013-06-07 -->
    </div>
    
    <div id="hotcityDiv" style="position:absolute;z-index:999999; background-color:#f3fbff; display:none;">
	<div class="hotCityBox">
	<div class="close"><img src="images/i_close3.gif" onclick="closehotcity()" alt="" style="cursor:pointer" /></div>
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
				<li ><span class="iName"><a href="javascript:selectCity('新加坡')" target="_self" title="Singapore"><nobr>新加坡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('曼谷')" target="_self" title="Bangkok"><nobr>曼谷</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('首尔')" target="_self" title="Seoul"><nobr>首尔</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('东京')" target="_self" title="Tokyo"><nobr>东京</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('大阪')" target="_self" title="Taipei"><nobr>大阪</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('吉隆坡')" target="_self" title="Kuala Lumpur"><nobr>吉隆坡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('雅加达')" target="_self" title="Jakarta"><nobr>雅加达</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('马尼拉')" target="_self" title="Manila"><nobr>马尼拉</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('加德满都')" target="_self" title="Kathmandu"><nobr>加德满都</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('普吉')" target="_self" title="Osaka"><nobr>普吉</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('金边')" target="_self" title="Hong Kong"><nobr>金边 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('迪拜')" target="_self" title="Phuket"><nobr>迪拜</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('河内')" target="_self" title="Phnom Penh"><nobr>河内</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('胡志明')" target="_self" title="Dubai"><nobr>胡志明 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('巴厘岛')" target="_self" title="Bali"><nobr>巴厘岛</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('暹粒')" target="_self" title="Bali"><nobr>暹粒</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('马尔代夫')" target="_self" title="Siem Reap"><nobr>马尔代夫</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('新德里')" target="_self" title="Male'"><nobr>新德里</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('高雄')" target="_self" title="New Delhi"><nobr>高雄</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('台北')" target="_self" title="Kaohsiung"><nobr>台北</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('槟城')" target="_self" title="Ho Chi Minh City"><nobr>槟城</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('仰光')" target="_self" title="Penang"><nobr>仰光</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('釜山')" target="_self" title="Yangon"><nobr>釜山</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('名古屋')" target="_self" title="Pusan"><nobr>名古屋</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('札幌')" target="_self" title="Nagoya"><nobr>札幌</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('福冈')" target="_self" title="Mumbai"><nobr>福冈</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('科伦坡')" target="_self" title="Sapporo"><nobr>科伦坡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('毛里求斯')" target="_self" title="Fukuoka"><nobr>毛里求斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('孟买')" target="_self" title="Colombo"><nobr>孟买</nobr></a></span></li>
			</ul>
		</div>
		<div class="citylist" id="citylist002" style="display:none;">
			<ul>
				<li ><span class="iName"><a href="javascript:selectCity('巴黎')" target="_self" title="Singapore"><nobr>巴黎</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('伦敦')" target="_self" title="Bangkok"><nobr>伦敦</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('法兰克福')" target="_self" title="Seoul"><nobr>法兰克福</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('罗马')" target="_self" title="Tokyo"><nobr>罗马</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('米兰')" target="_self" title="Tokyo"><nobr>米兰</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('莫斯科')" target="_self" title="Taipei"><nobr>莫斯科</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('阿姆斯特丹')" target="_self" title="Kuala Lumpur"><nobr>阿姆斯特</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('柏林')" target="_self" title="Jakarta"><nobr>柏林</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('汉堡')" target="_self" title="Jakarta"><nobr>汉堡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('马德里')" target="_self" title="Osaka"><nobr>马德里</nobr></a></span></li>
			    <li ><span class="iName"><a href="javascript:selectCity('里昂')" target="_self" title="Fukuoka"><nobr>里昂</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('伯明翰')" target="_self" title="Manila"><nobr>伯明翰</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('雅典')" target="_self" title="Kathmandu"><nobr>雅典</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('慕尼黑')" target="_self" title="Hong Kong"><nobr>慕尼黑 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('苏黎世')" target="_self" title="Phuket"><nobr>苏黎世</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('哥本哈根')" target="_self" title="Hanoi"><nobr>哥本哈根</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('赫尔辛基')" target="_self" title="Bali"><nobr>赫尔辛基</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('维也纳')" target="_self" title="Siem Reap"><nobr>维也纳</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('日内瓦')" target="_self" title="Male'"><nobr>日内瓦</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('爱丁堡')" target="_self" title="New Delhi"><nobr>爱丁堡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('布拉格')" target="_self" title="Kaohsiung"><nobr>布拉格</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('巴塞罗那')" target="_self" title="Ho Chi Minh City"><nobr>巴塞罗</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('斯德哥尔摩')" target="_self" title="Penang"><nobr>斯德哥尔摩</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('杜塞尔多夫')" target="_self" title="Pusan"><nobr>杜塞尔多夫</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('布达佩斯')" target="_self" title="MACAU "><nobr>布达佩斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('纽卡斯尔')" target="_self" title="Nagoya"><nobr>纽卡斯尔</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('曼彻斯特')" target="_self" title="Sapporo"><nobr>曼彻斯特</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('里斯本')" target="_self" title="LISBON"><nobr>里斯本</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('威尼斯')" target="_self" title="VENICE"><nobr>威尼斯</nobr></a></span></li>
				</ul>
		</div>
		<div class="citylist" id="citylist003" style="display:none;">
			<ul>
				<li ><span class="iName"><a href="javascript:selectCity('多伦多')" target="_self" title="Singapore"><nobr>多伦多</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('温哥华')" target="_self" title="Bangkok"><nobr>温哥华</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('纽约')" target="_self" title="Seoul"><nobr>纽约</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('洛杉矶')" target="_self" title="Tokyo"><nobr>洛杉矶</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('三藩市')" target="_self" title="Taipei"><nobr>三藩市</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('芝加哥')" target="_self" title="Kuala Lumpur"><nobr>芝加哥</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('华盛顿')" target="_self" title="Jakarta"><nobr>华盛顿</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('西雅图')" target="_self" title="Manila"><nobr>西雅图</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('波士顿')" target="_self" title="Kathmandu"><nobr>波士顿</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('达拉斯')" target="_self" title="Osaka"><nobr>达拉斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('亚特兰大')" target="_self" title="Hong Kong"><nobr>亚特兰大 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('蒙特利尔')" target="_self" title="Phuket"><nobr>蒙特利尔</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('休斯顿')" target="_self" title="Phnom Penh"><nobr>休斯顿</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('拉斯维加斯')" target="_self" title="Dubai"><nobr>拉斯维加斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('底特律')" target="_self" title="Hanoi"><nobr>底特律</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('迈阿密')" target="_self" title="Bali"><nobr>迈阿密</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('渥太华')" target="_self" title="Siem Reap"><nobr>渥太华</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('丹佛')" target="_self" title="Male'"><nobr>丹佛</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('明尼阿波利斯')" target="_self" title="New Delhi"><nobr>明尼阿波利斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('卡尔加里')" target="_self" title="Kaohsiung"><nobr>卡尔加里</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('费城')" target="_self" title="Ho Chi Minh City"><nobr>费城</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('渥太华')" target="_self" title="Penang"><nobr>渥太华</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('夏威夷')" target="_self" title="Yangon"><nobr>夏威夷</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('圣路易斯')" target="_self" title="Pusan"><nobr>圣路易斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('爱德蒙顿')" target="_self" title="MACAU "><nobr>爱德蒙顿</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('奥兰多')" target="_self" title="Nagoya"><nobr>奥兰多</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('匹兹堡')" target="_self" title="Pittsburgh"><nobr>匹兹堡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('圣地亚哥')" target="_self" title="Sapporo"><nobr>圣地亚哥</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('盐湖城')" target="_self" title="Fukuoka"><nobr>盐湖城</nobr></a></span></li>
			</ul>
		</div>
		<div class="citylist" id="citylist004" style="display:none;">
			<ul>
				<li ><span class="iName"><a href="javascript:selectCity('布宜诺斯艾利斯')" target="_self" title="Singapore"><nobr>布宜诺斯艾利斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('墨西哥城')" target="_self" title="Bangkok"><nobr>墨西哥城</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('圣保罗')" target="_self" title="Seoul"><nobr>圣保罗</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('哈瓦那')" target="_self" title="Tokyo"><nobr>哈瓦那</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('利马')" target="_self" title="Taipei"><nobr>利马</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('加拉加斯')" target="_self" title="Kuala Lumpur"><nobr>加拉加斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('里约热内卢')" target="_self" title="Jakarta"><nobr>里约热内卢</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('圣地亚哥')" target="_self" title="Kathmandu"><nobr>圣地亚哥</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('巴拿马')" target="_self" title="Osaka"><nobr>巴拿马</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('基多')" target="_self" title="Hong Kong"><nobr>基多 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('圣何塞')" target="_self" title="Phuket"><nobr>圣何塞</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('蒙得维的亚')" target="_self" title="Phnom Penh"><nobr>蒙得维的亚</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('复活岛')" target="_self" title="Dubai"><nobr>复活岛 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('瓜达拉哈拉')" target="_self" title="Hanoi"><nobr>瓜达拉哈拉</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('坎昆')" target="_self" title="Bali"><nobr>坎昆</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('帕拉马里博')" target="_self" title="Siem Reap"><nobr>帕拉马里博</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('波哥大')" target="_self" title="Male'"><nobr>波哥大</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('伯利兹城')" target="_self" title="New Delhi"><nobr>伯利兹城</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('拉巴斯')" target="_self" title="Kaohsiung"><nobr>拉巴斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('太子港')" target="_self" title="Ho Chi Minh City"><nobr>太子港</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('瓜亚基尔')" target="_self" title="Penang"><nobr>瓜亚基尔</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('巴西利亚')" target="_self" title="Yangon"><nobr>巴西利亚</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('危地马拉')" target="_self" title="Pusan"><nobr>危地马拉</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('迷纳蒂兰')" target="_self" title="MACAU "><nobr>迷纳蒂兰</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('蒙特雷')" target="_self" title="Nagoya"><nobr>蒙特雷</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('圣萨尔瓦多')" target="_self" title="Mumbai"><nobr>圣萨尔瓦多</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('利韦利亚')" target="_self" title="Sapporo"><nobr>利韦利亚</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('库斯科')" target="_self" title="Fukuoka"><nobr>库斯科</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('伊斯塔帕')" target="_self" title="Colombo"><nobr>伊斯塔帕</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('爱德林')" target="_self" title="Colombo"><nobr>爱德林</nobr></a></span></li>
			</ul>
		</div>
		<div class="citylist" id="citylist005" style="display:none;">
			<ul>
				<li ><span class="iName"><a href="javascript:selectCity('悉尼')" target="_self" title="Singapore"><nobr>悉尼</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('墨尔本')" target="_self" title="Bangkok"><nobr>墨尔本</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('奥克兰')" target="_self" title="Seoul"><nobr>奥克兰</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('布里斯班')" target="_self" title="Tokyo"><nobr>布里斯班</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('阿德莱德')" target="_self" title="Taipei"><nobr>阿德莱德</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('珀斯')" target="_self" title="Kuala Lumpur"><nobr>珀斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('惠灵顿')" target="_self" title="Jakarta"><nobr>惠灵顿</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('塞班')" target="_self" title="Manila"><nobr>塞班</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('堪培拉')" target="_self" title="Kathmandu"><nobr>堪培拉</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('凯恩斯')" target="_self" title="Osaka"><nobr>凯恩斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('关岛')" target="_self" title="Hong Kong"><nobr>关岛 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('苏瓦')" target="_self" title="Phnom Penh"><nobr>苏瓦</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('黄金海岸')" target="_self" title="Dubai"><nobr>黄金海岸 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('达尔文')" target="_self" title="Siem Reap"><nobr>达尔文</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('女皇镇')" target="_self" title="Male'"><nobr>女皇镇</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('达尼丁')" target="_self" title="Pusan"><nobr>达尼丁</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('帝力')" target="_self" title="MACAU "><nobr>帝力</nobr></a></span></li>
			</ul>
		</div>
		<div class="citylist" id="citylist006" style="display:none;">
			<ul>
				<li ><span class="iName"><a href="javascript:selectCity('开罗')" target="_self" title="Singapore"><nobr>开罗</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('约翰内斯堡')" target="_self" title="Bangkok"><nobr>约翰内斯堡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('内罗毕')" target="_self" title="Seoul"><nobr>内罗毕</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('开普敦')" target="_self" title="Tokyo"><nobr>开普敦</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('亚的斯亚贝巴')" target="_self" title="Taipei"><nobr>亚的斯亚贝巴</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('阿克拉')" target="_self" title="Kuala Lumpur"><nobr>阿克拉</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('达累斯萨拉姆')" target="_self" title="Jakarta"><nobr>达累斯萨拉姆</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('的黎波里')" target="_self" title="Manila"><nobr>的黎波里</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('卢萨卡')" target="_self" title="Kathmandu"><nobr>卢萨卡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('卡萨布兰卡')" target="_self" title="Osaka"><nobr>卡萨布兰卡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('卢安达')" target="_self" title="Hong Kong"><nobr>卢安达 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('阿布贾')" target="_self" title="Phuket"><nobr>阿布贾</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('阿尔及尔')" target="_self" title="Phnom Penh"><nobr>阿尔及尔</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('喀土穆')" target="_self" title="Dubai"><nobr>喀土穆 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('塔那那利佛')" target="_self" title="Hanoi"><nobr>塔那那利佛</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('突尼斯')" target="_self" title="Bali"><nobr>突尼斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('洛美')" target="_self" title="Siem Reap"><nobr>洛美</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('雅温得')" target="_self" title="Male'"><nobr>雅温得</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('路易港')" target="_self" title="New Delhi"><nobr>路易港</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('达喀尔')" target="_self" title="Kaohsiung"><nobr>达喀尔</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('的黎波里')" target="_self" title="Ho Chi Minh City"><nobr>的黎波里</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('巴马科')" target="_self" title="Penang"><nobr>巴马科</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('杜阿拉')" target="_self" title="Yangon"><nobr>杜阿拉</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('哈拉雷')" target="_self" title="Pusan"><nobr>哈拉雷</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('科托努')" target="_self" title="MACAU "><nobr>科托努</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('恩贾梅纳')" target="_self" title="Nagoya"><nobr>恩贾梅纳</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('金沙萨')" target="_self" title="Mumbai"><nobr>金沙萨</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('塔那那利佛')" target="_self" title="Sapporo"><nobr>塔那那利佛</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('拉各斯')" target="_self" title="Fukuoka"><nobr>拉各斯</nobr></a></span></li>
			    <li ><span class="iName"><a href="javascript:selectCity('马拉博')" target="_self" title="Fukuoka"><nobr>马拉博</nobr></a></span></li>
				</ul>
		</div>
	</div>
</div>
</div>
   
    <!--other plan-->
    <div class="otherfly">
     <div class="flytitle">共有 <b style="font-size:16px;color:#F60;"><asp:Label ID="rptAirlinesCount" runat="server" Text=""></asp:Label></b> 家航空公司</div>
     <div class="otherflybox">
      <ul class="otherfly_box">
	    <asp:Repeater ID="rptAirlines" runat="server">
           <ItemTemplate>
              <li <%#((AiFeiAirline)Container.DataItem).airlineId.Trim()==airlineId.ToString()?"style=\"background:#eee;\"":""%> ><img src="<%#((AiFeiAirline)Container.DataItem).airlinePic.Trim()%>" class="flyico" alt="<%#((AiFeiAirline)Container.DataItem).airlineName.Trim()%>" />
              <a href="searchTicket.aspx?airlineId=<%#((AiFeiAirline)Container.DataItem).airlineId.Trim()%>&fromCity=<%=Server.UrlEncode(Request.QueryString["fromCity"].ToString())%>&tocityName=<%=Server.UrlEncode(Request.QueryString["tocityName"].ToString())%>&tripType=<%=Request.QueryString["tripType"].ToString()%>&tripDate=<%=Request.QueryString["tripDate"].ToString()%>&backDate=<%=Request.QueryString["backDate"].ToString()%>">
                <span class="flyname"><%#((AiFeiAirline)Container.DataItem).airlineName.Trim()%></span>
              </a>
              </li>
	       </ItemTemplate>
        </asp:Repeater>
	  </ul>
     </div>
    </div>
    <!--other plan end-->
    <div class="clear"></div>
    <!---->
    <div class="searcblock"></div>
    <div class="searchlids">
     <div class="searchidst">
     <img src="images/searchleftids.gif" />
     </div>
     <div class="searchidsp">了解<b style="color:#09F"><%=fromCityName %>-<%=toCityName%></b>价格分析</div>
    </div>
    </div>
  <!--searchleft end-->
  <!--searchright start-->
  <div class="searchresult">
  <div class="searchrtitle"><strong>[<asp:Label ID="tripTypeNameLabel" runat="server" Text=""></asp:Label>] <span id="fromCityNameLabel"><%=fromCityName %></span>&nbsp;--&nbsp;<span id="toCityNameLabel"><%=toCityName%></span></strong></div>
  <div class="searchrnav">&nbsp;&nbsp;</div>
   <div class="clear"></div>
   <ul class="searchrtag">
      
       <%
       for (int i = 0; i < fromcitylist.Count; i++)
        {%>
         <%
       System.Data.DataRow citylist_row = fromcitylist[i];

       if (fromCity.SelectedValue == citylist_row["fId"].ToString())
       {     
        %>
	   <li class="one" id="Li1"><a href="javascript:void(0);"><%=citylist_row["chName"]%>出发</a></li>
	   <% }
       else
       {%>
	   <li class="two"><a href="javascript:SearchTicketByFromCity('<%=citylist_row["fId"]%>');"><%=citylist_row["chName"]%>出发</a></li>
	 
       <%
             }
       }%>
<script type="text/javascript">
    function showmoreCity() {
        var obj = document.getElementById("moreCity");
        if (obj.style.display == 'none')
            obj.style.display = 'block';
        else if (obj.style.display == 'block')
            obj.style.display = 'none';
    }
</script>
       
       <li class="two" id="moreSelect"><a href="javascript:showmoreCity();">更多出发地</a></li>
	</ul>
    <div class="clear"></div>
    <ul id="moreCity" class="flymore" style="display:none;">
<%
           for (int i = 0; i < morefromcitylist.Count; i++)
        {%>
        <%
         System.Data.DataRow morefromcitylist_row = morefromcitylist[i];

        if (fromCity.SelectedValue == morefromcitylist_row["fId"].ToString())
       {     
        %>
	   <a href="javascript:void(0);"><b><%=morefromcitylist_row["chName"]%>出发</b></a> 
	   <% }
       else
       {%>
	  <a href="javascript:SearchTicketByFromCity('<%=morefromcitylist_row["fId"]%>');"><%=morefromcitylist_row["chName"]%>出发</a> 
        <%
          }
        }%>
    </ul>
    <div class="clear"></div>
    <div class="searchrdiv">
		  <code>出发日期：<asp:Label ID="tripDateLabel" runat="server" Text=""></asp:Label>&nbsp;&nbsp;返回日期：<asp:Label ID="backDateLabel" runat="server" Text=""></asp:Label></code>
		  <div style=" float:right; width:195px;height:30px;"><a href="searchTicket.aspx?fromcity=<%=Request.QueryString["fromcity"].ToString()%>&tocityName=<%=Server.UrlEncode(Request.QueryString["tocityName"].ToString())%>&tripType=<%=Request.QueryString["tripType"].ToString()%>&tripDate=<%=Request.QueryString["tripDate"].ToString()%>&backDate=<%=Request.QueryString["backDate"].ToString()%>&orderStr=airLine" title="" class="slink_a">按航司排序</a><a href="searchTicket.aspx?fromcity=<%=Request.QueryString["fromcity"].ToString()%>&tocityName=<%=Server.UrlEncode(Request.QueryString["tocityName"].ToString())%>&tripType=<%=Request.QueryString["tripType"].ToString()%>&tripDate=<%=Request.QueryString["tripDate"].ToString()%>&backDate=<%=Request.QueryString["backDate"].ToString()%>" title="" class="slink_a">按价格排序</a></div>
		  
	 </div>
     <div class="clear"></div>
     
     <asp:Panel ID="panNoValue" runat="server" Visible="false" >  
    		<div style="width:745px; overflow:hidden; margin-top:15px;float:left;-webkit-border-radius: 5px;-moz-border-radius: 5px;border-radius: 5px;background:#c8f4ff url(/images/bg2.jpg) no-repeat;">
            <table class="errmes">
              <tr>
                <td width="130px">&nbsp;</td>
                <td width="228"><div class="errtxt1" ><font class="errF1">搜索不到，不代表没有哦！</font><font class="errF2">(我们提供全球每一个城市的机票。)</font><br>
            <font class="errF1">您查询的航线可能涉及多段航程接驳，需要客服设计行程。</font></div></td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td>
            	
	            <table width="100%" border="0">
              <tr>
                <td width="400px"><div class="errtxt4"><font class="errF1">请通过免费热线进行查询：</font></div></td>
                <td><a href="tencent://message/?uin=32335510&amp;Site=111&amp;Menu=yes"><img src="images/qq.jpg"></a></td>
              </tr>
              <tr>
                <td><div  class="errtxt2"><font class="errF3">400-885-0663</font></div></td>
                <td><a href="msnim:chat?contact=gzfeiyue_carol@hotmail.com"><img src="images/msn.jpg"></a></td>
              </tr>
            </table>

            </td>
              </tr>
              <tr>
                <td>&nbsp;</td>
                <td><div class="errtxt3" >
	            <font class="errF4">您还可以留下电话，客服马上与您联系</font><br>
	            <font class="errF4">
                <input style="margin-top:18px; margin-left:0px;float:left;" id="eMsg_tel" name="kw" type="text" /> <a href="javascript:void(0)" onclick="sendTelMsg();" ><img  style="margin-left:20px; margin-top:12px;float:left;" src="images/btn.jpg"></a></font>
                </div></td>
              </tr>
            </table>
		    </div>
      </asp:Panel>
      
     <asp:Panel ID="panLoading" runat="server" Visible="false" >  
         <div id="myads"class="searchlist">
            <p style="text-align:center;line-height:30px;"><img src="images/searchloading.gif" width="200" height="25" /></p>
            <p style="text-align:center;font-size:16px;font-weight:600;line-height:30px;">正以穿梭机般的速度为您查询，请稍候……</p>
         </div>
         <script type="text/javascript">
             $.ajax({ type: "get", cache: false, url: document.location.href + "&Loading=true", success: function(data) {
                 var obj = $(data);
                 var list = obj.find('.searchresult').html();
                 $('.searchresult').html(list);

                 var otherfly = obj.find('.otherfly').html();
                 $('.otherfly').html(otherfly);

                 obj.find('.scriptdiv').each(function() {
                    eval(this.innerHTML);
                 });
             },
                 error: function() {
                     return;
                 }
             });
         </script>
     </asp:Panel>
      
     <asp:Panel ID="panHaveValue1" runat="server">  
	     <asp:Repeater ID="rptshopnews" runat="server">
             <ItemTemplate>
               <div class="searchlist">
                    <div class="flynav">
                     <ul>
                      <li style="width:120px;float:left;"><%=fromCityName %>-<%=toCityName%></li>
                      <li style="width:40px;float:left;"><%#(((AiFeiTicket)Container.DataItem).tripType == "1") ? "往返" : "单程"%></li>
                     </ul>
                    </div>
                    <div class="table">
                    <div class="clearl"></div>
                    <table cellpadding="0" cellspacing="0" class="searchlisttable"> 
	                    <tr>
	                        <td width="100" align="center">
                                <ul>
                                 <li><img src="<%#((AiFeiTicket)Container.DataItem).airlineSmallPic%>" alt="<%#((AiFeiTicket)Container.DataItem).airline%>" /></li>
                                 <li class="lititle"><a target="_blank" href="airlineDetail.aspx?aId=<%#((AiFeiTicket)Container.DataItem).airlineId%>"><%#((AiFeiTicket)Container.DataItem).airline%></a></li>
                                 <li class="lititle2" id="ulaifei_3_<%#this.rptshopnews.Items.Count %>"><%#printf_relayPort(((AiFeiTicket)Container.DataItem).relayPort)%></li>
                                </ul>
                            </td>
                            
		                     <td width="150">
                                <ul id="ulaifei_0_<%#this.rptshopnews.Items.Count %>">
                                    <%# printf_flights((AiFeiTicket)Container.DataItem,"from")%>
                                </ul>
                            </td>
		                    <td width="30">
                                <ul id="ulaifei_1_<%#this.rptshopnews.Items.Count %>">
                                    <%# printf_flights((AiFeiTicket)Container.DataItem,"line")%>
                                </ul>
                            </td>
		                    <td width="150">
                                <ul id="ulaifei_2_<%#this.rptshopnews.Items.Count %>">
                                    <%# printf_flights((AiFeiTicket)Container.DataItem,"to")%>
                                </ul>
                            </td>
                            
		                    <td width="50"
                            <ul>
                                 <li class="lititle3">票价</li>
                                 <li class="lititle2">(不含税)</li>
                   <%--<li class="lititle3">税费</li>--%>
                                 <li class="lititle3">机型</li>
                                 <li class="lititle1">&nbsp;</li>
                            </ul>
                            </td>
		                    <td width="80">
                            <ul>
                                 <li class="price">￥<%#((AiFeiTicket)Container.DataItem).price%></li>
                                 <!--机位有限-->
                                 <li class="jiwei"><%# printJpjz((AiFeiTicket)Container.DataItem) %></li>
                                 <%--<li class="lititle4">&nbsp;&nbsp;￥<%#((AiFeiTicket)Container.DataItem).tax%><span style="color:#999;font-size:10px;">约</span></li>--%>
                                 <li id="ulaifei_4_<%#this.rptshopnews.Items.Count %>" class="lititle4">-</li>
                                 <li class="lititle1">&nbsp;</li>
                            </ul>
                            </td>
		                    <td width="80">
                            <ul>
                             <li><a href="<%# printfXXLink((AiFeiTicket)Container.DataItem) %>" target="_blank"><img src="images/hbinfoimg.gif" /></a></li>
                             <li><a  href="http://qiao.baidu.com/v3/?module=default&controller=im&action=index&ucid=2415525&type=n&siteid=293251" onclick="_czc.push(['_trackEvent', '搜索列表','咨询','点击']);" target="_blank" title="咨询客服" rel="nofollow"><img src="images/chatnowimg.gif" /></a></li>
                             <li>&nbsp;</li>
                            </ul>
                            </td>
	                    </tr>
	                </table>   
                    </div>
               </div>
               <div class="scriptdiv" style="display:none;">
                <%--<script language="javascript" type="text/javascript">--%>
                    $(function(){
                        SearchAifeiTicket(<%#this.rptshopnews.Items.Count %>,'<%#((AiFeiTicket)Container.DataItem).fromCityCode%>', '<%#((AiFeiTicket)Container.DataItem).toCityCode%>', '<%#((AiFeiTicket)Container.DataItem).airlineCode%>', '<%#ajaxToTime%>','<%#ajaxFromTime%>','<%#((AiFeiTicket)Container.DataItem).tripType %>');
                    });
                <%--</script>--%>
                </div>
                <script language="javascript" type="text/javascript">
                    $(function(){
                        SearchAifeiTicket(<%#this.rptshopnews.Items.Count %>,'<%#((AiFeiTicket)Container.DataItem).fromCityCode%>', '<%#((AiFeiTicket)Container.DataItem).toCityCode%>', '<%#((AiFeiTicket)Container.DataItem).airlineCode%>', '<%#ajaxToTime%>','<%#ajaxFromTime%>','<%#((AiFeiTicket)Container.DataItem).tripType %>');
                    });
                </script>
	         </ItemTemplate>
         </asp:Repeater>
      </asp:Panel>

      <div class="search_threeboxbottom"> 
	    <asp:Panel ID="panHaveValue2" runat="server"> 	
	     <webdiyer:AspNetPager ID="Pager"  UrlPaging="true"  runat="server" FirstPageText="首页" CssClass="paginator" CurrentPageButtonClass="cpb" HorizontalAlign="Center" LastPageText="末页" NextPageText="下一页" PageSize="12" PrevPageText="上一页" ShowPageIndexBox="Always" SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" AlwaysShow="True"></webdiyer:AspNetPager>
             </asp:Panel> 
      </div> 
  </div>
  <!--searchright end-->
  </div>
  <div class="clear"></div>
  <!--sixlinebox start-->
<div class="clear"></div>

<div id="duilianb02" style="top:220px; display:none;">
    <div  id="tipbi1" style="width:242px;display:none;">
        <div class="dubi_boxtitle"><a href="javascript:showCompare('tipbi1')">收回&gt;&gt;</a></div>
        <div class="dubi_boxtwo">
	        <ul id="compareList"></ul>
	        <p><input type="button" value="比较机票" onclick="window.open('contrast.aspx')" /> </p>
	    </div>
    </div>

    <div class="dubi_box" id="compareBut"><a href="javascript:showCompare('tipbi1')">&nbsp;</a><input onclick='closeCompareBut()' type="button" alt="" /></div>
    <script type="text/javascript">Compare_show();</script>
</div>
<script type="text/javascript" src="js/datepicker.js"></script>
<script src="js/scrolljs02.js" type="text/javascript"></script>  

<uc1:footControl ID="FootControl" runat="server" />
</form>
</div>
</body>
</html>
