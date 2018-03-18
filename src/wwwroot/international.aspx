<%@ Page Language="C#" AutoEventWireup="true" Inherits="international" EnableViewState="false" CodeFile="international.aspx.cs" %>
<%@ Register Src="share/searchControlB.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta http-equiv="mobile-agent" content="format=xhtml;url=http://m.fei580.com/international.html">
<title>国际机票查询_国际机票预订电话：400-885-0663(免费) - 飞瀛网 </title>
<meta name="Description"  content="飞瀛网为您提供广州,深圳,香港,澳门,上海,北京出发特价国际机票,打折国际机票,以及最新实时国际航班票价查询服务.免费热线：400-885-0663;" />
<meta name="keywords" content="国际机票,国际机票查询,国际机票预订,国际实时航班,国际航班" />
<meta property="og:image" content="http://www.fei580.com/logo.jpg"/>
<link rel="Baidu-Search-icon" sizes="121x75" href="http://www.fei580.com/logo.jpg" />
<link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index131222.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/select.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/hotcity.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/datepicker.css" rel="stylesheet" type="text/css"/>
<link href="http://www.fei580.com/CityClient/CitySelector2.css" rel="stylesheet" type="text/css" />
<link rel="canonical" href="http://www.fei580.com/international.aspx" />
<link rel="alternate" media="only screen and(max-width: 640px)"  href="http://m.fei580.com/international.html" >
<script type="text/javascript" src="http://www.fei580.com/js/jquery-1.4.2.min.js"></script>
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.min.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/postdata.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/indexAuto.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://www.fei580.com/js/JQuery.cookie.min.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/ticket.search.index.min.js"></script>
<script type="text/javascript" src="http://www.fei580.com/CityClient/CityData.js"></script>
<script type="text/javascript" src="http://www.fei580.com/CityClient/CitySelector.min.js"></script>
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
        //目的城市
        var dx = new VSxClientCountrySelector('tocityName', CityData);
        dx.Init();
        //日期控件
        TripBackDate(document.getElementById("fromtripDate"), document.getElementById("backtripDate"));
        //日期控件
        TripBackDate(document.getElementById("ids_tripDate"), document.getElementById("ids_backDate"));

        $.divselect("#divselect", "#inputselect");

        var hmsr = getRequest("hmsr");
        var medium = getRequest("utm_medium");
        var campaign = getRequest("utm_campaign");
        var keywords = getRequest("utm_content");
        if (hmsr == null || hmsr == "") { hmsr = getRequest("utm_source"); } else { hmsr = getRequest("hmsr"); }
        if (keywords == null || keywords == "") { keywords = "International"; } else { keywords = getRequest("utm_content"); }
        if (medium == null || medium == "") { medium = "PPC"; } else { medium = getRequest("utm_medium"); }
        if (campaign == null || campaign == "") { campaign = getRequest("hmpl"); } else { campaign = getRequest("utm_campaign"); }
        if (hmsr == null || hmsr == "") {
            //$(".msn_line a").attr("href", function(i, origValue) { return origValue + "&utm_source=PageLink&utm_medium=Organic&utm_content=" + keywords; });
            $("a.baidu-brige-chat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_content=" + keywords; });
            $("#ochat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#mchat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn1").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn2").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            $("#msn3").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
        } else {
            $(".shadsense a").attr("href", function(i, origValue) { return origValue + "&utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            //$(".msn_line a").attr("href", function(i, origValue) { return origValue + "&utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("a.baidu-brige-chat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#ochat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#mchat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn1").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn2").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            $("#msn3").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
        }
        
    });
    
<!-- 
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

        window.location.href = "http://m.fei580.com/international.html"; 
        } 
--> 
</script>
</head>
<body>
<div class="mainbody" >
 <form id="form1" runat="server">
    <!--header start-->
    <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="飞瀛网" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="飞瀛客服电话" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
    <div class="headerbottom" style="height: 205px">
  <div class="headerbottom_left"><a href="http://www.fei580.com" title="特价国际机票"><img src="http://www.fei580.com/images/logo.jpg" alt="国际机票" /></a></div>
  <div class="headerbottom_right" style="height: 103px;">
     <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="http://www.fei580.com/login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="会员登录" rel="nofollow">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册" rel="nofollow">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务" rel="nofollow">关于飞瀛</a>
    <%
        }
        else
        {
     %>
    <a href="http://www.fei580.com/person/myticket.aspx" title="您好，<%=Session["Mem_LoginName"].ToString() %>" rel="nofollow">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="http://www.fei580.com/person/myticket.aspx" title="积分" rel="nofollow">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="个人中心"  rel="nofollow">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="退出登录"  rel="nofollow">退出登录</a>
    <%}
         %> 
    </div>  
    <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com" title="首页" rel="nofollow">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="one"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a href="http://hotel.fei580.com" target="_blank" title="国际酒店" rel="nofollow">国际酒店</a></li>
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" rel="nofollow">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="飞瀛圈子最新话题" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="http://www.fei580.com/airline.aspx" title="">航空公司</a></li>
	      <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
	      <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="">民航机型</a></li>
	      <li class="two"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="" rel="nofollow">积分广场</a></li>
	    </ul>
        <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
	<div class="header_nav" style="height: 60px;">您现在位置：<a href="http://www.fei580.com" title="飞瀛网首页">飞瀛网</a>&gt;<a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票查询</a></div>
  </div>
</div>
    <!--header end-->
    <div style="margin: 15px auto 0px auto; width: 990px;">
            <div id="leftsida">
                <div class="searchbar">
                    <div class="searchnav"><img src="http://www.fei580.com/images/searchbar.jpg" alt="机票查询"  usemap="#Maps"/></div>      
                    <div class="searchform">
                        <div class="searchchoose">
                            <input id="tripType1" type="radio" name="tripType" checked="checked" value="2" />&nbsp;全部&nbsp;
                            <input id="tripType2" type="radio" name="tripType" value="0" />&nbsp;单程&nbsp;
                            <input id="tripType3" type="radio" name="tripType" value="1" />&nbsp;往返
                        </div>
                        <div class="searchare">
                            <table width="100%" border="0" cellspacing="0">
                                <tr>
                                    <td width="95" height="55">
                                        <div class="stit">
                                            出发城市</div>
                                    </td>
                                    <td>
                                        <div id="divselect" runat="server">
                                        </div>
                                     <input name="fromCity" type="hidden" value="1" id="fromCity"/>
                                     <input name="fromCity" type="hidden" value="广州" id="fromCityName"/>
                                </tr>
                                <tr>
                                    <td width="95" height="55">
                                        <div class="stit">
                                            到达城市</div>
                                    </td>
                                    <td>
                                        <input type="text" class="sinput" id="tocityName" />
                                        <%--<input type="text" class="sinput" id="tocityName" value="阿德莱德" />--%>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="95" height="55">
                                        <div class="stit2">
                                            出发日期</div>
                                    </td>
                                    <td>
                                        <input name="fromtripDate" type="text" id="fromtripDate" class="sdate"  runat="server"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="95" height="55">
                                        <div class="stit2">
                                            到达日期</div>
                                    </td>
                                    <td>
                                        <input name="backtripDate" type="text" id="backtripDate" class="sdate"  runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <script language="javascript" type="text/javascript" src="http://www.fei580.com/js/tocity.js"></script>
                        <div class="searchbtn" style="cursor: pointer;text-align:center;"><img alt="查询机票"  src="http://www.fei580.com/images/searchbtn.jpg" id="btnSearch" onclick="_czc.push(['_trackEvent', '国际机票','查询','点击']);" /></div>
                        <div class="searchbottom">
                        </div>
                    </div>
                </div>
                <script type="text/javascript">var ts = TicketSearch();</script>
                <!--searchbar-->
                <div class="clear"></div>
                <div class="xhrz"><a href="http://www.fei580.com/cata.html"><img src="http://www.fei580.com/images/xhrz.jpg" alt="协航认证 权威代理" /></a></div>
                <div class="clear"></div>
                <div class="kfteam">
                    <div class="kufutit">
                        <img src="http://www.fei580.com/images/kfteam.jpg" alt="客服团队" /></div>
                    <div id="divCusBook" class="abteam">
                        <div class="kfpic">
                            <ul>
                                <li><img src="http://www.fei580.com/images/kfimg/cs<%=csA_num %>.jpg" alt="明星客服1" /></li>
                                <li><img src="http://www.fei580.com/images/kfimg/cs<%=csB_num %>.jpg" alt="明星客服2" /></li>
                            </ul>
                        </div>
                        <div class="kfcontent">
                            <div class="kfonline">
                             <div class="onlinekf1"><a target="_blank" rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=32335510&site=qq&menu=yes" title="点击QQ，咨询在线客服" onclick="_czc.push(['_trackEvent', '国际机票QQ','咨询','点击']);"><img src="http://www.fei580.com/images/online.jpg" alt="在线客服" /></a></div>
                             <div class="kfxy">用我的真诚 完美你的旅程</div>
                            </div>
                            <div class="clear"></div>
                            <div class="kfc" id="divKFA" runat="server">
                            </div>
                            <div class="kfonline2">
                             <div class="onlinekf2"><a target="_blank" rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=531658630&site=qq&menu=yes" title="点击QQ，咨询在线客服" onclick="_czc.push(['_trackEvent', '国际机票QQ','咨询','点击']);"><img src="http://www.fei580.com/images/online.jpg" alt="在线客服" /></a></div>
                             <div class="kfxy">用我的耐心 助你行程开心</div>
                            </div>
                            <div class="clear"></div>
                            <div class="kfb"  id="divKFB" runat="server">
                            </div>
                        </div>
                        <input type="text" id="csDataA_Index" runat="server" />
                        <input type="text" id="csDataA" runat="server" />
                        <input type="text" id="csDataB_Index" runat="server" />
                        <input type="text" id="csDataB" runat="server" />
                    </div>
                </div>
                <!--kfteam-->
                <div class="clear"></div>
                <div class="idsfx"><a href="http://www.fei580.com/IdsSearch.aspx"><img src="http://www.fei580.com/images/sideids.jpg" alt="IDS系统 国际机票价格分析" /></a></div>
                <div class="clear"></div>
                <!--cxtool-->
                <!--spayaway-->     
            </div>
            <!--leftsida-end-->
            <div id="rmain">
                <div class="supdate">
                    <div class="sdtit"><h1>国际机票查询</h1></div>
                    <div class="supmap" style=" background:url('http://www.fei580.com/images/world_map.jpg');">
                        <div id="divPointA" style="top:100px;left:200px; position:relative; display:none; background-repeat:no-repeat;">
                         <img alt="国际线路" id="imgLine" src="http://www.fei580.com/images/map_point.png" runat="server" />
                         <img alt="阿德莱德线路图" src="http://www.fei580.com/images/linemap/internation/cityto_阿德莱德.png" style="display:none;" />
                         <img alt="巴黎线路图" src="http://www.fei580.com/images/linemap/internation/cityto_巴黎.png" style="display:none;" />
                         <img alt="布里斯本线路图" src="http://www.fei580.com/images/linemap/internation/cityto_布里斯本.png" style="display:none;" />
                         <img alt="迪拜线路图" src="http://www.fei580.com/images/linemap/internation/cityto_迪拜.png" style="display:none;" />
                         <img alt="东京线路图" src="http://www.fei580.com/images/linemap/internation/cityto_东京.png" style="display:none;" />
                         <img alt="多伦多线路图" src="http://www.fei580.com/images/linemap/internation/cityto_多伦多.png" style="display:none;" />
                         <img alt="法兰克福线路图" src="http://www.fei580.com/images/linemap/internation/cityto_法兰克福.png" style="display:none;" />
                         <img alt="伦敦线路图" src="http://www.fei580.com/images/linemap/internation/cityto_伦敦.png" style="display:none;" />
                         <img alt="洛杉矶线路图" src="http://www.fei580.com/images/linemap/internation/cityto_洛杉矶.png" style="display:none;" />
                         <img alt="马德里线路图" src="http://www.fei580.com/images/linemap/internation/cityto_马德里.png" style="display:none;" />
                         <img alt="曼彻斯特线路图" src="http://www.fei580.com/images/linemap/internation/cityto_曼彻斯特.png" style="display:none;" />
                         <img alt="曼谷线路图" src="http://www.fei580.com/images/linemap/internation/cityto_曼谷.png" style="display:none;" />
                         <img alt="蒙特利尔线路图" src="http://www.fei580.com/images/linemap/internation/cityto_蒙特利尔.png" style="display:none;" />
                         <img alt="墨尔本线路图" src="http://www.fei580.com/images/linemap/internation/cityto_墨尔本.png" style="display:none;" />
                         <img alt="墨西哥城线路图" src="http://www.fei580.com/images/linemap/internation/cityto_墨西哥城.png" style="display:none;" />
                         <img alt="纽约线路图" src="http://www.fei580.com/images/linemap/internation/cityto_纽约.png" style="display:none;" />
                         <img alt="三藩市线路图" src="http://www.fei580.com/images/linemap/internation/cityto_三藩市.png" style="display:none;" />
                         <img alt="苏黎世线路图" src="http://www.fei580.com/images/linemap/internation/cityto_苏黎世.png" style="display:none;" />
                         <img alt="温哥华线路图" src="http://www.fei580.com/images/linemap/internation/cityto_温哥华.png" style="display:none;" />
                         <img alt="渥太华线路图" src="http://www.fei580.com/images/linemap/internation/cityto_渥太华.png" style="display:none;" />
                         <img alt="悉尼线路图" src="http://www.fei580.com/images/linemap/internation/cityto_悉尼.png" style="display:none;" />
                         <img alt="芝加哥线路图" src="http://www.fei580.com/images/linemap/internation/cityto_芝加哥.png" style="display:none;" />
                        </div>
                        <%--<div id="divPointB" style="width:15px; height:15px; top:200px;left:300px; position:relative; background-image:url('../images/map_point.png');">
                        </div>--%>
                        <div id="divPrice" style=" width:236px; height:77px;top:50px;left:220px; position:relative; background-image:url('http://www.fei580.com/images/airline_price_bkg.png'); background-repeat:no-repeat; display:none;cursor: pointer;" onclick="clickFlySearching(this);"  onmouseover="mouseOverSearching();" onmouseout="mouseOutSearching();">
                            <table style=" border-collapse:collapse; border:0px; font-family:微软雅黑; color:White; ">
                                <tr>
                                    <td style=" width:20px; height:53px;"></td>
                                    <td style=" vertical-align:bottom;">
                                        <table style=" color:White;" >
                                            <tr>
                                                <td>
                                                     <span style=" font-size:25px; width:20px;">¥</span><span id="txtSearchingPrice" runat="server" style=" font-size:30px;">8250</span>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                 <span id="txtSearchingFlyDate" runat="server" style=" font-size:14px;">12月28日</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                 <span id="txtSearchingAirline" runat="server" style="font-size:14px;">阿德莱德航空</span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style=" width:20px; height:23px;"></td>
                                    <td >
                                        <span style="width:20px;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="txtSearchingFromTo"  runat="server" style=" font-size:14px;">广州-阿姆斯特丹（往返）</span>
                                        <input type="hidden" id="txtSearchingCityFromId" runat="server" />
                                        <input type="hidden" id="txtSearchingCityToName" runat="server" />
                                        <input type="hidden" id="txtSearchingTripType" runat="server" />
                                        <input type="hidden" id="txtSearchingTripDate" runat="server" />
                                        <input type="hidden" id="txtSearchingBackDate" runat="server" />
                                        <input type="hidden" id="txtSearchingLinkUrl" runat="server" />
                                        <input type="hidden" id="txtSearching" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!--supdate-->
                <div class="clear">
                </div>
                <div class="bank10"></div>
                <div class="shticket">
                    <div class="shtit"><h2>特价国际机票</h2></div>
                    <div class="shadsense">
                        <%
                            if (recommendThree.Count != 0)
                            {
                                for (int i = 0; i < recommendThree.Count; i++)
                                {
                                    string className = "shads";
                                    System.Data.DataRow recommendThree_row = recommendThree[i];
                                    if (i == 1 || i == 4)
                                    {
                                        className = "shads shadsm";
                                    }
                                %>
                                    <div class="<%=className%>"><a href="<%=recommendThree_row["ticketUrl"].ToString()%>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=recommendThree_row["ticketPic"].ToString()%>" alt="特价国际机票" /></a></div>
                                <%
                                }
                            }
                        %>
                    </div>
                </div>
                <!--shticket-->
                <div class="clear">
                </div>
                <div class="ihotel">
                    <div class="htit"><img src="http://www.fei580.com/images/goodhotel.jpg" alt="国际酒店精选" /></div>
                    <div class="hotellist">
                        <%
                            if (hotelList.Count != 0)
                            {
                                string aLinkUrl = "";
                                string aImageSrc = "";
                                string aHName = "";
                                string b1LinkUrl = "";
                                string b1ImageSrc = "";
                                string b1HName = "";
                                string b2LinkUrl = "";
                                string b2ImageSrc = "";
                                string b2HName = "";
                                string c1LinkUrl = "";
                                string c1ImageSrc = "";
                                string c1HName = "";
                                string c2LinkUrl = "";
                                string c2ImageSrc = "";
                                string c2HName = "";
                                
                                for (int i = 0; i < hotelList.Count; i++)
                                {
                                    System.Data.DataRow hotelList_row = hotelList[i];
                                    string position = hotelList_row["position"].ToString();
                                    string linkUrl = hotelList_row["linkUrl"].ToString();
                                    string imageSrc = hotelList_row["picPath"].ToString();
                                    string hName = hotelList_row["hName"].ToString();
                                    
                                    if (position != "")
                                    {
                                        switch (position)
                                        {
                                            case "a":
                                                aLinkUrl = linkUrl;
                                                aImageSrc = imageSrc;
                                                aHName = hName;
                                                break;
                                            case "b1":
                                                b1LinkUrl = linkUrl;
                                                b1ImageSrc = imageSrc;
                                                b1HName = hName;
                                                break;
                                            case "b2":
                                                b2LinkUrl = linkUrl;
                                                b2ImageSrc = imageSrc;
                                                b2HName = hName;
                                                break;
                                            case "c1":
                                                c1LinkUrl = linkUrl;
                                                c1ImageSrc = imageSrc;
                                                c1HName = hName;
                                                break;
                                            case "c2":
                                                c2LinkUrl = linkUrl;
                                                c2ImageSrc = imageSrc;
                                                c2HName = hName;
                                                break;
                                        }
                                    }
                                 }
                                %>
                                <div class="hotela"><a href="http://www.booking.com/hotel/th/intercontinental-bangkok.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=-3414440;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=2e237cf6d12f44239b0ff6df2f3b764fab60d7a3X1;type=total;ucfs=1&" title="<%=aHName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=aImageSrc %>" alt="<%=aHName %>" /></a></div>
                                <div class="hotelb">
                                    <div class="hotelb1">
                                      <a href="http://www.booking.com/hotel/gb/the-savoy.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=-2601889;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=8d451b30414d4328fff969ec97df95fcd519c6d7X1;type=total;ucfs=1&" title="<%=b1HName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=b1ImageSrc %>" alt="<%=b1HName %>" /></a>
                                    </div>
                                    <div class="hotelb2">
                                      <a href="http://www.booking.com/hotel/ca/hilton-toronto.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=-574890;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=31d64cf8890b49b5d1572d77f10a48ddd7739258X1;type=total;ucfs=1&" title="<%=b2HName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=b2ImageSrc %>" alt="<%=b2HName %>" /></a>
                                    </div>
                                </div>
                                <div class="hotelc">
                                    <div class="hotelc1">
                                      <a href="http://www.booking.com/hotel/us/giraffe.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=20088325;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=eca8cfc7697f421f8bc44e52d4c494cde61f3885X1;type=total;ucfs=1&" title="<%=c1HName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=c1ImageSrc %>" alt="<%=c1HName %>" /></a>
                                    </div>
                                    <div class="hotelc2">
                                      <a href="http://www.booking.com/hotel/fr/keppler.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=-1456928;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=a8c3f15b4ba534d452aadf28ceb271630ca42677X1;type=total;ucfs=1&" title="<%=c2HName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=c2ImageSrc %>" alt="<%=c2HName %>" /></a>
                                    </div>
                                </div>
                                <%
                            }
                        %>
                    </div>
                </div>
                <!--ihotel-->
            </div>
            <!--rmain-end-->
            <div class="clear">
            </div>
            <!--fivelinebox start-->
        </div>
    <uc1:footControl ID="FootControl" runat="server" />
</form>
</div>
<div class="clear"></div>
    <div id="duilian02" style="top: 250px; left: 0px;" class="kf_2012_box">
        <div class="kf_2012_lbox">
            <img src="http://www.fei580.com/images/kf_l.gif" border="0" usemap="#Map3" />
            <map name="Map3" id="map4">
                <area style="cursor: pointer;" onclick='show(1)' shape="rect" coords="4,12,26,101" href="javascript:void(0);" />
                <area style="cursor: pointer;" onclick='show(2)' shape="rect" coords="3,110,26,201" href="javascript:void(0);" />
            </map>
        </div>
        <div id="tip4341" class="kf_2012_rbox1" style="display: none">
            <img src="http://www.fei580.com/images/kf_r1.gif" border="0" usemap="#Map" />
            <input id="eMsg_tel" type="text" class="kf_2012_input" onclick="_hmt.push(['_trackEvent', 'eMsg_tel', 'input', 'text'])" />
            <map name="Map" id="map5">
                <area shape="rect" style="cursor: pointer;" coords="237,5,267,31" onclick='show("tip4341")' href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="186,110,259,138" onclick="sendTelMsg()" href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="123,160,260,183" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '国际机票首页','咨询','点击']);" id="ochat" rel="nofollow"  target="_blank" title="在线客服" />
            </map>
        </div>
        <div id="tip4342" class="kf_2012_rbox2" style="display: none">
            <img src="http://www.fei580.com/images/kf_r2.gif" border="0" usemap="#Map2" />
            <map name="Map2">
                <area shape="rect" style="cursor: pointer;" coords="237,5,267,31" onclick='show("tip4342")' href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="83,36,256,62" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '国际机票首页','咨询','点击']);" id="mchat" rel="nofollow" target="_blank" title="在线客服" />
                <area shape="rect" style="cursor: pointer;" coords="84,72,167,98" href="tencent://message/?uin=32335510&Site=111&Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="84,100,167,123" href="tencent://message/?uin=937056717&Site=111&Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="83,127,167,147" href="tencent://message/?uin=531658630&Site=111&Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="173,71,258,96" id="msn1" href="http://www.fei580.com/chat/" target="_blank" />
                <area shape="rect" style="cursor: pointer;" coords="172,126,256,149" id="msn2" href="http://www.fei580.com/chat/" target="_blank" />
                <area shape="rect" style="cursor: pointer;" coords="173,99,256,122" id="msn3" href="http://www.fei580.com/chat/" target="_blank" />
            </map>
        </div>
        
    </div>
<script language="javascript" type="text/javascript" src="http://www.fei580.com/js/datepicker.js"></script>
<script language="javascript" type="text/javascript" src="http://www.fei580.com/js/scrolljs.js" ></script> 
<map name="Maps" id="Maps">
  <area shape="rect" style="cursor: pointer;" coords="13,12,118,42" href="http://www.fei580.com/international.aspx" />
  <area shape="rect" style="cursor: pointer;" coords="118,12,228,42" href="http://hotel.fei580.com/"  target="_blank" rel="nofollow"/>
  <area shape="rect" style="cursor: pointer;" coords="228,12,340,42" href="http://www.fei580.com/visa.html"  target="_blank" rel="nofollow"/>
</map>
<link href="http://www.fei580.com/source/kuxun.css" rel="stylesheet" type="text/css" />
<div id="gg" class="footer_soft">
 <div class="footer_soft_bg"></div>
 <div class="footer_soft_Pos">	
  <div class="footer_soft_MiddleBox">		
  <i class="footer_soft_img"><a href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '底部横幅商桥客服','咨询','点击']);" target="_blank" title="咨询客服" rel="nofollow" class="baidu-brige-chat"></a></i>		
  <a href="javascript:void(0)" onclick="$('#gg').slideUp('slow');_czc.push(['_trackEvent', '底部横幅咨询关闭','关闭','点击']);" title="关闭" class="footer_soft_close"></a>
  <div class="footer_soft_tx"></div>		
  <div class="footer_soft_link">
  <p class="footer_soft_hd"></p>
  <p class="footer_soft_cn"></p>						
  </div>		
  </div>
 </div>
</div>
</body>
</html>