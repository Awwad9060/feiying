<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsDetail.aspx.cs" Inherits="newsDetail" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<title><%=newsOne["title"]%> - 飞瀛网</title>
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<meta name="Description"  content="<%=newsOne["title"]%>" />
<meta name="keywords" content="<%=newsOne["title"]%>" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/newscomment.js" type="text/javascript"></script>
<script type="text/javascript">
/*加载评论*/
$(document).ready(function() {
    getnewscomment('<%=id%>');
    $(".newsdoc_leftboxfive a").attr("href", "http://www.fei580.com/chat/?utm_source=NewsDetail&utm_medium=NewsLink&utm_campaign=BaiduBridge&utm_content=NewsContent");
    //发表评论
	$("#buttSubmit").bind("click", function() {
		insertnewscomment('<%=id%>');
	}) 
});
</script>
</head>
<body>
<div class="mainbody" >
<form id="form2" runat="server">
<!--header start-->
<div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span>
</div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
      <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/news_<%=id%>.htm" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
    <%
        }
        else
        {
     %>
    <a href="http://www.fei580.com/person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="http://www.fei580.com/person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="">退出登录</a>
    <%}
         %> 
    </div>    <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com/" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" title="支付方式">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="http://www.fei580.com/airline.aspx" title="">航空公司</a></li>
	      <li class="two"><a href="http://www.fei580.com/airport.aspx" title="">世界机场</a></li>
	      <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="">民航机型</a></li>
	      <li class="one"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
    <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="">飞瀛网</a>&gt;&nbsp;<a href="http://www.fei580.com/news.aspx">新闻资讯</a>&gt;&nbsp;<a href="http://www.fei580.com/newsList.aspx?typeId=<%=newsType %>"><%=Type_stat(newsType)%></a></div>
  </div>
</div>
<!--header end-->


<div style="margin:0px auto;width:966px;">

<div class="clear">
<!--boxright start-->
	  <div class="newsdoc_left">
	  
	    <img src="http://www.fei580.com/images/news05.jpg" style="float:left;" />
	    <div class="newsdoc_leftboxtwo">
	      <div class="newsdoc_leftboxthree">
	        <h1><%=newsOne["title"]%></h1>
	        时间:<%=newsOne["addtime"]%>&nbsp;&nbsp;&nbsp;&nbsp;来源:<%=newsOne["newsfrom"]%>&nbsp;&nbsp;&nbsp;&nbsp;点击:<%=newsOne["hitTimes"]%>次
	      </div>
	      <div style="margin:0px auto;width:655px">
	      
	        <div class="newsdoc_leftboxfour">
	          <div class="newsdoc_leftboxfive">
		         <%=newsOne["content"]%>
		         <div class="clearfix"></div>
	          </div>
	        <%--  <div class="newsdoc_leftboxsix">共11页:<a href="#" title="">上一页</a><a href="#" title="">1</a><a href="#" title="">2</a><a href="#" title="">3</a><a href="#" title="">4</a><a href="#" title="">5</a><a href="#" title="">6</a><a href="#" title="">7</a><a href="#" title="">8</a><a href="#" title="">9</a><a href="#" title="">10</a><a href="#" title="">11</a><a href="#" title="">下一页</a></div>
	        --%></div>
	        
	        <ul class="newsdoc_leftultwo">
	          <li class="one">
	          上一篇：<%=nextTitle %><br />
              下一篇：<%=preTitle %>
	          </li>
	        <%--  <li class="two">
	          【<a href="#" title="">收藏此页</a>】【<a href="#" title="">打印此页</a>】 
<br />【<a href="#" title="">推荐此文</a>】【<a href="#" title="">我要挑错</a>】 

	          </li>--%>
	        </ul>
	        
	      </div>
	      
	      <img src="http://www.fei580.com/images/news08.jpg" style="float:left;margin-top:10px;" />
	        <div class="newsdoc_leftboxsev">
	          <div class="newsdoc_leftboxeight">
	            <h2>相关文章</h2>
	            <ul>
					         <%if(relatNews.Count!=0) %>
		              <%{ %>
		                  <% for (int i = 0; i < relatNews.Count; i++)
                            {
                                System.Data.DataRow relatNews_row = relatNews[i];%>
                                  <li><a href="http://www.fei580.com/news_<%=relatNews_row["id"] %>.htm" title=""><%=relatNews_row["title"] %></a></li>
                           <%} %>
		             <%} %>
					        
					    </ul>
	          </div>
	          
	          <ul class="newsdoc_leftboxnine">
	            <div id="divcomment">
	            </div>
	            
	            <li class="two">发表评论</li>
	            <li class="three">
	            <% if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null){ %>
	            <input type="button" onclick="window.location.href='http://www.fei580.com/login.aspx?url=http://www.fei580.com/news_<%=id%>.htm'" value="登录" class="news_submittwo" /><a href="memberReg.aspx" title="">注册</a>
	            <%}else{ %>
	            <span style="padding:20px 0px 20px 5px" ><code style="color:#419C01;" ><%=Session["Mem_LoginName"] %></code>：您已登录，你可以在此发表评论！</span>
	            <%} %>
	            </li>
	            <li class="four"><textarea id="txt_comtcontent" runat="server" ></textarea></li>
	            <li class="five">匿名发表<input id="cheNiming" name="cheNiming" runat="server" type="checkbox" />
                <input id="buttSubmit" class="news_submitthree" type="button" value="" />
	            </li>
	          </ul>
	          
	        </div>
	      <img src="http://www.fei580.com/images/news010.jpg" style="float:left;" />
	     	      
	    </div>
	    <img src="http://www.fei580.com/images/news06.jpg" style="float:left;" />
	  </div>
	<!--boxright end-->
	<!--boxright start-->
	  <div class="newsdoc_right">
	    <select style="vertical-align:middle;"><option>全部</option></select><input type="text" class="news_text" value="请输入搜索内容" /><input type="submit" value="" class="news_submit" />
	    <div class="newsdoc_rightbox">
	      <div class="newsdoc_righttitle"><strong>热门排行榜</strong><code>本周TOP10</code></div>
	      <ul class="newsdoc_rightul">
	        <%if(hotNews.Count!=0) %>
		              <%{ %>
		                  <% for (int i = 0; i < hotNews.Count; i++)
                            {
                                System.Data.DataRow hotNews_row = hotNews[i];%>
                                  <li><a href="http://www.fei580.com/news_<%=hotNews_row["id"] %>.htm" title="<%=hotNews_row["title"] %>"><%=hotNews_row["title"] %></a></li>
                           <%} %>
		             <%} %>
	      </ul>
	    </div>
	    
	    <div class="news_ad">
	     <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=244&height=220&id=7"></script>
	     </div>
	    
	    <div style="border:1px solid #DFDFDF;padding:0px 5px;margin-top:10px;height:280px; border-bottom:none;">
	    <strong class="newsdoc_righttitletwo">今日特价机票</strong>
	    <ul class="newsdoc_rightultwo">
           <%if (ticketDay.Count != 0) %>
              <%{ %>
                  <% for (int i = 0; i < ticketDay.Count; i++)
                    {
                        System.Data.DataRow ticketDay_row = ticketDay[i];%>
                          <li>[<%=(ticketDay_row["tripType"].ToString()=="1")?"往返":"单程"%>]<a href="http://www.fei580.com/ticket_<%=ticketDay_row["tId"] %>.htm" title="<%=ticketDay_row["fromCityname"].ToString()%>到<%=ticketDay_row["toCityname"].ToString()%>机票"><%=ticketDay_row["fromCityname"].ToString()%>到<%=ticketDay_row["toCityname"].ToString()%>机票</a></li>
                   <%} %>
             <%} %>
	    </ul>
	    </div>
	    <!--<div class="newsdoc_righttitlethree"><strong>圈子新帖</strong><a href="http://quan.fei580.com" title="">更多&nbsp;&gt;</a></div>
	    <ul class="newsdoc_rightulthree">
	        <%
               if (bbstopics.Count != 0)
                 {

                     for (int i = 0; i < bbstopics.Count; i++)
                     {
                         System.Data.DataRow bbstopics_row = bbstopics[i];
                 %>
	      <li><a href="http://quan.fei580.com/showtopic-<%=bbstopics_row["tid"].ToString()%>.aspx" target="_blank"><%=bbstopics_row["title"].ToString()%></a></li>
	     <%
	     }
	     }
	      %>
	    </ul>-->
	    <img src="http://www.fei580.com/images/news02.jpg" style="float:left;" />
	  </div>
	<!--boxright end-->
	
	
</div>

</div>
 <uc1:footControl ID="FootControl" runat="server" />
</form>
</div>
<script src="http://www.fei580.com/js/baidusubmit.js"></script>
</body>
</html>