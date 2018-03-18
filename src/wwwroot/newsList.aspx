<%@ Page Language="C#" AutoEventWireup="true" CodeFile="newsList.aspx.cs" Inherits="newsList" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />  
<meta name="applicable-device" content="pc,mobile"> 
<meta name="MobileOptimized" content="width"/> 
<meta name="HandheldFriendly" content="true"/>
<title><%=typeName%> - 飞瀛网</title>
<meta name="Description"  content="飞瀛网为您提供<%=typeName%>，民航信息，旅游攻略，旅行日志等。飞瀛网，飞，我帮您。专业国际机票预订专家，您出行的好帮手。" />
<meta name="robots" content="index,follow" />
<link rel="canonical" href=http://www.fei580.com/newslist.aspx?type=<%=typeId %> />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>

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
    </div>     <ul class="menu_1">
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
	      <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型">民航机型</a></li>
	      <li class="one"><a href="http://www.fei580.com/news.aspx" title="新闻资讯">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="积分广场">积分广场</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
    <div class="header_nav">您现在位置：<a href="http://www.fei580.com" title="">飞瀛首页</a>&gt;&nbsp;<a href="http://www.fei580.com/news.aspx">新闻资讯</a>&gt;&nbsp;<a href="http://www.fei580.com/newslist.aspx?type=<%=typeId %>"><%=typeName%></a></div>
  </div>
</div>
<!--header end-->
    
    <div style="margin:0px auto;width:966px;">

<div class="clear">
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
	    
	    <div class="news_ad"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/news01.jpg" alt="飞瀛网" /></a></div>
	    
	    <strong class="newsdoc_righttitletwo">特别推荐文章</strong>
	    <ul class="newsdoc_rightultwo">
	               <%if(recomNews.Count!=0) %>
		              <%{ %>
		                  <% for (int i = 0; i < recomNews.Count; i++)
                            {
                                System.Data.DataRow recomNews_row = recomNews[i];%>
                                  <li><a href="http://www.fei580.com/news_<%=recomNews_row["id"] %>.htm" title="<%=recomNews_row["title"] %>"><%=recomNews_row["title"] %></a></li>
                           <%} %>
		             <%} %>
	    </ul>
	  </div>
	<!--boxright end-->
	
	<!--boxright start-->
	  <div class="newsdoc_left">
	  
	    <img src="images/news05.jpg" style="float:left;" />
	    <div class="newsdoc_leftboxtwo">
	      <ul class="newslist_vstitle">
	        <li class="one"><%=typeName %></li>
	      </ul>
	      <div style="margin:0px auto;width:655px">
	      
	        <ul class="newslist_vsultwo">
	          <asp:Repeater ID="rptshopnews" runat="server">
	           <ItemTemplate>
	          <li><span><a href="news_<%#Eval("id")%>.htm" title="<%#DataBinder.Eval(Container.DataItem, "title")%>"><%#DataBinder.Eval(Container.DataItem, "title")%></a></span><code><%#DataBinder.Eval(Container.DataItem, "addtime")%></code></li>
	          </ItemTemplate>
	          </asp:Repeater>
	        </ul>
	        
	       
	        <div class="clear"></div>
	     
	     <br />
	      <div class="newsdoc_leftboxsix">
	      <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" HorizontalAlign="Right" LastPageText="末页" NextPageText="下一页" PageSize="25" PrevPageText="上一页" ShowPageIndexBox="Always"
                  SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" UrlPaging="true" AlwaysShow="True"></webdiyer:AspNetPager>
	  
	      </div>
	        
	        
	        
	      </div>
	      
	      
	      
	      
	    </div>
	    <img src="images/news06.jpg" style="float:left;" />
	    
	    <%--<div class="newsdoc_leftbox">
	      <h2>博客精彩图集</h2>
	      <ul class="newsdoc_leftul">
	        <li>
	        <a href="#" title=""><img src="images/news04.jpg" alt="" /></a>
	        <strong><a href="#" title="">阳光旅程</a></strong><br />
	        作者：[<a href="#" title="">N5photo</a>]<code>[<a href="#" title="">湖北</a>]</code>
	        </li>
	        
	        <li>
	        <a href="#" title=""><img src="images/news04.jpg" alt="" /></a>
	        <strong><a href="#" title="">阳光旅程</a></strong><br />
	        作者：[<a href="#" title="">N5photo</a>]<code>[<a href="#" title="">湖北</a>]</code>
	        </li>
	        
	        <li>
	        <a href="#" title=""><img src="images/news04.jpg" alt="" /></a>
	        <strong><a href="#" title="">阳光旅程</a></strong><br />
	        作者：[<a href="#" title="">N5photo</a>]<code>[<a href="#" title="">湖北</a>]</code>
	        </li>
	        
	        <li>
	        <a href="#" title=""><img src="images/news04.jpg" alt="" /></a>
	        <strong><a href="#" title="">阳光旅程</a></strong><br />
	        作者：[<a href="#" title="">N5photo</a>]<code>[<a href="#" title="">湖北</a>]</code>
	        </li>
	      </ul>
	    </div>--%>
	  </div>
	<!--boxright end-->
</div>



</div>
    </form>
    <uc1:footControl ID="FootControl" runat="server" />
    </div>
</body>
</html>
