<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<HEAD><TITLE>�������߼�ʱ����-�����</TITLE>
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
       <li class="active"><a href="/yinlian/">��������</a></li>
       <li><a href="/99bill/">��Ǯ֧��</a></li>
       <li><a href="/alipay/">֧����֧��</a></li>
       <li><a href="/alipay2/">����֧��</a></li>
       <li><a href="/bank/">����ת��</a></li>
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
     <form method="post" name="OrderForm" onsubmit="return CheckForm();" action="SendOI.asp">
	 <input type="hidden" name="Action" value="SendOrder" />
     <div class="payform">
      <dl class="content">
       <dt class="paytitle">��ע��</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
	<%		
	'�������
	'����
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
       response.write "�������"
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




