<?php get_header(); ?>
<div id="main" class="container">
<?php get_sidebar(); ?>
<div id="primary">
<!--div id="go-city-navi">
<?php wp_nav_menu( array( 'container' => false, 'echo' => false, 'items_wrap' => '%3$s',  'theme_location' => 'header-menu', 'fallback_cb' => 'default_menu' ) ); ?>
</div-->
<div class="mainlist">
<ul>
<?php if ( have_posts() ) : ?>
<?php while ( have_posts() ) : the_post(); ?>
<li id="post-<?php the_ID(); ?>" <?php post_class(); ?>>
<div class="flyinfo">
<div class="airfly">
<div class="airline"><img class="air_logo" src="<?php echo get_custom_value('airIcon'); ?>" /> <span class="air_line"><?php get_terms_name('airline'); ?></span></div>
<div class="airtime"><?php get_tripType(); ?></div>
<div class="airdetail"><a class="air_detail" href="<?php the_permalink(); ?>">航班详情</a></div>
</div>
<div class="airticket">
<div class="flight-port">
<div class="airport">
<h3><?php get_terms_name('from'); ?></h3>
<p><?php $airport = get_custom_value('depport'); if(!empty($airport)){ echo $airport;} ?></p>
<p>[ <?php $deportcode = get_custom_value('depcode'); echo $deportcode; ?> ]</p>
</div>
</div>
<?php $trip = get_post_custom_values("ft"); if ($trip[0]==1){ ?>
<div class="flytimeinfo transfer">
<div class="flight-time"><span class="datetime">起飞：<?php echo get_custom_value('deptime'); ?></span><span class="icons"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span><span class="datetime">到达：<?php echo get_custom_value('arrtime'); ?></span></div>
<div class="flight-deline"><p><?php $airport = get_custom_value('transPort'); if(!empty($airport)){ echo '<i class="fa fa-refresh" aria-hidden="true"></i> '.$airport.'-[飞行] '.get_custom_value('flytime');} else { echo '<i class="fa fa-arrow-right" aria-hidden="true"></i> [飞行] '.get_custom_value('flytime'); } ?></p></div>
</div>
<?php } else { ?>
<div class="flytimeinfo">
<div class="flight-time transfer-go"><span class="datetime">起飞：<?php echo get_custom_value('deptime'); ?></span><span class="icons"><i class="fa fa-arrow-circle-right" aria-hidden="true"></i></span><span class="datetime">到达：<?php echo get_custom_value('arrtime'); ?></span></div>
<div class="flight-deline"><p><?php $airport = get_custom_value('transPort'); if(!empty($airport)){ echo '<i class="fa fa-refresh" aria-hidden="true"></i> '.$airport.'-[飞行] '.get_custom_value('flytime');} else { echo '<i class="fa fa-arrow-right" aria-hidden="true"></i> [飞行] '.get_custom_value('flytime'); } ?></p></div>
<div class="flight-time transfer-back"><span class="datetime">起飞：<?php echo get_custom_value('ardeptime'); ?></span><span class="icons"><i class="fa fa-arrow-circle-left" aria-hidden="true"></i></span><span class="datetime">到达：<?php echo get_custom_value('ararrtime'); ?></span></div>
<div class="flight-deline"><p><?php $airport = get_custom_value('transPort'); if(!empty($airport)){ echo '<i class="fa fa-refresh" aria-hidden="true"></i> '.$airport.'-[飞行] '.get_custom_value('arflytime');} else { echo '<i class="fa fa-arrow-right" aria-hidden="true"></i> [飞行] '.get_custom_value('arflytime');; } ?></p></div>
</div>
<?php } ?>
<div class="flight-port">
<div class="airport">
<h3><?php get_terms_name('post_tag'); ?></h3>
<p><?php echo get_custom_value('arrport'); ?></p>
<p>[ <?php echo get_custom_value('arrcode'); ?> ]</p>
</div>
</div>
</div>
</div>
<div class="flybuy">
<div class="price">
<?php $price = get_custom_value('adult'); if(!empty($price)){ echo '￥'.$price;} ?>
</div>
<div class="tax">
<?php $s_tax = get_custom_value('tax'); if(!empty($s_tax)){ echo '税费￥'.$s_tax.'约';} ?>
<?php $price = get_custom_value('adult'); if($price<3000){ echo '<div class="rtimed">机位紧张</div>';} ?>
</div>
<div class="clear"></div>
<div class="buylink">
<a href="<?php the_permalink(); ?>">预&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;订</a>
</div>
<div class="onChat">
<a href="http://www.fei580.com/chat/" target="_blank" rel="nofollow">在线咨询</a>
</div>
</div>
</li>
<?php endwhile; ?>
<?php else : ?>
<li>没有发现新内容</li>
<?php endif; ?>
</ul>
<div class="clear"></div>
<?php pagenavi(); ?>
</div>
</div>
</div>
<?php get_footer(); ?>