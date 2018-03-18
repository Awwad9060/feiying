<%@ Page Language="C#" AutoEventWireup="true" CodeFile="airplaneDetail.aspx.cs" Inherits="airplaneDetail" %>

<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<title>【<%=airlineOne["chName"]%>机型】代码、图片、座位图、驾驶舱、载客量介绍 - 民航机型 - 飞瀛网</title>
<meta name="keywords" content="<%=airlineOne["chName"]%>，<%=airlineOne["chName"]%>介绍,<%=airlineOne["chName"]%>图片" />
<meta name="Description"  content="<%=airlineOne["madeIn"]%>生产服务商,<%=airlineOne["chName"]%>机型介绍,飞瀛网为您提供详细的<%=airlineOne["chName"]%>机型介绍" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/ScrollPic.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.pack.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.plugings.js" type="text/javascript"></script>
<link href="http://www.fei580.com/css/jquery.lightbox-0.5.css"rel="stylesheet" type="text/css" />
<script src="http://www.fei580.com/js/jquery.lightbox-0.5.js" type="text/javascript"></script>
<script type="text/javascript">
$(document).ready(function() {
	//绑定图片显示
	$("#ISL_Cont_1 li a").lightBox();
});
</script>
<script src="http://www.fei580.com/js/airplancomment.js" type="text/javascript"></script>
<script type="text/javascript">
/*加载评论*/
$(document).ready(function() {
    getairplancomment('<%=id%>');
    //发表评论
	$("#buttSubmit").bind("click", function() {
		insertairplancomment('<%=id%>');
	}) 
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
        <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/airplane/<%=id%>.htm" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
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
	          <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司">航空公司</a></li>
	          <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
	          <li class="one"><a href="http://www.fei580.com/airplane.aspx" title="民航机型">民航机型</a></li>
	          <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯">新闻资讯</a></li>
	          <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="积分广场">积分广场</a></li>
	        </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
        <div class="header_nav">您现在位置：<a href="http://www.fei580.com" title="首页">飞瀛网</a>&nbsp;&gt;&nbsp;<a href="http://www.fei580.com/airplane.aspx" title="飞瀛国际机场">民航机型</a>&nbsp;&gt;&nbsp;<a href="http://www.fei580.com/airplane/<%=id%>.htm"><%=airlineOne["chName"]%></a></div>
      </div>
    </div>
    <!--header end-->


    <div style="margin:0px auto;width:962px;position:relative;">
      <div class="company_new_line"><img src="http://www.fei580.com/images/vews01.gif" alt="" style="float:left;position:relative;top:0;left:0;margin-bottom:-35px;z-index:999;" /></div>
       <div class="companyin_box_two">
           <!--strong class="news_companyin"><%=airlineOne["chName"]%></strong-->
	       <span class="air_plane_img"></span>
	       <span class="air_plane_name"><strong><%=airlineOne["chName"]%></strong></span>
           <ul class="companyin_ulone" style="width:260px;padding-left:0;">
             <li class="three"><strong>代码：<%=airlineOne["planCode"]%></strong><img src="http://www.fei580.com/images/companyin06.jpg" alt="" /></li>
             <li class="four">综合评价：<strong><code>4.55/</code>5分</strong><a href="#comment" title="我要评分"><img src="http://www.fei580.com/images/companyin07.jpg" alt="我要评分" /></a></li>
           </ul>
           
	       <ul class="news_companyinulfour">
	         <li><%=airlineOne["planCode"]%></li>
		     <li><%=airlineOne["madeIn"]%></li>
		     <li><%=airlineOne["madeYear"]%></li>
		     <li><%=airlineOne["planNum"]%></li>
	       </ul>　       　　　　   　　　     　
           
	       <div class="news_companyinbox">
			    <div style="margin:0px auto;width:938px">
			     <img src="http://www.fei580.com/images/v938t.jpg" alt="" style="float:left;margin-top:18px;" />
			     <div class="companyin_boxfive_two">
			       <ul class="companyin_ulsix">
				     <li class="one">机型图解</li>
				     <li class="two"><img src="http://www.fei580.com/<%=airlineOne["cangPic"]%>"  alt="<%=airlineOne["chName"]%>" /></li>
			       </ul>
			       <ul class="companyin_ulsev">
				     <li class="one">详细参数：</li>
				     <li class="two">
				     <%=airlineOne["otherVar"]%>
				     </li>
			       </ul>
			     </div>
			     <img src="http://www.fei580.com/images/v938b.jpg" alt="" style="float:left;" />
		       </div>
	       </div> 
       </div>
       <img src="http://www.fei580.com/images/companyin02.jpg" style="float:left" />



    <asp:Panel ID="panelPic" runat="server">
     <div class="company_new_line" style="margin-top:9px;"></div>
       <div class="companyin_box">
         <h2><strong><%=airlineOne["chName"]%>机型图集</strong><span>共10张</span></h2>	
		       <div class="weddingscroll">
	            <span class="wsprev"  id="LeftArr"></span>
	              <ul id="ISL_Cont_1">
	                <%if(!string.IsNullOrEmpty(airlineOne["pic2"].ToString())) {%>
			      <li><a   href="http://www.fei580.com/<%=airlineOne["pic2"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic2"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	              <%} %>
	              <%if(!string.IsNullOrEmpty(airlineOne["pic3"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic3"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic3"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	               <%} %>
	              <%if(!string.IsNullOrEmpty(airlineOne["pic4"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic4"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic4"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	               <%} %>
	              <%if(!string.IsNullOrEmpty(airlineOne["pic5"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic5"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic5"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	               <%} %>
	              <%if(!string.IsNullOrEmpty(airlineOne["pic6"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic6"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic6"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	               <%} %>
	              <%if(!string.IsNullOrEmpty(airlineOne["pic7"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic7"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic7"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	               <%} %>
	              <%if(!string.IsNullOrEmpty(airlineOne["pic8"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic8"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic8"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	               <%} %>
	               <%if(!string.IsNullOrEmpty(airlineOne["pic9"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic9"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic9"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	                <%} %>
	              <%if(!string.IsNullOrEmpty(airlineOne["pic10"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic10"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic10"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
	                <%} %>
	              <%if(!string.IsNullOrEmpty(airlineOne["pic11"].ToString())) {%>
	              <li><a   href="http://www.fei580.com/<%=airlineOne["pic11"] %>" title="<%=airlineOne["chName"]%>" ><img src="http://www.fei580.com/<%=airlineOne["pic11"] %>" alt="<%=airlineOne["chName"]%>" width="190px" height="130px" /></a></li>
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
       
       
      <div class="company_new_line" style="margin-top:9px;"></div>
       <div class="companyin_boxsix" style="background:url(http://www.fei580.com/images/companyin03.jpg) repeat-y;">
         <h2 style="font-size:16px;"><%=airlineOne["chName"]%>机型简介</h2>
         <div class="companyin_boxsever">
           <p><%=Public.StripHTML(airlineOne["description"].ToString())%></p>
         </div>
        
         <!--div class="companyin_boxeight">
           <img src="images/companyin025.jpg" alt=""  />
         </div-->
       </div>
       <img src="http://www.fei580.com/images/companyin02.jpg" style="float:left" />
       
       
      <div class="companyin_boxtitle" id="comment"><strong><%=airlineOne["chName"]%>机型评分</strong>（直接移动鼠标点击即可）</div>
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
            <div id="divcomment">
	        </div>          
          </ul>
          <ul class="companyin_ulfive">
            <li class="one"><img src="http://www.fei580.com/images/companyin016.jpg"  alt="" align="absmiddle" />对<%=airlineOne["chName"]%>机型发表评论</li>
            <li class="two">
	        <% if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null){ %>
            <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/airplane/<%=id%>.htm" title="登录">登录</a>&nbsp;&nbsp;&nbsp;<a href="http://www.fei580.com/memberReg.aspx" title="注册">注册</a>
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
      



    <!--twolinebox end-->    
  <uc1:footControl ID="FootControl" runat="server" />

    </form>
    
    </div>
</body>
</html>
