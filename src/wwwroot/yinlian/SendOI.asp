<!--#include file="md5function.asp"-->
<%
'##############################################################################
'#                                                                            #
'#                       �����̻��������ɷ��ͽӿڳ���V3.6              	      #
'#                       ====================================                 #
'# �ļ����ƣ�SendOI.asp                                                       #


'�������ƣ�GetOrderNo(��������)
'��Ҫ���ܣ����ݶ����������ɶ�����
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
'���ձ���
'-----------------------------------------------------------------------------------------
Dim Action
Action      = Request("Action")      '�û�����

'ִ���û��������ύ��������������
'-----------------------------------------------------------------------------------------
If Action = "SendOrder" Then

	Dim RcvCertPath,SendCertPath,SendCertPWD,MerId,OrderNo,OrderAmount,CurrCode,CallBackUrl,ResultMode
	Dim Reserved01,Reserved02,SourceText,obj,EncryptedMsg,SignedMsg,ErrMsg,bolRet,nPayStat,EntryMode			
	Dim strPKey
	
	MerId       = "D7R"              	    '�̻�ID����		
	OrderNo		= Request("OrderNo")		'�̻�������
	OrderAmount	= Request("OrderAmount")	'��������ʽ��Ԫ.�Ƿ�
	CurrCode	= "CNY"		'���Ҵ��룬ֵΪ��CNY
	CallBackUrl	= Request("CallBackUrl")	'֧���������URL
	ResultMode  = "0"				'֧��������ط�ʽ(0-�ɹ���ʧ��֧����������أ�1-�����سɹ�֧�����)
	Reserved01 	= Request("OrderNo")&"����ע˵����"& Request("alibody")				'������1
	Reserved02 	= ""				'������2
	BankCode    = "00010000"	
	
	strPKey		= "b62a811ed349fc11a90d03d0c8b15761"
	
	EntryMode = Request("EntryMode")  '֧����ʽ
	'��ϳɶ���ԭʼ����
  	SourceText 	= MerId & OrderNo & OrderAmount & CurrCode & CallBackUrl & ResultMode & BankCode & EntryMode & Reserved01 & Reserved02			
	
	'ʹ�÷��ͷ�֤��Զ���ԭʼ���ݽ���ǩ��
	SignedMsg = SignMsgWithPubKey(SourceText, strPKey)
	
		
	'����FORM���Զ��ύ	
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
    <title>�������߼�ʱ���ʽӿ�</title>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
</head>
<body>
<p>�����ύ�����Ժ򡭡�</p>
</body>
</html>

