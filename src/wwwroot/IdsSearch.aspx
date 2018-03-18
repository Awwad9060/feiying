<%@ Page Language="C#" AutoEventWireup="true" CodeFile="IdsSearch.aspx.cs" Inherits="IdsSearch" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>国际机票IDS - 飞瀛网</title>
    <link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
    <link href="chttp://www.fei580.com/ss/hotcity.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/datepicker.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="http://www.fei580.com/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
    <script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            //日期控件
            TripBackDate(document.getElementById("ids_tripDate"), document.getElementById("ids_backDate"));
        });
    </script>
</head>
<body>
    <div class="mainbody" >
    <form id="form1" runat="server">
    <!--header start-->
    <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
    <div class="headerbottom">
      <div class="headerbottom_left"><a href="http://www.fei580.com" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="飞瀛网" /></a></div>
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
        </div>  <ul class="menu_1">
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
	          <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
	          <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="">民航机型</a></li>
	          <li class="two"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	          <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	        </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
	    <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="">飞瀛网</a>&gt;<a href="http://www.fei580.com/IdsSearch.aspx" title="">IDS抢订服务</a></div>
      </div>
    </div>
    <!--header end-->
    
    <div style="margin:0px auto;width:960px;">

    <!--onelinebox start-->
     <!--searchleft start-->
     <div style=""><img src="http://www.fei580.com/images/1.png"/>   </div>
      <div style=" width:283px; height:205px; float:left; overflow:hidden; margin-top:6px;">
        <img src="http://www.fei580.com/images/2.png" />   	
      </div>
      <!--searchleft end-->
       
     
      <div class="onelinebox_right">
          <div id="hotcityDiv" style="position:absolute;left:320px; top:420px; z-index:999999; background-color:#E7E7E7; display:none;">
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
				<li ><span class="iName"><a href="javascript:selectCity('阿姆斯特丹')" target="_self" title="Kuala Lumpur"><nobr>阿姆斯特丹</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('柏林')" target="_self" title="Jakarta"><nobr>柏林</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('汉堡')" target="_self" title="Jakarta"><nobr>汉堡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('马德里')" target="_self" title="Osaka"><nobr>马德里</nobr></a></span></li>
			    <li ><span class="iName"><a href="javascript:selectCity('里昂')" target="_self" title="Fukuoka"><nobr>里昂</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('伯明翰')" target="_self" title="Manila"><nobr>伯明翰</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('雅典')" target="_self" title="Kathmandu"><nobr>雅典</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('慕尼黑')" target="_self" title="Hong Kong"><nobr>慕尼黑 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('苏黎世')" target="_self" title="Phuket"><nobr>苏黎世</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('哥本哈根')" target="_self" title="Phnom Penh"><nobr>哥本哈根</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('赫尔辛基')" target="_self" title="Dubai"><nobr>赫尔辛基 </nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('哥本哈根')" target="_self" title="Hanoi"><nobr>哥本哈根</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('赫尔辛基')" target="_self" title="Bali"><nobr>赫尔辛基</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('维也纳')" target="_self" title="Siem Reap"><nobr>维也纳</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('日内瓦')" target="_self" title="Male'"><nobr>日内瓦</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('爱丁堡')" target="_self" title="New Delhi"><nobr>爱丁堡</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('布拉格')" target="_self" title="Kaohsiung"><nobr>布拉格</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('巴塞罗那')" target="_self" title="Ho Chi Minh City"><nobr>巴塞罗那</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('斯德哥尔摩')" target="_self" title="Penang"><nobr>斯德哥尔摩</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('纽卡斯尔')" target="_self" title="Yangon"><nobr>纽卡斯尔</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('杜塞尔多夫')" target="_self" title="Pusan"><nobr>杜塞尔多夫</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('布达佩斯')" target="_self" title="MACAU "><nobr>布达佩斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('纽卡斯尔')" target="_self" title="Nagoya"><nobr>纽卡斯尔</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('尼斯')" target="_self" title="Mumbai"><nobr>尼斯</nobr></a></span></li>
				<li ><span class="iName"><a href="javascript:selectCity('曼彻斯特')" target="_self" title="Sapporo"><nobr>曼彻斯特</nobr></a></span></li>
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
				<li ><span class="iName"><a href="javascript:selectCity('水牛城')" target="_self" title="Mumbai"><nobr>水牛城</nobr></a></span></li>
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

        <div class="International_rightbox" style="margin-top:0px;">
	      <img src="http://www.fei580.com/images/International05.jpg" alt="" class="International_img" />
           <div class="tablerightbox" style="position:relative;left:0;top:0;z-index:2;">
	    <ul class="tablerightbox_ul">
		  <li class="International_rightinputbox">
			<img src="http://www.fei580.com/images/International08.jpg" alt="" onclick="showTripType();" />
			<input type="text" value="行程" id="tripType_str" runat="server"/>
			<div id="typeList" class="jscss" style="display:none;"> 
				<div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';"  onclick="insertTypeValue('单程');">单程</div> 
				<div onmouseover="this.style.backgroundColor='#cccccc';" onmouseout="this.style.backgroundColor='#ffffff';"  onclick="insertTypeValue('往返');">往返</div> 
			</div>
		  </li>
		  <li class="International_rightinputbox">
			  <img src="http://www.fei580.com/images/International08.jpg" alt="" onclick="showFromcity()" />
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
			 <img src="http://www.fei580.com/images/International08.jpg" alt=""  onclick="showhotcity();"  />
			 <!--<input type="text" id="ids_tocity" value="目的地" runat="server" />-->
			 <input name="ids_tocity" type="text" id="ids_tocity" value="目的地">
		  </li>
		  <li class="International_rightinputbox">
			  <img src="http://www.fei580.com/images/International08.jpg" alt=""  />
			   <input type="text" id="txtd" value="航空公司" />
		  </li>
		</ul>
		    
		<ul class="tablerightbox_ulright">
		    <li class="International_rightinputbox">
			  <img src="http://www.fei580.com/images/International18.jpg" alt="" style=" float:left"  />
			  <input type="text" value="出发时间" id="ids_tripDate"/>
			
			</li>
			 <li class="International_rightinputbox">
			   <img src="http://www.fei580.com/images/International18.jpg" alt="" style=" float:left"  />
			  <input type="text"  value="返回时间" id="ids_backDate"/>
			</li>
			
			<li  class="two">  <asp:ImageButton ID="ImageButton1" ImageUrl="images/International06.jpg"  OnClick="IDS_Search" runat="server" OnClientClick="return checkIds();"/>
		</li>
		</ul>
		
	
	  </div>
	    </div>
    	
	    </div>
	 
	    
      <!--onelinebox end-->
      <div style="clear:both;width:90%; margin-left:15px; line-height:23px; font-size:14px;">
      
      注释:<br />
      IDS抢订服务包括三大优势特点：<br />
      1.抢订火爆航线低价舱位，IDS尤其体验在节假日航线火爆的时间段，我们也可以为商旅人争取到特价舱位（此功能需要商旅人提前一个半月以上预订）。<br />
      2.IDS限量特价机票，飞瀛网会不定期提供利用IDS提前抢订特价航线，商旅人可以密切关注。<br />
      3.提供航线价格分析，飞瀛网提供你感兴趣的航线价格走势分析，让你360度了解你的需要，价格尽掌握。<br />
      </div>
    </div>

<script type="text/javascript" src="http://www.fei580.com/js/datepicker.js"></script>


<!--sixlinebox start-->
 <uc1:footControl ID="FootControl" runat="server" />
 <!--footer end-->
    </form>
    </div>
</body>
</html>
