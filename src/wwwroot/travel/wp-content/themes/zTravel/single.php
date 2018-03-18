<?php get_header(); ?>
<div id="main" class="container">
<div class="detail-banner"><a class="chat-button" href="http://www.fei580.com/chat/" target="_blank" rel="nofollow"></a></div>
<div class="detail-info">
<div class="detail-box-shadow"></div>
<?php while ( have_posts() ) : the_post(); ?>
<div class="detail-1">
<div class="detail-datetime">
<div class="trip_way"><i class="fa fa-chevron-right" aria-hidden="true"></i> 行程：<span><?php $trip = get_post_custom_values("ft"); if ($trip[0]==1){ echo '单程'; } else { echo '往返';} $trans = get_custom_value('transfer'); if($trans[0]==1){ echo ' / 中转'; } else { echo ' / 直飞'; } ?></span></div>
<div class="trip_date">
<ul>
<li><?php $date_time = get_post_custom_values("depdate"); if(!empty($date_time[0])){ echo '<i class="fa fa-chevron-right" aria-hidden="true"></i> 出发日期  <span>'.$date_time[0].'</span>';} ?></li>
<li><?php $date_time = get_post_custom_values("arrdate"); if(!empty($date_time[0])){ echo '<i class="fa fa-chevron-right" aria-hidden="true"></i> 到达日期  <span>'.$date_time[0].'</span>';} ?></li>
</ul>
</div>
</div>
<div class="detail-airline">
<div class="airlogo"><img src="<?php get_terms_des('airline'); ?>" alt="<?php get_terms_name('airline'); ?>" /></div>
<div class="airline-info">
<h3><?php get_terms_name('airline'); ?><?php $transeat = get_custom_value('transseat'); $arrseat = get_custom_value('arseat'); if(!empty($transeat)) { echo '('.get_custom_value('seat').'-'.$transeat.'舱)'; } elseif(!empty($arrseat)) { echo '('.get_custom_value('seat').'-'.$arrseat.'舱)'; } else { echo '('.get_custom_value('seat').'舱)'; }?></h3>
<ul>
<li><a href="http://www.fei580.com/airline/<?php echo get_custom_value('airId'); ?>.htm" target="_blank">机队情况</a></li>
<li>进入<a href="http://www.fei580.com/airline.aspx" target="_blank">航空公司专区</a></li>
</ul>
</div>
</div>
<div class="detail-price">
<div class="detail-price-tax">
<div class="price">
<?php $price = get_custom_value('adult'); if(!empty($price)){ echo '￥'.$price;} ?>
</div>
<div class="tax">
<?php $s_tax = get_custom_value('tax'); if(!empty($s_tax)){ echo '税费￥'.$s_tax.'约';} ?>
</div>
</div>
<div class="detail-buy-chat">
<div class="buylink">
<a href="http://www.fei580.com/chat/" target="_blank" rel="nofollow">预&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订</a>
</div>
<div class="onChat">
<a href="http://www.fei580.com/chat/" target="_blank" rel="nofollow">即时咨询</a>
</div>
</div>
</div>
</div>
<!--end detail-1-->
<div class="detail-2">
<div class="detail-fromcity">
<div class="cityport">
<h3><?php get_terms_name('from'); ?></h3>
<p><?php $airport = get_custom_value('depport'); if(!empty($airport)){ echo $airport;} ?></p>
<p>[ <?php $deportcode = get_custom_value('depcode'); echo $deportcode; ?> ]</p>
</div>
</div>
<?php $trip = get_post_custom_values("ft"); if ($trip[0]==1){ ?>
<div class="detail-line-detail detail-line-single">
<div class="detail-go-line">
<div class="ticketline"><?php $number = get_custom_value('depflight'); if(!empty($number)){ echo '<span>航班:<code>'.$number.'</code></span>';} ?><?php $mode = get_custom_value('plane'); if(!empty($mode)){ echo '<span>机型:<code>'.$mode.'</code></span>';} ?></div>
<div class="ticketline"><?php $number = get_custom_value('depflight'); if(!empty($number)){ echo '<span>航班:<code>'.$number.'</code></span>';} ?><?php $mode = get_custom_value('plane'); if(!empty($mode)){ echo '<span>机型:<code>'.$mode.'</code></span>';} ?></div>
<div class="clear"></div>
<div class="tickettime"><?php $gtime = get_custom_value('deptime'); if(!empty($gtime)){ echo '<span>起飞:<code>'.$gtime.'</code></span>';} ?><?php $artime = get_custom_value('arrtime'); if(!empty($artime)){ echo '<span>到达:<code>'.$artime.'</code></span>';} ?></div>
<div class="tickettime"><?php $gtime = get_custom_value('deptime'); if(!empty($gtime)){ echo '<span>起飞:<code>'.$gtime.'</code></span>';} ?><?php $artime = get_custom_value('arrtime'); if(!empty($artime)){ echo '<span>到达:<code>'.$artime.'</code></span>';} ?></div>
</div>
<div class="detail-trun-line">
<?php $trans = get_custom_value('transfer'); if($trans[0]==1){ echo '<p>[中转]-'.get_custom_value('transPort').'</p><p>飞行时长 - '.get_custom_value('flytime').' </p>';} else { echo '<p>[直飞] - 飞行时长 -'.get_custom_value('flytime').'</p>';}?>
</div>
</div>
<?php } else { ?>
<div class="detail-line-detail">
<div class="detail-go-line">
<div class="ticketline"><?php $number = get_custom_value('depflight'); if(!empty($number)){ echo '<span>航班:<code>'.$number.'</code></span>';} ?><?php $mode = get_custom_value('plane'); if(!empty($mode)){ echo '<span>机型:<code>'.$mode.'</code></span>';} ?></div>
<div class="ticketline"><?php $number = get_custom_value('depflight'); if(!empty($number)){ echo '<span>航班:<code>'.$number.'</code></span>';} ?><?php $mode = get_custom_value('plane'); if(!empty($mode)){ echo '<span>机型:<code>'.$mode.'</code></span>';} ?></div>
<div class="clear"></div>
<div class="tickettime"><?php $gtime = get_custom_value('deptime'); if(!empty($gtime)){ echo '<span>起飞:<code>'.$gtime.'</code></span>';} ?><?php $artime = get_custom_value('arrtime'); if(!empty($artime)){ echo '<span>到达:<code>'.$artime.'</code></span>';} ?></div>
<div class="tickettime"><?php $gtime = get_custom_value('deptime'); if(!empty($gtime)){ echo '<span>起飞:<code>'.$gtime.'</code></span>';} ?><?php $artime = get_custom_value('arrtime'); if(!empty($artime)){ echo '<span>到达:<code>'.$artime.'</code></span>';} ?></div>
</div>
<div class="detail-trun-line">
<?php $airport = get_custom_value('deptransfer'); if(!empty($airport)){ echo '<p>[中转]-'.$airport.'</p><p>飞行时长 - '.get_custom_value('flytime').' </p>';} else { echo '<p>[直飞] 飞行时长 -'.get_custom_value('flytime').'</p>';}?>
</div>
<div class="detail-back-line">
<div class="ticketline"><?php $number = get_custom_value('arrflight'); if(!empty($number)){ echo '<span>航班:<code>'.$number.'</code></span>';} ?><?php $mode = get_custom_value('arplane'); if(!empty($mode)){ echo '<span>机型:<code>'.$mode.'</code></span>';} ?></div>
<div class="ticketline"><?php $number = get_custom_value('arrflight'); if(!empty($number)){ echo '<span>航班:<code>'.$number.'</code></span>';} ?><?php $mode = get_custom_value('arplane'); if(!empty($mode)){ echo '<span>机型:<code>'.$mode.'</code></span>';} ?></div>
<div class="clear"></div>
<div class="tickettime"><?php $btime = get_custom_value('ardeptime'); if(!empty($btime)){ echo '<span>起飞:<code>'.$btime.'</code></span>';} ?><?php $bartime = get_custom_value('ararrtime'); if(!empty($bartime)){ echo '<span>到达:<code>'.$bartime.'</code></span>';} ?></div>
<div class="tickettime"><?php $btime = get_custom_value('ardeptime'); if(!empty($btime)){ echo '<span>起飞:<code>'.$btime.'</code></span>';} ?><?php $bartime = get_custom_value('ararrtime'); if(!empty($bartime)){ echo '<span>到达:<code>'.$bartime.'</code></span>';} ?></div>
</div>
<div class="detail-trun-line">
<?php $airport = get_custom_value('arrtransfer'); if(!empty($airport)){ echo '<p>[中转]-'.$airport.'</p><p>飞行时长 - '.get_custom_value('arflytime').' </p>';} else { echo '<p>[直飞] 飞行时长 -'.get_custom_value('arflytime').'</p>';}?>
</div>
</div>
<?php } ?>
<div class="detail-tocity">
<div class="cityport">
<h3><?php get_terms_name('post_tag'); ?></h3>
<p><?php $airport = get_custom_value('arrport'); if(!empty($airport)){ echo $airport;} ?></p>
<p>[ <?php $airport = get_custom_value('arrcode'); echo $airport; ?> ]</p>
</div>
</div>
<div class="rm_tips"></div>
</div>
<!--end detail-2-->
<div class="detail-3">
<div class="detail-type">
<ol>
<li><i class="fa fa-chevron-right" aria-hidden="true"></i> 机票类型:<span>电子机票</span></li>
<li><i class="fa fa-chevron-right" aria-hidden="true"></i> 交易形式:<span>先出票/后付款</span></li>
<li><i class="fa fa-chevron-right" aria-hidden="true"></i> 电子票下载:<a href="http://www.fei580.com/login.aspx" rel="nofollow">登录会员中心</a></li>
</ol>
</div>
<div class="detail-clause">
<ol>
<li>此票价为净票价，税费需根据航空公司当天发布为准</li>
<li>误机(NOSHOW)：需收取误机费</li>
<li>更改订座：允许更改。乘客必须于出发日之前取消原订的航班，否则按照“误机”处理</li>
<li>儿童票价：成人票价的75%</li>
<li>婴儿票价：使用 IATA 公布成人票价的10%</li>
</ol>
<?php the_content(); ?>
</div>
</div>
<?php endwhile; ?>
<!--end detail-3-->
<div class="detail-4">
<div class="detail-order-name">
<span>快速预订</span>
</div>
<div class="detail-order-form">
<form id="TicketBook" action ="<?php bloginfo('wpurl'); ?>/booking.php" method="POST">
<table>
<tbody>
<tr>
<td>
<span>机票</span><input type="text" id="title" name="title" readonly="readonly" value="<?php get_terms_name('from'); ?>-<?php get_terms_name('post_tag'); ?>" />
<input type="hidden" id="tId" name="tId" value="<?php echo get_custom_value('adultprice'); ?>" />
</td>
<td><span>出发日期</span><input type="text" id="tripDate" name="tripDate" value="<?php $tripDate = get_post_custom_values("tripDate"); echo $tripDate[0] ?>" /><i class="fa fa-calendar" aria-hidden="true"></i></td>
<td><span>联系电话</span><input type="text" id="telephone" name="telephone" value="" /></td>
<td rowspan="2"><span class="mess">留言<span><textarea id="otherMess" name="otherMess"></textarea></td>
<td rowspan="2"><button type="submit" class="BookSubmit"></button></td>
</tr>
<tr>
<td><span>姓名</span><input type="text" id="contact" name="contact" value="" /></td>
<td><span>返回日期</span><input type="text" id="backDate" name="backDate" value="<?php $backDate = get_post_custom_values("backDate"); echo $backDate[0] ?>" /><i class="fa fa-calendar" aria-hidden="true"></i></td>
<td><span>E-mail</span>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="email" name="email" value="" /></td>
</tr>
</tbody>
</table>
</form>
</div>
</div>
</div>
<!--end detail-info-->
<div class="detail-bottom-banner">
<img width="970" src="<?php bloginfo('template_directory'); ?>/img/btbanner.jpg" alt="机票详情底部广告图" />
</div>
<!--end bottom-banner-->
<?php
	$args = array(
		'post_type'=>'post',
		'post_status'=>'publish',
		'showposts'=> 8,
		'orderby'=>'rand',
		'meta_key'=>'views',
		'order'=>'DESC'
	);
	query_posts($args);
?>
<?php if(have_posts()): ?>
<div class="ticket-recommend">
<ul>
<?php while(have_posts()): the_post(); ?>
<li>
<div class="ticket-card">
<div class="card-title">
独家推荐
<div id="triangle-left"></div>
</div>
<div class="card-line"><?php get_terms_name('airline'); ?></div>
<div id="triangle-bottomright"></div>
<div class="clear"></div>
<div class="card-line-title"><i class="fa fa-chevron-right" aria-hidden="true"></i> <a href="<?php the_permalink(); ?>"><?php get_terms_name('from'); ?>至<?php get_terms_name('post_tag'); ?>机票</a></div>
<div class="card-line-price">￥ <?php echo get_custom_value('adult'); ?></div>
</div>
</li>
<?php endwhile; ?>
</ul>
</div>
<?php endif; wp_reset_query(); ?>
</div>
<?php get_footer(); ?>