<%@ Page Language="C#" AutoEventWireup="true" CodeFile="airportDetail.aspx.cs" Inherits="airportDetail" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />  
<meta name="applicable-device" content="pc,mobile"> 
<meta name="MobileOptimized" content="width"/> 
<meta name="HandheldFriendly" content="true"/> 
<meta http-equiv="mobile-agent" content=format=xhtml;url=http://m.fei580.com/airport/<%=id%>.html> 
<title>【<%=airlineOne["chName"]%>】官网_客服电话_航站楼_交通_评价 - 飞瀛网</title>
<meta name="keywords" content="<%=airlineOne["chName"]%>官网,<%=airlineOne["chName"]%>客服电话,<%=airlineOne["chName"]%>交通,<%=airlineOne["website"]%>评价" />
<meta name="Description"  content="飞瀛网为您提供<%=airlineOne["chName"]%>官方网址、<%=airlineOne["chName"]%>客服电话、<%=airlineOne["chName"]%>交通、<%=airlineOne["chName"]%>航空楼分布及<%=airlineOne["chName"]%>用户评价。" />
<meta name="robots" content="index,follow" />
<link rel="canonical" href=http://www.fei580.com/airport/<%=id%>.htm /> 
<link rel="alternate" media="only screen and(max-width: 640px)"  href=http://m.fei580.com/airport/<%=id%>.html >
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/jquery.lightbox-0.5.css"rel="stylesheet" type="text/css" />
<script src="http://www.fei580.com/ticket/script.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.pack.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.plugings.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.lightbox-0.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	//绑定图片显示
	$("#li_portPic a").lightBox();
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
    window.location.href = "http://m.fei580.com/airport/<%=id%>.html";
}
</script>
<script src="http://www.fei580.com/js/airportcomment.js" type="text/javascript"></script>
<script type="text/javascript">
/*加载评论*/
$(document).ready(function() {
    getairportcomment('<%=id%>');
    //发表评论
	$("#buttSubmit").bind("click", function() {
		insertairportcomment('<%=id%>');
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
        <a href="http://www.fei580.com/login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务" rel="nofollow">关于飞瀛</a>
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
          <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
          <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
          <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
          <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
          <!--<li class="two"><a href="hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
          <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
          <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
          <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
        </ul>
        <div class="menubottom">
	        <ul class="nohidden">
	          <li class="two"><a href="http://www.fei580.com/airline.aspx" title="">航空公司</a></li>
	          <li class="one"><a href="http://www.fei580.com/airport.aspx" title="">世界机场</a></li>
	          <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="">民航机型</a></li>
	          <li class="two"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	          <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	        </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
        <div class="header_nav">您现在位置：<a href="http://www.fei580.com" title="首页">飞瀛网</a>&nbsp;&gt;&nbsp;<a href="http://www.fei580.com/airport.aspx" title="飞瀛国际机场">世界机场</a>&nbsp;&gt;&nbsp;<a href="http://www.fei580.com/airport/<%=id%>.htm"><%=airlineOne["chName"]%></a></div>
      </div>
    </div>
    <!--header end-->


    <div style="margin:0px auto;width:962px;position:relative;">
       <div class="company_new_line"><img src="http://www.fei580.com/images/vews.gif" alt="" style="float:left;position:relative;top:0;left:0;margin-bottom:-35px;z-index:999;" /></div>
       <div class="companyin_box">
         <div class="companyin_boxone">
           <ul class="companyin_ulone">
             <li class="two" ><img style="float:left;" width="28px" height="28px" src="http://www.fei580.com/images/port1.jpg" alt="国际机场" /><%=airlineOne["chName"]%></li>
             <li class="three"><strong>代码：<%=airlineOne["airportCode"]%></strong><img src="http://www.fei580.com/images/companyin06.jpg" alt="" /></li>
             <li class="four">综合评论：<strong><code>4.55/</code>5分</strong> <a href="<%=airlineOne["bkUrl"]%>" target="_blank" rel="nofollow">百科网址</a><!--<a href="http://www.fei580.com/" title="我要评分"><img src="http://www.fei580.com/images/companyin07.jpg" alt="我要评分" /></a>-->
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
            <p>客服电话：<%=airlineOne["telphone"]%></p>
            <p>官方网站：<br /><%=airlineOne["website"]%></p>
            <p>所在时区：<%=airlineOne["timezone"]%></p>
            <!--<span>使用语言：</span><code><%=airlineOne["lang"]%></code>-->
           </div>
           
          
           
           <ul class="newcompanyin_ultwo">
	          <li class="one">机场影像</li>    
             <li id="li_portPic"  class="two"><a href="http://www.fei580.com/<%=airlineOne["portPic"]%>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["portPic"]%>" alt="<%=airlineOne["chName"]%>" width="213px" height="142px" alt="<%#Eval("chName") %>" /></a></li>
                 
           </ul>

         </div>
         
         <div class="companyin_boxtwo">
	         <h3><%=airlineOne["chName"]%>简介：</h3>
             <p><%=airlineOne["description"]%></p>
           </div>

        
         
       </div>
       <img src="http://www.fei580.com/images/companyin02.jpg" style="float:left" />
       
       
      <div class="company_new_line" style="margin-top:9px;"></div>
       <div class="companyin_boxnewadd">
         <h3><span><%=airlineOne["chName"]%>地图</span>详细参数：</h3>
         <img src="http://www.fei580.com/images/jichang01.jpg" style="float:left;margin-top:9px;" />
         <div class="companyin_boxfive">
    	   
           <ul class="companyin_ulsix">
             <li class="three">
             <iframe id="ifr_map" src="http://www.fei580.com/Map.aspx?lat=<%=airlineOne["lat"]%>&lng=<%=airlineOne["lng"]%>&name=<%=airlineOne["chName"]%>" width="542px" height="340px" frameborder="0" scrolling="no" ></iframe>
             </li>
             <!--<li class="four">
             地图说明<br />地图：显示机场和城市街道名称地图<br />卫星：显示机场 和城市卫星拍摄照片<br />混合：在卫星地图上标识街道名称 使用鼠标移动缩放地图<br />操作索命：使用鼠标移动和缩放地图
             </li>-->
           </ul>
           <ul class="companyin_ulsev">            
             <li class="two">
             <p><strong><%=airlineOne["chName"]%>地址：</strong><%=airlineOne["address"]%></p>
             <p><strong><%=airlineOne["chName"]%>级别：</strong><%=airlineOne["grade"]%></p>
             <p><strong><%=airlineOne["chName"]%>跑道：</strong><%=airlineOne["paodao"]%></p>
             <p><strong><%=airlineOne["chName"]%>海拔：</strong><%=airlineOne["height"]%></p>
             <p><strong><%=airlineOne["chName"]%>交通：</strong><%=airlineOne["jiaotong"]%></p>
             <p><strong><%=airlineOne["chName"]%>航站楼：</strong><%=airlineOne["hangzhanlou"]%></p>
             </li>
           </ul>
        </div>
          <img src="http://www.fei580.com/images/jichang02.jpg" style="float:left" />
	    </div>
       <img src="http://www.fei580.com/images/companyin02.jpg" style="float:left" />
        
       <div class="companyin_boxtitle"><strong><%=airlineOne["chName"]%>评价</strong>（直接移动鼠标点击即可）</div>
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
            <li><p style="text-indent:1em;"><strong><%=airlineOne["chName"]%></strong>怎么样？<strong><%=airlineOne["chName"]%>服务</strong>好吗？<strong><%=airlineOne["chName"]%>交通</strong>怎么样？以下是由飞瀛网为您提供的最新<strong><%=airlineOne["chName"]%>评价</strong>。</p></li>
            <div id="divcomment">
	        </div>          
          </ul>
          <ul class="companyin_ulfive">
            <li class="one"><img src="http://www.fei580.com/images/companyin016.jpg"  alt="" align="absmiddle" />对<%=airlineOne["chName"]%>发表评论</li>
            <li class="two">
	        <% if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null){ %>
            <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/airport/<%=id%>.htm" title="登录">登录</a>&nbsp;&nbsp;&nbsp;<a href="http://www.fei580.com/memberReg.aspx" title="注册">注册</a>
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
