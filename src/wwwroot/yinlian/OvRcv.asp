<%
'##############################################################################
'#                                                                            #
'#                       GNETE.com->开放商户支付接口接收程序V3.6              #
'#                       ====================================                 #
'# 文件名称：OvRcv.asp                                                        #
'# 原作者：钟千伟                                                             #
'# 修改者：张本翔 修改时间：2009-07-22                                        #
'# 技术支持：020-85548610 gnshi@gnete.com                                      #
'# 中国银联广州分公司技术管理部                                               #
'#                                                                            #
'# 主要功能：                                                                 #
'# =========                                                                  #
'# 1、此程序放在商户服务器端，用于接收GNETE.com通过用户浏览器返回的支付结果,  #
'#    并对支付结果进行解密校验                                                #
'#                                                                            #
'# 2、返回支付结果给用户                                                      #
'#                                                                            #

'#                                                                            #
'##############################################################################

Function SignMsgWithPubKey(strSourceMsg, strPKey)
	Dim strKey
	
	strKey	=	MD5(strPKey)
	strKey	=	strSourceMsg & strKey
	strKey	=	MD5(strKey)
	SignMsgWithPubKey	=	strKey

End Function

'接受银联在线返回数据
'----------------------------------------------------------------------------------------
OrderNo 	= Trim(Request("OrderNo"))		'商户订单号
PayNo 	    = Trim(Request("PayNo"))		'支付单号
PayAmount 	= Trim(Request("PayAmount"))		'支付金额，格式：元.角分
CurrCode 	= Trim(Request("CurrCode"))		'货币代码
SystemSSN 	= Trim(Request("SystemSSN"))		'系统参考号
RespCode 	= Trim(Request("RespCode"))		'响应码
SettDate 	= Trim(Request("SettDate"))		'清算日期，格式：月月日日
Reserved01 	= Trim(Request("Reserved01"))		'保留域1
Reserved02 	= Trim(Request("Reserved02"))		'保留域2
SignMsg      = Trim(Request("SignMsg"))                      '时间戳签名

'检验数据是否正确
'----------------------------------------------------------------------------------------
If  Len(SignMsg)=0 Then
	'输出错误信息到浏览器
	Response.Write "<font color=red>Err No.: 102<br>Err Description: The Payment Result Parameters Is Empty!</font>"
End If

'对信息进行解密并校验时间戳签名
'----------------------------------------------------------------------------------------
Dim obj,bolRet,SourceMsg,ErrMsg,SignerCert,SignedTime,locSignMsg,strPKey

strPKey		= "12hi60ohgmp16nbev0gr8au69bodzguz"

SourceMsg = OrderNo & PayNo & PayAmount & CurrCode & SystemSSN & RespCode & SettDate & Reserved01 & Reserved02

locSignMsg = SignMsgWithPubKey(SourceMsg,strPKey)

'校验签名是否一致
'----------------------------------------------------------------------------------------
If locSignMsg <>  SignMsg Then	
'验签不通过，不对数据库进行更新，检查公钥是否跟商户管理后台的查询到的一致
	
	Response.Write "签名不正确"
	Response.End
Else

'----------------------------------------------------------------------------------------
	
'将银联返回的支付结果更新到商户本地数据库
'----------------------------------------------------------------------------------------
'此部分操作由商户自行开发，建议将银联返回的原文、SignMsg同时写入数据库

'输出支付结果给顾客
'----------------------------------------------------------------------------------------
	If RespCode = "00" Then
		Response.Write "<font color=red>支付成功!系统参考号为："&SystemSSN&"</font>"
	Else
		Response.Write "<font color=red>支付失败!响应码为："&RespCode&"</font>"
	End If
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>银联在线即时到帐-飞瀛网</title>
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
       <li><a href="/yinlian/"><img src="images/ylzxa.gif" /></a></li>
       <li><a href="/alipay/"><img src="images/alipayzb.gif" /></a></li>
       <li><a href="/alipay2/"><img src="images/alipaydb.gif" /></a></li>
       <li><a href="/bank/"><img src="images/zhzzb.gif" /></a></li>
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
     <div class="payform">
      <%
'----------------------------------------------------------------------------------------

'根据解密后的内容分解出订单信息
'----------------------------------------------------------------------------------------
Dim OrderNo,PayNo,PayAmount,CurrCode,SystemSSN,RespCode,SettDate,Reserved01,Reserved02
OrderNo 	= GetValue(DecryptedMsg, "OrderNo")		'商户订单号
PayNo 		= GetValue(DecryptedMsg, "PayNo")		'支付单号
PayAmount 	= GetValue(DecryptedMsg, "PayAmount")		'支付金额，格式：元.角分
CurrCode 	= GetValue(DecryptedMsg, "CurrCode")		'货币代码
SystemSSN 	= GetValue(DecryptedMsg, "SystemSSN")		'系统参考号
RespCode 	= GetValue(DecryptedMsg, "RespCode")		'响应码
SettDate 	= GetValue(DecryptedMsg, "SettDate")		'清算日期，格式：月月日日
Reserved01 	= GetValue(DecryptedMsg, "Reserved01")		'保留域1
Reserved02 	= GetValue(DecryptedMsg, "Reserved02")		'保留域2
'用下段代码可以测试返回的信息是否正确
	
'将银联返回的支付结果更新到商户本地数据库
'----------------------------------------------------------------------------------------
'此部分操作由商户自行开发，建议将银联返回的EncodeMsg、SignMsg同时写入数据库

'输出支付结果给顾客
'----------------------------------------------------------------------------------------
If RespCode = "00" Then
	Response.Write "<p style='font-size:14px;color:#ff0000;'>支付成功!</p><p>交易流水号:"&SystemSSN&"</p><p>>金额："&PayAmount&"</p>"
Else
	Response.Write "<p style='font-size:14px;color:#ff0000;'>支付失败!响应码为："&RespCode&"</p>"
End If


'-----------------------------------------------------------------------------------------
'函数名称：GetValue(待取值的字符串, 域名)
'参数：
'	TobeGetStr 待取值的字符串,输入值
'	FieldName  要取值的域名
'输出：
'	符合域名的域值
'主要功能：从待取值的字符串中取出符合域名的域值
'-----------------------------------------------------------------------------------------
Function GetValue(TobeGetStr,FieldName)
	Dim tmpArray,tmpFieldStr,tmpFieldName,tmpFieldValue,i
	
	If TobeGetStr="" or FieldName="" Then
		Exit Function
	End If
	tmpArray = Split(TobeGetStr,"&")
	For i = 0 To UBound(tmpArray)-1
		tmpFieldStr	= tmpArray(i)
		tmpFieldName  	= Mid(tmpFieldStr, 1, InStr(tmpArray(i),"=")-1)
		tmpFieldValue 	= Mid(tmpFieldStr, InStr(tmpArray(i),"=") + 1, Len(tmpFieldStr)-InStr(tmpArray(i),"="))
	
		If UCase(FieldName) = UCase(tmpFieldName) Then
			GetValue = tmpFieldValue
			Exit Function
		End If
	Next	
End Function
%>
     </div>

     
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

