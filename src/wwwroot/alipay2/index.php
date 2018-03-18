<?php
/* *
 * 功能：支付宝纯担保交易接口接口调试入口页面
 * 版本：3.3
 * 日期：2012-07-23
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 */

?>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<HEAD><TITLE>支付宝担保支付-飞瀛网</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script language=JavaScript>
function CheckForm()
{
	if (document.alipayment.WIDseller_email.value.length == 0) {
		alert("请输入卖家账号.");
		document.alipayment.WIDseller_email.focus();
		return false;
	}
	if (document.alipayment.WIDout_trade_no.value.length == 0) {
		alert("请输入订单号.");
		document.alipayment.WIDout_trade_no.focus();
		return false;
	}
	if (document.alipayment.WIDsubject.value.length == 0) {
		alert("请输入名称.");
		document.alipayment.WIDsubject.focus();
		return false;
	}
	if (document.alipayment.WIDprice.value.length == 0) {
		alert("请输入付款金额.");
		document.alipayment.WIDprice.focus();
		return false;
	}
	var reg	= new RegExp(/^\d*\.?\d{0,2}$/);
	if (! reg.test(document.alipayment.WIDprice.value))
	{
        alert("请正确输入付款金额");
		document.alipayment.WIDprice.focus();
		return false;
	}
	if (Number(document.alipayment.WIDprice.value) < 0.01) {
		alert("付款金额金额最小是0.01.");
		document.alipayment.WIDprice.focus();
		return false;
	}
	function getStrLength(value){
        return value.replace(/[^\x00-\xFF]/g,'**').length;
    }
    if(getStrLength(document.alipayment.WIDbody.value) > 200){
        alert("备注过长！请在100个汉字以内");
        document.alipayment.WIDbody.focus();
        return false;
    }
    if(getStrLength(document.alipayment.WIDsubject.value) > 256){
        alert("标题过长！请在128个汉字以内");
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
     <li><a href="http://www.fei580.com/" target="_blank">飞瀛首页</a></li>
     <li>|</li>
     <li><a href="http://www.alipay.com/" target="_blank" rel="nofollow">支付宝首页</a></li>
     <li>|</li>
     <li><a href="http://help.alipay.com/support/index_sh.htm" target="_blank" rel="nofollow">帮助中心</a></li>
    </ul>
    </div>
   </div>
   <div class="headlogo">
	<div class="logo"><img src="images/paylogo.jpg" /></div>
     <div class="nav">
      <ul>
        <li><a href="/yinlian/">银联在线</a></li>
        <li><a href="/99bill/">快钱支付</a></li>
        <li><a href="/alipay/">支付宝支付</a></li>
        <li class="active"><a href="/alipay2/">担保支付</a></li>
        <li><a href="/bank/">银行转账</a></li>
       </ul>
      </div>
     </div>
	</div>
    <div id="main">
     <div class="paywayimg"></div>
     
     <div class="cashier-nav">
      <ol>
       <li class="current">1、确认付款信息 →</li>
       <li>2、付款 →</li>
       <li class="last">3、付款完成</li>
      </ol>
     </div>
     <form name=alipayment action="alipayapi.php" method=post target="_blank">
     <div class="payform">
      <dl class="content">
      <dt class="paytitle" style="display:none">卖家账户：</dt>
       <dd class="payinput" style="display:none">
       <span class="red-star">*</span>
       <input size="30" name="WIDseller_email" value="gzfeiying@sina.cn" />
       <span class="red-star">必填</span>
       </dd>
       <dt class="paytitle" style="display:none">订单号：</dt>
       <dd class="payinput" style="display:none">
       <span class="red-star">*</span>
       <input size="30" name="WIDout_trade_no" value="<?php echo $showtime=date("YmdHis");?>" />
       <span class="red-star">随机订单号</span>
       </dd>
       <dt class="paytitle">标题：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input size="30" name="WIDsubject" />
       <span class="red-star">格式要求：XX先生/女士 + XX至XX机票/酒店款</span>
       </dd>
       <dt class="paytitle">付款金额：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input size="30" name="WIDprice"  onfocus="if(Number(this.value)==0){this.value='';}" value="00.00"/>
       <span class="red-star">填写你要付款的金额(如：112.21)</span>
       </dd>
       <dt class="paytitle">备注：</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
       <textarea name="WIDbody" rows=4 cols=40 wrap="physical"></textarea>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;（如联系方法，商品要求、数量等。100汉字内）</span>
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
      <li>提示：</li>
      <li>1. 飞瀛商旅与支付宝签约成为合作商户，服务更加全面；支付更有保障。</li>
      <li>2. 付款前请与您的客服确认清楚款项金额。</li>
      <li>3. 储蓄卡与信用卡支付，需支付1.2%的手续费</li>
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
	   版权 归 广州市飞瀛商务服务有限公司 所有 本页面为 飞瀛网-支付方式-担保支付
	  </li>
	 </ul>
    </div>
</body>
</html>

