<div id="sidebar">
<div class="currentkf">
<h5>当值客服</h5>
<img src="http://www.fei580.com/images/kfimg/cs2.jpg" />
<p><b>态</b><em>度</em><span>决定一切</span></p>
<a href="http://www.fei580.com/chat" target="_blank" class="btn kf_chat">咨询我</a>
<div class="clear"></div>
</div>
<?php
	$args = array(
		'post_type'=>'post',
		'post_status'=>'publish',
		'showposts'=> 3,
		'orderby'=>'rand',
		'meta_key'=>'adult',
		'order'=>'DESC'
	);
	query_posts($args);
?>
<?php if(have_posts()): ?>
<?php while(have_posts()): the_post(); ?>
<div class="widget">
<h3><a href="<?php the_permalink(); ?>"><?php get_terms_name('from'); ?>至<?php get_terms_name('post_tag'); ?>机票</a></h3>
<div class="soticket">
<ul class="goto">
<li class="txt"><?php get_terms_name('from'); ?></li>
<li>-</li>
<li class="txt"><?php get_terms_name('post_tag'); ?></li>
</ul>
<ul class="datetime">
<li class="txt"><?php echo get_custom_value('depdate'); ?></li>
<li>&nbsp;</li>
<li class="txt"><?php $backDate = get_custom_value('ararrdate'); if(!empty($backDate)) { echo $backDate; } else { echo '单程'; } ?></li>
</ul>
<div class="clear"></div>
<ul class="info">
<li><code>CNY</code><b><?php echo get_custom_value('adult'); ?></b></li>
<li><span>经济舱</span></li>
<li><span>不含税费</span></li>
</ul>
<div class="chat"><a href="http://www.fei580.com/chat/" target="_blank" rel="nofollow">立即咨询</a></div>
</div>
<div class="clear"></div>
</div>
<?php endwhile; ?>
<?php endif; wp_reset_query(); ?>
</div>