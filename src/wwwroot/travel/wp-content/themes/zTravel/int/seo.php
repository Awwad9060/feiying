<?php
/*
Template Name: SEO
*/
?>
<?php if ( is_home() ) { ?><title><?php bloginfo('description'); ?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_search() ) { ?><title>特价国际机票查询<?php $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_single() ) { ?><title><?php echo trim(wp_title('',0)); ?>_<?php $number = get_custom_value('depflight'); if(!empty($number)){ echo $number;} ?>航班价格<?php $price = get_custom_value('adult'); if(!empty($price)){ echo 'CNY'.$price;} ?><?php if (get_query_var('page')) { echo '- 第'; echo get_query_var('page'); echo '页';}?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_page() ) { ?><title><?php echo trim(wp_title('',0)); ?><?php if (get_query_var('page')) { echo '- 第'; echo get_query_var('page'); echo '页';}?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_category() ) { ?><title><?php single_cat_title(); ?><?php $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_year() ) { ?><title><?php the_time('Y年 特价国际机票'); $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_month() ) { ?><title><?php the_time('Y年F份 特价国际机票'); $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_day() ) { ?><title><?php the_time('Y年n月j日 特价国际机票'); $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_404() ) { ?><title>您查看的页面不存在 - <?php bloginfo('name'); ?></title><?php } ?>
<?php if (function_exists('is_tag')) { if ( is_tag() ) { ?><title>特价<?php  single_tag_title("", true); ?>机票_【<?php  single_tag_title("", true); ?>机票哪里买便宜】<?php $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php } ?><?php } ?>
<?php if ( is_tax('airline') ) { ?><title><?php echo get_terms_name('airline'); ?>特价国际机票<?php $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_tax('from') ) { ?><title><?php echo get_terms_name('from'); ?>出发特价国际机票<?php $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php } ?>
<?php if ( is_author() ) {?><title>由 <?php wp_title('');?> 编辑整理特价国际机票<?php $paged = get_query_var('paged'); if ( $paged > 1 ) printf(' - 第 %s 页 ',$paged); ?> - <?php bloginfo('name'); ?></title><?php }?> 
<?php
if (!function_exists('utf8Substr')) {
 function utf8Substr($str, $from, $len)
 {
     return preg_replace('#^(?:[\x00-\x7F]|[\xC0-\xFF][\x80-\xBF]+){0,'.$from.'}'.
          '((?:[\x00-\x7F]|[\xC0-\xFF][\x80-\xBF]+){0,'.$len.'}).*#s',
          '$1',$str);
 }
}
if ( is_single() ){
    if ($post->post_excerpt) {
        $description  = $post->post_excerpt;
    } else {
        if(preg_match('/<p>(.*)<\/p>/iU',trim(strip_tags($post->post_content,"<p>")),$result)){
           $post_content = $result['1'];
        } else {
           $post_content_r = explode("\n",trim(strip_tags($post->post_content)));
           $post_content = $post_content_r['0'];
        }
        $description = utf8Substr($post_content,0,220);
    } 
    $keywords = "";
    $tags = wp_get_post_tags($post->ID);
    foreach ($tags as $tag ) {
        $keywords = $keywords . $tag->name . ",";
    }
}
function cat_des() {
	$cat_des = category_description( $categoryID );
	if(preg_match('/<p>(.*)<\/p>/iU',trim(strip_tags($cat_des,"<p>")),$result)) {
  		$cat_des = $result['1'];
	}
	return $cat_des;
}
?>
<?php if ( is_home() ) { ?>
<meta name="description" content="飞瀛网为您提供广州,深圳,香港,北京,上海等全国各地出发便宜特价国际机票查询预订服务,承诺保证：先验真机票再付款！安全可靠.免费咨询：400-885-0663." />
<meta name="keywords" content="便宜的国际机票,特价国际机票网站,出国便宜机票,出国特价机票,特价出国机票" />
<?php } ?>
<?php if ( is_category() ) { ?>
<meta name="description" content="" />
<?php } ?>
<?php if ( is_tag() ) { 
$description = term_description(); 
if(preg_match('/<p>(.*)<\/p>/iU',trim(strip_tags($description,"<p>")),$result)){
    $description = $result['1'];
}
if ( ! empty( $description ) ) : 
	printf( '<meta name="description" content="%s" />', $description ); 
endif; } ?>
<?php if ( is_page() ) { ?>
<meta name="description" content="<?php $description = get_post_meta($post->ID, 'description', true);{echo $description;}?>" />
<meta name="keywords" content="<?php $keywords = get_post_meta($post->ID, 'keywords', true);{echo $keywords;}?>" />
<?php } ?>
<?php if ( is_single() ) { ?>
<meta name="description" content="<?php echo trim($description); ?>" />
<meta name="keywords" content="<?php echo rtrim($keywords,','); ?>" />
<meta itemprop="datePublished" content="<?php the_time( 'Y-m-d' ) ?>" />
<meta property="og:site_name " content="<?php bloginfo('name'); ?>" />
<meta property="og:type" content="Article"/>
<meta property="og:title" content="<?php echo trim(wp_title('',0)); ?>"/>
<meta property="og:release_date" content="<?php the_time( 'Y年m月d日' ) ?>"/>
<meta property="og:description" content="<?php $descruotion = mb_strimwidth(strip_tags(apply_filters('the_content', $post->post_content)), 0, 120,"..."); $descruotion = str_replace("\r\n",'',$descruotion); $descruotion = str_replace("\n",'',$descruotion); $descruotion = str_replace("\t",'',$descruotion); echo $descruotion; ?>"/>
<meta property="og:url" content="<?php the_permalink();?>"/>
<?php } ?>