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
	Reserved01 	= Request("alibody")				'������1
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
<HEAD><TITLE>�������߼�ʱ����-�����</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script language="JavaScript" type="text/javascript">
        function CheckForm() {
            function getStrLength(value) {
                return value.replace(/[^\x00-\xFF]/g, '**').length;
            }
            if (document.OrderForm.OrderNo.value.length == 0) {
                alert("��������ϵ�ֻ�.");
                document.OrderForm.OrderNo.focus();
                return false;
            }
            if (getStrLength(document.OrderForm.OrderNo.value) > 256) {
                alert("��ϵ�ֻ�������18����������");
                document.OrderForm.OrderNo.focus();
                return false;
            }
            if (document.OrderForm.OrderAmount.value.length == 0) {
                alert("�����븶����.");
                document.OrderForm.OrderAmount.focus();
                return false;
            }
            var reg = new RegExp(/^\d*\.?\d{0,2}$/);
            if (!reg.test(document.OrderForm.OrderAmount.value)) {
                alert("����ȷ���븶����");
                document.OrderForm.OrderAmount.focus();
                return false;
            }
            if (Number(document.OrderForm.OrderAmount.value) < 0.01) {
                alert("����������С��0.01.");
                document.OrderForm.OrderAmount.focus();
                return false;
            }
			if (document.OrderForm.alibody.value.length == 0) {
                alert("������������.");
                document.OrderForm.OrderNo.focus();
                return false;
            }
            if (getStrLength(document.OrderForm.alibody.value) > 256) {
                alert("�������������135����������");
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
     <li><a href="http://www.fei580.com/" target="_blank">�����ҳ</a></li>
     <li>|</li>
     <li><a href="http://www.chinapay.com/" target="_blank" rel="nofollow">��������</a></li>
     <li>|</li>
     <li><a href="http://www.chinapay.com/web2011/helpCenter/helpcenter.jsp" target="_blank" rel="nofollow">��������</a></li>
    </ul>
    </div>
   </div>
   <div class="headlogo">
	<div class="logo"><img src="images/paylogo.jpg" /></div>
     <div class="nav">
      <ul>
       <li class="active"><a href="/yinlian/">��������</a></li>
       <li><a href="/99bill/">��Ǯ֧��</a></li>
       <li><a href="/alipay/">֧����֧��</a></li>
       <!--li><a href="/alipay2/">����֧��</a></li-->
       <li><a href="/bank/">����ת��</a></li>
       </ul>
      </div>
     </div>
	</div>
    <div id="main">
     <div class="paywayimg"></div>
     
     <div class="cashier-nav">
      <ol>
       <li class="current">1��ȷ�ϸ�����Ϣ ��</li>
       <li>2������ ��</li>
       <li class="last">3���������</li>
      </ol>
     </div>
     <form method="post" name="OrderForm" onsubmit="return CheckForm();" action="SendOI.asp"  target="_blank">
	 <input type="hidden" name="Action" value="SendOrder" />
	 <input type="hidden" name="CallBackUrl" value="http://www.fei580.com/unpay/GetResult.asp">
     <div class="payform">
      <dl class="content">
       <dt class="paytitle">������⣺</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
	   <input type="text" maxlength="256" size="30" name="alibody" value="" />
       <span class="red-star">��ʽ��XX����/Ůʿ + XX��XX��Ʊ/�Ƶ��</span>
       </dd>
       <dt class="paytitle">�����</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input type="text" maxlength="10" size="30" name="OrderAmount" onfocus="if(Number(this.value)==0){this.value='';}" value="00.00" />
       <span class="red-star">��д��Ҫ����Ľ��(�磺112.21)</span>
       </dd>
       <dt class="paytitle">��ϵ�ֻ���</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input type="text" maxlength="256" size="30" name="OrderNo" value="" />
	   <span class="red-star">��ʽ��������ƴ+�ֻ����� ��:ZS13800138000</span>
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

