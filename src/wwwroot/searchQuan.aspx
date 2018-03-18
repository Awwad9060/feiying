<%@ Page Language="C#" AutoEventWireup="true" CodeFile="searchQuan.aspx.cs" Inherits="searchQuan" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=keyword%> - 飞瀛圈 - 飞瀛网（国际商旅专家）</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="飞瀛圈,飞行日记" />
<meta name="description" content="飞瀛圈,飞行日记，预订热线：400-885-0663" />
<link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
</head>
<body>
<div class="mainbody" >
 <form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="飞瀛网" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="国际机票专家" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
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
      <li class="two"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li-->
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com/" target="_blank" title="国际酒店">国际酒店</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="one"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司">航空公司</a></li>
	      <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
	      <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型">民航机型</a></li>
	      <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
    <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="">飞瀛首页</a>&gt;<a href="http://www.fei580.com/quan.aspx" title="">飞瀛圈</a>&gt;&nbsp;搜索 "<%=keyword%>"</div>
  </div>
</div>
<!--header end-->

 
<div style="margin:0px auto;width:965px;position:relative;">
  <div class="qiuanadmin_newslist_left">
 
    <img src="http://www.fei580.com/images/qiuanadmin01.jpg" style="float:left;" />
	<div class="qiuanadmin_newslist_leftbox" style="padding-bottom:0px;">
	  <ul class="newslist_vstitle qiuanadmin_list" style="padding:3px 0 5px 0;">
	        <li class="searchthree">搜索结果</li>
	   </ul>
	   
      <div class="qiuan_twoline_ulthree qiuanadmin_newslist_leftboxone">
	    
	     <asp:Repeater ID="quanlist" runat="server">
	       <ItemTemplate>
	    <ul>
		   <li class="one"><a href="http://www.fei580.com/trip/<%# Eval("aId") %>.htm" target="_blank"><%#getTitle(Eval("title").ToString())%></a></li>
		   <li class="two">作者：<%#DataBinder.Eval(Container.DataItem, "publishName")%></li>
		   <li class="three">日期：<%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "addtime")).ToShortDateString()%></li>
	    </ul>
		</ItemTemplate>
		</asp:Repeater>
		
	  </div>


	 
     <div class="newsdoc_leftboxsix" style="float:left;width:100%;">
     <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" HorizontalAlign="Center"
                                                    LastPageText="末页" NextPageText="下一页" PageSize="20" PrevPageText="上一页" 
                                                    SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" AlwaysShow="True">
                                                </webdiyer:AspNetPager></div>

	</div>
    <img src="http://www.fei580.com/images/qiuanadmin02.jpg" style="float:left;" />
  </div>



  <!--boxright start-->
	  <div class="newsdoc_right">
	    
	    <div class="newsdoc_rightbox" style="margin-top:5px;">
	      <div class="newsdoc_righttitle qiuanadmin_number"><strong>圈子推荐榜</strong><code>推荐TOP10</code></div>
	      <ul class="newsdoc_rightul qiuanadmin_numberul">
	       <%
           if (clickOrder.Count != 0)
                 {

                     for (int i = 0; i < clickOrder.Count; i++)
                     {
                         System.Data.DataRow clickOrder_row = clickOrder[i];
                 %>
	      <li><a href="http://www.fei580.com/trip/<%=clickOrder_row["aId"].ToString()%>.htm" target="_blank"><%=clickOrder_row["title"].ToString()%></a></li>
	      <%
              }
          }
                %>
	      </ul>
	    </div>
	    
	   

	  </div>
	<!--boxright end-->








</div>
  </form>
  <uc1:footControl ID="FootControl" runat="server" />
  </div>
 </body>
</html>
