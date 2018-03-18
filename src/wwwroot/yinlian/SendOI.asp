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
	Reserved01 	= Request("OrderNo")&"；备注说明："& Request("alibody")				'保留域1
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
<head>
    <title>银联在线即时到帐接口</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body>
<p>正在提交，请稍候……</p>
</body>
</html>

