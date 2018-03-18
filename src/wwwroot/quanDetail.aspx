<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quanDetail.aspx.cs" Inherits="quanDetail" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=quanDetailOne["title"]%>- <%=getTypeName(quanDetailOne["typeId"].ToString())%> - 飞瀛网（国际商旅专家）</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="<%=quanDetailOne["title"]%>" />
<meta name="description" content="<%=quanDetailOne["title"]%>" />
<link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/quancomment.js" type="text/javascript"></script>
<script type="text/javascript">
/*加载评论*/
$(document).ready(function() {
    getquancomment('<%=aId%>');
    
    //发表评论
	$("#buttSubmit").bind("click", function() {
		insertquancomment('<%=aId%>');
	}) 
});
</script>
<script type="text/javascript">
function checkComtent(){           
    var txt_comtcontent=$("#txt_comtcontent").val();
    if(txt_comtcontent==""){
        alert("请输入评论内容");
        $("#txt_comtcontent").focus();
        return false;
    }
    else
    {
        if(txt_comtcontent.length>500)
        {
            alert("评论内容最多为500字符！");
            $("#txt_comtcontent").focus();
            return false;
        }
    }
    return true;
}
</script>
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
        <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/trip/<%=quanDetailOne["aId"]%>.htm" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
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
          <li class="two"><a href="http://www.fei580.com/" title="首页">首&nbsp;页</a></li>
          <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
          <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
          <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
          <!--li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li-->
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
        <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="飞瀛网首页">飞瀛网</a>&gt;<a href="http://www.fei580.com/quan.aspx" title="">飞瀛圈</a>&gt;&nbsp;<%=getTypeName(quanDetailOne["typeId"].ToString())%>列表</div>
      </div>
    </div>
    <!--header end-->

     <%
       string headpic = "http://www.fei580.com/images/onein029.jpg";
       if (quanDetailOne["mem_pic"] != null && quanDetailOne["mem_pic"].ToString()!="")
       {
           headpic = quanDetailOne["mem_pic"].ToString();
       }
      %>
    <div style="margin:0px auto;width:965px;position:relative;">
      <div class="qiuanadmin_newslist_left">
        <img src="http://www.fei580.com/images/qiuanadmin01.jpg" style="float:left;" />
	    <div class="qiuanadmin_newslist_leftbox">
	      <ul class="qiuanadmin_newslist_ulone">
		      <li class="one"><img alt="" height="64px" src="http://www.fei580.com/<%=headpic%>" width="69px" /><%=quanDetailOne["publishName"]%></li>
		      <li class="two">
			    <div style="font-size:12px;color:#616161"><h1><%=quanDetailOne["title"]%></h1>&nbsp;&nbsp;&nbsp;&nbsp;分类：<%=getTypeName(quanDetailOne["typeId"].ToString())%>&nbsp;&nbsp;&nbsp;&nbsp;时间:<%=quanDetailOne["addTime"]%>&nbsp;&nbsp;&nbsp;&nbsp;点击:<%=quanDetailOne["clicks"]%> 次&nbsp;&nbsp;&nbsp;&nbsp;</div>
			    <p><a href="http://www.fei580.com/searchQuan.aspx?username=<%=quanDetailOne["publishName"]%>" title=""><%=quanDetailOne["publishName"]%>的全部文章</a><a href="http://www.fei580.com/quanList.aspx?typeId=<%=quanDetailOne["typeId"]%>" title="">返回分类列表</a><a href="quan.aspx" title="">返回圈子首页</a></p>
		      </li>
	      </ul>
    　　　　　　　　
      
	         <div style="margin:0px auto;width:655px">
	            <div class="newsdoc_leftboxfour">
	              <div class="newsdoc_leftboxfive">
		             <%=quanDetailOne["content"]%>
	              </div>
	              <!--<div class="newsdoc_leftboxsix">共11页:<a href="#" title="">上一页</a><a href="#" title="">1</a><a href="#" title="">2</a><a href="#" title="">3</a><a href="#" title="">4</a><a href="#" title="">5</a><a href="#" title="">6</a><a href="#" title="">7</a><a href="#" title="">8</a><a href="#" title="">9</a><a href="#" title="">10</a><a href="#" title="">11</a><a href="#" title="">下一页</a></div>-->
	            </div>

            </div>
             
		     <img src="http://www.fei580.com/images/qiuanadmin09.jpg" style="float:left;margin-top:20px;" />
		     <div class="qiuanadmin_bottomboxinput">
    		   
                <div id="divcomment">
                </div>
         
		       <div class="qiuanadmin_sharetitle">
		       <%if (quanDetailOne["typeId"].ToString()=="4") %>
		       <%{ %>
		       <strong>发布回答</strong>
		       <%}else if (quanDetailOne["typeId"].ToString() == "5") %>
		       <%{ %>
		   	    <strong>我愿同行</strong>
		       <%}else{ %>
		   	    <strong>发表评论</strong>
		       <%} %>
    	       
	           <% if (Session["Mem_LoginName"] == null || Session["Mem_ID"] == null){ %>
		       <span><a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/trip/<%=quanDetailOne["aId"]%>.htm" >登录</a><a href="http://www.fei580.com/memberReg.aspx" >注册</a></span>
		       <%}else{ %>
                <span style="padding:20px 0px 20px 170px" ><code style="color:#419C01;" ><%=Session["Mem_LoginName"] %></code>：您已登录，你可以在此发表评论！</span>
                <%} %>
                
		       </div>
		       <textarea id="txt_comtcontent" runat="server"></textarea>
               <input id="buttSubmit" type="button" class="qiuanadmin_shar_submit" value="发&nbsp;表" />
		     </div>
		     <img src="http://www.fei580.com/images/qiuanadmin010.jpg" style="float:left;" />
             


          </div>

        <img src="http://www.fei580.com/images/qiuanadmin02.jpg" style="float:left;" />
			   <div class="ck_xgq">
	
	
	<div class="ck_xgq_2">
	<div class="ck_xgq_2t">相关问答</div>
	         <%if (randowNews.Count != 0)
        { %>
          <% for (int i = 0; i < randowNews.Count; i++)
                {
                    System.Data.DataRow randow_row = randowNews[i];%>
	    
	    <li><a href="http://www.fei580.com/trip/<%=randow_row["aId"].ToString()%>.htm" target="_blank" style="color:#0A6FA3;"><%=randow_row["title"].ToString()%></a></li>
	   <% }
                }
             %>

	</div>
	<div class="ck_xgq_1">
	<div class="ck_xgq_1t">机票推荐</div>
     <%if (randowTicket.Count != 0)
        { %>
          <% for (int i = 0; i < randowTicket.Count; i++)
                {
                    System.Data.DataRow randow_row = randowTicket[i];%>
	    <li><span>￥<%=randow_row["untaxPrice"]%></span><a href="http://www.fei580.com/ticket_<%=Convert.ToInt32(randow_row["ticketId"].ToString())%>.htm" target="_blank" ><%=randow_row["fromCityName"]%>到<%=randow_row["toCityName"]%>机票</a></li>
	  
	   <% }
                }
             %>
	</div>
	</div>
      </div>



      <div class="news_rightboxtwo">
         
	    <div class="qiuanadmin_newslist_rightbox" title="写旅行日记换大礼"><a href="http://www.fei580.com/quanPublish.aspx" class="bluestr">我要发表</a></div>
        <div class="newsdoc_righttitlethree"><strong>本周点击</strong></div>
	        <ul class="qiuan_rightulthree">
    	       
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
	       <img src="http://www.fei580.com/images/news02.jpg" style="float:left;" />


      </div>

    </div>
      </form>
      
      <uc1:footControl ID="FootControl" runat="server" />
      </div>
 </body>
</html>
