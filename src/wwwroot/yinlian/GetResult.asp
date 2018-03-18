<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<HEAD><TITLE>银联在线即时到帐-飞瀛网</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css" />

</head>

<body>
 <div id="head">
  <div class="top">		 
   <div class="topnav">
    <ul>
     <li><a target="_blank" href="http://www.fei580.com/">飞瀛首页</a></li>
     <li>|</li>
     <li><a target="_blank" href="http://www.chinapay.com/">银联在线</a></li>
     <li>|</li>
     <li><a target="_blank" href="http://www.chinapay.com/web2011/helpCenter/helpcenter.jsp">帮助中心</a></li>
    </ul>
    </div>
   </div>
   <div class="headlogo">
	<div class="logo"><img src="images/paylogo.jpg" /></div>
     <div class="nav">
      <ul>
       <li class="active"><a href="/yinlian/">银联在线</a></li>
       <li><a href="/99bill/">快钱支付</a></li>
       <li><a href="/alipay/">支付宝支付</a></li>
       <li><a href="/alipay2/">担保支付</a></li>
       <li><a href="/bank/">银行转账</a></li>
       </ul>
      </div>
     </div>
	</div>
    <div id="main">
     <div class="paywayimg"></div>
     
     <div class="cashier-nav">
      <ol>
       <li>1、确认付款信息 →</li>
       <li>2、付款 →</li>
       <li class="current">3、付款完成</li>
      </ol>
     </div>
     <form method="post" name="OrderForm" onsubmit="return CheckForm();" action="SendOI.asp">
	 <input type="hidden" name="Action" value="SendOrder" />
     <div class="payform">
      <dl class="content">
       <dt class="paytitle">备注：</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
	<%		
	'定义变量
	'具体
	Dim objXMLHTTP,strBuf
	strUrl = "https://www.gnete.com/bin/scripts/OpenVendor/gnete/V36/GetPayResult.asp"
	MerId			= "D7R"
	UserId			= "D7R"
	Pwd				= "123456"
	PaySuc			= "1" 
	ShoppingTime	= ""
	BeginTime		= "2012-10-11 00:00:00"
	EndTime			= "2012-10-12 00:00:00"	
	OrderNo			= ""
	  strBody = "MerId=" + Trim(MerId) + "&UserId=" + Trim(UserId) + "&Pwd=" + Trim(Pwd) + "&PaySuc=" + Trim(PaySuc) + "&ShoppingTime=" + Trim(ShoppingTime) + "&BeginTime=" + Trim(BeginTime) + "&EndTime=" + Trim(EndTime) +	"&OrderNo=" + Trim(OrderNo)
    Dim tmpstr
	strUrl = strUrl & "?" & strBody
	Dim objHttp, objXml
	Set objXMLHTTP=Server.CreateObject("Microsoft.XMLHTTP")
	objXMLHTTP.open "GET", strUrl, False, "", ""
	objXMLHTTP.send()
    If objXMLHTTP.Status <> "200" Then
       response.write "网络故障"
	Else    
	    strBuf = objXMLHTTP.responseText
		Response.Write strBuf
    End If    	  	   	
	objXMLHTTP = Nothing
	Response.End
	%>
	</dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;</span>
       </dd>
      </dl>
     </div>
     </form>
     
    </div>
    <div class="clear"></div>
    <div class="tishi">
     <ul>
      <li>提示：</li>
      <li>1. 飞瀛商旅与银联在线签约成为合作商户，服务更加全面；支付更有保障。</li>
      <li>2. 付款前请与您的客服确认清楚款项金额。</li>
      <li>3. 储蓄卡与信用卡支付，需支付0.7%的手续费</li>
      <li>4. 咨询电话：400-885-0663</li>
     </ul>
    </div>
    <div id="foot">
	 <ul class="foot-ul">
	  <li>
	   <font class=note-help2>如果您点击"确认付款"按钮，即表示您同意向卖家购买此物品。 
	   <br/>
	   您有责任查阅完整的物品登录资料，包括卖家的说明和接受的付款方式。卖家必须承担物品信息正确登录的责任！ 
	   </font>
	  </li>
	  <li>
	   版权 归 广州市飞瀛商务服务有限公司 所有 本页面为 飞瀛网-支付方式-银联在线
	  </li>
	 </ul>
    </div>
</body>
</html>




