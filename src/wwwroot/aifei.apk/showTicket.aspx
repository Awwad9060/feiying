<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showTicket.aspx.cs" Inherits="showticket" %>
<%@ Register Src="~/share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="~/share/footControl1.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<title><%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票_<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票预订_<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票特价￥<%=ticketOne["untaxPrice"]%>-飞瀛网</title>
<meta name="Description"  content="<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票查询预订，<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票特价￥12565。飞瀛网提供最新实时<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票航班价格及预订服务。" />
<meta name="keywords" content="<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票,<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票查询,<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票预订" />
<link href="css/main.css" rel="stylesheet" type="text/css" />
<link href="css/index.css" rel="stylesheet" type="text/css" />
<link href="css/hotcity.css" rel="stylesheet" type="text/css" />
<link href="css/datepicker.css" rel="stylesheet" type="text/css"/>
<script src="js/index.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery-1.4.2.min.js"></script>
<script src="js/postdata.js" type="text/javascript"></script>
<script type="text/javascript">
    $(document).ready(function() {
        //日期控件
        TripBackDate(document.getElementById("tripDate"), document.getElementById("backDate"));
        //日期控件
        TripBackDate(document.getElementById("fDate"), document.getElementById("tDate"));
    });
    //查询机型
    function SearchAifeiPlan(from, to, airline) {
        var url = "share/AifeiInfoRequest.aspx";
        $.ajax({
            type: "get",
            cache: false,
            url: url + "?from=" + from + "&to=" + to + "&airline=" + airline,
            success: function(data) {
                if (data == "false")
                    return;

                $("#ticketplan").html(data);
            },
            error: function() {
                return;
                //alert('验证数据异常！');
            }
        });
    }
</script>

</head>
<body>
<div class="mainbody" >
 <form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="images/home.jpg" alt="" /><img src="images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="#" title=""><img src="images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
      <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="会员登录" rel="nofollow">会员登录</a>|<a href="regAgree.aspx" title="会员注册" rel="nofollow">会员注册</a>|<a href="/sm/" title="飞瀛服务" rel="nofollow">关于飞瀛</a>
    <%
        }
        else
        {
     %>
    <a href="person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="person/myinfo.aspx" title="">个人中心</a>|<a href="logout.aspx" title="">退出登录</a>
    <%}
         %> 
    </div>   <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com" title="首页" rel="nofollow">首&nbsp;页</a></li>
      <li class="two"><a href="recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="one"><a href="international.aspx" title="国际机票">国际机票</a></li>
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="/visa.html" title="国际签证" rel="nofollow">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com/" target="_blank" title="国际酒店" rel="nofollow">国际酒店</a></li>
      <!--<li class="two"><a href="hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="quan.aspx" title="飞瀛圈" rel="nofollow">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="airline.aspx" title="航空公司" rel="nofollow">航空公司</a></li>
	      <li class="two"><a href="airport.aspx" title="世界机场" rel="nofollow">世界机场</a></li>
	      <li class="two"><a href="airplane.aspx" title="民航机型" rel="nofollow">民航机型</a></li>
	      <li class="two"><a href="news.aspx" title="新闻资讯" rel="nofollow">新闻资讯</a></li>
	      <li class="two"><a href="prizes.aspx" title="积分广场" rel="nofollow">积分广场</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
	<div class="header_nav">您现在位置：<a href="http://www.fei580.com" title="飞瀛首页" rel="nofollow">飞瀛首页</a>&gt;<a href="international.aspx" title="国际机票">国际机票</a>&gt;&nbsp;<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票</div>
  </div>
</div>
<!--header end-->

 <%
              string xingcheng = "往返";
		        if(ticketOne["tripType"].ToString()=="0"){
                xingcheng = "单程";
		   }      
		   %>
<div style="margin:0px auto;width:970px;position:relative;">


  <div class="In_inlinebutton"><a href="javascript:addCompare('<%=ticketOne["tId"]%>','<%=xingcheng%>  <%=ticketOne["fromCityname"]%>-<%=ticketOne["toCityname"]%>','￥<%=ticketOne["untaxPrice"]%>');" rel="nofollow">加入比较</a></div>
  <!--onlinebox start-->
  <div class="In_inlineonlinebox">
    <div class="In_onlineboxleftbg">
      <img src="images/In_inline02.jpg" alt="航线" style="float:left;" />
	  
	  <div class="In_onlineboxright">
		  <table cellpadding="0" cellspacing="0" class="In_onlinetable">
			<tr>
			  <th class="In_thclass" valign="top">
			  
				<table cellpadding="0" cellspacing="10" class="In_onlinetablethree">
				  <tr>
					<td class="hstrongtd" valign="top">
					  <h2><%=ticketOne["fromCityname"]%> (<%=ticketOne["fromCityCode"]%>)</h2>
					  <p><a href="airportDetail.aspx?apId=<%=ticketOne["fromPort"]%>" title="<%=ticketOne["fAirportName"]%>(<%=ticketOne["fAirportCode"]%>)" target="_blank"><%=ticketOne["fAirportName"]%>(<%=ticketOne["fAirportCode"]%>)</a><br /><span><a href="airportDetail.aspx?apId=<%=ticketOne["fromPort"]%>" title="<%=ticketOne["fAirportName"]%>简介" target="_blank" rel="nofollow">机场简介</a></span><span><a href="airportDetail.aspx?apId=<%=ticketOne["fromPort"]%>" title="<%=ticketOne["fAirportName"]%>地图" target="_blank" rel="nofollow">机场地图</a></span><span><a href="airportDetail.aspx?apId=<%=ticketOne["fromPort"]%>" title="<%=ticketOne["fAirportName"]%>交通" target="_blank" rel="nofollow">机场交通</a></span></p>
					</td>
					<td rowspan="2">
				
					<img src="images/tripType<%=ticketOne["tripType"]%>.gif" alt="" style="vertical-align:middle;" />
					
					</td>
				  </tr>
				  <tr>
					<td  valign="top">
					<h2><%=ticketOne["toCityname"]%> (<%=ticketOne["toCityCode"]%>)</h2>
					  <p><a href="airportDetail.aspx?apId=<%=ticketOne["toPort"]%>" title="<%=ticketOne["tAirportName"]%>(<%=ticketOne["tAirportCode"]%>)" target="_blank"><%=ticketOne["tAirportName"]%>(<%=ticketOne["tAirportCode"]%>)</a><br /><span><a href="airportDetail.aspx?apId=<%=ticketOne["toPort"]%>" title="<%=ticketOne["tAirportName"]%>简介" rel="nofollow" target="_blank">机场简介</a></span><span><a href="airportDetail.aspx?apId=<%=ticketOne["toPort"]%>" title="<%=ticketOne["tAirportName"]%>地图" rel="nofollow" target="_blank">机场地图</a></span><span><a href="airportDetail.aspx?apId=<%=ticketOne["toPort"]%>" title="<%=ticketOne["tAirportName"]%>交通" rel="nofollow" target="_blank">机场交通</a></span></p>					
					</td>
				  </tr>
				</table>
			  </th>
			  <td class="In_tdclass">
			   
			   <ul class="In_onlineul">
				 <li class="one"><img src="<%=ticketOne["logoPic"]%>" alt=""  /></li>
				 <li class="two"><%=ticketOne["airname"]%></li>
				 <li class="three">机队情况：<%=ticketOne["planNum"]%>&nbsp;&nbsp;&nbsp;平均机龄：<%=ticketOne["age"]%></li>
				 <li class="three"><a href="airlineDetail.aspx?aId=<%=ticketOne["airId"]%>" title="进入航空公司专区" rel="nofollow">进入航空公司专区</a></li>
			   </ul>
			  
			  </td>
			  <td class="In_tdclass">
			  
				<div class="In_onlinetabletwo">
				  <img src="images/In_inline012.jpg" alt="航线评分" style="float:left;" />
				  <ul>
				    <li class="one"><p>航线积分<code><%=ticketOne["score"]%>+<%=ticketOne["score"]%></code></p></li>
				    <li class="two">飞瀛人综评</li>
					<li class="three"><img src="images/In_inline_num_<%=ticketOne["zongping"]%>.jpg" alt="" /></li>
				    <li class="two">喜爱度</li>
					<li class="three"><img src="images/In_inline_num_<%=ticketOne["xiai"]%>.jpg" alt="" /></li>
				    <li class="two">消费度</li>
					<li class="three"><img src="images/In_inline_num_<%=ticketOne["xiaofei"]%>.jpg" alt="" /></li>
				    <li class="two">飞行满意度</li>
					<li class="three"><img src="images/In_inline_num_<%=ticketOne["manyi"]%>.jpg" alt="" /></li>
				    <li class="two">航空服务态度</li>
					<li class="three"><img src="images/In_inline_num_<%=ticketOne["fuwu"]%>.jpg" alt="" /></li>
				    <li class="four"><img src="images/In_inline05.jpg" alt="" /><a href="#" title="" rel="nofollow">关注航线社区</a><img src="images/In_inline05.jpg" alt="" /><a href="#" title="" rel="nofollow">我要评论</a></li>
				  </ul>
				</div>
			  
			  </td>
			</tr>
		  </table>
		  
		  <ul class="In_onlineultwo">
		    <%if (ticket_7.Count != 0)
        {
            string tickeAndAirlines = "";
             %>
		    <li class="one">7天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			    <%int j = 0; %>
			    <% for (int i = 0; i < ticket_7.Count; i++)
                {
                 
              System.Data.DataRow ticket_7_row = ticket_7[i];

              string tickeAndAirline = ticket_7_row["untaxPrice"].ToString() + ticket_7_row["airname"].ToString();
              if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
              {
              %>
               <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="ticket_<%=Convert.ToInt32(ticket_7_row["ticketId"].ToString())%>.htm" target="_blank" rel="nofollow"><img src="<%=ticket_7_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_7_row["untaxPrice"].ToString())%></a></td>
			    <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
			
			<%if (ticket_14.Count != 0)
        {
            string tickeAndAirlines = "";
           
         %>
		    <li class="one">14天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			    <%int j = 0; %>
			    <% for (int i = 0; i < ticket_14.Count; i++)
                {
                  System.Data.DataRow ticket_14_row = ticket_14[i];
                  
                  string tickeAndAirline = ticket_14_row["untaxPrice"].ToString() + ticket_14_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
                    <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a href="ticket_<%=Convert.ToInt32(ticket_14_row["ticketId"].ToString())%>.htm" target="_blank" rel="nofollow"><img src="<%=ticket_14_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_14_row["untaxPrice"].ToString())%></a></td>
			  <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     <%for (int i = 0; i < (tmax - j); i++)
                {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
			     
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
			
			
			
			
				<%if (ticket_30.Count != 0)
        {
            string tickeAndAirlines = "";
          %>
		    <li class="one">30天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0" >
			    <tr>
			    <%int j = 0; %>
			    <% for (int i = 0; i < ticket_30.Count; i++)
                {
                  System.Data.DataRow ticket_30_row = ticket_30[i];
                    string tickeAndAirline = ticket_30_row["untaxPrice"].ToString() + ticket_30_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
               <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="ticket_<%=Convert.ToInt32(ticket_30_row["ticketId"].ToString())%>.htm" target="_blank" rel="nofollow"><img src="<%=ticket_30_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_30_row["untaxPrice"].ToString())%></a></td>
			    <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
			
			
			
				<%if (ticket_60.Count != 0)
        {
            string tickeAndAirlines = "";
          %>
		    <li class="one">60天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_60.Count; i++)
                {
                  System.Data.DataRow ticket_60_row = ticket_60[i];
                   string tickeAndAirline = ticket_60_row["untaxPrice"].ToString() + ticket_60_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="ticket_<%=Convert.ToInt32(ticket_60_row["ticketId"].ToString())%>.htm" target="_blank" rel="nofollow"><img src="<%=ticket_60_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_60_row["untaxPrice"].ToString())%></a></td>
			   <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
             
             
             
				<%if (ticket_90.Count != 0)
        {   string tickeAndAirlines = "";
        
        %>
		    <li class="one">90天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_90.Count; i++)
                {
                    System.Data.DataRow ticket_90_row = ticket_90[i];
                       string tickeAndAirline = ticket_90_row["untaxPrice"].ToString() + ticket_90_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="ticket_<%=Convert.ToInt32(ticket_90_row["ticketId"].ToString())%>.htm" target="_blank" rel="nofollow"><img src="<%=ticket_90_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_90_row["untaxPrice"].ToString())%></a></td>
			    <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
             
             		<%if (ticket_120.Count != 0)
        { string tickeAndAirlines = ""; 
        %>
		    <li class="one">120天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_120.Count; i++)
                {
                    System.Data.DataRow ticket_120_row = ticket_120[i];
                          string tickeAndAirline = ticket_120_row["untaxPrice"].ToString() + ticket_120_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="ticket_<%=Convert.ToInt32(ticket_120_row["ticketId"].ToString())%>.htm" target="_blank" rel="nofollow"><img src="<%=ticket_120_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_120_row["untaxPrice"].ToString())%></a></td>
			   <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
             
             
             
				<%if (ticket_180.Count != 0)
        {
            string tickeAndAirlines = ""; 
          %>
		    <li class="one">180天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_180.Count; i++)
                {
                    System.Data.DataRow ticket_180_row = ticket_180[i];
                              string tickeAndAirline = ticket_180_row["untaxPrice"].ToString() + ticket_180_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="ticket_<%=Convert.ToInt32(ticket_180_row["ticketId"].ToString())%>.htm" target="_blank" rel="nofollow"><img src="<%=ticket_180_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_180_row["untaxPrice"].ToString())%></a></td>
			  <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>"  style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
	
			
					<%if (ticket_365.Count != 0)
       {
           string tickeAndAirlines = ""; 
            %>
		    <li class="one">365天停留期</li>
			<li class="two">
			  <table cellpadding="0" cellspacing="0">
			    <tr>
			     <%int j = 0; %>
			    <% for (int i = 0; i < ticket_365.Count; i++)
                {
                    System.Data.DataRow ticket_365_row = ticket_365[i];
                  string tickeAndAirline = ticket_365_row["untaxPrice"].ToString() + ticket_365_row["airname"].ToString();
                 if (tickeAndAirlines.IndexOf(tickeAndAirline) == -1)
                {
              %>
              <%j = j + 1; %>
				  <td width="<%=100/tmax+"%" %>" bgcolor="#f0f0f0"><a  href="ticket_<%=Convert.ToInt32(ticket_365_row["ticketId"].ToString())%>.htm" target="_blank" rel="nofollow"><img src="<%=ticket_365_row["smallPic"]%>" alt="" />￥<%=Convert.ToInt32(ticket_365_row["untaxPrice"].ToString())%></a></td>
			   <%
                    tickeAndAirlines = tickeAndAirlines + tickeAndAirline+",";
                    }
                }
			     %>
			     			     <%for (int i = 0; i < (tmax - j); i++)
          {%>
			     <td width="<%=100/tmax+"%" %>" style="border:none;border-bottom:1px solid #D6E1E5;<%=(i==(tmax - j)-1)?"border-right:1px solid #D6E1E5;":"" %>" bgcolor="#f0f0f0">&nbsp;</td>
			     <%} %>
				</tr>
			
			  </table>
			</li>
			<li class="three"></li>
		    <%
                }
             %>
	
	
		  </ul>
		  
	  </div>
	  
	  
	  
	</div>
  </div>
  <!--onlinebox end-->
  
  
   <!--twolinebox start-->
    <div class="clearbox">
	  <div class="In_left">
	    <div class="In_lefttitle"><h1><%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票</h1></div>
		<table cellpadding="0" cellspacing="0" class="In_lefttable">
		 
		  
		  <tr>
		     <td align="right">行程</td>
			<td colspan="3">&nbsp;<%=xingcheng%></td>
		  </tr>
		 
		  <tr>
		    <td align="right">航空公司</td>
			<td colspan="3">&nbsp;<img src="<%=ticketOne["smallPic"]%>" alt="<%=ticketOne["airname"]%>" /><a href="airlineDetail.aspx?aId=<%=ticketOne["airId"]%>" target="_blank"><%=ticketOne["airname"]%></a></td>
		  </tr>
		  <tr>
		    <td align="right">出发地</td>
			<td>&nbsp;<%=ticketOne["fromCityName"]%></td>
			<td align="right">目的地</td>
			<td>&nbsp;<%=ticketOne["toCityName"]%></td>
		  </tr>
		  <tr>
		    <td align="right">出发地机场</td>
			<td>&nbsp;<%=ticketOne["fAirportName"]%></td>
			<td align="right">目的地机场</td>
			<td>&nbsp;<%=ticketOne["tAirportName"]%></td>
		  </tr>
		  <asp:Panel ID="pan_aifeitime" runat="server" Visible="true" >
		  <tr>
		    <td align="right">出发时间</td>
			<td>&nbsp;<%=ticketOne["startTime"]%></td>
			<td align="right">到达时间</td>
			<td>&nbsp;<%=ticketOne["arriveTime"]%></td>
		  </tr>
		  </asp:Panel>
		  <tr>
		    <td align="right">中转机场</td>
			<td>&nbsp;<%=ticketOne["relayPort"]%></td>
			<td align="right">免费行李额</td>
			<td>&nbsp;<%=ticketOne["bagPrice"]%></td>
		  </tr>
		  <tr>
		    <td align="right">机型</td>
			<td>&nbsp;<span id="ticketplan"></span></td>
			<td align="right">客票类型</td>
			<td>&nbsp;<%=ticketOne["engerTicket"]%></td>
		  </tr>
		  <tr>
		    <td colspan="4"><div class="yutish">使用条款(请确认使用条款是否符合你的出行需求)</div></td>
		  </tr>
		  <tr>
		    <td align="right">舱位</td>
			<td>&nbsp;<%=ticketOne["seatShip"]%></td>
			<td align="right">不含税价格</td>
			<td>&nbsp;<strong><code style="font-size:18px; color:Red;">CNY<%=ticketOne["untaxPrice"]%></code></strong></td>
		  </tr>
		  <tr>
		    <td align="right">最短停留日期</td>
			<td>&nbsp;<%=ticketOne["shortstayDate"]%>天</td>
			<td align="right">旺季附加费</td>
			<td>&nbsp;<%=ticketOne["attPrice"]%></td>
		  </tr>
		  <tr>
		    <td align="right">最长停留日期</td>
			<td>&nbsp;<%=ticketOne["longstayDate"]%>天</td>
			<td align="right">儿童/婴儿/折扣价</td>
			<td>&nbsp;<%=ticketOne["childPrice"]%></td>
		  </tr>
		 
		  <tr>
		    <td align="right">开始售票日期</td>
			<td>&nbsp;<%=Convert.ToDateTime(ticketOne["fromsaleDate"]).ToShortDateString()%></td>
			<td align="right">结束售票日期</td>
			<td>&nbsp;<%=Convert.ToDateTime(ticketOne["tosaleDate"]).ToShortDateString()%></td>
		  </tr>
		  <tr>
		    <td align="right">开始旅行日期</td>
			<td>&nbsp;<%=Convert.ToDateTime(ticketOne["fromtripDate"]).ToShortDateString()%></td>
			<td align="right">最迟出发日期</td>
			<td>&nbsp;<%=Convert.ToDateTime(ticketOne["totripDate"]).ToShortDateString()%></td>
		  </tr>
		  <tr>
		    <td align="right">退款条款</td>
			<td>&nbsp;<%=ticketOne["returnMoney"]%></td>
			<td align="right">改期条款</td>
			<td>&nbsp;<%=ticketOne["updateProvision"]%></td>
		  </tr>
		  <tr>
		    <td colspan="4"><div class="yutish">限制条款(机票限制条款非常重要，请详细阅读)</div></td>
		  </tr>
		  <tr>
		    <td colspan="4">
			<div class="yutishinfor">
			<%=ticketOne["limitProvision"]%>
			</div>
			</td>
		  </tr>
		  <tr>
		    <td colspan="4">
			  <ul class="In_onlineulthree">
			    <li class="one">温馨提示：由于国际机票情况复杂、操作繁琐，<br />
建议您先致电400-885-0663/020-38039589给我们的操作员再进行支付，谢谢！</li>
                <li class="two">
				  <a href="tencent://message/?uin=32335510&amp;Site=111&amp;Menu=yes" target="_blank" rel="nofollow"><img src="images/qq.gif" alt="QQ" /></a><br />
				  <a href="http://qiao.baidu.com/v3/?module=default&controller=im&action=index&ucid=2415525&type=n&siteid=293251" target="_blank"  rel="nofollow"><img src="images/msn.gif" alt="QQ" /></a>
				</li>
			  </ul>
			</td>
		  </tr>
		  
		</table>
            <script language="javascript" type="text/javascript">
                $(function() {
                SearchAifeiPlan('<%=ticketOne["fromCityCode"]%>', '<%=ticketOne["toCityCode"]%>', '<%=ReadXmlHelper.GetAirLineCodeByID(Convert.ToInt64(ticketOne["airId"]))%>');
                });
            </script>
	  </div>
	  
	  
	  <div class="In_right">
	    <div class="In_righttitle">快速预定</div>
		<div class="In_rightbox">
			<table cellpadding="0" cellspacing="12">
			  <tr>
			    <td align="right">机票</td>
				<td><input id="title" type="text" class="In_rightinput" name="title" value="[<%=(ticketOne["tripType"].ToString()=="1")?"往返":"单程"%>] <%=ticketOne["fromCityName"]%>-<%=ticketOne["toCityName"]%> (￥<%=ticketOne["untaxPrice"]%>)" />
				    <input id="tId" type="hidden" name="tId" value="<%=ticketOne["tId"].ToString()%>" /> 
				</td>
			  </tr>
			  <tr>
			    <td align="right">姓名</td>
				<td><input id="contact" type="text" class="In_rightinput" name="contact"/></td>
			  </tr>
			  <tr>
			    <td align="right">出发日期</td>
				<td><input id="tripDate" type="text" class="In_rightinput" style="width:120px" name="tripDate" /></td>
			  </tr>
			  <tr>
			    <td align="right">返回日期</td>
				<td><input id="backDate" type="text" class="In_rightinput" style="width:120px" name="backDate"  /></td>
			  </tr>
			  <tr>
			    <td align="right">联系电话</td>
				<td><input id="telephone" type="text" class="In_rightinput" name="telephone" /></td>
			  </tr>
			  <tr>
			    <td align="right">紧急预订</td>
				<td><select id="harryGrade" name="harryGrade">
				<option value="不着急">不着急</option>
				<option value="紧急">紧急</option>
				</select></td>
			  </tr>
			  <tr>
			    <td align="right" valign="top">留言</td>
				<td><textarea  id="otherMess" name="otherMess" cols="" rows=""></textarea></td>
			  </tr>
			  <tr>
			    <td align="right">预定数量</td>
				<td>
				 <select  id="num" name="num">
				 <option value="1" selected="selected">1</option>
				  <option value="2">2</option>
				   <option value="3">3</option>
				    <option value="4">4</option>
				     <option value="5">5</option>
				      <option value="6">6</option>
				       <option value="7">7</option>
				        <option value="8">8</option>
				         <option value="9">9</option>
				          <option value="10">10</option>
				 </select>
				</td>
			  </tr>
			  <tr>
			    <td colspan="2" align="center"><input type="button" class="In_rightsubmit" value="" onclick="sendTicketBookMsg()" /></td>
			  </tr>
			   <tr>
			    <td colspan="2" align="center" class="vfontsize"><img src="images/In_inline032.jpg" alt="" />我们将尽快与你联系确认.</td>
			  </tr>
			</table>
		</div>
        <img src="images/In_inline030.jpg" style="float:left" alt="" />

	    <div class="ticketdoc_rightbox">
	      <div class="ticketdoc_righttitle"><strong>热门机票</strong><code>本周TOP10</code></div>
	       <%if (randowTicketF!=null && randowTicketF.Count != 0)
           { %>
	      <ul class="ticketdoc_rightul">
 	        <% for (int i = 0; i < randowTicketF.Count; i++)
                {
                    System.Data.DataRow randow_row = randowTicketF[i];%>
                          <li><a href="ticket_<%=Convert.ToInt32(randow_row["ticketId"].ToString())%>.htm" target="_blank" ><%=randow_row["fromCityName"]%>到<%=randow_row["toCityName"]%>机票</a><span>￥<%=randow_row["untaxPrice"]%></span></li>
                   <% }%>
	      </ul>
	      <%} %>
	    </div>

	  </div>
	  
	  
    </div>
   <!--twolinebox end-->
  
   
  <!--threelinebox start-->
    <h2 class="In_threeboxtitle"><%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票相关推荐&nbsp;-&nbsp;不含税价</h2>
	<div class="In_threeboxline">

		

     <%if (ticket_all.Count != 0)
        { %>
          <% for (int i = 0; i < ticket_all.Count; i++)
                {
                    System.Data.DataRow ticket_all_row = ticket_all[i];%>
	  <ul>
	    <li class="one"><a href="ticket_<%=Convert.ToInt32(ticket_all_row["ticketId"].ToString())%>.htm">[<%=(ticket_all_row["tripType"].ToString()=="1")?"往返":"单程"%>]<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票</a></li>
		<li class="two"><a href="ticket_<%=Convert.ToInt32(ticket_all_row["ticketId"].ToString())%>.htm" rel="nofollow"><%=ticket_all_row["untaxPrice"]%></a></li>
		<li class="three"><img src="<%=ticket_all_row["smallPic"]%>" alt="" /><a href="airlineDetail.aspx?aId=<%=ticket_all_row["airId"]%>"><%=ticket_all_row["airname"]%></a></li>
		<li class="four"><%=ticket_all_row["seatShip"]%></li>
		<li class="four">停留期<%=ticket_all_row["shortstayDate"]%>天-<%=ticket_all_row["longstayDate"]%>天</li>
		<li class="four">最迟出发时间&nbsp;<%=ticket_all_row["totripDate"]%></li>
		<li class="four">最迟出票时间&nbsp;<%=ticket_all_row["tosaleDate"]%></li>
	  </ul>
	  
	  
	   <% }
                }
             %>
	
	</div>
	<div class="ck_xg_b"></div>
  <!--threelinebox end-->
 
 <div class="clear"></div>
 <div id="duilianb02" style="display:none;">
  
 <div  id="tipbi1" style="width:242px;display:none;">
     <div class="dubi_boxtitle"><a href="javascript:showCompare('tipbi1')" rel="nofollow">收回&gt;&gt;</a></div>
     <div class="dubi_boxtwo">
	   <ul id="compareList">
	   </ul>
	   <p><input type="button" value="比较机票" onclick="window.open('contrast.aspx')" /> </p>
	 </div>
</div>


  <div class="dubi_box" id="compareBut">
   <a href="javascript:showCompare('tipbi1')">&nbsp;</a>
  <input onclick='closeCompareBut()' type="button" alt="" />
  </div>
  	    <script type="text/javascript">  	        Compare_show();</script>
</div>
<script src="js/scrolljs02.js" type="text/javascript"></script>
</div>
 <uc1:footControl ID="FootControl" runat="server" />
</form>
</div>

<script type="text/javascript">
addHistory('<%=ticketOne["fromCityname"]%>-<%=ticketOne["toCityname"]%>','￥<%=ticketOne["untaxPrice"]%>','showticket.aspx?tId=<%=ticketOne["tId"]%>')
</script>


 <div class="clear"></div>
<div id="duilian02" style="top:400px;left:0px;" class="kf_2012_box">
    <div class="kf_2012_lbox">
	    <img src="images/kf_l.gif" border="0" usemap="#Map3" />
        <map name="Map3" id="map4">
            <area style="cursor:pointer;" onclick='show(1)' shape="rect" coords="4,12,26,101" href="javascript:void(0);" />
            <area style="cursor:pointer;" onclick='show(2)' shape="rect" coords="3,110,26,201" href="javascript:void(0);" />
        </map>
    </div>
    <div id="tip4341" class="kf_2012_rbox1" style="display:block">
	    <img src="images/kf_r1.gif" border="0" usemap="#Map" />
	    <input id="eMsg_tel" type="text" class="kf_2012_input" />
        <map name="Map" id="map5">
            <area shape="rect" style="cursor:pointer;" coords="237,5,267,31" onclick='show("tip4341")' href="javascript:void(0);" />
            <area shape="rect" style="cursor:pointer;" coords="186,110,259,138" onclick="sendTelMsg()" href="javascript:void(0);"  />
            <area shape="rect" style="cursor:pointer;" coords="123,160,260,183" href="http://qiao.baidu.com/v3/?module=default&controller=im&action=index&ucid=2415525&type=n&siteid=293251" onclick="_czc.push(['_trackEvent', '航班详情页','咨询','点击']);" rel="nofollow" target="_blank" title="在线客服" />
        </map>
    </div>
	<div id="tip4342" class="kf_2012_rbox2" style=" display:none" >
	    <img src="images/kf_r2.gif" border="0" usemap="#Map2" />
        <map name="Map2">
            <area shape="rect" style="cursor:pointer;" coords="237,5,267,31" onclick='show("tip4342")' href="javascript:void(0);" />
            <area shape="rect" style="cursor:pointer;" coords="83,36,256,62" href="http://qiao.baidu.com/v3/?module=default&controller=im&action=index&ucid=2415525&type=n&siteid=293251" onclick="_czc.push(['_trackEvent', '航班详情页','咨询','点击']);" rel="nofollow" target="_blank" title="在线客服" />
            <area shape="rect" style="cursor:pointer;" coords="84,72,167,98" href="tencent://message/?uin=32335510&amp;Site=111&amp;Menu=yes" />
            <area shape="rect" style="cursor:pointer;" coords="84,100,167,123" href="tencent://message/?uin=1713133229&amp;Site=111&amp;Menu=yes" />
            <area shape="rect" style="cursor:pointer;" coords="83,127,167,147" href="tencent://message/?uin=531658630&amp;Site=111&amp;Menu=yes" />
            <area shape="rect" style="cursor:pointer;" coords="173,71,258,96" href="msnim:chat?contact=gzfeiyue_carol@hotmail.com" />
            <area shape="rect" style="cursor:pointer;" coords="172,126,256,149" href="msnim:chat?contact=feiying_yo@msn.cn" />
            <area shape="rect" style="cursor:pointer;" coords="173,99,256,122" href="msnim:chat?contact=gzfeiyue_ivy@hotmail.com" />
        </map>
    </div>
</div> 
<script type="text/javascript" src="js/datepicker.js"></script>
<script language="javascript" src="js/scrolljs.js" type="text/javascript"></script>
</body>
</html>
