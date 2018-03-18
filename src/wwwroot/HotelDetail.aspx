<%@ Page Language="C#" AutoEventWireup="true" CodeFile="HotelDetail.aspx.cs" Inherits="HotelDetail" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title><%=hotelOne["HotelName"]%> - 特价酒店 - 飞瀛网</title>
    <link href="css/main.css" rel="stylesheet" type="text/css" />
    <link href="css/index.css" rel="stylesheet" type="text/css" />
    <link href="css/hotcity.css" rel="stylesheet" type="text/css" />
    <link href="css/datepicker.css" rel="stylesheet" type="text/css"/>
    <meta name="Description"  content="飞瀛网" />
    <meta name="keywords" content="飞瀛网" />
    <script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
    <script src="js/index.js" type="text/javascript"></script>
    <script src="js/common.js" type="text/javascript"></script>
    <script src="js/menu.js" type="text/javascript"></script>
    <script src="js/postdata.js" type="text/javascript"></script>
    <script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript">
        $(document).ready(function() {
            //日期控件
            TripBackDate(document.getElementById("txt_fromDate"), document.getElementById("txt_toDate"));
            //日期控件
            TripBackDate(document.getElementById("txt_bookfromdate"), document.getElementById("txt_booktodate"));
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
     <div class="mainbody">
  <!--header start-->
    <div class="headertop"><span><img src="images/home.jpg" alt="飞瀛网" /><img src="images/homeinfor.jpg" alt="国际机票专家" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
    <div class="headerbottom">
      <div class="headerbottom_left"><a href="http://www.fei580.com" title="飞瀛网"><img src="images/logo.jpg" alt="" /></a></div>
      <div class="headerbottom_right">
        <div class="headerbottom_rightone">
        <% if (Session["Mem_LoginName"] == null)
           { %>
        <a href="login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="">会员登录</a>|<a href="regAgree.aspx" title="会员注册">会员注册</a>|<a href="/sm/" title="飞瀛服务">关于飞瀛</a>
        <%
            }
            else
            {
         %>
        <a href="person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="person/myinfo.aspx" title="">个人中心</a>|<a href="logout.aspx" title="">退出登录</a>
        <%}
             %> 
        </div>
        <ul class="menu_1">
          <li class="two"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
          <li class="two"><a href="recommend.aspx" title="特价机票">特价机票</a></li>
          <li class="two"><a href="international.aspx" title="国际机票">国际机票</a></li>
          <li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>
          <!--<li class="two"><a href="/visa.html" title="国际签证">国际签证</a></li>-->
           <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
     <!--<li class="two"><a href="hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
          <li class="two"><a href="quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a></li>
          <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
          <li class="new_imgs" style="padding:0px;background:none;"><img src="images/new.gif" alt="" /></li>
        </ul>
        <div class="menubottom">
	        <ul class="nohidden">
	          <li class="two"><a href="airline.aspx" title="航空公司">航空公司</a></li>
	          <li class="two"><a href="airport.aspx" title="世界机场">世界机场</a></li>
	          <li class="two"><a href="airplane.aspx" title="民航机型">民航机型</a></li>
	          <li class="two"><a href="news.aspx" title="">新闻资讯</a></li>
	          <li class="two"><a href="prizes.aspx" title="">积分广场</a></li>
	        </ul>
                <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
         <div class="header_nav">您现在位置：<a href="http://www.fei580.com" title="首页">飞瀛首页</a>&gt;&nbsp;特价酒店</div>
      </div>
    </div>
    <!--header end-->

    <div style="margin:0px auto;width:964px;">
      <!--onelinebox start-->
      <div class="onelinebox_left">
         <div class="onelinebox_leftboxone">
      <ul class="onelinebox_leftboxonetitle onelinebox_leftboxonetitle_soso3">
        <li class="two" id="right1" onclick='location.href("../international.aspx")' >国际机票</li>
        <li class="three" id="right2" onclick="location.href('ticket')">国内机票</li>
        <li class="one_new" id="right3" >特价酒店</li>
      </ul>
      <div class="onelinebox_leftboxonebg">
        <!--hiddenone start-->
         <div id="rightChild1" class="nohidden">
	        <table class="onelinebox_leftbgbox1" cellpadding="0" cellspacing="5">
	          <tr>
	            <td colspan="2" align="center">
	            <asp:RadioButton ID="tripType0" runat="server" GroupName="tripType"  Text="国内酒店" />
	            &nbsp;<asp:RadioButton ID="tripType1" runat="server" GroupName="tripType" Text="国外酒店"   Checked="True" />
	            </td>
	          </tr>
	          <tr>
	            <th>目的城市</th>
	            <td><input type="text" class="onelinebox_input" id="tocityName" runat="server" /><a href="javascript:showhotcity();"><img src="images/onein06.jpg" alt="" /></a></td>
	          </tr>
	          <tr>
	            <th>指定酒店</th>
	            <td><input type="text" class="onelinebox_input" id="txt_hotelName" runat="server" /></td>
	          </tr>
	          <tr>
	            <th>入住日期</th>
	            <td><input id="txt_fromDate" type="text" class="onelinebox_input" runat="server" /></td>
	          </tr>
	          <tr>
	            <th>退房日期</th>
	            <td><input id="txt_toDate" type="text" class="onelinebox_input"  runat="server"/></td>
	          </tr>
	          <tr>
	            <th>价格范围</th>
	            <td><input id="txt_minPrice" type="text" style="width:57px"  runat="server"/> - <input id="txt_maxPrice" type="text" style="width:57px"  runat="server"/></td>
	          </tr>
	          <tr>
	            <th>房间数</th>
	            <td>
	            <select id="selBookNum" runat="server" style="width:50px" >
	                <option value="1">1</option>
	                <option value="2">2</option>
	                <option value="3">3</option>
	                <option value="4">4</option>
	                <option value="5">5</option>
	            </select>
	            </td>
	          </tr>          
	          <tr style="z-index:999;">
	            <td colspan="2" style="padding-bottom:26px;"><asp:Button ID="btnSearch" runat="server" Text=""  OnClientClick="return CheckSearchHotel()" OnClick="btnSearch_Click" CssClass="onesubmitcss1"/></td>
	          </tr>
	        </table>
        </div>
        <!--hiddenone end-->
        
       <div id="hotcityDiv" style="position:absolute;left:220px; top:150px; z-index:999999; background-color:#E7E7E7; display:none;">
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
        
      </div>
      </div>

       <div class="hotel_search_title"><%=hotelOne["chName"]%>好评酒店排名</div>
       <div class="hotel_search_boxone">
         <ul>
         <asp:Repeater ID="repRecomHotel" runat="server">
         <ItemTemplate>
         <li><a href="hotelinfo_<%#Eval("hId") %>.htm"><%#Eval("HotelName") %></a><%#Hotelhelper.getHotelRate(Eval("rate").ToString())%></li>
         </ItemTemplate>
         </asp:Repeater>
	     </ul> 
	     <span class="hotel_search_boxtwo"><a href="hotellist_<%=Server.UrlEncode(hotelOne["chName"].ToString()) %>.htm">查阅<%=hotelOne["chName"]%>的所有酒店</a></span>
       </div>
       <div class="hotel_search_line"></div>

       <div class="hotel_search_titletwo"><%=hotelOne["stateName"] %>特价机票</div>
       <ul class="hotel_search_ulone">
         <asp:Repeater ID="repRecomTicket" runat="server">
         <ItemTemplate>
         <li><span><a href="ticket_<%#Eval("tId")%>.htm" title="<%#Eval("fromCityname").ToString()%>←→<%#Eval("toCityname").ToString()%>" ><%#Eval("title") %> <%#Eval("fromCityname").ToString()%>←→<%#Eval("toCityname").ToString()%></a></span><code>￥<%#Eval("untaxPrice").ToString()%></code></li>
         </ItemTemplate>
         </asp:Repeater>
       </ul>
       <div class="hotel_search_line"></div>



      </div>  
       
       <script type="text/javascript">
       function changHotelPic(res){
           document.getElementById("imgHotelPic").src=res.src;
       }
       </script>


      <div class="hotel_search_newright">
        <img src="images/hotelnew_05.jpg" style="float:left;margin-top:15px;" />
	    <div class="hotel_search_newrightbox">
	      <div style="margin:0 auto;width:644px;">
	        <dl class="hotel_search_newrightdl">
		      <dt><strong><%=hotelOne["HotelName"]%></strong><%=Hotelhelper.getHotelRate(hotelOne["rate"].ToString())%>星级</dt>
		      <dd title="<%=hotelOne["address"]%>" >位置：<%=hotelOne["address"]%></dd>
		    </dl>
		    <div class="clearfix">
		      <dl class="hotel_search_newimgleft">
		        <dt><img id="imgHotelPic" src="<%=hotelOne["pic2"]%>" alt="" width="250px" height="229px" /></dt>
			    <dd><img onclick="selectHotelPic(0)" src="images/hotelnew_09.jpg" alt="上一张" /><img onclick="selectHotelPic(1)" src="images/hotelnew_010.jpg" alt="下一张" /></dd>
		      </dl>
              <script type="text/javascript">
               var hotelpic=1;
               var hotelpicMax=<%=this.repHotelPic.Items.Count%>;
               function selectHotelPic(align){
                    if(align==0){
                        if(hotelpic!=1){
                            hotelpic=hotelpic-1;
                            document.getElementById("imgHotelPic").src=document.getElementById("hotelpic_"+hotelpic).src;
                        }
                    }else{
                        if(hotelpic!=hotelpicMax){
                            hotelpic=hotelpic+1;
                            document.getElementById("imgHotelPic").src=document.getElementById("hotelpic_"+hotelpic).src; 
                        }
                    }
                } 
                 
              </script>
		      <dl class="hotel_search_newrightboxtwo">
		        <dd class="one clearfix">
		        <asp:Repeater ID="repHotelPic" runat="server" >
		        <ItemTemplate>
		        <img id="hotelpic_<%#this.repHotelPic.Items.Count+1 %>"  src="<%#Eval("Pic") %>" onmouseover="changHotelPic(this)" width="50px" height="50px" alt="<%#Eval("name") %>" />
		        </ItemTemplate>
		        </asp:Repeater>
			    </dd>
			    <dd class="two">
			      过去<b style="color: #0066ff;">3</b>天已有<b style="color: #0066ff;"><%=RanNum %></b>位客人预订该酒店
			    </dd>
			    <dd class="three">
			      顾客满意度：<img src="images/gogo.gif" alt="" /><input type="submit" value="" class="hotel_search_rightsubmitone" />
			    </dd>
			    <dd class="four"><a href="#divComment" style="color:red;">查看客户评论（共有<%=this.repComent.Items.Count %>条）</a></dd>
			    <dd class="five"><strong class="hotel_search_strongthree">均价：<%=hotelOne["Price"]%></strong>
                 <input id="buttshowbookHotel" onclick="showBookHotel()" class="hotel_search_rightbuttonone" value="我要预定" type="text" />
			    </dd>
		      </dl>
		    </div>

            <div class="hotel_search_righttitlelast">酒店概况</div>
		    <dl class="hotel_search_rightboxtwo">
              <dt><%=hotelOne["intro"]%></dt>
            <dd>400-885-0663</dd>
            </dl>

		    <div class="hotel_search_righttitlelast">酒店设施</div>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>综合设施 </dt>
		      <dd><%=hotelOne["zhonghesheshi"]%></dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>服务项目 </dt>
		      <dd><%=hotelOne["fuwuxiangmu"]%></dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>互联网 </dt>
		      <dd><%=hotelOne["internet"]%></dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix" style="border:none">
		      <dt>停车设施 </dt>
		      <dd><%=hotelOne["tingchesheshi"]%></dd>
		    </dl>

            <div class="hotel_search_righttitlelast">酒店政策</div>
		    <div class="hotel_search_rightulone clearfix"><%=hotelOne["jiudianzhengce"]%></div>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>办理入住手续 </dt>
		      <dd><%=hotelOne["ruzhushouxu"]%></dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>办理退房手续 </dt>
		      <dd><%=hotelOne["tuifangshouxu"]%></dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>取消预订 </dt>
		      <dd><%=hotelOne["quxiaoyuding"]%></dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>儿童和加床事宜 </dt>
		      <dd><%=hotelOne["ertongjiachuang"]%> </dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>押金 </dt>
		      <dd><%=hotelOne["yajin"]%></dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix">
		      <dt>宠物事宜</dt>
		      <dd><%=hotelOne["chongwu"]%></dd>
		    </dl>

		    <dl class="hotel_search_rightulone clearfix" style="border:none">
		      <dt>可接受的信用卡</dt>
		      <dd><%=hotelOne["xinyongka"]%></dd>
		    </dl>

            <div id="divComment" class="hotel_search_righttitlelast">顾客点评</div>
            

            <asp:Repeater ID="repComent" runat="server">
            <ItemTemplate>
		    <div class="hotel_search_rightboxthree clearfix">
		      <ul>
		        <li class="one">580</li>
			    <li class="two">［<a href="javascript:void(0)" class="bluestr"><%#Eval("name") %></a>］的点评&nbsp;&nbsp;&nbsp;&nbsp;<%#Eval("type").ToString()=="0"?"商务":"旅游" %>/<%#Eval("year")%>-<%#Eval("mouth")%>入住<br />
    			
    总评分：<img src="images/gogo.gif" alt="" /><br />
    性价比:<code>5</code>舒适度:<code>5</code>位置:<code>5</code>卫生:<code>5</code>服务:<code>5</code>格调:<code>5</code> </li>
                <li class="three"><%#Eval("addtime") %></li>
		      </ul>
		      <p><%#Eval("comtcontent") %></p>
		    </div>
		    </ItemTemplate>
            </asp:Repeater>
        
	       <div class="newsdoc_leftboxsix">
	      <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页"  LastPageText="末页" NextPageText="下一页" PageSize="8" PrevPageText="上一页" ShowPageIndexBox="Always"
                  SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" AlwaysShow="True"></webdiyer:AspNetPager>
	       </div>

	      </div>

          <div class="hotel_search_rightfourtitle">参与有奖点评</div>
	      <table class="hotel_search_righttable" cellspacing="0" >
	        <tr>
		      <th width="68px">总体印象：</th>
		      <th colspan="5"><img src="images/gogo.gif" alt="" /><img src="images/hotelnew_015.jpg" alt="点击评分" /></th>
		    </tr>
		    <tr>
		      <th>舒适度</th>
		      <td><img src="images/hotelnew_018.jpg" alt="" /></td>
		      <th>性价比</th>
		      <td><img src="images/hotelnew_018.jpg" alt="" /></td>
		      <th>位&nbsp;&nbsp;置</th>
		      <td><img src="images/hotelnew_018.jpg" alt="" /></td>
		    </tr>
		    <tr>
		      <th>卫&nbsp;&nbsp;生</th>
		      <td><img src="images/hotelnew_018.jpg" alt="" /></td>
		      <th>服&nbsp;&nbsp;务</th>
		      <td><img src="images/hotelnew_018.jpg" alt="" /></td>
		      <th>格&nbsp;&nbsp;调</th>
		      <td><img src="images/hotelnew_018.jpg" alt="" /></td>
		    </tr>
            <tr>
		      <th colspan="2" >入住时间<br />
		      <select id="sel_year" runat="server" >
		      </select>
		      
		      <select id="sel_mouth" runat="server">
		        <option value="1" >1月</option>
		        <option value="2" >2月</option>
		        <option value="3" >3月</option>
		        <option value="4" >4月</option>
		        <option value="5" >5月</option>
		        <option value="6" >6月</option>
		        <option value="7" >7月</option>
		        <option value="8" >8月</option>
		        <option value="9" >9月</option>
		        <option value="10" >10月</option>
		        <option value="11" >11月</option>
		        <option value="12" >12月</option>
		      </select>
		      
		      </th>
		      <th colspan="4"><strong>旅行目的</strong><br />
		      <input id="radtype0" name="radtype" runat="server" type="radio" />商务<input id="radtype1"  name="radtype"  runat="server" type="radio" />旅游
		      </th>
		    </tr>
		    <tr>
		      <th colspan="6"><strong style="color:#EF008F">获取联系电话</strong><br /><input id="txt_tel" runat="server" type="text" class="text_vis" /><img src="images/hotelnew_016.jpg" alt="" /></th>
		    </tr>
		        <% if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null){ %>
        	    <%}else{ %>
		        <tr>
		        <th colspan="6">
		          <span style="padding-left:5px">
                    <code style="color:#419C01;" ><%=Session["Mem_LoginName"] %></code>：您已登录，你可以在此发表评论！
		          </span>
		          </th>
		        </tr>
                <%} %>
		    <tr>
		      <th colspan="6"><strong>您的点评</strong>
		       <% if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null){ %>
                <span style="padding-left:205px"><a href="login.aspx?url=hotelinfo_<%=id %>.htm" title="登录">登录</a>&nbsp;&nbsp;<a href="memberReg.aspx" title="注册">注册</a></span>
        	    <%}%>
		      <br />
		      <textarea id="txt_comment" runat="server" ></textarea></th>
		    </tr>
		    <tr>
		      <th colspan="6" style="padding-left:340px;">
               <asp:Button ID="but_submit" runat="server" CssClass="text_vissubmit" OnClientClick="return checksubmit()" OnClick="but_submit_Click" />
		      </th>
		    </tr>
	      </table>
<script type="text/javascript" >
function checksubmit(){
    var tel =$("#txt_tel").val();
    if(tel=="")
    {
        alert("请填写联系电话！");
        $("#txt_tel").focus();
        return false;
    }
    else
    {
       var reg=/(^([0-9]{3}-?[0-9]{8})|([0-9]{4}-?[0-9]{7})$)/ 
        if(!reg.test(tel))
        {
            alert("请填写正确的联系电话！");
            $("#txt_tel").focus();
            return false;
        }
    }
    
    var name = $("#txt_name").val();
    if(name=="")
    {
        alert("请填写昵称！");
        $("#txt_name").focus();
        return false;
    }
    
    var comtcontent = $("#txt_comment").val();
    if(comtcontent=="")
    {
        alert("请填写点评内容！");
        $("#txt_comment").focus();
        return false;
    }
    else
    {
        if(comtcontent.length>500)
        {
            alert("点评内容最多为500字符！");
            $("#txt_comment").focus();
            return false;
        }
    }   
    return true;
} 
</script>
    	  
	       <img src="images/hotelnew_08.jpg" style="float:left;margin-top:20px;" />
	       <div class="hotel_search_lasttable">
	         <p>查看"<%=hotelOne["HotelName"]%>"的客人也浏览过以下酒店：</p>
		     <ul>
		     <asp:Repeater ID="rptCookieHotel" runat="server">
		     <ItemTemplate>
		        <li><a href="hotelinfo_<%#Eval("hId") %>.htm"><img src="<%#Eval("picPath") %>" alt="<%#Eval("HotelName") %>" width="146px" height="133px" class="meritonecss" /></a><%#Hotelhelper.getHotelRate(Eval("rate").ToString())%>&nbsp;&nbsp;星级<span><a href="HotelDetail.aspx?hid=<%#Eval("hId") %>"><%#Eval("HotelName") %></a></span><strong>起价：CNY<%#Eval("Price") %></strong></li>
		     </ItemTemplate>
		     </asp:Repeater>
		     </ul>
	       </div>
	       <img src="images/hotelnew_07.jpg" style="float:left;" />


	    </div>
	    <img src="images/hotelnew_06.jpg" style="float:left;" />
      </div>



       

    </div>

<script type="text/javascript">
function checkBookHotel(){
//    var login="<%=Session["Mem_LoginName"] %>";
//    if(login=="")
//    {
//        alert("请登录后进行预定！");
//        return false;
//    }
    
        //入住日期
    var txt_bookfromdate = $("#txt_bookfromdate").val();
    if (!isDate(txt_bookfromdate)) {
        alert("请选择入住日期！")
        $("#txt_bookfromdate").focus();
        return false;
    }
    //离住日期
    var txt_booktodate = $("#txt_booktodate").val();
    if (!isDate(txt_booktodate)) {
        alert("请选择退房日期！")
        $("#txt_booktodate").focus();
        return false;
    }
    
    
    //比较入住日期和离住日期大少
    if(CheckDatesBS(txt_booktodate,txt_bookfromdate)){
      alert("入住日期不能大于离住日期！")
      $("#txt_booktodate").focus();
       return false;
    }
    
    //判断入住天数是否大于28天
    if(DateDiff(txt_booktodate,txt_bookfromdate)>28){
      alert("入住天数不能大于30天！")
      $("#txt_booktodate").focus();
       return false;
    }
    
    var tel =$("#txt_booktel").val();
    if(tel=="")
    {
        alert("请填写联系电话！");
        $("#txt_booktel").focus();
        return false;
    }
    else
    {
       var reg=/(^([0-9]{3}-?[0-9]{8})|([0-9]{4}-?[0-9]{7})$)/ 
        if(!reg.test(tel))
        {
            alert("请填写正确的联系电话！");
            $("#txt_booktel").focus();
            return false;
        }
    }
    
    var text_bookinfo = $("#text_bookinfo").val();
    if(text_bookinfo.length>500)
    {
        alert("附加说明长度不超500字符！");
        $("#text_bookinfo").focus();
        return false;
    } 
    return true;
}

function showBookHotel(){
    document.getElementById("divbookHotel").style.display="block";
}
function closeBookHotel(){
    document.getElementById("divbookHotel").style.display="none";
}
</script>

<div id="divbookHotel" style="left:480px; top:320px;  position:absolute;display:none; ">
<div style="width:560px; height:400px; border:solid 1px #878787; font-size:15px;background:#fff ">
<div style="float:left; width:400px; height:54px; margin-left:43px; margin-top:23px;"><img src="images/p3-1.png"></div>
<div style="float:right;width:50px; height:54px; margin-top:23px;"><a href="javascript:closeBookHotel();">关闭</a></div>

<div style="float:left;width:500px; margin-left:60px; margin-top:3px; line-height:25px;">
酒店的具体价格因房型有所不同，详情请致电<strong>400-885-0663</strong><br />
预订机票＋酒店更优惠哦!
</div>
<div><table width="443" border="0" align="center" style="line-height:25px;">
  <tr>
    <td width="74"><div align="right">房间数:</div></td>
    <td width="353">
        <select id="sel_bookroomnum" runat="server" name="select">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select> 间
    </td>
  </tr>
  <tr>
    <td>入住人数:</td>
    <td><select id="sel_bookpesonnum" runat="server" name="select">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
        </select> 人</td>
  </tr>
  <tr>
    <td>入住时间:</td>
    <td style=" font-size:13px;">
    <input id="txt_bookfromdate" style="width:100px"  type="text" runat="server" />
        至
    <input id="txt_booktodate"  style="width:100px" type="text" runat="server" />
    </td>
  </tr>
  <tr>
    <td>联系电话:</td>
    <td><input id="txt_booktel"  runat="server" type="text" /></td>
  </tr>
  <tr>
    <td valign="top">附加说明:</td>
    <td><textarea id="text_bookinfo" runat="server" cols="43" rows="3">&nbsp;</textarea></td>
  </tr>
</table>
 
 
</div>
<div style="margin:auto; width:300px; margin-top:20px; line-height:37px; color:#656565;">
<asp:ImageButton ID="butbook" ImageUrl="images/p3-2.png" OnClientClick="return checkBookHotel()" runat="server" OnClick="butbook_Click" /> (我们稍后与您联系)
</div>
</div>
</div>

<script type="text/javascript" src="js/datepicker.js"></script>


    <!--sixlinebox start-->
  <uc1:footControl ID="FootControl" runat="server" />


    </div>
    </form>
</body>
</html>
