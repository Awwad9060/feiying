<?php
/* * 
 * ���ܣ�֧����ҳ����תͬ��֪ͨҳ��
 * �汾��3.2
 * ���ڣ�2011-03-25
 * ˵����
 * ���´���ֻ��Ϊ�˷����̻����Զ��ṩ���������룬�̻����Ը����Լ���վ����Ҫ�����ռ����ĵ���д,����һ��Ҫʹ�øô��롣
 * �ô������ѧϰ���о�֧�����ӿ�ʹ�ã�ֻ���ṩһ���ο���

 *************************ҳ�湦��˵��*************************
 * ��ҳ����ڱ������Բ���
 * �ɷ���HTML������ҳ��Ĵ��롢�̻�ҵ���߼��������
 * ��ҳ�����ʹ��PHP�������ߵ��ԣ�Ҳ����ʹ��д�ı�����logResult���ú����ѱ�Ĭ�Ϲرգ���alipay_notify_class.php�еĺ���verifyReturn
 
 * TRADE_FINISHED(��ʾ�����Ѿ��ɹ�������Ϊ��ͨ��ʱ���ʵĽ���״̬�ɹ���ʶ);
 * TRADE_SUCCESS(��ʾ�����Ѿ��ɹ�������Ϊ�߼���ʱ���ʵĽ���״̬�ɹ���ʶ);
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
//����ó�֪ͨ��֤���
$alipayNotify = new AlipayNotify($aliapy_config);
$verify_result = $alipayNotify->verifyReturn();
if($verify_result) {//��֤�ɹ�
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
	//������������̻���ҵ���߼��������
	
	//�������������ҵ���߼�����д�������´�������ο�������
    //��ȡ֧������֪ͨ���ز������ɲο������ĵ���ҳ����תͬ��֪ͨ�����б�
    $out_trade_no	= $_GET['out_trade_no'];	//��ȡ������
    $trade_no		= $_GET['trade_no'];		//��ȡ֧�������׺�
    $total_fee		= $_GET['total_fee'];		//��ȡ�ܼ۸�

    if($_GET['trade_status'] == 'TRADE_FINISHED' || $_GET['trade_status'] == 'TRADE_SUCCESS') {
		//�жϸñʶ����Ƿ����̻���վ���Ѿ����������ɲο�"���ɽ̳�"��"3.4�������ݴ���"��
			//���û�������������ݶ����ţ�out_trade_no�����̻���վ�Ķ���ϵͳ�в鵽�ñʶ�������ϸ����ִ���̻���ҵ�����
			//���������������ִ���̻���ҵ�����
    }
    else {
      echo "trade_status=".$_GET['trade_status'];
    }
		
	echo "<div id='head'>
  <div class='top'>		 
   <div class='topnav'>
    <ul>
     <li><a target='_blank' href='http://www.fei580.com/'>�����ҳ</a></li>
     <li>|</li>
     <li><a target='_blank' href='http://www.alipay.com/'>֧������ҳ</a></li>
     <li>|</li>
     <li><a target='_blank' href='http://help.alipay.com/support/index_sh.htm'>��������</a></li>
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
       <li>1��ȷ�ϸ�����Ϣ ��</li>
       <li>2������ ��</li>
       <li class='current'>3���������</li>
      </ol>
     </div>
     <div class='payform'>
      <p>�����ţ�<b style='color:#ff0000'>".$out_trade_no; echo "</b></p>";
       echo "<p>���׺ţ�<b style='color:#ff0000'>".$trade_no; echo "</b></p>";
       echo "<p>״&nbsp;&nbsp;̬��<b>���׳ɹ�</b></p>";
	   echo "
     </div>
     
    </div>
    <div class='clear'></div>
    <div class='tishi'>
     <ul>
      <li>��ʾ��</li>
      <li>1. ���������֧����ǩԼ��Ϊ�����̻����������ȫ�棻֧�����б��ϡ�</li>
      <li>2. ����ǰ�������Ŀͷ�ȷ����������</li>
      <li>3. ��������ÿ�֧������֧��1.2%��������</li>
      <li>4. ��ѯ�绰��400-885-0663</li>
     </ul>
    </div>
    <div id='foot'>
	 <ul class='foot-ul'>
	  <li>
	   �����з������������޹�˾ ��Ȩ����
	  </li>
	  <li>
	   &copy;2011-2015 WWW.FEI580.COM
	  </li>
	 </ul>
    </div>";

	//�������������ҵ���߼�����д�������ϴ�������ο�������
	
	/////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////
}
else {
    //��֤ʧ��
    //��Ҫ���ԣ��뿴alipay_notify.phpҳ���verifyReturn����
    echo "<div id='head'>
  <div class='top'>		 
   <div class='topnav'>
    <ul>
     <li><a target='_blank' href='http://www.fei580.com/'>�����ҳ</a></li>
     <li>|</li>
     <li><a target='_blank' href='http://www.alipay.com/'>֧������ҳ</a></li>
     <li>|</li>
     <li><a target='_blank' href='http://help.alipay.com/support/index_sh.htm'>��������</a></li>
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
       <li>1��ȷ�ϸ�����Ϣ ��</li>
       <li>2������ ��</li>
       <li class='current'>3���������</li>
      </ol>
     </div>
     <div class='payform'>
      <p>�����ţ�<b style='color:#ff0000'>".$out_trade_no; echo "</b></p>";
       echo "<p>���׺ţ�<b style='color:#ff0000'>".$trade_no; echo "</b></p>";
       echo "<p>״&nbsp;&nbsp;̬��<b>����ʧ��</b></p>";
	   echo "
     </div>
     
    </div>
    <div class='clear'></div>
    <div class='tishi'>
     <ul>
      <li>��ʾ��</li>
      <li>1. ���������֧����ǩԼ��Ϊ�����̻����������ȫ�棻֧�����б��ϡ�</li>
      <li>2. ����ǰ�������Ŀͷ�ȷ����������</li>
      <li>3. ��������ÿ�֧������֧��1.2%��������</li>
      <li>4. ��ѯ�绰��400-885-0663</li>
     </ul>
    </div>
    <div id='foot'>
	 <ul class='foot-ul'>
	  <li>
	   �����з������������޹�˾ ��Ȩ����
	  </li>
	  <li>
	   &copy;2011-2015 WWW.FEI580.COM
	  </li>
	 </ul>
    </div>";
}
?>
        <title>֧������ʱ����-�����</title>
	</head>
    <body>
    </body>
</html>