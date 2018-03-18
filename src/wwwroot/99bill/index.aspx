<%@ Page Language="C#" AutoEventWireup="true" CodeFile="index.aspx.cs" Inherits="_99bill_index" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>快钱支付-飞瀛网-国际/国内机票服务热线：400-885-0663(免费)</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta name="Description"  content="飞瀛网为您提供广州,香港,澳门,上海,北京出发特价国际机票,打折国际机票,以及最新实时国际航班票价查询服务.免费热线：400-885-0663;" />
<meta name="keywords" content="国际机票,国际机票查询,国际机票预订,国际实时航班,国际机航班" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script language="JavaScript" type="text/javascript">
        function CheckForm() {
            function getStrLength(value) {
                return value.replace(/[^\x00-\xFF]/g, '**').length;
            }
            var productName = document.OrderForm.productName.value;
            if (productName.length == 0) {
                alert("请输入付款标题.");
                document.OrderForm.productName.focus();
                return false;
            }
            if (getStrLength(productName) > 256) {
                alert("标题过长！请在128个汉字以内");
                document.OrderForm.productName.focus();
                return false;
            }
            var orderAmount = document.OrderForm.orderAmount.value;
            if (orderAmount.length == 0) {
                alert("请输入付款金额.");
                document.OrderForm.orderAmount.focus();
                return false;
            }
            var reg = new RegExp(/^\d*\.?\d{0,2}$/);
            if (!reg.test(orderAmount)) {
                alert("请正确输入付款金额");
                document.OrderForm.orderAmount.focus();
                return false;
            }
            if (Number(orderAmount) < 0.01) {
                alert("付款金额金额最小是0.01.");
                document.OrderForm.orderAmount.focus();
                return false;
            }
            var productDesc = document.OrderForm.productDesc.value;
            if (getStrLength(productDesc) > 200) {
                alert("备注过长！请在100个汉字以内");
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
     <li><a href="http://www.fei580.com/" target="_blank">飞瀛首页</a></li>
     <li>|</li>
     <li><a href="http://www.99bill.com/" target="_blank" rel="nofollow">快钱支付</a></li>
     <li>|</li>
     <li><a href="https://help.99bill.com/" target="_blank" rel="nofollow">帮助中心</a></li>
    </ul>
    </div>
   </div>
   <div class="headlogo">
	<div class="logo"><img src="images/paylogo.jpg" /></div>
     <div class="nav">
      <ul>
        <li><a href="/yinlian/">银联在线</a></li>
        <li class="active"><a href="/99bill/">快钱支付</a></li>
        <li><a href="/alipay/">支付宝支付</a></li>
        <!--li><a href="/alipay2/">担保支付</a></li-->
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
	 <div class="payform">
      <dl class="content">
       <dt class="paytitle">标题：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       
       <input name="productName" size=30 type="text" value="" />
       <span class="red-star">格式要求：XX先生/女士 + XX至XX机票/酒店款</span>
       </dd>
       <dt class="paytitle">付款金额：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <input name="orderAmount" maxLength=10 size=30 type="text" onfocus="if(Number(this.value)==0){this.value='';}" value=""/>
       <span class="red-star">填写你要付款的金额(如：112.21)</span>
       </dd>
       <dt class="paytitle">备注：</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
       <textarea name="productDesc" type="text" rows=4 cols=40 wrap="physical" value=""></textarea>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;（如联系方法，商品要求、数量等。100汉字内）</span>
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
      <li>提示：</li>
      <li>1. 飞瀛商旅与快钱签约成为合作商户，服务更加全面；支付更有保障。</li>
      <li>2. 付款前请与您的客服确认清楚款项金额。</li>
      <li>3. 储蓄卡与信用卡支付，需支付0.5%的手续费</li>
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
	   版权 归 广州市飞瀛商务服务有限公司 所有 本页面为 飞瀛网-支付方式-快钱支付
	  </li>
	 </ul>
	 </div>
    </form>
</body>
</html>
