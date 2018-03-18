<!--#include file="md5function.asp"-->
<%
'##############################################################################
'#                                                                            #
'#                       开放商户订单生成发送接口程序V3.6              	      #
'#                       ====================================                 #
'# 文件名称：SendOI.asp                                                       #


'函数名称：GetOrderNo(订单日期)
'主要功能：根据订单日期生成订单号
'-----------------------------------------------------------------------------------------
'Function GetOrderNo(dDate)
'    GetOrderNo = RIGHT("0000"+Trim(Year(dDate)),4)+RIGHT("00"+Trim(Month(dDate)),2)+RIGHT("00"+Trim(Day(dDate)),2)+RIGHT("00" + Trim(Hour(dDate)),2)+RIGHT("00"+Trim(Minute(dDate)),2)+RIGHT("00"+Trim(Second(dDate)),2)
'End Function

Function SignMsgWithPubKey(strSourceMsg, strPKey)
	Dim strKey
	
	strKey	=	MD5(strPKey)
	strKey	=	strSourceMsg & strKey
	strKey	=	MD5(strKey)
	SignMsgWithPubKey	=	strKey

End Function
'接收变量
'-----------------------------------------------------------------------------------------
Dim Action
Action      = Request("Action")      '用户动作

'执行用户动作，提交订单至银联在线
'-----------------------------------------------------------------------------------------
If Action = "SendOrder" Then

	Dim RcvCertPath,SendCertPath,SendCertPWD,MerId,OrderNo,OrderAmount,CurrCode,CallBackUrl,ResultMode
	Dim Reserved01,Reserved02,SourceText,obj,EncryptedMsg,SignedMsg,ErrMsg,bolRet,nPayStat,EntryMode			
	Dim strPKey
	
	MerId       = "D7R"              	    '商户ID参数		
	OrderNo		= Request("OrderNo")		'商户订单号
	OrderAmount	= Request("OrderAmount")	'订单金额，格式：元.角分
	CurrCode	= "CNY"		'货币代码，值为：CNY
	CallBackUrl	= Request("CallBackUrl")	'支付结果接收URL
	ResultMode  = "0"				'支付结果返回方式(0-成功和失败支付结果均返回；1-仅返回成功支付结果)
	Reserved01 	= Request("alibody")				'保留域1
	Reserved02 	= ""				'保留域2	
	BankCode    = "00010000"	
	
	strPKey		= "b62a811ed349fc11a90d03d0c8b15761"
	
	EntryMode = Request("EntryMode")  '支付方式
	'组合成订单原始数据
  	SourceText 	= MerId & OrderNo & OrderAmount & CurrCode & CallBackUrl & ResultMode & BankCode & EntryMode & Reserved01 & Reserved02			
	
	'使用发送方证书对订单原始数据进行签名
	SignedMsg = SignMsgWithPubKey(SourceText, strPKey)
	
		
	'生成FORM并自动提交	
	Response.Write "<form method='post' name='SendOrderForm' action='https://www.gnete.com/bin/scripts/OpenVendor/gnete/V36/GetOvOrder.asp'>"&vbCrLf		
	Response.Write "<input type='hidden' name='MerId' value='"& MerId &"'>"&vbCrLf
	Response.Write "<input type='hidden' name='OrderNo' value='"& OrderNo &"'>"&vbCrLf
	Response.Write "<input type='hidden' name='OrderAmount' value='"& OrderAmount &"'>"&vbCrLf
	Response.Write "<input type='hidden' name='CurrCode' value='"& CurrCode &"'>"&vbCrLf
	Response.Write "<input type='hidden' name='CallBackUrl' value='"& CallBackUrl &"'>"&vbCrLf
	Response.Write "<input type='hidden' name='ResultMode' value='"& ResultMode &"'>"&vbCrLf
	Response.Write "<input type='hidden' name='BankCode' value='"& BankCode &"'>"&vbCrLf
	Response.Write "<input type='hidden' name='EntryMode' value='"& EntryMode &"'>"&vbCrLf
	Response.Write "<input type='hidden' name='Reserved01' value='"& Reserved01 &"'>"&vbCrLf								
	Response.Write "<input type='hidden' name='Reserved02' value='"& Reserved02 &"'>"&vbCrLf									
	Response.Write "<input type='hidden' name='SignMsg' value='"& SignedMsg &"'>"&vbCrLf
	Response.Write "</form>"&vbCrLf
	Response.Write "<script language='javascript'>"&vbCrLf
	Response.Write "<!--"&vbCrLf
	Response.Write "SendOrderForm.submit();"&vbCrLf
	Response.Write "//-->"&vbCrLf
	Response.Write "</script>"
	Response.End
	
End If
'-----------------------------------------------------------------------------------------
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<HEAD><TITLE>银联在线即时到帐-飞瀛网</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript">
        function CheckForm() {
            function getStrLength(value) {
                return value.replace(/[^\x00-\xFF]/g, '**').length;
            }
            if (document.OrderForm.OrderNo.value.length == 0) {
                alert("请输入联系手机.");
                document.OrderForm.OrderNo.focus();
                return false;
            }
            if (getStrLength(document.OrderForm.OrderNo.value) > 256) {
                alert("联系手机！请在18个汉字以内");
                document.OrderForm.OrderNo.focus();
                return false;
            }
            if (document.OrderForm.OrderAmount.value.length == 0) {
                alert("请输入付款金额.");
                document.OrderForm.OrderAmount.focus();
                return false;
            }
            var reg = new RegExp(/^\d*\.?\d{0,2}$/);
            if (!reg.test(document.OrderForm.OrderAmount.value)) {
                alert("请正确输入付款金额");
                document.OrderForm.OrderAmount.focus();
                return false;
            }
            if (Number(document.OrderForm.OrderAmount.value) < 0.01) {
                alert("付款金额金额最小是0.01.");
                document.OrderForm.OrderAmount.focus();
                return false;
            }
			if (document.OrderForm.alibody.value.length == 0) {
                alert("请输入款项标题.");
                document.OrderForm.OrderNo.focus();
                return false;
            }
            if (getStrLength(document.OrderForm.alibody.value) > 256) {
                alert("标题过长！请在135个汉字以内");
                document.OrderForm.alibody.focus();
                return false;
            }
            document.OrderForm.alibody.value = document.OrderForm.alibody.value.replace(/\n/g, '');
        }
    </script>
</head>

<body>
 <div id="head">
  <div class="top">		 
   <div class="topnav">
    <ul>
     <li><a href="http://www.fei580.com/" target="_blank">飞瀛首页</a></li>
     <li>|</li>
     <li><a href="http://www.chinapay.com/" target="_blank" rel="nofollow">银联在线</a></li>
     <li>|</li>
     <li><a href="http://www.chinapay.com/web2011/helpCenter/helpcenter.jsp" target="_blank" rel="nofollow">帮助中心</a></li>
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
       <!--li><a href="/alipay2/">担保支付</a></li-->
       <li><a href="/bank/">银行转账</a></li>
       </ul>
      </div>
     </div>
	</div>
    <div id="main">
     <div class="paywayimg"></div>
     
     <div class="cashier-nav">
      <ol>
       <li class="current">1、确认付款信息 →</li>
       <li>2、付款 →</li>
       <li class="last">3、付款完成</li>
      </ol>
     </div>
     <form method="post" name="OrderForm" onsubmit="return CheckForm();" action="SendOI.asp"  target="_blank">
	 <input type="hidden" name="Action" value="SendOrder" />
	 <input type="hidden" name="CallBackUrl" value="http://www.fei580.com/unpay/GetResult.asp">
     <div class="payform">
      <dl class="content">
       <dt class="paytitle">款项标题：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
	   <input type="text" maxlength="256" size="30" name="alibody" value="" />
       <span class="red-star">格式：XX先生/女士 + XX至XX机票/酒店款</span>
       </dd>
       <dt class="paytitle">付款金额：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input type="text" maxlength="10" size="30" name="OrderAmount" onfocus="if(Number(this.value)==0){this.value='';}" value="00.00" />
       <span class="red-star">填写你要付款的金额(如：112.21)</span>
       </dd>
       <dt class="paytitle">联系手机：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input type="text" maxlength="256" size="30" name="OrderNo" value="" />
	   <span class="red-star">格式：姓名简拼+手机号码 如:ZS13800138000</span>
       </dd>
       <dd class="payinput">
       <span class="new-btn-login-sp">
       <button class="new-btn-login" type="submit"></button>
       </span>
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

