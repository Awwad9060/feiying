<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news.aspx.cs" Inherits="news" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />  
<meta name="applicable-device" content="pc,mobile"> 
<meta name="MobileOptimized" content="width"/> 
<meta name="HandheldFriendly" content="true"/>
<title>新闻资讯_最新旅游资讯、民航新闻、机场动态等业界信息 - 飞瀛网</title>
<meta name="Description"  content="飞瀛网为您提供最新旅游资讯、民航新闻、机场动态等业界信息。飞瀛网，飞，我帮您。专业国际机票预订专家，您出行的好帮手。" />
<meta name="robots" content="index,follow" />
<link rel="canonical" href="http://www.fei580.com/news.aspx" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/jquery.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/lanren.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/index.js"></script>
</head>
<body>
    <div class="mainbody" >
    <form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="Home" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="eMail" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
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
    <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="">飞瀛首页</a>&gt;&nbsp;<a href="http://www.fei580.com/news.aspx">新闻资讯</a></div>
  </div>
</div>
<!--header end-->
<div style="margin:0px auto;width:966px;position:relative;">
<div class="newsbox">

  <div class="smallleft_one">
       <div class="smallleft_onetitle"><strong>新闻天天看</strong><a href="http://www.fei580.com/" title="新闻天天看"><img src="http://www.fei580.com/images/onein027.gif" alt="新闻天天看" /></a></div>
       <div class="smallleft_onebox">
         <div class="Hr_1" id="div" style="CURSOR: hand">
			      <div class="Hr_11">
			      
			 <%
            if (focuNews.Count != 0)
            {

                for (int i = 0; i < focuNews.Count; i++)
                {
                    System.Data.DataRow focuNews_row = focuNews[i];
                    
                    if (i == 0)
                    {
             %>
					 <a class="act" id="a<%=i%>" hidefocus="true" onmouseover="clearAuto();" onclick="Mea(<%=i%>);" onmouseout="setAuto()" href="javascript:void(0);" ><%=focuNews_row["title"].ToString()%></a> 
					<%}
               else
               { %>
					        <a class="nor" id="a<%=i%>" hidefocus="true" onmouseover="clearAuto();" onclick="Mea(<%=i%>);" onmouseout="setAuto()" href="javascript:void(0);" ><%=focuNews_row["title"].ToString()%></a> 
					        <%
                    }
                }
            }
                    %>
			      
				    </div>
				    <div class="himgbox">
			<%
            if (focuNews.Count != 0)
            {

                for (int n = 0; n < focuNews.Count; n++)
                {
                    System.Data.DataRow focuNews_row_pic = focuNews[n];
                    string picUrl = "http://www.fei580.com/images/focus.jpg";
                    if (focuNews_row_pic["newsPic"].ToString() != "")
                    {
                        picUrl = focuNews_row_pic["newsPic"].ToString();
                    }
                    if (n == 0)
                    {
             %>
						    <a href="http://www.fei580.com/news_<%=focuNews_row_pic["id"].ToString()%>.htm" target="_blank"><img id="pc_<%=n%>" alt="<%=focuNews_row_pic["title"].ToString()%>" style="DISPLAY: block" height="226px" src="http://www.fei580.com/<%=picUrl%>" width="344px" /></a>
						        <%}
               else
               { %>
						    <a href="http://www.fei580.com/news_<%=focuNews_row_pic["id"].ToString()%>.htm" target="_blank"><img id="pc_<%=n%>" alt="<%=focuNews_row_pic["title"].ToString()%>" style="DISPLAY: none" height="226px" src="http://www.fei580.com/<%=picUrl%>" width="344px" /></a>
        					
						        <%
                    }
                }
            }
                            %>
	          </div>
	        </div>
       </div>

       <div class="news_leftbox">
         <h2>主要航空公司</h2>
         <table cellpadding="0" cellspacing="5">
           <tr>
             <th valign='top'><strong>国内:</strong></th>
             <td valign="top"><a href="http://www.fei580.com/airline/248.htm" title="中国国际航空">[中国国际航空]</a><a href="http://www.fei580.com/airline/25.htm" title="东方航空">[东方航空]</a><a href="http://www.fei580.com/airline/358.htm" title="南方航空">[南方航空]</a><a href="http://www.fei580.com/airline/349.htm" title="海南航空">[海南航空]</a></td>
           </tr>
           <tr>
             <th valign='top'><strong>港台:</strong></th>
             <td valign="top"><a href="http://www.fei580.com/airline/266.htm" title="国泰航空">[国泰航空]</a><a href="http://www.fei580.com/airline/16.htm" title="港龙航空">[港龙航空]</a><a href="http://www.fei580.com/airline/254.htm" title="中华航空">[中华航空]</a><a href="http://www.fei580.com/airline/10.htm" title="长荣航空">[长荣航空]</a></td>
           </tr>
           <tr>
             <th valign='top'><strong>亚洲:</strong></th>
             <td valign="top">
             <a href="http://www.fei580.com/airline/15.htm" title="日本航空">[日本航空]</a><a href="http://www.fei580.com/airline/343.htm" title="全日空">[全日空]</a><a href="http://www.fei580.com/airline/1.htm" title="泰国航空">[泰国航空]</a><a href="http://www.fei580.com/airline/344.htm" title="新加坡航空">[新加坡航空]</a><a href="http://www.fei580.com/airline/18.htm" title="韩亚航空">[韩亚航空]</a><br />
             <a href="http://www.fei580.com/airline/20.htm" title="大韩航空">[大韩航空]</a><a href="http://www.fei580.com/airline/19.htm" title="马来西亚航空">[马来西亚航空]</a>
             </td>
           </tr>
           <tr>
             <th valign='top'><strong>美洲:</strong></th>
             <td valign="top"><a href="http://www.fei580.com/airline/354.htm" title="美国联合航空">[美国联合航空]</a><a href="http://www.fei580.com/airline/194.htm" title="美国航空">[美国航空]</a><a href="http://www.fei580.com/airline/283.htm" title="达美航空">[达美航空]</a><a href="http://www.fei580.com/airline/257.htm" title="美国大陆航空">[美国大陆航空]</a></td>
           </tr>
           <tr>
             <th valign='top'><strong>欧洲:</strong></th>
             <td valign="top">
             <a href="http://www.fei580.com/airline/198.htm" title="法国航空">[法国航空]</a><a href="http://www.fei580.com/airline/23.htm" title="汉莎航空">[汉莎航空]</a><a href="http://www.fei580.com/airline/3.htm" title="荷兰航空">[荷兰航空]</a><a href="http://www.fei580.com/airline/215.htm" title="芬兰航空">[芬兰航空]</a><br />
             <a href="http://www.fei580.com/airline/365.htm" title="北欧航空">[北欧航空]</a><a href="http://www.fei580.com/airline/14.htm" title="阿联酋航空">[阿联酋航空]</a><a href="http://www.fei580.com/airline/341.htm" title="卡塔尔航空">[卡塔尔航空]</a><br />
             </td>
           </tr>
         </table>
       </div>
       
   </div>

   
   <div class="news_rightbox">
     <ul class="news_rightul">
           <% if (rightNews.Count != 0)
            {%>

                <%for (int n = 0; n < rightNews.Count&&n<3; n++)
                {
                    System.Data.DataRow rightNews_row = rightNews[n];%>
       <li>
         <h2><a href="http://www.fei580.com/news_<%=rightNews_row["id"].ToString()%>.htm"><%=rightNews_row["title"].ToString()%></a></h2>
         &nbsp;&nbsp;&nbsp;&nbsp;<%=eap.share.Sys.truncate(Public.StripHTML(rightNews_row["content"].ToString()),180,"...")%>[<a href="http://www.fei580.com/news_<%=rightNews_row["id"].ToString()%>.htm" title="<%=rightNews_row["title"].ToString()%>"  target="_blank">查看全文</a>]
       </li>
                <%} %>
          <%} %>
     </ul>
     
   
     <ul class="news_rightultwo1">
     <% if (rightNews.Count != 0)
            {%>

                <%for (int n = 3; n < rightNews.Count; n++)
                {
                    System.Data.DataRow rightNews_row = rightNews[n];%>
       <li><a href="http://www.fei580.com/news_<%=rightNews_row["id"].ToString()%>.htm" title="<%=rightNews_row["title"].ToString()%>"  target="_blank"><%=rightNews_row["title"].ToString()%></a></li>
           <%} %>
          <%} %>
     </ul>
   </div>


</div>

<div class="clearbox">

  <div class="news_leftboxtwo">
  
    <div class="news_leftboxone">
      <div class="news_leftboxoneimg">
        <a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/v5.gif" alt="飞瀛网" width="137px" height="192px" /></a>
      </div>
      <div class="news_leftboxoneright">
        <ul class="news_ulone">
         <% if (zhihuiNews.Count != 0)
            {

                for (int n = 0; n < zhihuiNews.Count; n++)
                {
                    if (n < 3)
                    {
                        System.Data.DataRow zhihuiNews_row = zhihuiNews[n];
                 
             %>
          <li><a href="http://www.fei580.com/news_<%=zhihuiNews_row["id"].ToString()%>.htm" title="<%=zhihuiNews_row["title"].ToString()%>"  target="_blank"><%=zhihuiNews_row["title"].ToString()%></a>
          <br/><%=eap.share.Sys.truncate(Public.StripHTML(zhihuiNews_row["content"].ToString()), 70, "...")%><a href="http://www.fei580.com/news_<%=zhihuiNews_row["id"].ToString()%>.htm"  target="_blank" title="<%=zhihuiNews_row["title"].ToString()%>" class="redlink">[详细进入]</a></li>
            <%} %>
          <%}
        }%>
           </ul>
        <ul class="news_ultwo">
        <% if (zhihuiNews.Count != 0)
           {

               for (int n = 0; n < zhihuiNews.Count; n++)
               {
                   if (n > 3)
                   {
                       System.Data.DataRow zhihuiNews_row = zhihuiNews[n];
                  
             %>
          <li><a href="http://www.fei580.com/news_<%=zhihuiNews_row["id"].ToString()%>.htm"  target="_blank" title="<%=zhihuiNews_row["title"].ToString()%>"><%=zhihuiNews_row["title"].ToString()%></a></li>
          <%}
        }
    }
              %>
        </ul>
      </div>
    </div>
    
    <img src="http://www.fei580.com/images/news016.jpg" alt="news016" style="float:left;margin-top:8px;" />
    <ul class="news_leftboxthree">
      <li class="one"><strong>旅游资讯</strong><span><a href="http://www.fei580.com/newsList.aspx?typeId=1" title="旅游资讯">更多</a><img src="http://www.fei580.com/images/news018.gif" alt="旅游资讯" /></span></li>
      <li class="two">
      
            <%
    
    
                string lvyou_news = "images/lvyou_news.jpg";
                if (focuairlineNews.Count != 0)
                {
                    for (int n = 0; n < focuairlineNews.Count; n++)
                    {
                        System.Data.DataRow News_row = focuairlineNews[n];

                        if (News_row["newsPic"].ToString() != "")
                        {
                            lvyou_news = News_row["newsPic"].ToString();
                        }
                      %>
                <p><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" title="<%=News_row["title"].ToString()%>"  target="_blank"><img src="http://www.fei580.com/<%=lvyou_news%>" alt="<%=News_row["title"].ToString()%>" width="200px" height="125px" /></a><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" title="<%=News_row["title"].ToString()%>"><%=News_row["title"].ToString()%></a></p>
                <%} %>
          <%}
            else
            {
               %>
             <p><img src="<%=lvyou_news%>" alt="旅游资讯" width="200px" height="125px" />旅游资讯</p>
           
           <%}
              %>
     <ul>
          <% if (airlineNews.Count > 1)
            {%>

                <%for (int n = 1; n < airlineNews.Count; n++)
                {
                    System.Data.DataRow News_row = airlineNews[n];%>
                <li><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" title="<%=News_row["title"].ToString()%>"  target="_blank"><%=News_row["title"].ToString()%></a>(<%=Convert.ToDateTime(News_row["addtime"].ToString()).ToShortDateString()%>)</li>
                <%} %>
          <%} %>
        </ul>
      </li>
      
      <li class="one"><strong>民航新闻</strong><span><a href="http://www.fei580.com/newsList.aspx?typeId=2" title="民航新闻">更多</a><img src="http://www.fei580.com/images/news018.gif" alt="news018" /></span></li>
      <li class="two">
            <% 
                string minhang_news = "http://www.fei580.com/images/minhang_news.jpg";
                if (focuairportNews.Count != 0)
                {%>

                <%for (int n = 0; n < focuairportNews.Count; n++)
                  {   
                      System.Data.DataRow News_row = focuairportNews[n];
                      if (News_row["newsPic"].ToString() != "")
                      {
                          minhang_news = News_row["newsPic"].ToString();
                      }
                      %>
                <p><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" target="_blank"><img src="<%=minhang_news%>" alt="<%=News_row["title"].ToString()%>" width="200px" height="125px" /></a><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" title="<%=News_row["title"].ToString()%>"><%=News_row["title"].ToString()%></a></p>
                <%} %>
          <%}
            else
            { %>
      
               <p><img src="<%=minhang_news%>" width="200px" height="125px" /></p>
       <%
                }
        %>
     <ul>
          <% if (airportNews.Count > 1)
            {%>

                <%for (int n = 1; n < airportNews.Count; n++)
                {
                    System.Data.DataRow News_row = airportNews[n];%>
                <li><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" target="_blank"><%=News_row["title"].ToString()%></a>(<%=Convert.ToDateTime(News_row["addtime"].ToString()).ToShortDateString()%>)</li>
                <%} %>
          <%} %>
        </ul>
      </li>
      
      <li class="one"><strong>业界动态</strong><span><a href="http://www.fei580.com/newsList.aspx?typeId=3" title="业界动态">更多</a><img src="http://www.fei580.com/images/news018.gif" alt="news018" /></span></li>
      <li class="two">
                    <% 
    
                        string dongtai_news = "http://www.fei580.com/images/dongtai_news.jpg";
                        if (focuairplanNews.Count != 0)
            {%>

                <%for (int n = 0; n < focuairplanNews.Count; n++)
                {
                    System.Data.DataRow News_row = focuairplanNews[n];
                    if (News_row["newsPic"].ToString() != "")
                    {
                        dongtai_news = News_row["newsPic"].ToString();
                    }
                      %>
                <p><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" target="_blank"><img src="<%=dongtai_news%>" alt="<%=News_row["title"].ToString()%>" width="200px" height="125px" /></a><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" title="<%=News_row["title"].ToString()%>"><%=News_row["title"].ToString()%></a></p>
                <%} %>
          <%}else{ %>
            <p><img src="<%=dongtai_news%>" width="200px" height="125px" /></p>
         <%} %>      
     <ul>
          <% if (airplanNews.Count > 1)
            {%>

                <%for (int n = 1; n < airplanNews.Count; n++)
                {
                    System.Data.DataRow News_row = airplanNews[n];%>
                <li><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" target="_blank"><%=News_row["title"].ToString()%></a>(<%=Convert.ToDateTime(News_row["addtime"].ToString()).ToShortDateString()%>)</li>
                <%} %>
          <%} %>
        </ul>
      </li>
      
      <li class="one"><strong>机场新闻</strong><span><a href="http://www.fei580.com/newsList.aspx?typeId=4" title="机场新闻">更多</a><img src="images/news018.gif" alt="news018" /></span></li>
      <li class="two">
                   <% 
    
                       string jichang_news = "http://www.fei580.com/images/jichang_news.jpg";
                       if (focujobNews.Count != 0)
            {%>

                <%for (int n = 0; n < focujobNews.Count; n++)
                {
                    System.Data.DataRow News_row = focujobNews[n];
                    if (News_row["newsPic"].ToString() != "")
                    {
                        jichang_news = News_row["newsPic"].ToString();
                    }
                      
                      %>
                <p><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" target="_blank"><img src="<%=jichang_news%>" alt="<%=News_row["title"].ToString()%>" width="200px" height="125px" /></a><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" title="<%=News_row["title"].ToString()%>"><%=News_row["title"].ToString()%></a></p>
                <%} %>
          <%}else{ %>
                   <p><img src="<%=jichang_news%>" width="200px" height="125px" /></p>
     
          <%
          }
           %>
      
     <ul>
          <% if (jobNews.Count > 1)
            {%>

                <%for (int n = 1; n < jobNews.Count; n++)
                {
                    System.Data.DataRow News_row = jobNews[n];%>
                <li><a href="http://www.fei580.com/news_<%=News_row["id"].ToString()%>.htm" target="_blank"><%=News_row["title"].ToString()%></a>(<%=Convert.ToDateTime(News_row["addtime"].ToString()).ToShortDateString()%>)</li>
                <%} %>
          <%} %>
        </ul>
      </li>
      
    </ul>
    <img src="http://www.fei580.com/images/news017.jpg" style="float:left;" />
    
  </div>
  
  
  <div class="news_rightboxtwo">
  
    <div class="news_righttitleone"><img src="http://www.fei580.com/images/news021.gif" style="float:left;margin:-7px 0px -16px 1px;position:relative;z-index:2;" /><strong>旅行日记</strong><span><a href="http://www.fei580.com/quan.aspx" title="">更多</a><img src="http://www.fei580.com/images/news018.gif" alt="news018" /></span></div>
    <div class="news_rightboxthree">
      <ul class="news_rightulone">
	      <li>
	       <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=219&height=87&id=6"></script>	        	   
	      </li>
	     
	    </ul>
	    
	    <ul class="news_rightultwo">
	     <%
           if (clickOrder.Count != 0)
                 {

                     for (int i = 0; i < clickOrder.Count; i++)
                     {
                         System.Data.DataRow clickOrder_row = clickOrder[i];
                 %>
	      <li><a href="http://www.fei580.com/trip/<%=clickOrder_row["aId"].ToString()%>.htm" target="_blank" ><%=clickOrder_row["title"].ToString()%></a></li>
	      <%
              }
          }
                %>
	   
	    </ul>
    </div>
    <img src="http://www.fei580.com/images/news02.jpg" style="float:left;" />
    
    <div class="news_rightboxfour"><strong>最新积分奖品</strong></div>
    <div class="news_rightboxsix">
    
     <%
               if (newPrizes.Count != 0)
                 {

                     for (int i = 0; i < newPrizes.Count; i++)
                     {
                         System.Data.DataRow newPrizes_row = newPrizes[i];
                 %>
	      <a href="http://www.fei580.com/prizes/<%=newPrizes_row["pId"].ToString()%>.htm" target="_blank"><img src="http://www.fei580.com/<%=newPrizes_row["picPath"].ToString()%>" alt="<%=newPrizes_row["pName"].ToString()%>" width="94px" height="94px" /></a>
	      <%
              }
          }
                %>
                
      <div class="clear"></div>
    </div>
    <div class="news_rightboxfive"><a href="http://www.fei580.com/prizes.aspx" title="">了解积分</a><img src="http://www.fei580.com/images/news018.gif" alt="news018" /></div>
    
  </div>
</div>
</div>
 <uc1:footControl ID="FootControl" runat="server" />
</form>
    </div>
</body>
</html>
