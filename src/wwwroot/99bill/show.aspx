<%@ Page Language="C#" AutoEventWireup="true" CodeFile="show.aspx.cs" Inherits="show" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<HEAD><TITLE>支付宝即时到帐接口</TITLE>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="css/css.css" rel="stylesheet" type="text/css" />
</head>

<body>
 <div id="head">
  <div class="top">		 
   <div class="topnav">
    <ul>
     <li><a target="_blank" href="http://www.fei580.com/">飞瀛首页</a></li>
     <li>|</li>
     <li><a target="_blank" href="http://www.fei580.com/">银联在线</a></li>
     <li>|</li>
     <li><a target="_blank" href="http://help.alipay.com/lab/150006-234447/0-234447.htm">帮助中心</a></li>
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
       <li>1、确认付款信息 →</li>
       <li class="current">2、付款 →</li>
       <li class="last">3、付款完成</li>
      </ol>
     </div>
     <div class="payform">
      <dl class="content">
       <dt class="paytitle">标题：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <%--<%=productName %>--%>
       <span class="red-star">格式要求：XX先生/女士 + XX至XX机票/酒店款</span>
       </dd>
       <dt class="paytitle">付款金额：</dt>
       <dd class="payinput">
       <span class="red-star">*</span>
       <%=(orderAmount)+"分" %>
       <span class="red-star">填写你要付款的金额(如：112.21)</span>
       </dd>
       <dt class="paytitle">备注：</dt>
       <dd class="payinput">
       <span class="null-star">*</span>
       <%--<%=productDesc %>--%>
       </dd>
       <dt class="paytitle">&nbsp;</dt>
       <dd class="payinput">
       <span class=note-help>&nbsp;（如联系方法，商品要求、数量等。100汉字内）</span>
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