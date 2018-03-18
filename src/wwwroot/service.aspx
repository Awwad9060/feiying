<%@ Page Language="C#" AutoEventWireup="true" CodeFile="service.aspx.cs" Inherits="service" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />  
<meta name="applicable-device" content="pc,mobile"> 
<meta name="MobileOptimized" content="width"/> 
<meta name="HandheldFriendly" content="true"/>
<title>关于飞瀛_飞瀛商旅服务介绍 - 飞瀛网</title>
<meta name="keywords" content="飞瀛商务,飞瀛服务" />
<meta name="Description"  content="飞瀛网是广州市飞瀛商务服务有限公司旗下官方网站，提供国际机票预订查询服务。飞瀛服务，诚信第一。" />
<link rel="canonical" href="http://www.fei580.com/service.aspx" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/fuwu.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/index.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/postdata.js"></script>
<script  type="text/javascript">
function fuwuturnit(o){
	 document.getElementById("fuwuright"+o).className="one";//newsearchinsider
	 document.getElementById("fuwurightChild"+o).className="nohidden";
	 var j;
	 var g;
	 var id;
	 var e;
	 var f;
	 for(var i=1;i<=7;i++){
	   j = document.getElementById("fuwuright"+i);
	   //alert(o.id);
	   e = document.getElementById("fuwurightChild"+i);
	   if(o != i){
	   	 j.className="two";//newsearchinsidew
	   	 e.className="hidden";
	   }	   
	 }		 
}	
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
      <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li-->
      <!--li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com/" target="_blank" title="国际酒店">国际酒店</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
      <li class="one" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
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
    <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="飞瀛网">飞瀛网</a>&gt;&nbsp;关于飞瀛</div>
  </div>
</div>
<!--header end-->
<div style="margin:38px auto 0px auto;width:930px;position:relative;">
  
  <ul class="fuwu_leftbox">
    <li class="one" id="fuwuright1" onclick="fuwuturnit(1);">了解飞瀛</li>
    <li class="two" id="fuwuright2" onclick="fuwuturnit(2);">飞瀛产品</li>
    <li class="two" id="fuwuright3" onclick="fuwuturnit(3);">飞瀛文化</li>
    <li class="two" id="fuwuright4" onclick="fuwuturnit(4);">营业资格</li>
    <li class="two" id="fuwuright5" onclick="fuwuturnit(5);">地址地图</li>
    <li class="two" id="fuwuright6" onclick="fuwuturnit(6);">服务建议</li>
    <li class="two" id="fuwuright7" onclick="fuwuturnit(7);">服务投诉</li>
  </ul>
   
   <img src="http://www.fei580.com/images/menustro1.gif" alt="" style="float:right;width:106px;margin-left:-99px;position:relative;z-index:3;" />
   
  <div class="fuwu_rightbox">
  
    <div id="fuwurightChild1" class="nohidden">
	    <div class="fuwu_rightboxcenter">
	<p><b>飞瀛网 <a href="http://www.fei580.com">www.fei580.com</a></b><br /><br />
 广州市飞瀛商务服务有限公司精心策划的国际商旅互动性服务网站。<br />
飞瀛网是中国在线商旅服务行业的创先者，致力把航空服务业与广大商旅人的距离拉近，<br />
服务大众，我们的服务标语是：向往世界的翅膀。目前飞瀛网可以为您提供226个国家1318个<br />
城市的机票及酒店，国内338个主要城市的近4,300家酒店和海外数万家酒店优惠的预订服务，<br />
国内70个主要商务、旅游城市的出、送机票服务以及东南亚签证服务。飞瀛商旅服务有限公司于<br />
2009年成立，总部设在广州珠江新城。我们的服务一直深受广大商旅人的赞同与支持。<br />
<br />
飞瀛首创-IDS-（F&Y  international  ticket discount  service） <br /><img src="http://www.fei580.com/images/fuwu_r2_c5.gif" alt="" style="position:absolute; left:500px; top:210px;" />
国际机票抢订服务，该服务由飞瀛商务服务有限公司团队凭借着<br />
多年航空业界经验，不断开发创新服务手段，就商旅发展需求而开发<br />
定制的服务技术。从客户一开始查询航班，技术就会启用，由价格查<br />
询到技术手段申请舱位，每一步都发挥重要的关节作用。为客户争取<br />
特惠而且高性价比舱位。技术服务一推出，客户反应热烈，支持声音不断。<br /><br />

飞瀛网特点：<br />
网站采用即时的机票信息索引查询，做到“有价即有票”，不让您打冤枉电话，填冤枉表格。<br /> 
网站机票信息及商旅资讯由维护人员24小时及时添加同步，飞瀛网不只是一个服务的平台，更是一个<br />
沟通的平台。了解飞瀛要动动手指头。<br />
网站具有创新的互动性，商旅人可以注册会员、加入圈子分享旅游生活，还可以为网站的资讯内容<br />
和功能留言评论以及提出建议。<br />
网站设有［限量IDS机票特价］是飞瀛特设优惠，是我们采用IDS服务申请的国际航线特价，所以限量名额。<br />
网站还设有［IDS机票价格分析］让广大商旅人实时了解各大航线的价格动向与走势，并以图解显示，<br />
附上飞瀛网分析评价，让您对你需要的航线充分了解实时行情。<br />
<br />
</p>


	    </div>
	  </div>
	  
    <div id="fuwurightChild2" class="hidden">
      <div class="fuwu_rightboxcenter"><p>
	   <b>国内外机票</b><br /><br />

飞瀛商旅代理全球超过300家航空公司机票销售，丰富的航线设计，专业真诚的服务团队操作，致力<br />
让广大商旅人踏上轻松旅途，飞瀛旅程。 <br />
我司设有多套大型民航订座系统，能利用不同系统及时、准确地预定各地航班。在这个基础出更综合出<br />
一套IDS国际机票抢订系统，不断创新、服务大众，资深的客服人员为您量身订做行程设计，真诚、细致<br />
入微的服务让您的旅程全无烦恼。（免费申请航空公司会员卡，累计里程积分，申请机上特殊餐食等）<br />
提供咨询-报价-订位-出票-送票一站式高效服务，广州市内免费送票，可机场取票，让您的出行更轻松。<br /> 
飞瀛商旅已经与多家大型国际旅游网站成为战略合作伙伴，为大家提供更多样出色的国际出行路线,商旅人<br />
只要背起你的行囊就能走遍全世界，飞瀛商旅-您的商旅伙伴。<br />
<br />
<b>国内外酒店</b> <br />
<br />
　飞瀛商旅提供国内、国际300多个城市，4000多家酒店的预订服务。<br /> 
国际酒店：飞瀛网已覆盖全球的国际酒店预定系统，并与全球多家酒店建立促销网络，房源及时更新，<br />
实时提供房价在线咨询，即订即出房单。 <br />
港澳酒店：实时提供现时房价，可售房额，即时出具入住单。<br /> 
国内酒店：全国各大中城市，几千家酒店宾馆以及连锁酒店，并建立优惠销售平台，优惠的房间价格，<br />
专业的订房服务。 <br />
<br />
<b>签证</b> <br />
<br />
　代办东南亚各国及欧洲商务签证，为了客户更方便到国外，减免签证带来麻烦，为客户提供一条龙服务。<br /> 
<br />
<b>航空保险</b><br /> 
<br />
 　我们还可以为您办理国际旅游保险、海外旅游保险、保障计划、境内旅游保险等，将为你的出行提供<br />
安全可靠的保障。<br /></p>
	    </div>
    </div>
    
    <div id="fuwurightChild3" class="hidden">
      <div class="fuwu_rightboxcenter">
	  <p><b>公司服务宗旨：</b><br />
      
<img src="http://www.fei580.com/images/fuwu_r2_c6.gif" style="position:absolute; left:80px; top:70px;" />
<div  style="float:right; right:100px;">
<b>为客户营造一个没有烦恼的旅途</b><br />
Build a no trouble journey for you<br /><br />
<b>为客户提供一个方便快捷的平台</b><br />
Provide a convenient platform for you<br /><br />
<b>为客户设计一个优惠放心的航程</b><br />
Designed the favourable price and safe voyage for you<br /><br />
</div>
<br /><br />

<br />
<br /><br /><br /><br /><br /><br /><br />

<b>公司目标：</b>成为广大商旅人的商旅伙伴<br />
<b>公司文化：</b>向往世界的翅膀<br />
<b>文化诠释：</b><br />
　　每一个人都有周游世界的梦想；每一个人都有走遍瀛寰的向往。这也是飞瀛商旅创立的初<br />
衷，让我们成为您的出行伙伴，服务更多的商旅人，认识这个缤纷的世界，享受一个无忧的<br />
旅程；原来，世界也是触手可及的。<br /><br />

      </p>
	    </div>
    </div>
    
     <div id="fuwurightChild4" class="hidden">
      <div class="fuwu_rightboxcenter">
      <p>
      <img src="http://www.fei580.com/images/fuwu_r2_c7.gif" /><br /><br />
广州市飞瀛商务服务有限公司已备齐工商资格证明文件；<br />
服务真诚；资格认证。<br />
飞瀛商旅正式通过百度搜索信息安全严格审核，正式运营推广。<br />
防骗小贴士：<br />
现在网络上浮现某些个别不良商家以起低价吸引商旅人咨询，然后最后支付的却是高价的费用，<br />
或者服务时效性差，往往机票出现问题不能及时联系上客服等等，选择商旅服务公司的时候请先<br />
了解好品牌口碑。相信飞瀛，放心选择。<br /><p>
	    </div>
    </div>
    
    <div id="fuwurightChild5" class="hidden">
      <div class="fuwu_rightboxcenter">
	    <p><img src="http://www.fei580.com/images/fuwu_r2_c2.jpg" /></p>
        <p><img src="http://www.fei580.com/images/fuwu_r2_c3.jpg" /></p>
        <p><img src="http://www.fei580.com/images/fuwu_r2_c4.jpg" /></p>
        <p><br />［飞瀛商务服务有限公司］详细地址：<br />
 广州市天河区珠江新城 华明路9号华普广场西塔1603<br />
(即南方报社对面)<br />
<br /><br />
周边交通连接：<br />
地铁站：珠江新城A1、A2站台<br />
公交站：南方报社站<br />
189路上行、178路上行、230路下行、301路上行、194路上行、266路下行、83路下行、305路下行、<br />
183路上行、178路下行、83路上行、130路上行、266路上行、183路下行、194路下行、248路下行、<br />
230路上行、189路下行、130路下行、301路下行、248路上行、307路下行、高峰快线13路上行、<br />
高峰快线13路下行<br />
金穗路站<br />
272、513、522a、522、407、夜43、811<br />
        </p>
      </div>
    </div>
    
    <div id="fuwurightChild6" class="hidden">
      <div class="fuwu_rightboxcenter">
      <table width="500" align="center"><tr>
      <td>
     <img src="http://www.fei580.com/images/fuwu_r2_c8.gif" /></td><td><font style="font-size:16px; font-weight:bold;" >有了你的反馈，<br />我们就能为你提供更好的服务；谢谢您!<br /></font></td></tr></table>
<br /><br />
<table width="400" align="center">
<tr>
<td valign="top" height="50">
标 题：<input type="text"  name="title" id="title" size="40"/></td>
</tr>
<tr>
<td valign="top" height="150">
内 容：<textarea name="content" rows="8" id="content" cols="40"></textarea>
</td>
</tr>
<tr>
<td valign="top" height="50">
称 呼：<input type="text"  name="contact" id="contact" size="40"/>
</td>
</tr>
<tr>
<td valign="top" height="50">
电 话：<input type="text"  name="telephone" id="telephone" size="40"/>
</td>
</tr>
<tr>
<td valign="top" height="50">
eMail：<input type="text"  name="email" id="email" size="40"/>

<input type="hidden"  name="lType" id="lType" value="服务建议"/>
</td>
</tr>
<tr>
<td valign="top" height="50">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="http://www.fei580.com/images/fuwu_submit.gif" onclick="sendLeaveMessage();" />
</td>
</tr>
</table>
 </div>   </div>
    
    <div id="fuwurightChild7" class="hidden">
      <div class="fuwu_rightboxcenter">
      <table width="500" align="center"><tr>
      <td>
     <img src="http://www.fei580.com/images/fuwu_r2_c9.gif" /></td><td><font style="font-size:16px; font-weight:bold;" >飞瀛网设有［服务执行课］监督工作人员的服务质量；<br />您有投诉，我们次日给您回复。<br /></font></td></tr></table>
<br /><br />
<table width="400" align="center">
<tr>
<td valign="top" height="50">
投 诉：<input type="text"  name="otitle" id="otitle" size="40"/></td>
</tr>
<tr>
<td valign="top" height="150">
内 容：<textarea name="ocontent" rows="8" id="ocontent" cols="40"></textarea>
</td>
</tr>
<tr>
<td valign="top" height="50">
称 呼：<input type="text"  name="ocontact" id="ocontact" size="40"/>
</td>
</tr>
<tr>
<td valign="top" height="50">
电 话：<input type="text"  name="otelephone" id="otelephone" size="40"/>
</td>
</tr>
<tr>
<td valign="top" height="50">
eMail：<input type="text"  name="oemail" id="oemail" size="40"/>

<input type="hidden"  name="olType" id="olType" value="服务投诉"/>
</td>
</tr>
<tr>
<td valign="top" height="50">
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<img src="http://www.fei580.com/images/fuwu_submit.gif" onclick="sendObjectMessage();" />
</td>
</tr>
</table>
	    </div>
    </div>
    
  </div> 
  
  
  
</div>
 <uc1:footControl ID="FootControl" runat="server" />
</form>
    </div>
</body>
</html>
