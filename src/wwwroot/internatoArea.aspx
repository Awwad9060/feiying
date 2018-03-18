<%@ Page Language="C#" AutoEventWireup="true" CodeFile="internatoArea.aspx.cs" Inherits="internatoArea" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />  
<meta name="applicable-device" content="pc,mobile"> 
<meta name="MobileOptimized" content="width"/> 
<meta name="HandheldFriendly" content="true"/>
<title>国际机票_特价<%=title %>,全球各洲地区特价国际机票 - 飞瀛网</title>
<meta name="Description"  content="飞瀛网为您提供广州,深圳,香港,澳门,上海,北京出发特价国际机票,打折国际机票,以及最新实时国际机票查询服务.免费热线：400-885-0663" />
<meta name="robots" content="index,follow" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index_internatoArea.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/index.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/common.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/menu.js"></script>
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
        </div>
    <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="one"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
      <!--li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
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
		<div class="header_nav">您现在位置：<a href="http://www.fei580.com" title="">飞瀛首页</a>&gt;<a href="http://www.fei580.com/international.aspx" title="">国际机票</a></div>
      </div>
    </div>
    <!--header end-->


    <div style="margin:0px auto;width:960px;">

    <!--onelinebox start-->
       <img src="http://www.fei580.com/images/tell01.jpg" alt="服务与价格是我们的核心竞争力电话:400-885-0663" class="tellleftcss" />
      <div class="onelinebox_right">
      
	    <ul class="International_rightultwo">
	      <li><a href="http://www.fei580.com/internatoArea.aspx?State=1" title="亚洲专区" class="white">亚洲机票</a></li>
	      <li><a href="http://www.fei580.com/internatoArea.aspx?State=2" title="欧洲专区" class="white">欧洲机票</a></li>
	      <li><a href="http://www.fei580.com/internatoArea.aspx?State=3" title="北美洲专区" class="white">北美洲机票</a></li>
	      <li><a href="http://www.fei580.com/internatoArea.aspx?State=5" title="大洋洲专区" class="white">大洋洲机票</a></li>
	      <li><a href="http://www.fei580.com/internatoArea.aspx?State=6" title="非洲专区" class="white">非洲机票</a></li>
	    </ul>

       </div>
    <!--onelinebox end-->
    </div>

    <!--twolinebox start-->
    <div style="margin:0px auto;width:968px;">

      <div class="twolinebox_title">
        <img src="http://www.fei580.com/images/bg02.jpg" style="float:left" />
        <img src="http://www.fei580.com/images/International016.jpg" style="float:left;position:relative;top:0px;left:6px;margin-top:-11px;" />
        <strong>国际机票列表</strong>
       
        <img src="http://www.fei580.com/images/bg03.jpg" style="float:right" />
      </div>
      
      <div class="twolinebox_box" style="width:966px;">
      
       <div class="International_rightboxfive"><%=name %></div>
       <%if(DataList.Count!=0) %>
       <%{ %>
        <div class="twolinebox_ulthreebox">
		    <ul class="twolinebox_ulthree add_01ff">
		      <li class="two">
			    <span class="spanone">航空公司</span>
			    <span class="spantwo">航线</span>
			    <span class="spanthree">价格</span>
			    <span class="spanfour">日期</span>
		      </li>
		      <%for(int i=0;i<DataList.Count&&i<8;i++) %>
		      <%{ %>
		            <%System.Data.DataRow DataList_row = DataList[i];%>
                 <li class="three" onmouseover="this.style.background='#F4F4F4'" onmouseout="this.style.background=''" >
                    <span class="spanone"><img src="http://www.fei580.com/<%=DataList_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=DataList_row["airline"]%>.htm"><%=DataList_row["airname"].ToString()%></a></code></span>
                    <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=DataList_row["tId"] %>.htm" title="">[<%=(DataList_row["tripType"].ToString() == "1") ? "往返" : "单程"%>] <%=DataList_row["fromCityname"].ToString()%>←→<%=DataList_row["toCityname"].ToString()%> </a></span>
                    <span class="spanthree">￥<%=DataList_row["untaxPrice"].ToString()%> </span>
                    <span class="spanfour"><%=Convert.ToDateTime(DataList_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
                 </li>
		      <%} %>
		    </ul>

		    <ul class="twolinebox_ulthree add_01ff" style="height:225px;">
		      <%for(int i=8;i<DataList.Count&&i<16;i++) %>
		      <%{ %>
		            <%System.Data.DataRow DataList_row = DataList[i];%>
                 <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
                    <span class="spanone"><img src="http://www.fei580.com/<%=DataList_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=DataList_row["airline"]%>.htm"><%=DataList_row["airname"].ToString()%></a></code></span>
                    <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=DataList_row["tId"] %>.htm" title="">[<%=(DataList_row["tripType"].ToString() == "1") ? "往返" : "单程"%>] <%=DataList_row["fromCityname"].ToString()%>←→<%=DataList_row["toCityname"].ToString()%> </a></span>
                    <span class="spanthree">￥<%=DataList_row["untaxPrice"].ToString()%> </span>
                    <span class="spanfour"><%=Convert.ToDateTime(DataList_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
                 </li>
		      <%} %>
		    </ul>

		    <ul class="twolinebox_ulthree add_01ff" style="height:225px;">
		      <%for(int i=16;i<DataList.Count&&i<24;i++) %>
		      <%{ %>
		            <%System.Data.DataRow DataList_row = DataList[i];%>
                 <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
                    <span class="spanone"><img src="http://www.fei580.com/<%=DataList_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=DataList_row["airline"]%>.htm"><%=DataList_row["airname"].ToString()%></a></code></span>
                    <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=DataList_row["tId"] %>.htm" title="">[<%=(DataList_row["tripType"].ToString() == "1") ? "往返" : "单程"%>] <%=DataList_row["fromCityname"].ToString()%>←→<%=DataList_row["toCityname"].ToString()%> </a></span>
                    <span class="spanthree">￥<%=DataList_row["untaxPrice"].ToString()%> </span>
                    <span class="spanfour"><%=Convert.ToDateTime(DataList_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
                 </li>
		      <%} %>
		    </ul>
        </div>
       
        <div class="twolinebox_ulfourbox">
		    <ul class="twolinebox_ulthree add_01ff">
		      <li class="two">
			    <span class="spanone">航空公司</span>
			    <span class="spantwo">航线</span>
			    <span class="spanthree">价格</span>
			    <span class="spanfour">日期</span>
		      </li>
		      <%for(int i=24;i<DataList.Count&&i<32;i++) %>
		      <%{ %>
		            <%System.Data.DataRow DataList_row = DataList[i];%>
                 <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
                    <span class="spanone"><img src="http://www.fei580.com/<%=DataList_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=DataList_row["airline"]%>.htm"><%=DataList_row["airname"].ToString()%></a></code></span>
                    <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=DataList_row["tId"] %>.htm" title="">[<%=(DataList_row["tripType"].ToString() == "1") ? "往返" : "单程"%>] <%=DataList_row["fromCityname"].ToString()%>←→<%=DataList_row["toCityname"].ToString()%> </a></span>
                    <span class="spanthree">￥<%=DataList_row["untaxPrice"].ToString()%> </span>
                    <span class="spanfour"><%=Convert.ToDateTime(DataList_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
                 </li>
		      <%} %>
		    </ul>

		    <ul class="twolinebox_ulthree add_01ff" style="height:225px;">
		      <%for(int i=32;i<DataList.Count&&i<40;i++) %>
		      <%{ %>
		            <%System.Data.DataRow DataList_row = DataList[i];%>
                 <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
                    <span class="spanone"><img src="http://www.fei580.com/<%=DataList_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=DataList_row["airline"]%>.htm"><%=DataList_row["airname"].ToString()%></a></code></span>
                    <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=DataList_row["tId"] %>.htm" title="">[<%=(DataList_row["tripType"].ToString() == "1") ? "往返" : "单程"%>] <%=DataList_row["fromCityname"].ToString()%>←→<%=DataList_row["toCityname"].ToString()%> </a></span>
                    <span class="spanthree">￥<%=DataList_row["untaxPrice"].ToString()%> </span>
                    <span class="spanfour"><%=Convert.ToDateTime(DataList_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
                 </li>
		      <%} %>
		    </ul>

			<ul class="twolinebox_ulthree add_01ff" style="height:225px;">
		      <%for(int i=40;i<DataList.Count&&i<48;i++) %>
		      <%{ %>
		            <%System.Data.DataRow DataList_row = DataList[i];%>
                 <li class="three" onMouseOver="this.style.background='#F4F4F4'" onMouseOut="this.style.background=''" >
                    <span class="spanone"><img src="http://www.fei580.com/<%=DataList_row["smallPic"].ToString()%>" alt="" /><code><a href="http://www.fei580.com/airline/<%=DataList_row["airline"]%>.htm"><%=DataList_row["airname"].ToString()%></a></code></span>
                    <span class="spantwo"><a href="http://www.fei580.com/ticket_<%=DataList_row["tId"] %>.htm" title="">[<%=(DataList_row["tripType"].ToString() == "1") ? "往返" : "单程"%>] <%=DataList_row["fromCityname"].ToString()%>←→<%=DataList_row["toCityname"].ToString()%> </a></span>
                    <span class="spanthree">￥<%=DataList_row["untaxPrice"].ToString()%> </span>
                    <span class="spanfour"><%=Convert.ToDateTime(DataList_row["tosaleDate"].ToString()).ToShortDateString()%> </span>
                 </li>
		      <%} %>
		     </ul>

        </div>
        <%} %>
      </div>
      
      <div class="twolinebox_newsixbox">
      <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" LastPageText="末页" NextPageText="下一页" PageSize="48" PrevPageText="上一页" ShowPageIndexBox="Always"   SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" UrlPaging="true" AlwaysShow="True"></webdiyer:AspNetPager>
      </div>
      
      </div>
      
    <!--twolinebox end-->

    <!--sixlinebox start-->
 <uc1:footControl ID="FootControl" runat="server" />
    <!--footer end-->

    </form>
    </div>
</body>
</html>
