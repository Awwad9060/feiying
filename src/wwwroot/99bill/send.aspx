<%@ Page Language="C#" AutoEventWireup="true" CodeFile="send.aspx.cs" Inherits="_99bill_send" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>��Ǯ֧��-�����-����/���ڻ�Ʊ�������ߣ�400-885-0663(���)</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta name="Description"  content="�����Ϊ���ṩ����,���,����,�Ϻ�,���������ؼ۹��ʻ�Ʊ,���۹��ʻ�Ʊ,�Լ�����ʵʱ���ʺ���Ʊ�۲�ѯ����.������ߣ�400-885-0663;" />
<meta name="keywords" content="���ʻ�Ʊ,���ʻ�Ʊ��ѯ,���ʻ�ƱԤ��,����ʵʱ����,���ʻ�����" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
 <div id="head">
  <div class="top">		 
   <div class="topnav">
    <ul>
     <li><a href="http://www.fei580.com/" target="_blank">�����ҳ</a></li>
     <li>|</li>
     <li><a href="http://www.99bill.com/" target="_blank" rel="nofollow">��Ǯ֧��</a></li>
     <li>|</li>
     <li><a href="https://help.99bill.com/" target="_blank" rel="nofollow">��������</a></li>
    </ul>
    </div>
   </div>
   <div class="headlogo">
	<div class="logo"><img src="images/paylogo.jpg" /></div>
     <div class="nav">
      <ul>
        <li><a href="/yinlian/">��������</a></li>
        <li class="active"><a href="/99bill/">��Ǯ֧��</a></li>
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
     <form name="kqPay" method="post" action="https://www.99bill.com/gateway/recvMerchantInfoAction.htm" target="_blank">    
	 <div class="payform">
      <dl class="content">
       <dt class="paytitle">���⣺</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <asp:Label ID="lab_ProductName" runat="server"></asp:Label>
       <span class="red-star">��ʽҪ��XX����/Ůʿ + XX��XX��Ʊ/�Ƶ��</span>
       </dd>
       <dt class="paytitle">�����</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <asp:Label ID="lab_OrderAmount" runat="server"></asp:Label>
       <span class="red-star">��д��Ҫ����Ľ��(�磺112.21)</span>
       </dd>
       <dt class="paytitle">��ע��</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
       <asp:Label ID="lab_ProductDesc" runat="server"></asp:Label>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;������ϵ��������ƷҪ�������ȡ�100�����ڣ�</span>
       </dd>
       <dt class="other">&nbsp;</dt>
       <dd class="otheri">
        <input type="hidden" name="inputCharset" value="<%=inputCharset %>"/>
	    <input type="hidden" name="bgUrl" value="<%=bgUrl %>"/>
		<input type="hidden" name="pageUrl" value="<%=pageUrl %>"/>
		<input type="hidden" name="version" value="<%=version %>"/>
		<input type="hidden" name="language" value="<%=language %>"/>
		<input type="hidden" name="signType" value="<%=signType %>"/>
		<input type="hidden" name="signMsg" value="<%=signMsg %>"/>
		<input type="hidden" name="merchantAcctId" value="<%=merchantAcctId %>"/>
		<input type="hidden" name="payerName" value="<%=payerName %>"/>
		<input type="hidden" name="payerContactType" value="<%=payerContactType %>"/>
		<input type="hidden" name="payerContact" value="<%=payerContact %>"/>
		<input type="hidden" name="orderId" value="<%=orderId %>"/>
		<input type="hidden" name="orderAmount" value="<%=orderAmount%>" />
		<input type="hidden" name="orderTime" value="<%=orderTime %>">
	    <input type="hidden" name="productName" value="<%=productName%>" />
		<input type="hidden" name="productNum" value="<%=productNum %>"/>
		<input type="hidden" name="productId" value="<%=productId %>"/>
		<input type="hidden" name="productDesc" value="<%=productDesc%>" />
		<input type="hidden" name="ext1" value="<%=ext1 %>"/>
		<input type="hidden" name="ext2" value="<%=ext2 %>"/>
		<input type="hidden" name="payType" value="<%=payType %>"/>
		<input type="hidden" name="bankId" value="<%=bankId %>"/>
		<input type="hidden" name="redoFlag" value="<%=redoFlag %>"/>
		<input type="hidden" name="pid" value="<%=pid %>"/>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class="new-btn-login-sp">
       <button class="new-btn-login" type="submit" style="text-align:center;"></button>
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
      <li>1. ����������ǮǩԼ��Ϊ�����̻����������ȫ�棻֧�����б��ϡ�</li>
      <li>2. ����ǰ�������Ŀͷ�ȷ����������</li>
      <li>3. ��ѯ�绰��400-885-0663</li>
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
	   ��Ȩ �� �����з������������޹�˾ ���� ��ҳ��Ϊ �����-֧����ʽ-��Ǯ֧��
	  </li>
	 </ul>
	 </div>
</body>
</html>
