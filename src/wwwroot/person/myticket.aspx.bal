<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myticket.aspx.cs" Inherits="person_myticket" %>
<%@ Register Src="../share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/myleft.ascx" TagName="myleft" TagPrefix="uc1" %>
<%@ Register Src="../share/footControl.ascx" TagName="footControl" TagPrefix="uc2" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>我的电子机票-飞瀛网</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../css/person.css" rel="stylesheet" type="text/css" />
    <meta name="Description"  content="飞瀛网" />
    <meta name="keywords" content="飞瀛网" />
    <script type="text/javascript" src="../js/jquery.js"></script>
    <script type="text/javascript">
     function searchfocus(){
	    if (document.getElementById("txtsearch").value == "请联系你的客服获取编号") {
		    document.getElementById("txtsearch").value ="";
		    document.getElementById("txtsearch").className ="txtunserchcolor";
	    }
     }

    function searchblur(){
	    if (document.getElementById("txtsearch").value == "") {
		    document.getElementById("txtsearch").value ="请联系你的客服获取编号";
		    document.getElementById("txtsearch").className ="txtserchcolor";
	    }
    }
    
    //获取状态
    function getTicketingState(code){

    }
    
    function confirmLoad(code){
        var type=1;
        $.get("share/updatetickering.aspx?rand=" + parseInt(10000 * Math.random()), { code: code, type: type }, function (html) {
            if (html == "false") {
                alertMess();
                return;
            }
            else {
                type = 0;
                if (confirm('你的电子票已成功，是否下载？')) {
                    $.get("share/updatetickering.aspx?rand=" + parseInt(10000 * Math.random()), { code: code, type: type }, function (s) {
                        //window.location.href = "/fileload.aspx?path=" + escape(s);
                        var url = "http://www.fei580.com/fileload.aspx?path=" + escape("/"+s);
                        //alert(url);
                        window.open(url);
                    });
                }
            }
        });
    }
    function alertMess(){
        alert("此机票已被获取，为失效状态！");
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

            <div style=" float:left; width:100%">
            <div class="persontopnav">你当前的积分是：<code><%=Mem_Money %></code><span>赶快兑换吧!</span></div>
            <div style="float:left; padding-left:150px; padding-top:15px;">电子机票下载号<input id="txtsearch"  onfocus="searchfocus()"  class="txtserchcolor" onblur="searchblur()"  value="请联系你的客服获取编号" runat="server" type="text" /> 
          <asp:Button ID="butt_search" runat="server" Text="获取机票" OnClick="butt_search_Click" /></div>
          </div>
        <uc1:myleft ID="Myleft1" runat="server" />
       
      <div class="person_rightbox">
        <table cellpadding="0" cellspacing="0" class="person_tableone">
         <asp:Repeater ID="rptshopnews" runat="server">
            <HeaderTemplate>
            
          <tr>
            <th>行程</th><th>航空公司</th><th>出发日期</th><th>回程日期</th><th>积分</th><th>电子机票下载</th>
          </tr>
          
            </HeaderTemplate>
            <ItemTemplate>
            
          <tr>
            <td><%#Eval("fromcity")%>-<%#Eval("tocity")%></td><td><%#Eval("airline")%></td><td><%#Eval("chufa")%></td><td><%#Eval("huicheng")%></td><td><%#Eval("jifen") %></td>
            <td style="color:Red;cursor:pointer;" onclick="window.location.href='http://www.fei580.com/fileload.aspx?path=/<%#Eval("path") %>&cId=<%#Eval("cId")%>'"  >共<%#Eval("number")%>个下载</td>
          </tr>
          
          </ItemTemplate>
         </asp:Repeater>
        
        </table>
        <div class="list_nav">
        <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" 
            LastPageText="末页" NextPageText="下一页" PageSize="20" PrevPageText="上一页" ShowPageIndexBox="Never"
            SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" AlwaysShow="True">
        </webdiyer:AspNetPager>
        
        </div>
      </div>
      
    </div>
       


    </form>
    <uc2:footControl ID="FootControl" runat="server" />
    </div>
</body>
</html>
