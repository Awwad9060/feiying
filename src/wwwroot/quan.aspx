<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quan.aspx.cs" Inherits="quan" %>

<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
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
<title>飞瀛圈 | 国际机票咨询问答社区,飞友互助圈子 - 飞瀛网（国际商旅专家）</title>
<meta name="keywords" content="飞瀛圈子,社交圈子,国际机票圈子,国际机票问答" />
<meta name="description" content="飞瀛网为广大国际达人提供机票咨询，各地风俗知识分享的社交圈子，让您发现身边的朋友，一起讨论世界各地有趣的旅行。" />
<meta name="robots" content="index,follow" />
<link rel="canonical" href="http://www.fei580.com/quan.aspx" />
<link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/jquery.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/index.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/postdata.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/lanren.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/JQuery.cookie.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/ticket.search.js"></script>
</head>
<body>
    <div class="mainbody" >
     <form id="form1" runat="server">
    <!--header start-->
    <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="飞瀛网" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="国际机票专家" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
    <div class="headerbottom">
      <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="飞瀛网" /></a></div>
      <div class="headerbottom_right">
        <div class="headerbottom_rightone">
        <% if (Session["Mem_LoginName"] == null)
           { %>
        <a href="http://www.fei580.com/login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="会员登录" rel="nofollow">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册" rel="nofollow">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
        <%
            }
            else
            {
         %>
        <a href="http://www.fei580.com/person/myticket.aspx" title="您好，<%=Session["Mem_LoginName"].ToString() %>" rel="nofollow">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="http://www.fei580.com/person/myticket.aspx" title="会员积分" rel="nofollow">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="个人中心" rel="nofollow">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="退出登陆" rel="nofollow">退出登录</a>
        <%}
             %> 
        </div>
        <ul class="menu_1">
          <li class="two"><a href="http://www.fei580.com/" title="首页" rel="nofollow">首&nbsp;页</a></li>
          <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
          <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
          <!--<li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li>-->
          <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
          <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
          <li class="two"><a rel="nofollow" href="http://hotel.fei580.com" target="_blank" title="国际酒店">国际酒店</a></li>
          <!--<li class="two"><a href="hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
          <li class="one"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a></li>
          <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
          <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
        </ul>
        <div class="menubottom">
	        <ul class="nohidden">
	          <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司" rel="nofollow">航空公司</a></li>
	          <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场" rel="nofollow">世界机场</a></li>
	          <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型" rel="nofollow">民航机型</a></li>
	          <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯" rel="nofollow">新闻资讯</a></li>
	          <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="积分广场" rel="nofollow">积分广场</a></li>
	        </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
      </div>
    </div>
    <!--header end-->

     
    <div style="margin:0px auto;width:956px;position:relative;">

      <!--oneline start-->
      <div class="qiuan_onelinebox">

        <div class="qiuan_oneline_leftbox">
           <div class="smallleft_onetitle"><strong>旅行日记</strong><a href="http://www.fei580.com/newsList.aspx?typeId=1" title="旅游资讯"><img src="http://www.fei580.com/images/onein027.gif" alt="" /></a></div>
           <div class="smallleft_onebox">
             <div class="Hr_1" id="div" style="CURSOR: hand">
			     <div class="Hr_11">
    			      
			     <%
                if (focuNews.Count != 0)
                { for (int i = 0; i < focuNews.Count; i++)
                    {System.Data.DataRow focuNews_row = focuNews[i];
                       if (i == 0)
                        {
                 %>
					     <a class="act" id="a<%=i%>" hidefocus="true" onmouseover="clearAuto();" onclick="Mea(<%=i%>);" onmouseout="setAuto()" href="javascript:void(0);" ><%=eap.share.Sys.truncate(focuNews_row["title"].ToString(),32,"...")%></a> 
					    <%}else{%>
					     <a class="nor" id="a<%=i%>" hidefocus="true" onmouseover="clearAuto();" onclick="Mea(<%=i%>);" onmouseout="setAuto()" href="javascript:void(0);" ><%=eap.share.Sys.truncate(focuNews_row["title"].ToString(), 32, "...")%></a> 
			    <%}}}%>
    			      
				        </div>
				        <div class="himgbox">
			    <%
                if (focuNews.Count != 0)
                {for (int n = 0; n < focuNews.Count; n++)
                    {
                        System.Data.DataRow focuNews_row_pic = focuNews[n];
                        string picUrl = "http://www.fei580.com/images/focus.jpg";
                        if (focuNews_row_pic["newsPic"].ToString() != "")
                        {
                            picUrl = focuNews_row_pic["newsPic"].ToString();
                        }
                        if (n == 0)
                        {%>
                        <a href="http://www.fei580.com/news_<%=focuNews_row_pic["id"].ToString()%>.htm" target="_blank"><img id="pc_<%=n%>" alt="<%=focuNews_row_pic["title"].ToString()%>" style="DISPLAY: block" height="226px" src="<%=picUrl%>" width="344px" /></a>
				        <%}
                        else
                        { %>
					    <a href="http://www.fei580.com/news_<%=focuNews_row_pic["id"].ToString()%>.htm" target="_blank"><img id="pc_<%=n%>" alt="<%=focuNews_row_pic["title"].ToString()%>" style="DISPLAY: none" height="226px" src="<%=picUrl%>" width="344px" /></a>
        			    <%}}}%>
            			
	              </div>
	            </div>
           </div>
	     </div>
    <script type="text/javascript">
    function searchByType(value){
    for(var i=1;i<=6;i++){
    if(i==value){
    document.getElementById("searchType"+i).className="qiuan_onmuesover";
    }else{
    document.getElementById("searchType"+i).className="qiuan_outmuesover";
    }
    }
    document.getElementById("txtTypeId").value=value;
    }

    </script>
         <div class="qiuan_oneline_middlebox">
	       <ul class="qiuan_oneline_ulone">
	         <li class="qiuan_onmuesover"  id="searchType1"><a href="javascript:searchByType(1);">攻略游记</a></li>
		     <li class="qiuan_outmuesover" id="searchType2"><a href="javascript:searchByType(2);">旅游点评</a></li>
		     <li class="qiuan_outmuesover" id="searchType3"><a href="javascript:searchByType(3);">图片故事</a></li>
		     <li class="qiuan_outmuesover" id="searchType4"><a href="javascript:searchByType(4);">旅游问答</a></li>
		     <li class="qiuan_outmuesover" id="searchType5"><a href="javascript:searchByType(5);">寻找结伴</a></li>
		     <li class="qiuan_outmuesover" id="searchType6"><a href="javascript:searchByType(6);">会员文章</a></li>
	       </ul>
	       <input name="txtTypeId" type="hidden" id="txtTypeId" runat="server" value="1" />
	       <div class="qiuan_seacherbox">
	         <input type="text" class="qiuan_but_text" id="txtKey" value="先选择分类再搜索攻略"  runat="server"/>
		     <asp:Button ID="btnSearch" runat="server" Text="搜&nbsp;&nbsp;索"   OnClick="btnSearch_Click" CssClass="qiuan_but_submit"/>
	       </div>
	       <div class="qiuan_oneline_middleboxtwo"><a href="http://www.fei580.com/quanPublish.aspx" class="white">我要发表</a><span>记录每一次飞行心情...</span></div>
        </div>

        

         <div class="smallright_one">
           <div class="smallright_onetitle">飞瀛圈子</div>
           <% if (Session["Mem_LoginName"] != null)
              { %>
           <div class="smallright_onebox">
             <ul class="smallright_ulone">
               <li class="one"><strong><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈子" class="bluestr"><%=Session["Mem_LoginName"].ToString() %></a></strong><br />圈子欢迎您！</li>
               <li class="two">积分：<strong><%=Session["Mem_Money"].ToString()%></strong></li>
               <li class="three">
                 <p><a href="http://www.fei580.com/quanPublish.aspx" title="发表话题" class="white">发话题</a></p>
                 <p><a href="http://www.fei580.com/prizes.aspx" title="兑换礼品" class="white">换礼品</a></p>
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
               <li class="one"><a href="http://www.fei580.com/person/myinfo.aspx" title="个人资料"><img alt="个人资料" height="64px" src="http://www.fei580.com/<%=headpic%>" width="69px" /></a></li>
               <li class="one"><%=Session["Mem_type"].ToString()%></li>
               <li class="two">
                 <p><a href="http://www.fei580.com/quan.aspx" title="进入圈子">进入圈子</a></p>
                 <p><a href="http://www.fei580.com/person/myinfo.aspx" title="修改资料">修改资料</a></p>
               </li>
             </ul>

             <div class="smallright_clear"><a href="http://www.fei580.com/logout.aspx" title="退出登录">退出登录</a></div>
             <div class="smallright_clearbottom">了解我的积分怎么用<br />我可以换取哪些奖品</div>
             
           </div>
           <img src="http://www.fei580.com/images/onein028.jpg" style="float:left;" />
	       <%
               }else{
           %>
	   <div class="smallright_onebox" style="height:165px;padding-top:3px;">
         <ul class="hotel_ulone">
           <li class="one">用户<input type="text" id="shortname" runat="server" /></li>
           <li class="one">密码<input type="password" id="pwd1" runat="server" /><span id="lblerrmes" style="color:Red;"></span></li>
           <li class="two"><input id="btnok" type="button" class="hotel_submit" /><input type="checkbox" checked="checked" />记住我</li>
           <li class="three"><a href="http://www.fei580.com/regAgree.aspx" title="注册">注册会员</a>  <a href="http://www.fei580.com/news.aspx" title="新闻中心">新闻中心</a></li>
         </ul>
       </div>
       <script type="text/javascript">
           var tl = new TicketLogin('http://www.fei580.com/quan.aspx');
       </script>
       <img src="http://www.fei580.com/images/vbcc.jpg" style="float:left;" alt="" />
	       <%
	        }
	        %>
       </div>
       </div>
       <!--oneline end-->

       <div class="qiuanad_box">
       <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=952&height=94&id=4"></script> 
       </div>

    <script type="text/javascript">
    function goType(value){
    for(var i=1;i<=5;i++){
    if(i==value){
    document.getElementById("typeList"+i).style.display="block";
    document.getElementById("liType"+i).className="qiuan_twoline_onmenuseover";
    }else{
    document.getElementById("typeList"+i).style.display="none";
    document.getElementById("liType"+i).className="qiuan_twoline_onmenuseout";
    }
    }

    }

    </script>
      <!--twoline start-->
        <div class="qiuan_twoline_left">
	      <ul class="qiuan_twoline_ulone">
	        <li class="qiuan_twoline_onmenuseover" id="liType1"><a href="javascript:goType(1);" style="color:White;">攻略游记</a></li>
		    <li class="qiuan_twoline_onmenuseout" id="liType2"><a href="javascript:goType(2);" style="color:White;">旅游点评</a></li>
		    <li class="qiuan_twoline_onmenuseout"  id="liType3"><a href="javascript:goType(3);" style="color:White;">图片故事</a></li>
		    <li class="qiuan_twoline_onmenuseout" id="liType4"><a href="javascript:goType(4);" style="color:White;">旅游问答</a></li>
		    <li class="qiuan_twoline_onmenuseout" id="liType5"><a href="javascript:goType(5);" style="color:White;">寻找结伴</a></li>
	      </ul>
    	  
	      <div class="qiuan_twoline_leftbox" id="typeList1" style="display:block">
    	   
	        <% if (gonglue!=null&&gonglue.Count != 0)
                {%>

                    <%for (int n = 0; n < gonglue.Count && n < 3; n++)
                    {
                        System.Data.DataRow gonglue_row = gonglue[n];


                        string headpic = "images/onein029.jpg";
                        if (gonglue_row["mem_pic"] != null && gonglue_row["mem_pic"].ToString() != "")
                        {
                            headpic = gonglue_row["mem_pic"].ToString();
                        }
                          %>
	        <ul class="qiuan_twoline_ultwo">
		      <li class="qiuan_twoline_liimg"><img height="64px" alt=Gravet" src="http://www.fei580.com/<%=headpic%>" width="69px" /><%=gonglue_row["publishName"].ToString()%></li>
		      <li class="qiuan_twoline_font">
		        <h2><a href="http://www.fei580.com/trip/<%=gonglue_row["aId"].ToString()%>.htm" target="_blank"><%=gonglue_row["title"].ToString()%></a></h2>
			    <div class="qiuan_twoline_div"><%=Convert.ToDateTime(gonglue_row["addtime"].ToString()).ToShortDateString()%> 发表&nbsp;&nbsp;&nbsp;&nbsp;分类：攻略游记</div>
			    <p><%=eap.share.Sys.truncate(Public.StripHTML(gonglue_row["content"].ToString()), 180, "...")%></p><a href="http://www.fei580.com/trip/<%=gonglue_row["aId"].ToString()%>.htm" title="<%=gonglue_row["publishName"].ToString()%>" target="_blank" class="qiuanlink">阅读全文&nbsp;&gt;&gt;</a>
		      </li>
		    </ul>
          <%
          }
          }
         
           %>


		    <div class="qiuan_twoline_ulthree">
    		 
		      <% if (gonglue != null && gonglue.Count != 0)
           {%>

                    <%for (int n = 3; n < gonglue.Count ; n++)
                      {
                          System.Data.DataRow gonglue_row = gonglue[n];%>
		      <ul>
		       <li class="one"><a href="http://www.fei580.com/trip/<%=gonglue_row["aId"].ToString()%>.htm" target="_blank"><%=gonglue_row["title"].ToString()%></a></li>
		       <li class="two">作者：<%=gonglue_row["publishName"].ToString()%></li>
		       <li class="three">日期：<%=Convert.ToDateTime(gonglue_row["addtime"].ToString()).ToShortDateString()%></li>
		      </ul>
		      <%
                  }
              }
                       
		       %>

		    </div>

            <div class="qiuan_twoline_leftmore"><a href="http://www.fei580.com/quanList.aspx?typeId=1">更多精彩</a></div>

	      </div>
    	  
    	
	      <div class="qiuan_twoline_leftbox" id="typeList2" style="display:none">
	       <% if (dianping != null && dianping.Count != 0)
                {%>

                    <%for (int n = 0; n < dianping.Count && n < 3; n++)
                    {
                        System.Data.DataRow dianping_row = dianping[n];

                        string headpic = "images/onein029.jpg";
                        if (dianping_row["mem_pic"] != null && dianping_row["mem_pic"].ToString() != "")
                        {
                            headpic = dianping_row["mem_pic"].ToString();
                        }
                          %>
	        <ul class="qiuan_twoline_ultwo">
		      <li class="qiuan_twoline_liimg"><img height="64px" alt=Gravet" src="http://www.fei580.com/<%=headpic%>" width="69px" /><%=dianping_row["publishName"].ToString()%></li>
		      <li class="qiuan_twoline_font">
		        <h2><a href="http://www.fei580.com/trip/<%=dianping_row["aId"].ToString()%>.htm" target="_blank"><%=dianping_row["title"].ToString()%></a></h2>
			    <div class="qiuan_twoline_div"><%=Convert.ToDateTime(dianping_row["addtime"].ToString()).ToShortDateString()%> 发表&nbsp;&nbsp;&nbsp;&nbsp;分类：游记攻略</div>
			    <p><%=eap.share.Sys.truncate(Public.StripHTML(dianping_row["content"].ToString()), 180, "...")%></p><a href="http://www.fei580.com/trip/<%=dianping_row["aId"].ToString()%>.htm" target="_blank" title="<%=dianping_row["title"].ToString()%>" class="qiuanlink">阅读全文&nbsp;&gt;&gt;</a>
		      </li>
		    </ul>
          <%
          }
          }
         
           %>


		    <div class="qiuan_twoline_ulthree">
    		 
		      <% if (dianping != null && dianping.Count != 0)
           {%>

                    <%for (int n = 3; n < dianping.Count ; n++)
                      {
                          System.Data.DataRow dianping_row = dianping[n];%>
		      <ul>
		       <li class="one"><a href="http://www.fei580.com/trip/<%=dianping_row["aId"].ToString()%>.htm" target="_blank"><%=dianping_row["title"].ToString()%></a></li>
		       <li class="two">作者：<%=dianping_row["publishName"].ToString()%></li>
		       <li class="three">日期：<%=Convert.ToDateTime(dianping_row["addtime"].ToString()).ToShortDateString()%></li>
		      </ul>
		      <%
                  }
              }
                       
		       %>
		    </div>

            <div class="qiuan_twoline_leftmore"><a href="http://www.fei580.com/quanList.aspx?typeId=2">更多精彩</a></div>

	      </div>
    	  
    	  
    	  
    	    
	      <div class="qiuan_twoline_leftbox" id="typeList3" style="display:none">
    	   
	        <% if (tupian != null && tupian.Count != 0)
                {%>

                    <%for (int n = 0; n < tupian.Count && n < 3; n++)
                    {
                        System.Data.DataRow tupian_row = tupian[n];
                             string headpic = "images/onein029.jpg";
                             if (tupian_row["mem_pic"] != null && tupian_row["mem_pic"].ToString() != "")
                        {
                            headpic = tupian_row["mem_pic"].ToString();
                          }
                          %>
	        <ul class="qiuan_twoline_ultwo">
		      <li class="qiuan_twoline_liimg"><img height="64px" alt=Gravet" src="http://www.fei580.com/<%=headpic%>" width="69px" /><%=tupian_row["publishName"].ToString()%></li>
		      <li class="qiuan_twoline_font">
		        <h2><a href="http://www.fei580.com/trip/<%=tupian_row["aId"].ToString()%>.htm" target="_blank"><%=tupian_row["title"].ToString()%></a></h2>
			    <div class="qiuan_twoline_div"><%=Convert.ToDateTime(tupian_row["addtime"].ToString()).ToShortDateString()%> 发表&nbsp;&nbsp;&nbsp;&nbsp;分类：图片故事</div>
			    <p><%=eap.share.Sys.truncate(Public.StripHTML(tupian_row["content"].ToString()), 180, "...")%></p><a href="http://www.fei580.com/trip/<%=tupian_row["aId"].ToString()%>.htm" target="_blank" title="<%=tupian_row["title"].ToString()%>" class="qiuanlink">阅读全文&nbsp;&gt;&gt;</a>
		      </li>
		    </ul>
          <%
          }
          }
         
           %>


		    <div class="qiuan_twoline_ulthree">
    		 
		      <% if (tupian != null && tupian.Count != 0)
           {%>

                    <%for (int n = 3; n < tupian.Count; n++)
                      {
                          System.Data.DataRow tupian_row = tupian[n];%>
		      <ul>
		       <li class="one"><a href="http://www.fei580.com/trip/<%=tupian_row["aId"].ToString()%>.htm" target="_blank"><%=tupian_row["title"].ToString()%></a></li>
		       <li class="two">作者：<%=tupian_row["publishName"].ToString()%></li>
		       <li class="three">日期：<%=Convert.ToDateTime(tupian_row["addtime"].ToString()).ToShortDateString()%></li>
		      </ul>
		      <%
                  }
              }
                       
		       %>

		    </div>

            <div class="qiuan_twoline_leftmore"><a href="http://www.fei580.com/quanList.aspx?typeId=3">更多精彩</a></div>

	      </div>
    	  
    	  
    	    
	      <div class="qiuan_twoline_leftbox" id="typeList4" style="display:none">
    	   
	        <% if (wenda != null && wenda.Count != 0)
                {%>

                    <%for (int n = 0; n < wenda.Count && n < 3; n++)
                    {
                        System.Data.DataRow wenda_row = wenda[n];
                         string headpic = "images/onein029.jpg";
                         if (wenda_row["mem_pic"] != null && wenda_row["mem_pic"].ToString() != "")
                        {
                            headpic = wenda_row["mem_pic"].ToString();
                          }
                          %>
	        <ul class="qiuan_twoline_ultwo">
		      <li class="qiuan_twoline_liimg"><img height="64px" alt="Gravet" src="http://www.fei580.com/<%=headpic%>" width="69px" /><%=wenda_row["publishName"].ToString()%></li>
		      <li class="qiuan_twoline_font">
		        <h2><a href="http://www.fei580.com/trip/<%=wenda_row["aId"].ToString()%>.htm" target="_blank"><%=wenda_row["title"].ToString()%></a></h2>
			    <div class="qiuan_twoline_div"><%=Convert.ToDateTime(wenda_row["addtime"].ToString()).ToShortDateString()%> 发表&nbsp;&nbsp;&nbsp;&nbsp;分类：旅游问答</div>
			    <p><%=eap.share.Sys.truncate(Public.StripHTML(wenda_row["content"].ToString()), 180, "...")%></p><a href="http://www.fei580.com/trip/<%=wenda_row["aId"].ToString()%>.htm" target="_blank" title="<%=wenda_row["title"].ToString()%>" class="qiuanlink">阅读全文&nbsp;&gt;&gt;</a>
		      </li>
		    </ul>
          <%
          }
          }
         
           %>


		    <div class="qiuan_twoline_ulthree">
    		 
		      <% if (wenda != null && wenda.Count != 0)
           {%>

                    <%for (int n = 3; n < wenda.Count; n++)
                      {
                          System.Data.DataRow wenda_row = wenda[n];%>
		      <ul>
		       <li class="one"><a href="http://www.fei580.com/trip/<%=wenda_row["aId"].ToString()%>.htm" target="_blank"><%=wenda_row["title"].ToString()%></a></li>
		       <li class="two">作者：<%=wenda_row["publishName"].ToString()%></li>
		       <li class="three">日期：<%=Convert.ToDateTime(wenda_row["addtime"].ToString()).ToShortDateString()%></li>
		      </ul>
		      <%
                  }
              }
                       
		       %>
		    </div>

            <div class="qiuan_twoline_leftmore"><a href="http://www.fei580.com/quanList.aspx?typeId=4">更多精彩</a></div>

	      </div>
    	  
    	  
    	    
	      <div class="qiuan_twoline_leftbox" id="typeList5" style="display:none">
    	   
	       <% if (jieban != null && jieban.Count != 0)
                {%>

                    <%for (int n = 0; n < jieban.Count && n < 3; n++)
                    {
                        System.Data.DataRow jieban_row = jieban[n];
                        string headpic = "images/onein029.jpg";
                        if (jieban_row["mem_pic"] != null && jieban_row["mem_pic"].ToString()!="")
                        {
                             headpic = jieban_row["mem_pic"].ToString();
                          }
                          %>
	        <ul class="qiuan_twoline_ultwo">
		      <li class="qiuan_twoline_liimg"><img height="64px" alt="Gravet" src="http://www.fei580.com/<%=headpic%>" width="69px" /><%=jieban_row["publishName"].ToString()%></li>
		      <li class="qiuan_twoline_font">
		        <h2><a href="http://www.fei580.com/trip/<%=jieban_row["aId"].ToString()%>.htm" target="_blank"><%=jieban_row["title"].ToString()%></a></h2>
			    <div class="qiuan_twoline_div"><%=Convert.ToDateTime(jieban_row["addtime"].ToString()).ToShortDateString()%> 发表&nbsp;&nbsp;&nbsp;&nbsp;分类：寻找结伴</div>
			    <p><%=eap.share.Sys.truncate(Public.StripHTML(jieban_row["content"].ToString()),180,"...")%></p><a href="http://www.fei580.com/trip/<%=jieban_row["aId"].ToString()%>.htm" target="_blank" title="<%=jieban_row["title"].ToString()%>" class="qiuanlink">阅读全文&nbsp;&gt;&gt;</a>
		      </li>
		    </ul>
          <%
          }
          }
         
           %>


		    <div class="qiuan_twoline_ulthree">
    		 
		      <% if (jieban != null && jieban.Count != 0)
           {%>

                    <%for (int n = 3; n < jieban.Count ; n++)
                      {
                          System.Data.DataRow jieban_row = jieban[n];%>
		      <ul>
		       <li class="one"><a href="http://www.fei580.com/trip/<%=jieban_row["aId"].ToString()%>.htm" target="_blank"><%=jieban_row["title"].ToString()%></a></li>
		       <li class="two">作者：<%=jieban_row["publishName"].ToString()%></li>
		       <li class="three">日期：<%=Convert.ToDateTime(jieban_row["addtime"].ToString()).ToShortDateString()%></li>
		      </ul>
		      <%
                  }
              }
                       
		       %>

		    </div>

            <div class="qiuan_twoline_leftmore"><a href="http://www.fei580.com/quanList.aspx?typeId=5">更多精彩</a></div>

	      </div>
    	  
    	  
    	  
	      <img src="images/IDS_08.jpg" style="float:left;" />
	    </div>

       <div class="news_rightboxtwo">
      
      
        <div class="news_rightboxfour"><strong>最新积分奖品</strong></div>
        <div class="news_rightboxsix">
      
      
      <%
          if (newPrizes != null && newPrizes.Count != 0)
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
        <div class="news_rightboxfive"><a href="http://www.fei580.com/prizes.aspx" title="">我们的积分可以换什么奖品？</a><img src="http://www.fei580.com/images/news018.gif" alt="new018" /></div>

        <div class="newsdoc_righttitlethree"><strong>本周点击</strong></div>
	        <ul class="qiuan_rightulthree">
    	   
	       <%
               if (clickOrder != null && clickOrder.Count != 0)
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

	       <div class="newsdoc_righttitlethree"><strong>推荐话题</strong></div>
	        <ul class="newsdoc_rightulthree">
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
	       <img src="http://www.fei580.com/images/news02.jpg" style="float:left;" alt="" />
        
      </div>
    </div>
      </form>
      
  <uc1:footControl ID="FootControl" runat="server" />
  </div>
 </body>
</html>
