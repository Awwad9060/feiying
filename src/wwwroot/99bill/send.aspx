<%@ Page Language="C#" AutoEventWireup="true" CodeFile="send.aspx.cs" Inherits="_99bill_send" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<title>快钱支付-飞瀛网-国际/国内机票服务热线：400-885-0663(免费)</title>
<meta http-equiv="Content-Type" content="text/html; charset=GB2312">
<meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7"/>
<meta name="Description"  content="飞瀛网为您提供广州,香港,澳门,上海,北京出发特价国际机票,打折国际机票,以及最新实时国际航班票价查询服务.免费热线：400-885-0663;" />
<meta name="keywords" content="国际机票,国际机票查询,国际机票预订,国际实时航班,国际机航班" />
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>
<body>
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
     <form name="kqPay" method="post" action="https://www.99bill.com/gateway/recvMerchantInfoAction.htm" target="_blank">    
	 <div class="payform">
      <dl class="content">
       <dt class="paytitle">标题：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <asp:Label ID="lab_ProductName" runat="server"></asp:Label>
       <span class="red-star">格式要求：XX先生/女士 + XX至XX机票/酒店款</span>
       </dd>
       <dt class="paytitle">付款金额：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <asp:Label ID="lab_OrderAmount" runat="server"></asp:Label>
       <span class="red-star">填写你要付款的金额(如：112.21)</span>
       </dd>
       <dt class="paytitle">备注：</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
       <asp:Label ID="lab_ProductDesc" runat="server"></asp:Label>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;（如联系方法，商品要求、数量等。100汉字内）</span>
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
      <li>提示：</li>
      <li>1. 飞瀛商旅与快钱签约成为合作商户，服务更加全面；支付更有保障。</li>
      <li>2. 付款前请与您的客服确认清楚款项金额。</li>
      <li>3. 咨询电话：400-885-0663</li>
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
</body>
</html>
