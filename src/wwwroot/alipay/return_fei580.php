<?php
/* * 
 * 功能：支付宝页面跳转同步通知页面
 * 版本：3.2
 * 日期：2011-03-25
 * 说明：
 * 以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 * 该代码仅供学习和研究支付宝接口使用，只是提供一个参考。

 *************************页面功能说明*************************
 * 该页面可在本机电脑测试
 * 可放入HTML等美化页面的代码、商户业务逻辑程序代码
 * 该页面可以使用PHP开发工具调试，也可以使用写文本函数logResult，该函数已被默认关闭，见alipay_notify_class.php中的函数verifyReturn
 
 * TRADE_FINISHED(表示交易已经成功结束，为普通即时到帐的交易状态成功标识);
 * TRADE_SUCCESS(表示交易已经成功结束，为高级即时到帐的交易状态成功标识);
 */

require_once("alipay.config.php");
require_once("lib/alipay_notify.class.php");
?>
<!DOCTYPE HTML>
<html>
    <head>
    <meta http-equiv="Content-Type" content="text/html; charset=gb2312">
    <link href="css/css.css" rel="stylesheet" type="text/css" />
<?php
//计算得出通知验证结果
$alipayNotify = new AlipayNotify($aliapy_config);
$verify_result = $alipayNotify->verifyReturn();
if($verify_result) {//验证成功
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//请在这里加上商户的业务逻辑程序代码
	
	//——请根据您的业务逻辑来编写程序（以下代码仅作参考）——
    //获取支付宝的通知返回参数，可参考技术文档中页面跳转同步通知参数列表
    $out_trade_no	= $_GET['out_trade_no'];	//获取订单号
    $trade_no		= $_GET['trade_no'];		//获取支付宝交易号
    $total_fee		= $_GET['total_fee'];		//获取总价格

    if($_GET['trade_status'] == 'TRADE_FINISHED' || $_GET['trade_status'] == 'TRADE_SUCCESS') {
		//判断该笔订单是否在商户网站中已经做过处理（可参考"集成教程"中"3.4返回数据处理"）
			//如果没有做过处理，根据订单号（out_trade_no）在商户网站的订单系统中查到该笔订单的详细，并执行商户的业务程序
			//如果有做过处理，不执行商户的业务程序
    }
    else {
      echo "trade_status=".$_GET['trade_status'];
    }
		
	echo "<div id='head'>
  <div class='top'>		 
   <div class='topnav'>
    <ul>
     <li><a target='_blank' href='http://www.fei580.com/'>飞瀛首页</a></li>
     <li>|</li>
     <li><a target='_blank' href='http://www.alipay.com/'>支付宝首页</a></li>
     <li>|</li>
     <li><a target='_blank' href='http://help.alipay.com/support/index_sh.htm'>帮助中心</a></li>
    </ul>
    </div>
   </div>
   <div class='headlogo'>
	<div class='logo'><img src='images/paylogo.jpg' /></div>
     <div class='nav'>
      <ul>
       <li><a href='/yinlian/'><img src='images/ylzxb.gif' /></a></li>
       <li><a href='/alipay/'><img src='images/alipayzba.gif' /></a></li>
       <li><a href='/alipay2/'><img src='images/alipayd.gif' /></a></li>
       <li><a href='/bank/'><img src='images/zhzzb.gif' /></a></li>
       </ul>
      </div>
     </div>
	</div>
    <div id='main'>
     <div class='paywayimg'></div>
     
     <div class='cashier-nav'>
      <ol>
       <li>1、确认付款信息 →</li>
       <li>2、付款 →</li>
       <li class='current'>3、付款完成</li>
      </ol>
     </div>
     <div class='payform'>
      <p>订单号：<b style='color:#ff0000'>".$out_trade_no; echo "</b></p>";
       echo "<p>交易号：<b style='color:#ff0000'>".$trade_no; echo "</b></p>";
       echo "<p>状&nbsp;&nbsp;态：<b>交易成功</b></p>";
	   echo "
     </div>
     
    </div>
    <div class='clear'></div>
    <div class='tishi'>
     <ul>
      <li>提示：</li>
      <li>1. 飞瀛商旅与支付宝签约成为合作商户，服务更加全面；支付更有保障。</li>
      <li>2. 付款前请与您的客服确认清楚款项金额。</li>
      <li>3. 储蓄卡与信用卡支付，需支付1.2%的手续费</li>
      <li>4. 咨询电话：400-885-0663</li>
     </ul>
    </div>
    <div id='foot'>
	 <ul class='foot-ul'>
	  <li>
	   广州市飞瀛商务服务有限公司 版权所有
	  </li>
	  <li>
	   &copy;2011-2015 WWW.FEI580.COM
	  </li>
	 </ul>
    </div>";

	//——请根据您的业务逻辑来编写程序（以上代码仅作参考）——
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
else {
    //验证失败
    //如要调试，请看alipay_notify.php页面的verifyReturn函数
    echo "<div id='head'>
  <div class='top'>		 
   <div class='topnav'>
    <ul>
     <li><a target='_blank' href='http://www.fei580.com/'>飞瀛首页</a></li>
     <li>|</li>
     <li><a target='_blank' href='http://www.alipay.com/'>支付宝首页</a></li>
     <li>|</li>
     <li><a target='_blank' href='http://help.alipay.com/support/index_sh.htm'>帮助中心</a></li>
    </ul>
    </div>
   </div>
   <div class='headlogo'>
	<div class='logo'><img src='images/paylogo.jpg' /></div>
     <div class='nav'>
      <ul>
       <li><a href='/yinlian/'><img src='images/ylzxb.gif' /></a></li>
       <li><a href='/alipay/'><img src='images/alipayza.gif' /></a></li>
       <li><a href='/alipay2/'><img src='images/alipaydb.gif' /></a></li>
       <li><a href='/bank/'><img src='images/zhzzb.gif' /></a></li>
       </ul>
      </div>
     </div>
	</div>
    <div id='main'>
     <div class='paywayimg'></div>
     
     <div class='cashier-nav'>
      <ol>
       <li>1、确认付款信息 →</li>
       <li>2、付款 →</li>
       <li class='current'>3、付款完成</li>
      </ol>
     </div>
     <div class='payform'>
      <p>订单号：<b style='color:#ff0000'>".$out_trade_no; echo "</b></p>";
       echo "<p>交易号：<b style='color:#ff0000'>".$trade_no; echo "</b></p>";
       echo "<p>状&nbsp;&nbsp;态：<b>交易失败</b></p>";
	   echo "
     </div>
     
    </div>
    <div class='clear'></div>
    <div class='tishi'>
     <ul>
      <li>提示：</li>
      <li>1. 飞瀛商旅与支付宝签约成为合作商户，服务更加全面；支付更有保障。</li>
      <li>2. 付款前请与您的客服确认清楚款项金额。</li>
      <li>3. 储蓄卡与信用卡支付，需支付1.2%的手续费</li>
      <li>4. 咨询电话：400-885-0663</li>
     </ul>
    </div>
    <div id='foot'>
	 <ul class='foot-ul'>
	  <li>
	   广州市飞瀛商务服务有限公司 版权所有
	  </li>
	  <li>
	   &copy;2011-2015 WWW.FEI580.COM
	  </li>
	 </ul>
    </div>";
}
?>
        <title>支付宝即时交易-飞瀛网</title>
	</head>
    <body>
    </body>
</html>