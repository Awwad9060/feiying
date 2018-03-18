<%@ Page Language="C#" AutoEventWireup="true" CodeFile="mypwdedit.aspx.cs" Inherits="person_mypwdedit" %>
<%@ Register Src="../share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="../share/footControl.ascx" TagName="footControl" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改密码-飞瀛网</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../css/person.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="../js/index.js"></script>
    <meta name="Description"  content="飞瀛网" />
    <meta name="keywords" content="飞瀛网" />
    <script type="text/javascript" language="javascript" defer="defer">
      //表单验证
     function checkperregister()
     {
        var username = document.getElementById("username");
        if(username.value=='')
        {
            alert('请填写您的姓名！');
            return false;
        }
        
        var nickname = document.getElementById("nickname");
        if(nickname.value=='')
        {
            alert('请填写您的昵称！');
            return false;
        }
      
        var email = document.getElementById("email");
        if(email.value=='')
        {
            alert('请填写您的邮箱！');
            return false;
        }
       
     }
     </script>
</head>
<body>
    <div class="mainbody" >
    <form id="form1" runat="server">
 <!--header start-->
<div class="headertop"><span><img src="../images/home.jpg" alt="飞瀛网" /><img src="../images/homeinfor.jpg" alt="国际机票专家" />国际、国内机票服务热线：4008-850-663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com" title="飞瀛网"><img src="../images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
    <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="../login.aspx" title="">会员登录</a>|<a href="../regAgree.aspx" title="会员注册">会员注册</a>
    <%
        }
        else
        {
     %>
    <a href="../person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="../person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="../person/myinfo.aspx" title="">个人中心</a>|<a href="../logout.aspx" title="">退出登录</a>
    <%}
         %> 
    </div>
    <ul class="menu_1">
      <li class="two"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="../recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="../international.aspx" title="国际机票">国际机票</a></li>
      <li class="two"><a href="../ticket" title="国内机票">国内机票</a></li>
      <li class="two"><a href="../hotel" title="特价酒店">特价酒店</a></li>
      <li class="two"><a href="../quan.aspx"title="飞瀛圈" target="_blank">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="/sm/" title="飞瀛服务">飞瀛服务</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="../images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="../airline.aspx" title="航空公司">航空公司</a></li>
	      <li class="two"><a href="../airport.aspx" title="世界机场">世界机场</a></li>
	      <li class="two"><a href="../airplane.aspx" title="民航机型">民航机型</a></li>
	      <li class="two"><a href="../news.aspx" title="">新闻资讯</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
  </div>
</div>


    <div style="margin:0px auto;width:953px;">

      <div class="persontopnav">你当前的积分是：<code><%=memberitem.Mem_Money%></code><span>赶快兑换吧!</span></div>
       <div class="person_leftboxtwo">
         <h2>个人中心主页</h2>
         <ul>
          <li><a class="person_leftboxtwo_out" href="myinfo.aspx" title="个人资料">个人资料</a><a class="person_leftboxtwo_out" href="myticket.aspx" title="我的机票">我的机票</a></li>
          <li><a class="person_leftboxtwo_out" href="../quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a><a class="person_leftboxtwo_out" href="../quanPublish.aspx" title="我的话题">发表话题</a><a class="person_leftboxtwo_out" href="../quanList.aspx?username=<%=Session["Mem_LoginName"]%>" title="">我的话题</a></li>
          <li><a class="person_leftboxtwo_out" href="http://quan.fei580.com" title="" target="_blank">飞瀛社区</a></li>
          <li><a class="person_leftboxtwo_out" href="../prizes.aspx" title="" target="_blank">兑换奖品</a></li>
          <li style="background:none;"><a class="person_leftboxtwo_on" href="mypwdedit.aspx" title="修改密码">修改密码</a><a class="person_leftboxtwo_out" href="myfeedlist.aspx" title="意见反馈">意见反馈</a></li>
         </ul>
       </div> 
       
      <div class="person_rightbox" style="width:719px;">
      
           
           <div class="person_rightboxone">
 
             <img src="../images/person012.jpg" alt="" style="float:left;margin-top:40px;" />
             <div class="person_rightboxtwo person_rightboxfour">
               <table cellpadding="0" cellspacing="14">
                 <tr>
                   <th>原密码：</th>
                   <td><input id="pwd1" runat="server" type="password" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>新密码：</th>
                   <td><input id="pwd2" runat="server" type="password" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>确认密码：</th>
                   <td><input id="pwd3" runat="server" type="password" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th></th>
                   <td><asp:Button ID="But_submit" runat="server" CssClass="person_submitfour" Text="提&nbsp;&nbsp;交" OnClick="But_submit_Click" /></td>
                 </tr>
                
               </table>
               
               
             </div>
                
               
             <img src="../images/person013.jpg" alt="" style="float:left;" />
             
               
           </div>
          
          
          
      
        <div class="smallright_threebox">
         <ul class="smallright_threeboxtitle">
           <li class="one" id="weekRec" onclick="showPicRec('weekRec','feiRec');">本周特价</li>
           <li class="two" id="feiRec" onclick="showPicRec('feiRec','weekRec');">飞瀛精选</li>
         </ul>
<div class="clearbox">
         <ul class="smallright_threeulone" id="weekRec_ul">
        
        <%
            if (recommendThree.Count != 0)
            {

                for (int i = 0; i < recommendThree.Count; i++)
                {
                    System.Data.DataRow recommendThree_row = recommendThree[i];
                 %>
           <li class="one"><a href="../<%=recommendThree_row["ticketUrl"].ToString()%>" title="" target="_blank"><img src="../<%=recommendThree_row["ticketPic"].ToString()%>" alt="" width="161px" height="148px" /></a></li>
           <li class="two"><a href="../<%=recommendThree_row["ticketUrl"].ToString()%>" title="" target="_blank"><%=recommendThree_row["title"].ToString()%></a><br /><strong><%=recommendThree_row["price"].ToString()%></strong></li>
           <%
            }
        }
              %>
             </ul>
            
         <ul class="smallright_threeulone" id="feiRec_ul" style="display:none;">
        
        <%
            if (recommendFour.Count != 0)
            {

                for (int i = 0; i < recommendFour.Count; i++)
                {
                    System.Data.DataRow recommendFour_row = recommendFour[i];
                 %>
           <li class="one"><a href="../<%=recommendFour_row["ticketUrl"].ToString()%>" title="" target="_blank"><img src="../<%=recommendFour_row["ticketPic"].ToString()%>" alt="" width="161px" height="148px" /></a></li>
           <li class="two"><a href="../<%=recommendFour_row["ticketUrl"].ToString()%>" title="" target="_blank"><%=recommendFour_row["title"].ToString()%></a><br /><strong><%=recommendFour_row["price"].ToString()%></strong></li>
           <%
            }
        }
              %>
             </ul>
</div>
       </div>
           
        
      </div>
      
    </div>
       

 
    </form>
    <uc2:footControl ID="FootControl" runat="server" />
    </div>
</body>
</html>
