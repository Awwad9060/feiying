<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="show" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<HEAD><TITLE>֧������ʱ���ʽӿ�</TITLE>
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
     <li><a target="_blank" href="http://www.fei580.com/">��������</a></li>
     <li>|</li>
     <li><a target="_blank" href="http://help.alipay.com/lab/150006-234447/0-234447.htm">��������</a></li>
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
       <li>1��ȷ�ϸ�����Ϣ ��</li>
       <li class="current">2������ ��</li>
       <li class="last">3���������</li>
      </ol>
     </div>
     <div class="payform">
      <dl class="content">
       <dt class="paytitle">���⣺</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <%--<%=productName %>--%>
       <span class="red-star">��ʽҪ��XX����/Ůʿ + XX��XX��Ʊ/�Ƶ��</span>
       </dd>
       <dt class="paytitle">�����</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <%=(orderAmount)+"��" %>
       <span class="red-star">��д��Ҫ����Ľ��(�磺112.21)</span>
       </dd>
       <dt class="paytitle">��ע��</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
       <%--<%=productDesc %>--%>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;������ϵ��������ƷҪ�������ȡ�100�����ڣ�</span>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class="new-btn-login-sp">
       <%= msg%>
       </span>
       </dd>
      </dl>
     </div>
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