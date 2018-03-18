<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prizes.aspx.cs" Inherits="prizes" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" /> 
<meta http-equiv="Cache-Control" content="no-siteapp" />  
<meta name="applicable-device" content="pc,mobile"> 
<meta name="MobileOptimized" content="width"/> 
<meta name="HandheldFriendly" content="true"/>
<title>兑换礼品_国际机票预订积分换礼 - 飞瀛网</title>
<meta name="description" content="飞瀛网国际机票预订积分换礼品服务。凡在飞瀛网查询预订国际机票成功皆可积分，累积积分可以兑换相应的积分礼品。预订热线：400-885-0663" />
<meta name="robots" content="index,follow" />
<link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<link rel="canonical" href="http://www.fei580.com/prizes.aspx" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/jquery.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/index.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/JQuery.cookie.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/ticket.search.js"></script>
 <script type="text/javascript">
	 function goUrl(value){
	 location.href='prizes.aspx?typeId=<%=typeId %>&orderField='+value;
	 }
	 </script> 　
</head>
<body>
    <div class="mainbody" style="margin-top:-19px;" >
    <form id="form1" runat="server"><!--header start--><div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="飞瀛网" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="国际机票专家" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
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
        <a href="person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="person/myinfo.aspx" title="">个人中心</a>|<a href="logout.aspx" title="">退出登录</a>
        <%}
             %> 
        </div>
        <ul class="menu_1">
          <li class="two"><a href="http://www.fei580.com/" title="首页">首&nbsp;页</a></li>
          <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
          <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
          <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
          <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
          <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
          <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
          <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
          <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a></li>
          <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
          <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="new" /></li>
        </ul>
        <div class="menubottom">
	        <ul class="nohidden">
	          <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司">航空公司</a></li>
	          <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
	          <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型">民航机型</a></li>
	          <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯">新闻资讯</a></li>
	          <li class="one"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	        </ul>
                <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
        <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="飞瀛网首页">飞瀛网</a>&gt;<a href="http://www.fei580.com/prizes.aspx">积分换礼</a>&gt;<a href="http://www.fei580.com/prizes.aspx?typeId=<%=typeId %>" title="<%=typeName %>"><%=typeName %></a></div>
      </div>
    </div>
    <!--header end-->

     
    <div style="margin:0px auto;width:960px;position:relative;">
      
      <div class="lottery_left">
	      <div class="smallright_one">
           <div class="smallright_onetitle">飞瀛圈子</div>
           <% if (Session["Mem_LoginName"] != null)
              { %>
           <div class="smallright_onebox">
             <ul class="smallright_ulone">
               <li class="one"><strong><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈子" class="bluestr"><%=Session["Mem_LoginName"].ToString() %></a></strong><br />圈子欢迎您！</li>
               <li class="two">积分：<strong><%=Session["Mem_Money"].ToString()%></strong></li>
               <li class="three">
                 <p><a href="http://www.fei580.com/quanPublish.aspx" title="" class="white">发话题</a></p>
                 <p><a href="http://www.fei580.com/prizes.aspx" title="" class="white">兑奖品</a></p>
               </li>
             </ul>
             
              <%
       string headpic = "http://www.fei580.com/images/onein029.jpg";
       if (Session["Mem_Pic"] != null && Session["Mem_Pic"].ToString()!="")
       {
           headpic  =Session["Mem_Pic"].ToString();
       }
      %>
      
             <ul class="smallright_ultwo">
               <li class="one"><a href="http://www.fei580.com/person/myinfo.aspx" title="个人资料"><img alt="个人资料" height="64px" src="<%=headpic%>" width="69px" /></a></li>
               <li class="two">
                 <p><a href="http://www.fei580.com/quan.aspx" title="">进入圈子</a></p>
                 <p><a href="http://www.fei580.com/person/myinfo.aspx" title="">修改资料</a></p>
               </li>
             </ul>

             <div class="smallright_clear"><a href="http://www.fei580.com/logout.aspx" title="退出登录">退出登录</a></div>
             <div class="smallright_clearbottom">了解我的积分怎么用<br />我可以换取哪些奖品</div>
             
           </div>
           <img src="http://www.fei580.com/images/onein028.jpg" style="float:left;"/>
	       <%
               }else{
           %>
	   <div class="smallright_onebox" style="height:165px;padding-top:3px;">
         <ul class="hotel_ulone">
           <li class="one">用户<input type="text" id="shortname" runat="server" /></li>
           <li class="one">密码<input type="password" id="pwd1" runat="server" /><span id="lblerrmes" style="color:Red;"></span></li>
           <li class="two"><input id="btnok" type="button" class="hotel_submit" /><input type="checkbox" checked="checked" />记住我</li>
           <li class="three"><a href="http://www.fei580.com/regAgree.aspx" title="注册">注册会员</a><br /><a href="http://www.fei580.com/news.aspx" title="帮助中心">新闻中心</a></li>
         </ul>
       </div>
       <script type="text/javascript">
           var tl = new TicketLogin('http://www.fei580.com/prizes.aspx');
       </script>
       <img src="http://www.fei580.com/images/vbcc.jpg" style="float:left;" />
	       <%
	        }
	        %>
       </div>
            <div class="lottery_ad">
             <a href="http://www.fei580.com/sm/3.htm" title=""><img alt="积分规则" height="36px" src="http://www.fei580.com/images/lottery01.jpg" width="174px" /></a>
		     <a href="http://www.fei580.com/sm/5.htm" title=""><img alt="兑换说明" height="36px" src="http://www.fei580.com/images/lottery02.jpg" width="174px" /></a>
		    </div>
		    <div class="lottery_lefttitle">最新奖品上线榜</div>
		    <div class="lottery_leftbox">
			    <ul class="newsdoc_rightul">
			    <%
                   if (newPrizes.Count != 0)
                     {

                         for (int i = 0; i < newPrizes.Count; i++)
                         {
                             System.Data.DataRow newPrizes_row = newPrizes[i];
                     %>
	          <li><a href="http://www.fei580.com/prizes/<%=newPrizes_row["pId"].ToString()%>.htm" target="_blank"><%=newPrizes_row["pName"].ToString()%></a></li>
	          <%
                  }
              }
                    %>

			      </ul>
	        </div>
		    <img src="images/lottery03.jpg" style="float:left;" />

		    <div class="lottery_ad">
             <a href="http://www.fei580.com/quan.aspx"><img alt="如何赚取积分" height="42px" src="http://www.fei580.com/images/prize02.jpg" width="152px" /></a>
		    </div>
       </div>

       <div class="prize_right">
        <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=778&height=123&id=5"></script>    
	     <ul class="prize_rightulone">
	       <li class="three"><img src="http://www.fei580.com/images/prize03.jpg" alt="商品兑换" /></li>
	       <li class="<%=(typeId==0)? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx" style="color:White">全部商品</a></li>
	       <li class="<%=(typeId==1)? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=1" style="color:White">时尚达人</a></li>
	       <li class="<%=(typeId==2)? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=2" style="color:White">数码精品</a></li>
	       <li class="<%=(typeId==3)? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=3" style="color:White">旅行专家</a></li>
	       <li class="<%=(typeId==4)? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=4" style="color:White">机票折扣</a></li>
	       <li class="<%=(typeId==5)? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=5" style="color:White">酒店住宿</a></li>
	     </ul>
	     <img src="http://www.fei580.com/images/prize04.jpg" style="float:left;" />
	     <div class="prize_rightbox">
	       <div class="prize_rightboxone">
	         <code><input type="radio"  id="radio1" name="radioFile" runat="server"  onclick="goUrl('getNum')"/>兑换排名<img src="http://www.fei580.com/images/prize06.jpg" /><input type="radio" id="radio2"  name="radioFile" runat="server" onclick="goUrl('needScore')" />积分排序<img src="http://www.fei580.com/images/prize06.jpg" /></code>
		     <p><span><strong>提示：</strong>积分不够，想换大礼？快来抽奖，试试手气如何!</span></p>
	       </div>
	       <ul class="prize_rightultwo clearfix">
	       <asp:Repeater ID="prizesList" runat="server">
	           <ItemTemplate>
	         <li><a href="http://www.fei580.com/prizes/<%# Eval("pId") %>.htm" target="_blank"><img src="http://www.fei580.com/<%#DataBinder.Eval(Container.DataItem, "picPath")%>" alt="" width="94px" height="94px" /></a><a href="http://www.fei580.com/prizes/<%# Eval("pId") %>.htm" target="_blank"><%#DataBinder.Eval(Container.DataItem, "pName")%></a><span>-<strong><%#DataBinder.Eval(Container.DataItem, "needScore")%>分</strong>-</span></li>
	   	       </ItemTemplate>
		    </asp:Repeater>
	   	    </ul>
	       <div class="prize_rightnav"><webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" HorizontalAlign="Center"  LastPageText="末页" NextPageText="下一页" PageSize="20" PrevPageText="上一页"   SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" UrlPaging="true" AlwaysShow="True"></webdiyer:AspNetPager></div>
	     </div>　　 　     
	     <img src="http://www.fei580.com/images/prize05.jpg" style="float:left;" />　
       </div>

    </div>
      </form>
      
  <uc1:footControl ID="FootControl" runat="server" />
  </div>
 </body>
</html>