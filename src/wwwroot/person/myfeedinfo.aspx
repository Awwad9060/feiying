<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myfeedinfo.aspx.cs" Inherits="person_myfeedinfo" %>
<%@ Register Src="../share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="../share/footControl.ascx" TagName="footControl" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
   <title>意见反馈内容-飞瀛网</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../css/person.css" rel="stylesheet" type="text/css" />
    <meta name="Description"  content="飞瀛网" />
    <meta name="keywords" content="飞瀛网" />
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

      <div class="persontopnav">你当前的积分是：<code><%=Mem_Money%></code><span>赶快兑换吧!</span></div>
       <div class="person_leftboxtwo">
         <h2>个人中心主页</h2>
         <ul>
          <li><a class="person_leftboxtwo_out" href="myinfo.aspx" title="个人资料">个人资料</a><a class="person_leftboxtwo_out" href="myticket.aspx" title="我的机票">我的机票</a></li>
          <li><a class="person_leftboxtwo_out" href="../quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a><a class="person_leftboxtwo_out" href="../quanPublish.aspx" title="我的话题">发表话题</a><a class="person_leftboxtwo_out" href="../quanList.aspx?username=<%=Session["Mem_LoginName"]%>" title="">我的话题</a></li>
          <li><a class="person_leftboxtwo_out" href="http://quan.fei580.com" title="" target="_blank">飞瀛社区</a></li>
          <li><a class="person_leftboxtwo_out" href="../prizes.aspx" title="" target="_blank">兑换奖品</a></li>
          <li style="background:none;"><a class="person_leftboxtwo_out" href="mypwdedit.aspx" title="修改密码">修改密码</a><a class="person_leftboxtwo_on" href="myfeedlist.aspx" title="意见反馈">意见反馈</a></li>
         </ul>
       </div>
       
      <div class="person_rightbox">
         <span class="yijancss"><a href="myfeedadd.aspx" title="" class="white">发表意见</a></span>
        <table cellpadding="0" cellspacing="0" class="person_tabletwo">
          <tr>
            <th>查看问题详情</th><th><a href="/index.aspx" title="" class="blackline">&gt;&gt; 返回首页查看问题状况</a></th>
          </tr>
          <tr>
            <td colspan="2">
              <h2><%=title %></h2>
              
    状态：<a class="bluestr"><%=state.Trim().Equals("0")?"未解决":"已解决" %></a><br />
              
    发表时间：<%=addtime%><br />
    
    内容：<br />
        <%=context %>
        
            </td>
          </tr>                                                    
        </table>
      </div>
      
    </div>
       

    <!--sixlinebox start-->
    <div class="clear"></div>
    <div class="sixlinebox">
      <ul>
        <li class="one"><img src="../images/01.gif" alt="" /><br />了解飞瀛</li>
        <li class="two">
          <a href="#" title="">飞瀛网介绍</a><br />
          <a href="#" title="">服务范围</a><br />
          <a href="#" title="">会员规则</a><br />
          <a href="#" title="">服务根基</a>
        </li>
      </ul>
      
      <ul>
        <li class="one"><img src="../images/02.gif" alt="" /><br />领先服务</li>
        <li class="two">
          <a href="#" title="">特有价格优势</a><br />
          <a href="#" title="">服务引子</a><br />
          <a href="#" title="">标榜服务第一</a><br />
          <a href="#" title="">网站互动特色</a>
        </li>
      </ul>
      



      <ul>
        <li class="one"><img src="../images/03.gif" alt="" /><br />订购帮助</li>
        <li class="two">
          <a href="#" title="">国际机票订购方式</a><br />
          <a href="#" title="">国内机票订购方式</a><br />
          <a href="#" title="">国内酒店订票方式</a><br />
          <a href="#" title="">多种支付方式</a>
        </li>
      </ul>
       
     
     
     
      <ul>
        <li class="one"><img src="../images/04.gif" alt="" /><br />接触飞瀛</li>
        <li class="two">
          <a href="#" title="">机票业务合作</a><br />
          <a href="#" title="">酒店业务合作</a><br />
          <a href="#" title="">活动招募</a><br />
          <a href="#" title="">职位招聘</a>
        </li>
      </ul>
    </div>
    <!--sixlinebox start-->

     
     
    <!--footer start-->
    <ul class="footer">
      <li class="one"><code><a href="#" title="" class="white">TOP</a></code><span><a href="#" title="" class="white">HOME</a></span></li>
      <li class="two"><a href="#" title=""><img src="../images/bottomlogo.jpg" alt="" /></a></li>
      <li class="three">
          <span><a href="#" title="">主力站</a><a href="#" title="">形象站</a></span>E-Mail：gzfeiyue@163.com
    <br />
          Copyright © 1999 - 2009  飞瀛网  广州飞瀛商务服务有限公司. All Rights Reserved 
    <br />
          订票热线：400-700-4066(免费) 020-38039693(国际)　020-87534066（国内） 办公时间：9:00～18:00
    <br />粤ICP备08001831号 
      </li>
    </ul>
    <!--footer end-->

    </form>
    </div>
</body>
</html>
