<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prizesDetail.aspx.cs" Inherits="prizesDetail" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title><%=prizesDetailOne["pName"]%> - <%=getTypeName(prizesDetailOne["type"].ToString())%> - 奖品，兑换礼品  - 飞瀛网（国际商旅专家）</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="奖品，兑换礼品" />
<meta name="description" content="奖品，兑换礼品，预订热线：400-885-0663" />
<link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/jquery.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
<script type="text/javascript" src="http://www.fei580.com/js/JQuery.cookie.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/ticket.search.js"></script>
<script type="text/javascript">

function order(){
 var linkMan = document.getElementById("txt_linkMan");
    if(linkMan.value=='')
    {
        alert('请填写你的真实姓名！');
        linkMan.focus();
        return false;
    }
    
     var linkAddress = document.getElementById("txt_linkAddress");
    if(linkAddress.value=='')
    {
        alert('请填写你的收件地址！');
        linkAddress.focus();
        return false;
    }
    
     var linkCode = document.getElementById("txt_linkCode");
    if(linkCode.value=='')
    {
        alert('请填写你的邮政编码！');
        linkCode.focus();
        return false;
    }
    
    
      var linkTel = document.getElementById("txt_linkTel");
    if(linkTel.value=='')
    {
        alert('请填写你的电话！');
        linkTel.focus();
        return false;
    }
}

function showdui(){
var qId=document.getElementById('q1');
<%
if (Session["Mem_LoginName"]==null){
%>
alert('请登陆');
location.href='http://www.fei580.com/login.aspx?url=http://www.fei580.com/prizes/<%=prizesDetailOne["pId"]%>.htm'; 
<%
}else{
 if (Convert.ToInt32(Session["Mem_Money"].ToString())<Convert.ToInt32(prizesDetailOne["needScore"].ToString())){
 %>
alert('您的积分余额不够！');
<%
}else{
%> 
qId.style.display='block';
<%
}
}
 %>
}

function showLot(){
<%
if (Session["Mem_LoginName"]==null){
%>
alert('请登陆');
location.href='http://www.fei580.com/login.aspx?url=http://www.fei580.com/prizes/<%=prizesDetailOne["pId"]%>.htm'; 
<%
}else{
 if (Convert.ToInt32(Session["Mem_Money"].ToString())<Convert.ToInt32(prizesDetailOne["lotteryScore"].ToString())){
 %>
alert('您的积分余额不够！');
return false;
<%
}else{
%>  
    var msg="确定抽奖，并扣取积分？";   
    if (confirm(msg) == true)   
    {   location.href='http://www.fei580.com/lottery.aspx?pId=<%=prizesDetailOne["pId"]%>'; 
        return true;   
    }   
    else  
    {   
        return false;   
    }    
<%
}
}
 %>
     
}
</script>
</head>
<body>
    <div class="mainbody" >
     <form id="form1" runat="server">
    <!--header start-->
    <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="home" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="mail" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
    <div class="headerbottom">
      <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
      <div class="headerbottom_right">
        <div class="headerbottom_rightone">
        <% if (Session["Mem_LoginName"] == null)
           { %>
        <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/prizes/<%=pId%>.htm" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
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
          <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a></li>
          <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
          <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
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
         <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="">飞瀛网</a>&gt;<a href="http://www.fei580.com/prizes.aspx?typeId=<%=prizesDetailOne["type"]%>" title=""><%=getTypeName(prizesDetailOne["type"].ToString())%></a></div>
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
               <li class="one"><strong><a href="javascript:;" title="" class="bluestr"><%=Session["Mem_LoginName"].ToString() %></a></strong><br />圈子欢迎您！</li>
               <li class="two">积分：<strong><%=Session["Mem_Money"].ToString()%></strong></li>
               <li class="three">
                 <p><a href="http://www.fei580.com/quanPublish.aspx" title="" class="white">发话题</a></p>
                 <p><a href="http://www.fei580.com/prizes.aspx" title="" class="white">兑奖品</a></p>
               </li>
             </ul>
             
              <%
       string headpic = "images/onein029.jpg";
       if (Session["Mem_Pic"] != null && Session["Mem_Pic"].ToString()!="")
       {
           headpic  =Session["Mem_Pic"].ToString();
       }
      %>
      
             <ul class="smallright_ultwo">
               <li class="one"><a href="http://www.fei580.com/person/myinfo.aspx" title=""><img alt="" height="64px" src="<%=headpic%>" width="69px" /></a></li>
               <li class="one"><%=Session["Mem_type"].ToString()%></li>
               <li class="two">
                 <p><a href="http://www.fei580.com/quan.aspx" title="">进入圈子</a></p>
                 <p><a href="http://www.fei580.com/person/myinfo.aspx" title="">修改资料</a></p>
               </li>
             </ul>

             <div class="smallright_clear"><a href="http://www.fei580.com/logout.aspx" title="退出登录">退出登录</a></div>
             <div class="smallright_clearbottom">了解我的积分怎么用<br />我可以换取哪些奖品</div>
             
           </div>
           <img src="http://www.fei580.com/images/onein028.jpg" style="float:left;"  alt=""/>
	       <%
               }else{
           %>
	   <div class="smallright_onebox" style="height:165px;padding-top:3px;">
         <ul class="hotel_ulone">
           <li class="one">用户<input type="text" id="shortname" runat="server" /></li>
           <li class="one">密码<input type="password" id="pwd1" runat="server" /><span id="lblerrmes" style="color:Red;"></span></li>
           <li class="two"><input id="btnok" type="button" class="hotel_submit" /><input type="checkbox" checked="checked" />记住我</li>
           <li class="three"><a href="http://www.fei580.com/regAgree.aspx" title="注册">注册会员</a><br /><a href="http://www.fei580.com/news.aspx" title="帮助中心">帮助中心</a></li>
         </ul>
       </div>
       <script type="text/javascript">
           var tl = new TicketLogin('http://www.fei580.com/prizes/<%=pId %>.htm');
       </script>
       <img src="http://www.fei580.com/images/vbcc.jpg" style="float:left;" alt="" />
	       <%
	        }
	        %>
       </div>
            <div class="lottery_ad">
             <a href="javascript:;" title=""><img alt="积分规则" height="36px" src="http://www.fei580.com/images/lottery01.jpg" width="174px" /></a>
		     <a href="javascript:;" title=""><img alt="兑换说明" height="36px" src="http://www.fei580.com/images/lottery02.jpg" width="174px" /></a>
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
		    <img src="http://www.fei580.com/images/lottery03.jpg" style="float:left;" />

		    <div class="lottery_ad">
             <a href="javascript:;" title=""><img alt="如何赚取积分" height="42px" src="http://www.fei580.com/images/prize02.jpg" width="152px" /></a>
		    </div>
       </div>

       <div class="prize_right">
         <img src="http://www.fei580.com/images/prize01.gif" alt="" width="778px" height="123px" />
	     <ul class="prize_rightulone">
	       <li class="three"><img src="http://www.fei580.com/images/prize03.jpg" alt="商品兑换" /></li>
	       <li class="<%=(prizesDetailOne["type"].ToString()=="0")? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx" style="color:White">全部商品</a></li>
	       <li class="<%=(prizesDetailOne["type"].ToString()=="1")? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=1" style="color:White">时尚达人</a></li>
	       <li class="<%=(prizesDetailOne["type"].ToString()=="2")? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=2" style="color:White">数码精品</a></li>
	       <li class="<%=(prizesDetailOne["type"].ToString()=="3")? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=3" style="color:White">旅行专家</a></li>
	       <li class="<%=(prizesDetailOne["type"].ToString()=="4")? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=4" style="color:White">机票折扣</a></li>
	       <li class="<%=(prizesDetailOne["type"].ToString()=="5")? "one":"two" %>"><a href="http://www.fei580.com/prizes.aspx?typeId=5" style="color:White">酒店住宿</a></li>
	     </ul><img src="http://www.fei580.com/images/prize04.jpg" style="float:left;" />
	     <div class="prize_rightbox" style="padding-bottom:12px;">
	       <div class="prize_rightboxtwo"><strong>奖品详细</strong><a href="http://www.fei580.com/prizes.aspx">返回奖品首页</a></div>
	       <ul class="prize_rightulthree clearfix">
	         <li class="one"><a href="http://www.fei580.com/<%=prizesDetailOne["picPath"]%>" target="_blank"><img alt="" height="331px" src="http://www.fei580.com/<%=prizesDetailOne["picPath"]%>" width="331px" /></a><p>这份奖品抽奖一次需<%=prizesDetailOne["lotteryScore"]%>积分</p></li>
		     <li class="two">
		       <h1><%=prizesDetailOne["pName"]%></h1>
		       <div class="prize_font"><%=prizesDetailOne["description"]%>
    </div>
		     </li>
	       </ul>

          <ul class="prize_rightulfour clearfix">
	        <li class="one"><input type="button" class="myprize_input_button" value="" id="a1" onclick="showdui();" /><input type="button" value="" class="myprize_input_links" id="a2" onclick="return showLot();"/></li>
		    <li class="two"><a href="javascript:;" title=""><img alt="如何赚取积分" height="42px" src="http://www.fei580.com/images/prize02.jpg" width="152px" /></a></li>
	      </ul>
          
	      <div class="prize_rightbottombox clearfix">
	         <img src="http://www.fei580.com/images/prize08.jpg" style="float:left;" />　
		     <dl>
	       <dt>抽奖说明：</dt>
	       <dd>
	       抽奖方式：会员点击“我要抽奖”进入网页抽奖程序，中奖率均达百分之三十三。<br />
    兑换方式：抽奖中奖之后以填写订单为最终兑换结果<br />
    配送方式：快递<br />
    配送费用：飞瀛承担<br />
    配送时间：奖品在提交申请后一周内送出，如遇节假日或缺货情况，配送将相应延期。<br />
    温馨提示：
	        <ol>
		      <li>请中文填写订单信息，同时确认配送地址和联系方式正确，收到发货通知后，请保持电话畅通；</li>
		      <li>奖品兑换订单一经处理，如无质量问题，将不再接受取消或更改；</li>
		      <li>奖品图片仅供参考，具体奖品以收到的实物为准；</li>
		      <li>接到收货通知，如一周后仍未收到，请及时联系飞瀛客服中心（400-885-0663）查询；</li>
		      <li>收取奖品时，请当场拆封检查，如有损坏或与实际兑换不符，请拒收，同时请与飞瀛客服中心联系，如收取奖品时，未检查即签收，以奖品完好处理。</li>
		    <ol>
	       </dd>
	     </dl>
		     <img src="http://www.fei580.com/images/prize09.jpg" style="float:left;" />　
	      </div>

	     </div>　　 　     
	     <img src="http://www.fei580.com/images/prize05.jpg" style="float:left;" />　
       </div>


      <div class="prize_tips" id="q1" style="clear:both;">
        <a href="javascript:void(0);" style="float:right;margin-right:10px;display:inline;" onclick="document.getElementById('q1').style.display='none';">×关闭</a>
        <strong class="prize_tipsstrong">兑换提示</strong>
        <%
     string memberName = "";
     if (Session["Mem_LoginName"] != null) memberName = Session["Mem_LoginName"].ToString(); %>
	    <ul>
	      <li class="one"><strong><%=memberName%></strong>您好，这次兑换的奖品是<strong><%=prizesDetailOne["pName"]%></strong>;<br />
    这次兑换将会扣除<strong><%=prizesDetailOne["needScore"]%></strong>积分，确认无误，请继续填写订单。</li>
          <li class="two">
	        <table>
		      <tr>
		        <th>收件人名字：</th>
			    <td><input type="text" id="txt_linkMan"  runat="server"/></td>
		      </tr>
		      <tr>
		        <th>收件地址：</th>
			    <td><input type="text" id="txt_linkAddress"  runat="server"/></td>
		      </tr>
		      <tr>
		        <th>邮编：</th>
			    <td><input type="text" id="txt_linkCode"  runat="server"/></td>
		      </tr>
		      <tr>
		        <th>联系电话：</th>
			    <td><input type="text" id="txt_linkTel"  runat="server"/></td>
		      </tr>
		      <tr>
		        <th>附加说明：</th>
			    <td><textarea id="txt_otherDetail"  runat="server"></textarea></td>
		      </tr>
		    </table>
		    <asp:Button ID="prizeOrder" runat="server" Text="提交订单" OnClick="btnok_order"  OnClientClick="return order();" CssClass="prize_tips_button_submit" />

	      </li>
	    </ul>
      </div>
       </div>


      </form>
      
  <uc1:footControl ID="FootControl" runat="server" />
  </div>
 </body>
</html>
