<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_99bill_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>��Ǯ֧��-�����-����/���ڻ�Ʊ�������ߣ�400-885-0663(���)</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta name="Description"  content="�����Ϊ���ṩ����,���,����,�Ϻ�,���������ؼ۹��ʻ�Ʊ,���۹��ʻ�Ʊ,�Լ�����ʵʱ���ʺ���Ʊ�۲�ѯ����.������ߣ�400-885-0663;" />
<meta name="keywords" content="���ʻ�Ʊ,���ʻ�Ʊ��ѯ,���ʻ�ƱԤ��,����ʵʱ����,���ʻ�����" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script language="JavaScript" type="text/javascript">
        function CheckForm() {
            function getStrLength(value) {
                return value.replace(/[^\x00-\xFF]/g, '**').length;
            }
            var productName = document.OrderForm.productName.value;
            if (productName.length == 0) {
                alert("�����븶�����.");
                document.OrderForm.productName.focus();
                return false;
            }
            if (getStrLength(productName) > 256) {
                alert("�������������128����������");
                document.OrderForm.productName.focus();
                return false;
            }
            var orderAmount = document.OrderForm.orderAmount.value;
            if (orderAmount.length == 0) {
                alert("�����븶����.");
                document.OrderForm.orderAmount.focus();
                return false;
            }
            var reg = new RegExp(/^\d*\.?\d{0,2}$/);
            if (!reg.test(orderAmount)) {
                alert("����ȷ���븶����");
                document.OrderForm.orderAmount.focus();
                return false;
            }
            if (Number(orderAmount) < 0.01) {
                alert("����������С��0.01.");
                document.OrderForm.orderAmount.focus();
                return false;
            }
            var productDesc = document.OrderForm.productDesc.value;
            if (getStrLength(productDesc) > 200) {
                alert("��ע����������100����������");
                document.OrderForm.productDesc.focus();
                return false;
            }
            window.location.href = "send.aspx?productName=" + escape(productName) + "&orderAmount=" + escape(orderAmount) + "&productDesc=" + escape(productDesc);
        }
    </script>
</head>
<body>
    <form id="OrderForm" runat="server">
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
	 <div class="payform">
      <dl class="content">
       <dt class="paytitle">���⣺</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       
       <input name="productName" size=30 type="text" value="" />
       <span class="red-star">��ʽҪ��XX����/Ůʿ + XX��XX��Ʊ/�Ƶ��</span>
       </dd>
       <dt class="paytitle">�����</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input name="orderAmount" maxLength=10 size=30 type="text" onfocus="if(Number(this.value)==0){this.value='';}" value=""/>
       <span class="red-star">��д��Ҫ����Ľ��(�磺112.21)</span>
       </dd>
       <dt class="paytitle">��ע��</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
       <textarea name="productDesc" type="text" rows=4 cols=40 wrap="physical" value=""></textarea>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;������ϵ��������ƷҪ�������ȡ�100�����ڣ�</span>
       </dd>
       <dt class="other">&nbsp;</dt>
       <dd class="otheri">
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class="new-btn-login-sp">
       <button class="new-btn-login" type="button" onclick="return CheckForm();" style="text-align:center;"></button>
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
      <li>3. ��������ÿ�֧������֧��0.5%��������</li>
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
	   ��Ȩ �� �����з������������޹�˾ ���� ��ҳ��Ϊ �����-֧����ʽ-��Ǯ֧��
	  </li>
	 </ul>
	 </div>
    </form>
</body>
</html>
