<?php
/* *
 * ���ܣ�֧�������������׽ӿڽӿڵ������ҳ��
 * �汾��3.3
 * ���ڣ�2012-07-23
 * ˵����
 * ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 */

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<HEAD><TITLE>֧��������֧��-�����</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script language=JavaScript>
function CheckForm()
{
	if (document.alipayment.WIDseller_email.value.length == 0) {
		alert("�����������˺�.");
		document.alipayment.WIDseller_email.focus();
		return false;
	}
	if (document.alipayment.WIDout_trade_no.value.length == 0) {
		alert("�����붩����.");
		document.alipayment.WIDout_trade_no.focus();
		return false;
	}
	if (document.alipayment.WIDsubject.value.length == 0) {
		alert("����������.");
		document.alipayment.WIDsubject.focus();
		return false;
	}
	if (document.alipayment.WIDprice.value.length == 0) {
		alert("�����븶����.");
		document.alipayment.WIDprice.focus();
		return false;
	}
	var reg	= new RegExp(/^\d*\.?\d{0,2}$/);
	if (! reg.test(document.alipayment.WIDprice.value))
	{
        alert("����ȷ���븶����");
		document.alipayment.WIDprice.focus();
		return false;
	}
	if (Number(document.alipayment.WIDprice.value) < 0.01) {
		alert("����������С��0.01.");
		document.alipayment.WIDprice.focus();
		return false;
	}
	function getStrLength(value){
        return value.replace(/[^\x00-\xFF]/g,'**').length;
    }
    if(getStrLength(document.alipayment.WIDbody.value) > 200){
        alert("��ע����������100����������");
        document.alipayment.WIDbody.focus();
        return false;
    }
    if(getStrLength(document.alipayment.WIDsubject.value) > 256){
        alert("�������������128����������");
        document.alipayment.WIDsubject.focus();
        return false;
    }

	document.aplipayment.alibody.value = document.aplipayment.WIDbody.value.replace(/\n/g,'');
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
     <li><a href="http://www.alipay.com/" target="_blank" rel="nofollow">֧������ҳ</a></li>
     <li>|</li>
     <li><a href="http://help.alipay.com/support/index_sh.htm" target="_blank" rel="nofollow">��������</a></li>
    </ul>
    </div>
   </div>
   <div class="headlogo">
	<div class="logo"><img src="images/paylogo.jpg" /></div>
     <div class="nav">
      <ul>
        <li><a href="/yinlian/">��������</a></li>
        <li><a href="/99bill/">��Ǯ֧��</a></li>
        <li><a href="/alipay/">֧����֧��</a></li>
        <li class="active"><a href="/alipay2/">����֧��</a></li>
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
     <form name=alipayment action="alipayapi.php" method=post target="_blank">
     <div class="payform">
      <dl class="content">
      <dt class="paytitle" style="display:none">�����˻���</dt>
       <dd class="payinput" style="display:none">
       <span class="red-star">*</span>
       <input size="30" name="WIDseller_email" value="gzfeiying@sina.cn" />
       <span class="red-star">����</span>
       </dd>
       <dt class="paytitle" style="display:none">�����ţ�</dt>
       <dd class="payinput" style="display:none">
       <span class="red-star">*</span>
       <input size="30" name="WIDout_trade_no" value="<?php echo $showtime=date("YmdHis");?>" />
       <span class="red-star">���������</span>
       </dd>
       <dt class="paytitle">���⣺</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input size="30" name="WIDsubject" />
       <span class="red-star">��ʽҪ��XX����/Ůʿ + XX��XX��Ʊ/�Ƶ��</span>
       </dd>
       <dt class="paytitle">�����</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input size="30" name="WIDprice"  onfocus="if(Number(this.value)==0){this.value='';}" value="00.00"/>
       <span class="red-star">��д��Ҫ����Ľ��(�磺112.21)</span>
       </dd>
       <dt class="paytitle">��ע��</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
       <textarea name="WIDbody" rows=4 cols=40 wrap="physical"></textarea>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;������ϵ��������ƷҪ�������ȡ�100�����ڣ�</span>
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
      <li>1. ���������֧����ǩԼ��Ϊ�����̻����������ȫ�棻֧�����б��ϡ�</li>
      <li>2. ����ǰ�������Ŀͷ�ȷ����������</li>
      <li>3. ��������ÿ�֧������֧��1.2%��������</li>
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
	   ��Ȩ �� �����з������������޹�˾ ���� ��ҳ��Ϊ �����-֧����ʽ-����֧��
	  </li>
	 </ul>
    </div>
</body>
</html>

