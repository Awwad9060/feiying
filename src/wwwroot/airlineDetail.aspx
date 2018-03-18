<%@ Page Language="C#" AutoEventWireup="true" CodeFile="airlineDetail.aspx.cs" Inherits="airlineDetail" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> 
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />  
<meta name="applicable-device" content="pc,mobile"> 
<meta name="MobileOptimized" content="width"/> 
<meta name="HandheldFriendly" content="true"/> 
<meta http-equiv="mobile-agent" content=format=xhtml;url=http://m.fei580.com/airline/<%=id%>.html> 
<title>【<%=airlineOne["chName"]%>】官网_客服电话_特价机票_服务评价 - 飞瀛网</title>
<meta name="keywords" content="<%=airlineOne["chName"]%>公司,<%=airlineOne["chName"]%>官网,<%=airlineOne["chName"]%>介绍" />
<meta name="Description"  content="飞瀛网为您提供<%=airlineOne["chName"]%>官方网址、<%=airlineOne["chName"]%>客服电话、<%=airlineOne["chName"]%>特价机票航班时刻表及<%=airlineOne["chName"]%>用户评价。飞瀛网服务热线：4008850663" />
<meta name="robots" content="index,follow" />
<link rel="canonical" href=http://www.fei580.com/airline/<%=id%>.htm />
<link rel="alternate" media="only screen and(max-width: 640px)"  href=http://m.fei580.com/airline/<%=id%>.html >
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/jquery.lightbox-0.5.css"rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script> 
<script src="http://www.fei580.com/js/ScrollPic.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.pack.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.plugings.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.lightbox-0.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	//绑定图片显示
	$("#ISL_Cont_1 li a").lightBox();
	$("#ulxingxiang li a").lightBox();
});
//平台、设备和操作系统 
var system = {
    win: false,
    mac: false,
    xll: false,
    ipad: false
};
//检测平台 
var p = navigator.platform;
system.win = p.indexOf("Win") == 0;
system.mac = p.indexOf("Mac") == 0;
system.x11 = (p == "X11") || (p.indexOf("Linux") == 0);
system.ipad = (navigator.userAgent.match(/iPad/i) != null) ? true : false;
//跳转语句，如果是手机访问就自动跳转到wap.baidu.com页面 
if (system.win || system.mac || system.xll || system.ipad) {
} else {
    window.location.href = "http://m.fei580.com/airline/<%=id%>.html";
}
</script>
<script src="http://www.fei580.com/js/airlinecomment.js" type="text/javascript"></script>
<script type="text/javascript">
/*加载评论*/
$(document).ready(function() {
    getairlinecomment('<%=id%>');
    //发表评论
	$("#buttSubmit").bind("click", function() {
		insertairlinecomment('<%=id%>');
	}) 
});
</script>
 
</head>
<body>
    <div class="mainbody">
    <form id="form1" runat="server">
    <!--header start-->
    <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
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
        </div>
        <ul class="menu_1">
          <li class="four"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
          <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
          <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
          <!--<li class="two"><a href="/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
          <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
          <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
           <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
     <!--<li class="two"><a href="http://www.booking.com/index.html?aid=347436" title="特价酒店">特价酒店</a></li>--> 
          <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
          <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
          <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
        </ul>
        <div class="menubottom">
	        <ul class="nohidden">
	          <li class="one"><a href="http://www.fei580.com/airline.aspx" title="">航空公司</a></li>
	          <li class="two"><a href="http://www.fei580.com/airport.aspx" title="">世界机场</a></li>
	          <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="">民航机型</a></li>
	          <li class="two"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	          <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="" rel="nofollow">积分广场</a></li>
	        </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
      </div>
    </div>
    <!--header end-->


    <div style="margin:0px auto;width:962px;position:relative;">

       <div class="company_new_line"><img src="http://www.fei580.com/images/vews-airpoort.gif" alt="" style="float:left;position:relative;top:0;left:0;margin-bottom:-35px;z-index:999;" /></div>
       <div class="companyin_box">
         <div class="companyin_boxone">
           <ul class="companyin_ulone">
             <li class="one"><img  src="http://www.fei580.com/<%=airlineOne["logoPic"]%>" alt="<%=airlineOne["chName"]%>" /></li>
             <li class="two"><h1><%=airlineOne["chName"]%></h1></li>
             <li class="three"><strong>代码：<%=airlineOne["airlineCode"]%></strong><img src="http://www.fei580.com/images/companyin06.jpg" alt="" /></li>
             <li class="four">综合评论：<strong><code><%=airlineOne["score"]%>/</code>5分</strong> <a href="<%=airlineOne["bkUrl"]%>" target="_blank" rel="nofollow">百科网址</a><!--<a href="#" title="我要评分"><img src="http://www.fei580.com/images/companyin07.jpg" alt="我要评分" /></a>-->
             <div class="bdsharebuttonbox" data-tag="share_1">
             <a class="bds_qzone" data-cmd="qzone" href="#"></a>
             <a class="bds_tsina" data-cmd="tsina"></a>
             <a class="bds_weixin" data-cmd="weixin"></a>
             <a class="bds_baidu" data-cmd="baidu"></a>
             <a class="bds_renren" data-cmd="renren"></a>
             <a class="bds_tqq" data-cmd="tqq"></a>
             <a class="bds_more" data-cmd="more"></a>
            </div>
            </li>
           </ul>
           
           <div class="companyin_boxthree">
            <p><%=airlineOne["enName"]%></p>
            <p>官方网址：<%=airlineOne["webUrl"]%></p>
            <p>客服电话：<%=airlineOne["tel"]%></p>
            <p>所属国家：<%=airlineOne["nation"]%></p>
            <p>机队情况：<%=airlineOne["planNum"]%></p>
            <p>平均机龄：<%=airlineOne["age"]%>年</p>        
            <span>主要基地：</span><code><%=airlineOne["mainBase"].ToString().Replace(",", ",<br />")%></code>
           </div>
             
           <ul id="ulxingxiang" class="newcompanyin_ultwo">
	          <li class="aone">形象机款</li>    
             <li class="two"><a href="http://www.fei580.com/<%=airlineOne["airlinePic"]%>" title="" rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["airlinePic"]%>" width="213px" height="142px" alt="我要评分" /></a></li>           
           </ul>

         </div>
         
         <div class="companyin_boxtwo">
	         <h3><%=airlineOne["chName"]%>简介：</h3>
             <p><%=airlineOne["description"]%></p>
         </div>
         
       </div>
       <img src="http://www.fei580.com/images/companyin02.jpg" style="float:left" />
       
       <asp:Panel ID="panelPic" runat="server">
  
       <div class="company_new_line" style="margin-top:9px;"></div>
       <div class="companyin_box">
         <h2><%=airlineOne["chName"]%>图集</h2>
         
         	<div class="weddingscroll" style="height:140px; position:relative;overflow: hidden; " >
	        <span class="wsprev"  id="LeftArr"></span>
	          <ul id="ISL_Cont_1">
	          <%if(!string.IsNullOrEmpty(airlineOne["pic2"].ToString())) {%>
			  <li><a   href="http://www.fei580.com/<%=airlineOne["pic2"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic2"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	          <%} %>
	          <%if(!string.IsNullOrEmpty(airlineOne["pic3"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic3"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic3"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	           <%} %>
	          <%if(!string.IsNullOrEmpty(airlineOne["pic4"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic4"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic4"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	           <%} %>
	          <%if(!string.IsNullOrEmpty(airlineOne["pic5"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic5"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic5"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	           <%} %>
	          <%if(!string.IsNullOrEmpty(airlineOne["pic6"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic6"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic6"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	           <%} %>
	          <%if(!string.IsNullOrEmpty(airlineOne["pic7"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic7"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic7"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	           <%} %>
	          <%if(!string.IsNullOrEmpty(airlineOne["pic8"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic8"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic8"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	           <%} %>
	           <%if(!string.IsNullOrEmpty(airlineOne["pic9"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic9"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic9"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	            <%} %>
	          <%if(!string.IsNullOrEmpty(airlineOne["pic10"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic10"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic10"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	            <%} %>
	          <%if(!string.IsNullOrEmpty(airlineOne["pic11"].ToString())) {%>
	          <li><a   href="http://www.fei580.com/<%=airlineOne["pic11"] %>" title="<%=airlineOne["chName"]%>"  rel="nofollow"><img src="http://www.fei580.com/<%=airlineOne["pic11"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	          <%} %>
	          </ul>
			  <span class="wsnext" id="RightArr"></span>
	        </div>
<script language="javascript" type="text/javascript">
		var scrollPic_02 = new ScrollPic();
		scrollPic_02.scrollContId   = "ISL_Cont_1"; //内容容器ID
		scrollPic_02.arrLeftId      = "LeftArr";//左箭头ID
		scrollPic_02.arrRightId     = "RightArr"; //右箭头ID
		scrollPic_02.frameWidth     = 855;//显示框宽度
		scrollPic_02.pageWidth      = 210; //翻页宽度
		scrollPic_02.speed          = 10; //移动速度(单位毫秒，越小越快)
		scrollPic_02.space          = 10; //每次移动像素(单位px，越大越快)
		scrollPic_02.autoPlay       = true; //自动播放
		scrollPic_02.autoPlayTime   = 3; //自动播放间隔时间(秒)
		scrollPic_02.initialize(); //初始化					
</script>
    	
       </div>
       <img src="http://www.fei580.com/images/companyin02.jpg" style="float:left" />
       </asp:Panel>

      
    <div style="margin:0px auto;width:955px;">
    <div style="float:left;width:100%;height:20px;"></div>
<!--twolinebox start-->
  <div class="twolinebox_title">
    <img src="http://www.fei580.com/images/bg02.jpg" style="float:left" alt="" />
    <img src="http://www.fei580.com/images/img01.jpg" style="float:left;position:relative;top:0px;left:6px;margin-top:-16px;" alt="" />
    <strong><%=airlineOne["chName"]%>特价机票</strong>
    <ul class="twolinebox_ulone">
      <li class="one" id="fromGz"><span><a href="javascript:showFromTicket('Gz','Hk');" rel="nofollow">广州出发</a></span></li>
      <li class="two" id="fromHk"><span><a href="javascript:showFromTicket('Hk','Gz');" rel="nofollow">香港出发</a></span></li>
    </ul>


    <img src="http://www.fei580.com/images/bg03.jpg" style="float:right" alt="" />
  </div>
  
  <div class="twolinebox_box" id="Gz_TicketDiv">
    <ul class="twolinebox_ulthree">
      <li class="one"><h2>ASIA</h2><h3>亚洲精选</h3></li>
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
     <% if (gzToAsia.Count != 0)
            {

                for (int i = 0; i < gzToAsia.Count; i++)
                {
                    System.Data.DataRow gzToAsia_row = gzToAsia[i];
                 %>
       <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=gzToAsia_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=gzToAsia_row["airline"]%>.htm"><%=gzToAsia_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=gzToAsia_row["tId"] %>.htm" title="" target="_blank">[<%=(gzToAsia_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=gzToAsia_row["fromCityname"].ToString()%>←→<%=gzToAsia_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree"><a href="http://www.fei580.com/ticket_<%=gzToAsia_row["tId"] %>.htm" title="" target="_blank" style="color:Red;" rel="nofollow">￥<%=gzToAsia_row["untaxPrice"].ToString()%></a> </span>
        <span class="spanfour"><%=Convert.ToDateTime(gzToAsia_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
     <%
}
} %>
    </ul>
    
    <ul class="twolinebox_ulthree">
      <li class="one"><h2>EURO</h2><h3>欧洲精选</h3></li>
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
          <% if (gzToEuro.Count != 0)
            {

                for (int i = 0; i < gzToEuro.Count; i++)
                {
                    System.Data.DataRow gzToEuro_row = gzToEuro[i];
                 %>
       <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=gzToEuro_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=gzToEuro_row["airline"]%>.htm" target="_blank"><%=gzToEuro_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=gzToEuro_row["tId"] %>.htm" title="" target="_blank">[<%=(gzToEuro_row["tripType"].ToString() == "1") ? "往返" : "单程"%>] <%=gzToEuro_row["fromCityname"].ToString()%>←→<%=gzToEuro_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree"><a href="http://www.fei580.com/ticket_<%=gzToEuro_row["tId"] %>.htm" title="" target="_blank" style="color:Red;" rel="nofollow">￥<%=gzToEuro_row["untaxPrice"].ToString()%></a> </span>
        <span class="spanfour"><%=Convert.ToDateTime(gzToEuro_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
     <%
}
} %>
     
    </ul>
    
   <ul class="twolinebox_ulthree">
      <li class="one"><h2>NORTH AMERICA</h2><h3>北美精选</h3></li>
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
      
        <% if (gzToNAmerica.Count != 0)
            {

                for (int i = 0; i < gzToNAmerica.Count; i++)
                {
                    System.Data.DataRow gzToNAmerica_row = gzToNAmerica[i];
                 %>
       <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=gzToNAmerica_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=gzToNAmerica_row["airline"]%>.htm" target="_blank"><%=gzToNAmerica_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=gzToNAmerica_row["tId"] %>.htm" title="" target="_blank">[<%=(gzToNAmerica_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=gzToNAmerica_row["fromCityname"].ToString()%>←→<%=gzToNAmerica_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree"><a href="http://www.fei580.com/ticket_<%=gzToNAmerica_row["tId"] %>.htm" title="" target="_blank" style="color:Red;" rel="nofollow">￥<%=gzToNAmerica_row["untaxPrice"].ToString()%></a> </span>
        <span class="spanfour"><%=Convert.ToDateTime(gzToNAmerica_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
     <%
}
} %>
     
     
    </ul>
    
    <ul class="twolinebox_ulthree">
      <li class="one"><h2>OCEANIA</h2><h3>大洋洲精选</h3></li>
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
       <% if (gzToOceania.Count != 0)
            {

                for (int i = 0; i < gzToOceania.Count; i++)
                {
                    System.Data.DataRow gzToOceania_row = gzToOceania[i];
                 %>
       <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=gzToOceania_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=gzToOceania_row["airline"]%>.htm" target="_blank"><%=gzToOceania_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=gzToOceania_row["tId"] %>.htm" title="" target="_blank">[<%=(gzToOceania_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=gzToOceania_row["fromCityname"].ToString()%>←→<%=gzToOceania_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree"><a href="http://www.fei580.com/ticket_<%=gzToOceania_row["tId"] %>.htm" title="" target="_blank" style="color:Red;" rel="nofollow">￥<%=gzToOceania_row["untaxPrice"].ToString()%></a> </span>
        <span class="spanfour"><%=Convert.ToDateTime(gzToOceania_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
     <%
}
} %>
    </ul>   
    
  </div>
  
  
  <div class="twolinebox_box" id="Hk_TicketDiv" style="display:none;">
    <ul class="twolinebox_ulthree">
      <li class="one"><h2>ASIA</h2><h3>亚洲精选</h3></li>
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
     <% if (hkToAsia.Count != 0)
            {

                for (int i = 0; i < hkToAsia.Count; i++)
                {
                    System.Data.DataRow hkToAsia_row = hkToAsia[i];
                 %>
       <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=hkToAsia_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=hkToAsia_row["airline"]%>.htm" target="_blank"><%=hkToAsia_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=hkToAsia_row["tId"] %>.htm" title="" target="_blank">[<%=(hkToAsia_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=hkToAsia_row["fromCityname"].ToString()%>←→<%=hkToAsia_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree"><a href="http://www.fei580.com/ticket_<%=hkToAsia_row["tId"] %>.htm" title="" target="_blank" style="color:Red;" rel="nofollow">￥<%=hkToAsia_row["untaxPrice"].ToString()%></a> </span>
        <span class="spanfour"><%=Convert.ToDateTime(hkToAsia_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
     <%
}
} %>
    </ul>
    
    <ul class="twolinebox_ulthree">
      <li class="one"><h2>EURO</h2><h3>欧洲精选</h3></li>
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
          <% if (hkToEuro.Count != 0)
            {

                for (int i = 0; i < hkToEuro.Count; i++)
                {
                    System.Data.DataRow hkToEuro_row = hkToEuro[i];
                 %>
       <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=hkToEuro_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=hkToEuro_row["airline"]%>.htm" target="_blank"><%=hkToEuro_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=hkToEuro_row["tId"] %>.htm" title="" target="_blank">[<%=(hkToEuro_row["tripType"].ToString() == "1") ? "往返" : "单程"%>] <%=hkToEuro_row["fromCityname"].ToString()%>←→<%=hkToEuro_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree"><a href="http://www.fei580.com/ticket_<%=hkToEuro_row["tId"] %>.htm" title="" target="_blank" style="color:Red;" rel="nofollow">￥<%=hkToEuro_row["untaxPrice"].ToString()%></a> </span>
        <span class="spanfour"><%=Convert.ToDateTime(hkToEuro_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
     <%
}
} %>
     
    </ul>
    
   <ul class="twolinebox_ulthree">
      <li class="one"><h2>NORTH AMERICA</h2><h3>北美精选</h3></li>
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
      
        <% if (hkToNAmerica.Count != 0)
            {

                for (int i = 0; i < hkToNAmerica.Count; i++)
                {
                    System.Data.DataRow hkToNAmerica_row = hkToNAmerica[i];
                 %>
       <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=hkToNAmerica_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=hkToNAmerica_row["airline"]%>.htm" target="_blank"><%=hkToNAmerica_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=hkToNAmerica_row["tId"] %>.htm" title="" target="_blank">[<%=(hkToNAmerica_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=hkToNAmerica_row["fromCityname"].ToString()%>←→<%=hkToNAmerica_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree"><a href="http://www.fei580.com/ticket_<%=hkToNAmerica_row["tId"] %>.htm" title="" target="_blank" style="color:Red;" rel="nofollow">￥<%=hkToNAmerica_row["untaxPrice"].ToString()%></a> </span>
        <span class="spanfour"><%=Convert.ToDateTime(hkToNAmerica_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
     <%
}
} %>
     
     
    </ul>
    
    <ul class="twolinebox_ulthree">
      <li class="one"><h2>OCEANIA</h2><h3>大洋洲精选</h3></li>
      <li class="two">
        <span class="spanone">航空公司</span>
        <span class="spantwo">航线</span>
        <span class="spanthree">价格</span>
        <span class="spanfour">日期</span>
      </li>
       <% if (hkToOceania.Count != 0)
            {

                for (int i = 0; i < hkToOceania.Count; i++)
                {
                    System.Data.DataRow hkToOceania_row = hkToOceania[i];
                 %>
       <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
        <span class="spanone"><img src="http://www.fei580.com/<%=hkToOceania_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=hkToOceania_row["airline"]%>.htm" target="_blank"><%=hkToOceania_row["airname"].ToString()%></a></code></span>
        <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=hkToOceania_row["tId"] %>.htm" title="" target="_blank">[<%=(hkToOceania_row["tripType"].ToString()=="1")?"往返":"单程"%>] <%=hkToOceania_row["fromCityname"].ToString()%>←→<%=hkToOceania_row["toCityname"].ToString()%> </a></span>
        <span class="spanthree"><a href="http://www.fei580.com/ticket_<%=hkToOceania_row["tId"] %>.htm" title="" target="_blank" style="color:Red;" rel="nofollow">￥<%=hkToOceania_row["untaxPrice"].ToString()%></a> </span>
        <span class="spanfour"><%=Convert.ToDateTime(hkToOceania_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
      </li>
     <%
}
} %>
    </ul>   
    
  </div>
  <div class="twolinebox_line"></div>
  <!--twolinebox end-->
    </div>   
    <div class="companyin_boxtitle"><strong><%=airlineOne["chName"]%>服务评价</strong>（直接移动鼠标点击即可）</div>
       <div class="companyin_box">
          <ul class="companyin_ulthree">
            <li>
              <strong>1.机上餐饮</strong><br />目前平均：3.47<br /><img src="http://www.fei580.com/images/gogo.gif" alt="" />
            </li>
            <li>
              <strong>2.机上娱乐</strong><br />目前平均：3.47<br /><img src="http://www.fei580.com/images/gogo.gif" alt="" />
            </li>
            <li>
              <strong>3.机型新旧</strong><br />目前平均：3.47<br /><img src="http://www.fei580.com/images/gogo.gif" alt="" />
            </li>
            <li>
              <strong>4.机场服务</strong><br />目前平均：3.47<br /><img src="http://www.fei580.com/images/gogo.gif" alt="" />
            </li>
            <li>
              <strong>5.航班票价</strong><br />目前平均：3.47<br /><img src="http://www.fei580.com/images/gogo.gif" alt="" />
            </li>
          </ul>
          
          
          <ul class="companyin_ulfour">
            <li><p style="text-indent:1em;"><strong><%=airlineOne["chName"]%></strong>怎么样？<strong><%=airlineOne["chName"]%>服务</strong>好吗？<strong><%=airlineOne["chName"]%>安全性</strong>怎么样？以下是由飞瀛网为您提供的最新<strong><%=airlineOne["chName"]%>服务评价</strong>。</p></li>
            <div id="divcomment">
	        </div>          
          </ul>
          <ul class="companyin_ulfive">
            <li class="one"><img src="images/companyin016.jpg"  alt="" align="absmiddle" />对<%=airlineOne["chName"]%>服务发表评论</li>
            <li class="two">
	        <% if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null){ %>
            <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/airline/<%=id%>.htm" title="登录">登录</a>&nbsp;&nbsp;&nbsp;<a href="http://www.fei580.com/memberReg.aspx" title="注册">注册</a>
        	<%}else{ %>
            <span style="padding:20px 0px 20px 5px" ><code style="color:#419C01;" ><%=Session["Mem_LoginName"] %></code>：您已登录，你可以在此发表评论！</span>
            <%} %>
            </li>
            <li class="three"><textarea id="txt_comtcontent" runat="server" ></textarea></li>
            <li class="four">匿名发表<input id="cheNiming" name="cheNiming" runat="server" type="checkbox" /><input id="buttSubmit" type="button" class="company_inputcss" value="" /></li>
          </ul>
       </div>
       <img src="http://www.fei580.com/images/companyin02.jpg" style="float:left" />  
    </div> 
  <uc1:footControl ID="FootControl" runat="server" />
    </form>
    </div>
<script>
	window._bd_share_config = {
		common : {
			bdText : '',	
			bdDesc : '',	
			bdUrl : '', 	
			bdPic : ''
		},
		share : [{
			"bdSize" : 16
		}],
	}
	with(document)0[(getElementsByTagName('head')[0]||body).appendChild(createElement('script')).src='http://bdimg.share.baidu.com/static/api/js/share.js?cdnversion='+~(-new Date()/36e5)];
</script>
</body>
</html>
