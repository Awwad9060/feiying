<%@ Page Language="C#" AutoEventWireup="true" CodeFile="contrast.aspx.cs" Inherits="contrast" %>

<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta content="all" name="robots" />
<title>机票智能对比--飞瀛网</title>
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
</head>
<body>
<div class="mainbody">
 <form id="form1" runat="server">
<!--header start-->
<div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
     <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="http://www.fei580.com/login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>
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
      <li class="one"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <li class="two"><a href="http://www.fei580.com/ticket" title="国内机票">会员专区</a></li>
       <li class="two"><a rel="nofollow" href="http://www.booking.com/index.zh.html?aid=345062" target="_blank" title="国际酒店">国际酒店</a></li>
     <!--<li class="two"><a href="http://www.booking.com/index.html?aid=347436" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/sm/" title="关于飞瀛">关于飞瀛</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="http://www.fei580.com/airline.aspx" title="">航空公司</a></li>
	      <li class="two"><a href="http://www.fei580.com/airport.aspx" title="">世界机场</a></li>
	      <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="">民航机型</a></li>
	      <li class="two"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	    </ul>

            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
    <div class="header_nav">您现在位置：<a href="http://www.fei580.com">飞瀛首页</a>&gt;<a href="http://www.fei580.com/international.aspx">国际机票</a>&gt;<a href="http://www.fei580.com/contrast.aspx" title="">机票对比</a></div>

  </div>
</div>
<!--header end-->
<div style="margin:0px auto;width:957px;position:relative;">

  
  <div class="Contrast_title">机票智能比较</div>
  
  <table cellpadding="0" cellspacing="0" class="Contrast_table">
    <tr>
      <td class="Contrast_td"  width="150px"  style="background:#F6F6F6;font-size:15px;">机票航线</td>
      
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
      <td class="Contrast_td"  style="font-size:15px;"><a href="http://www.fei580.com/ticket_<%=DataRow[n]["tId"]%>.htm" target="_blank"><%=DataRow[n]["fromCityname"]%>-<%=DataRow[n]["toCityname"]%></a><a href="http://www.fei580.com/contrast.aspx?delId=<%=DataRow[n]["tId"]%>" title="" ><img src="http://www.fei580.com/images/remove.gif" alt="移除机票" border"0"/></a></td>
      <%
          }
      }
       %>
      </tr>
    <tr>
      <th><div class="Contrast_box">航空公司</div></th>
     
        <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
     <td><img src="http://www.fei580.com/<%=DataRow[n]["smallPic"]%>" alt="" /><a href="http://www.fei580.com/airline/<%=DataRow[n]["airId"]%>.htm"><%=DataRow[n]["airname"]%></a></td>
       <%
          }
      }
       %>
        </tr>
    <tr>
      <th><div class="Contrast_box">价格</div></th>
    <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
     <td><code>CYN <%=DataRow[n]["untaxPrice"]%></code>&nbsp;</td>  
      <%
          }
      }
       %>

    
    </tr>
    <tr >
      <th><div class="Contrast_box">行程</div></th>
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
        %>
      <td><%=(DataRow[n]["tripType"].ToString()=="1")?"往返":"单程"%>&nbsp;</td>
    
      <%
          }
      }
       %>
     
    </tr>
    <tr >
      <th><div class="Contrast_box">航位</div></th>
   
    <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["seatShip"]%>&nbsp;</td>
           <%
          }
      }
       %>
 
    </tr>
    <tr>
      <th><div class="Contrast_box">出发地</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["fromCityname"]%>&nbsp;</td>
           <%
          }
      }
       %>
       
    </tr>
    <tr>
      <th><div class="Contrast_box">目的地</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["toCityname"]%>&nbsp;</td>
           <%
          }
      }
       %>
      
    </tr>
    <tr>
      <th><div class="Contrast_box">出发地机场</div></th>
     <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["fAirportName"]%>&nbsp;</td>
           <%
          }
      }
       %>
      
    </tr>
    <tr>
      <th><div class="Contrast_box">目的地机场</div></th>
    <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["tAirportName"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">中转机场</div></th>
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["relayPort"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">免费行李额</div></th>
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["bagPrice"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">回程并不订期票</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["returnTip"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">客票类型</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["engerTicket"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">最短停留时间</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["shortstayDate"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">最长停留时间</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["longstayDate"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">开始售票时间</div></th>
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=Convert.ToDateTime(DataRow[n]["fromsaleDate"]).ToShortDateString()%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">结束售票时间</div></th>
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=Convert.ToDateTime(DataRow[n]["tosaleDate"]).ToShortDateString()%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">开始旅行日期</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=Convert.ToDateTime(DataRow[n]["fromtripDate"]).ToShortDateString()%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">截止出发日期</div></th>
     <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=Convert.ToDateTime(DataRow[n]["totripDate"]).ToShortDateString()%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">旺季附加费</div></th>
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["attPrice"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">儿童/婴儿/折扣</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["childPrice"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">退款条款</div></th>
       <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["returnMoney"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th><div class="Contrast_box">改期条款</div></th>
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
         <td><%=DataRow[n]["updateProvision"]%>&nbsp;</td>
           <%
          }
      }
       %>
    </tr>
    <tr>
      <th valign="top"><div class="Contrast_box">限制条款</div></th>
     
      <% 
          if (DataRow.Length != 0)
          {
              for (int n=0; n < DataRow.Length; n++)
              {
         %>
      <td valign="top">
	      <div class="yutishinfor addpad">
			<%=DataRow[n]["limitProvision"]%>
				</div>
      </td>
      <%
          }
      }
       %>
    </tr>
  </table>
  
</div>
  <uc1:footControl ID="FootControl" runat="server" />
    </form>
 </div>
</body>
</html>
