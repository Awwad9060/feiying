<%
'##############################################################################
'#                                                                            #
'#                       GNETE.com->�����̻�֧���ӿڽ��ճ���V3.6              #
'#                       ====================================                 #
'# �ļ����ƣ�OvRcv.asp                                                        #
'# ԭ���ߣ���ǧΰ                                                             #
'# �޸��ߣ��ű��� �޸�ʱ�䣺2009-07-22                                        #
'# ����֧�֣�020-85548610 gnshi@gnete.com                                      #
'# �й��������ݷֹ�˾��������                                               #
'#                                                                            #
'# ��Ҫ���ܣ�                                                                 #
'# =========                                                                  #
'# 1���˳�������̻��������ˣ����ڽ���GNETE.comͨ���û���������ص�֧�����,  #
'#    ����֧��������н���У��                                                #
'#                                                                            #
'# 2������֧��������û�                                                      #
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

'�����������߷�������
'----------------------------------------------------------------------------------------
OrderNo 	= Trim(Request("OrderNo"))		'�̻�������
PayNo 	    = Trim(Request("PayNo"))		'֧������
PayAmount 	= Trim(Request("PayAmount"))		'֧������ʽ��Ԫ.�Ƿ�
CurrCode 	= Trim(Request("CurrCode"))		'���Ҵ���
SystemSSN 	= Trim(Request("SystemSSN"))		'ϵͳ�ο���
RespCode 	= Trim(Request("RespCode"))		'��Ӧ��
SettDate 	= Trim(Request("SettDate"))		'�������ڣ���ʽ����������
Reserved01 	= Trim(Request("Reserved01"))		'������1
Reserved02 	= Trim(Request("Reserved02"))		'������2
SignMsg      = Trim(Request("SignMsg"))                      'ʱ���ǩ��

'���������Ƿ���ȷ
'----------------------------------------------------------------------------------------
If  Len(SignMsg)=0 Then
	'���������Ϣ�������
	Response.Write "<font color=red>Err No.: 102<br>Err Description: The Payment Result Parameters Is Empty!</font>"
End If

'����Ϣ���н��ܲ�У��ʱ���ǩ��
'----------------------------------------------------------------------------------------
Dim obj,bolRet,SourceMsg,ErrMsg,SignerCert,SignedTime,locSignMsg,strPKey

strPKey		= "12hi60ohgmp16nbev0gr8au69bodzguz"

SourceMsg = OrderNo & PayNo & PayAmount & CurrCode & SystemSSN & RespCode & SettDate & Reserved01 & Reserved02

locSignMsg = SignMsgWithPubKey(SourceMsg,strPKey)

'У��ǩ���Ƿ�һ��
'----------------------------------------------------------------------------------------
If locSignMsg <>  SignMsg Then	
'��ǩ��ͨ�����������ݿ���и��£���鹫Կ�Ƿ���̻������̨�Ĳ�ѯ����һ��
	
	Response.Write "ǩ������ȷ"
	Response.End
Else

'----------------------------------------------------------------------------------------
	
'���������ص�֧��������µ��̻��������ݿ�
'----------------------------------------------------------------------------------------
'�˲��ֲ������̻����п��������齫�������ص�ԭ�ġ�SignMsgͬʱд�����ݿ�

'���֧��������˿�
'----------------------------------------------------------------------------------------
	If RespCode = "00" Then
		Response.Write "<font color=red>֧���ɹ�!ϵͳ�ο���Ϊ��"&SystemSSN&"</font>"
	Else
		Response.Write "<font color=red>֧��ʧ��!��Ӧ��Ϊ��"&RespCode&"</font>"
	End If
End If
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<title>�������߼�ʱ����-�����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
 <div id="head">
  <div class="top">		 
   <div class="topnav">
    <ul>
     <li><a target="_blank" href="http://www.fei580.com/">�����ҳ</a></li>
     <li>|</li>
     <li><a target="_blank" href="http://www.chinapay.com/">��������</a></li>
     <li>|</li>
     <li><a target="_blank" href="http://www.chinapay.com/web2011/helpCenter/helpcenter.jsp">��������</a></li>
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
       <li>1��ȷ�ϸ�����Ϣ ��</li>
       <li>2������ ��</li>
       <li class="current">3���������</li>
      </ol>
     </div>
     <div class="payform">
      <%
'----------------------------------------------------------------------------------------

'���ݽ��ܺ�����ݷֽ��������Ϣ
'----------------------------------------------------------------------------------------
Dim OrderNo,PayNo,PayAmount,CurrCode,SystemSSN,RespCode,SettDate,Reserved01,Reserved02
OrderNo 	= GetValue(DecryptedMsg, "OrderNo")		'�̻�������
PayNo 		= GetValue(DecryptedMsg, "PayNo")		'֧������
PayAmount 	= GetValue(DecryptedMsg, "PayAmount")		'֧������ʽ��Ԫ.�Ƿ�
CurrCode 	= GetValue(DecryptedMsg, "CurrCode")		'���Ҵ���
SystemSSN 	= GetValue(DecryptedMsg, "SystemSSN")		'ϵͳ�ο���
RespCode 	= GetValue(DecryptedMsg, "RespCode")		'��Ӧ��
SettDate 	= GetValue(DecryptedMsg, "SettDate")		'�������ڣ���ʽ����������
Reserved01 	= GetValue(DecryptedMsg, "Reserved01")		'������1
Reserved02 	= GetValue(DecryptedMsg, "Reserved02")		'������2
'���¶δ�����Բ��Է��ص���Ϣ�Ƿ���ȷ
	
'���������ص�֧��������µ��̻��������ݿ�
'----------------------------------------------------------------------------------------
'�˲��ֲ������̻����п��������齫�������ص�EncodeMsg��SignMsgͬʱд�����ݿ�

'���֧��������˿�
'----------------------------------------------------------------------------------------
If RespCode = "00" Then
	Response.Write "<p style='font-size:14px;color:#ff0000;'>֧���ɹ�!</p><p>������ˮ��:"&SystemSSN&"</p><p>>��"&PayAmount&"</p>"
Else
	Response.Write "<p style='font-size:14px;color:#ff0000;'>֧��ʧ��!��Ӧ��Ϊ��"&RespCode&"</p>"
End If


'-----------------------------------------------------------------------------------------
'�������ƣ�GetValue(��ȡֵ���ַ���, ����)
'������
'	TobeGetStr ��ȡֵ���ַ���,����ֵ
'	FieldName  Ҫȡֵ������
'�����
'	������������ֵ
'��Ҫ���ܣ��Ӵ�ȡֵ���ַ�����ȡ��������������ֵ
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
      <li>��ʾ��</li>
      <li>1. �����������������ǩԼ��Ϊ�����̻����������ȫ�棻֧�����б��ϡ�</li>
      <li>2. ����ǰ�������Ŀͷ�ȷ����������</li>
      <li>3. ��������ÿ�֧������֧��0.7%��������</li>
      <li>4. ��ѯ�绰��400-885-0663</li>
     </ul>
    </div>
    <div id="foot">
	 <ul class="foot-ul">
	  <li>
	   <font class=note-help2>��������"ȷ�ϸ���"��ť������ʾ��ͬ�������ҹ������Ʒ�� 
	   <br/>
	   �������β�����������Ʒ��¼���ϣ��������ҵ�˵���ͽ��ܵĸ��ʽ�����ұ���е���Ʒ��Ϣ��ȷ��¼�����Σ� 
	   </font>
	  </li>
	  <li>
	   ��Ȩ �� �����з������������޹�˾ ���� ��ҳ��Ϊ �����-֧����ʽ-��������
	  </li>
	 </ul>
    </div>
</body>
</html>

