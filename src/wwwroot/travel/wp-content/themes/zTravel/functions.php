<?php

// 加载前端脚本及样式
function ima_header() {
	wp_enqueue_style( 'style', get_stylesheet_uri(), array(), '2017.4.24' );
	wp_enqueue_style( 'font', 'https://cdn.bootcss.com/font-awesome/4.7.0/css/font-awesome.css', array(), '4.7.0' );
	wp_enqueue_script( 'jquery.min', 'https://cdn.bootcss.com/jquery/3.2.0/jquery.min.js', array(), '3.2.0', false );
	wp_enqueue_script( 'ticketbook', 'http://www.fei580.com/js/index.js', array(), '1.0', false );
}
function ima_footer() {
	wp_register_script( 'script', get_template_directory_uri() . '/js/script.js', false, '1.0', true );
	if ( !is_admin() ) {
		wp_enqueue_script( 'script' );
	}
}
add_action( 'wp_enqueue_scripts', 'ima_header' );
add_action( 'init', 'ima_footer' );

// 注册组件
register_nav_menus( array(  'header-menu' => __( '出发列表' ), ));
register_taxonomy('from', 'post', array( 'hierarchical' => false,  'label' => '出发', 'query_var' => true, 'rewrite' => true));
register_taxonomy('airline', 'post', array( 'hierarchical' => false,  'label' => '航空', 'query_var' => true, 'rewrite' => true));
//register_taxonomy('airport', 'post', array( 'hierarchical' => false,  'label' => '机场', 'query_var' => true, 'rewrite' => true));
add_editor_style( '/css/editor-style.css' );
add_filter( 'pre_option_link_manager_enabled', '__return_true' );
require get_template_directory() . '/int/crumbs.php';
require get_template_directory() . '/int/pagenav.php';
require get_template_directory() . '/int/font.php';
//require get_template_directory() . '/int/xml.php';
show_admin_bar(false);

//移除冗余代码
remove_action( 'wp_head', 'wp_generator' );// WP版本信息
remove_action( 'wp_head', 'rsd_link' );// 离线编辑器接口
remove_action( 'wp_head', 'wlwmanifest_link' );// 同上
remove_action( 'wp_head', 'adjacent_posts_rel_link_wp_head', 10, 0 );// 上下文章的url
remove_action( 'wp_head', 'feed_links', 2 );// 文章和评论feed
remove_action( 'wp_head', 'feed_links_extra', 3 );// 去除评论feed
remove_action( 'wp_head', 'wp_shortlink_wp_head', 10, 0 );// 短链接
//禁用Emoji表情
remove_action( 'wp_head', 'print_emoji_detection_script', 7 );
remove_action( 'admin_print_scripts', 'print_emoji_detection_script' );
remove_action( 'wp_print_styles', 'print_emoji_styles' );
remove_action( 'admin_print_styles', 'print_emoji_styles' );
//禁止代码标点转换
remove_filter( 'the_content', 'wptexturize' );
//禁止更新提醒
add_filter('pre_site_transient_update_core',    create_function('$a', "return null;")); // 关闭核心提示
add_filter('pre_site_transient_update_plugins', create_function('$a', "return null;")); // 关闭插件提示
add_filter('pre_site_transient_update_themes',  create_function('$a', "return null;")); // 关闭主题提示
remove_action('admin_init', '_maybe_update_core');    // 禁止 WordPress 检查更新
remove_action('admin_init', '_maybe_update_plugins'); // 禁止 WordPress 更新插件
remove_action('admin_init', '_maybe_update_themes');  // 禁止 WordPress 更新主题
function disable_embeds_init() {
    /* @var WP $wp */
    global $wp;
    // Remove the embed query var.
    $wp->public_query_vars = array_diff( $wp->public_query_vars, array(
        'embed',
    ) );
    // Remove the REST API endpoint.
    remove_action( 'rest_api_init', 'wp_oembed_register_route' );
    // Turn off
    add_filter( 'embed_oembed_discover', '__return_false' );
    // Don't filter oEmbed results.
    remove_filter( 'oembed_dataparse', 'wp_filter_oembed_result', 10 );
    // Remove oEmbed discovery links.
    remove_action( 'wp_head', 'wp_oembed_add_discovery_links' );
    // Remove oEmbed-specific JavaScript from the front-end and back-end.
    remove_action( 'wp_head', 'wp_oembed_add_host_js' );
    add_filter( 'tiny_mce_plugins', 'disable_embeds_tiny_mce_plugin' );
    // Remove all embeds rewrite rules.
    add_filter( 'rewrite_rules_array', 'disable_embeds_rewrites' );
}
add_action( 'init', 'disable_embeds_init', 9999 );
/**
 * Removes the 'wpembed' TinyMCE plugin.
 *
 * @since 1.0.0
 *
 * @param array $plugins List of TinyMCE plugins.
 * @return array The modified list.
 */
function disable_embeds_tiny_mce_plugin( $plugins ) {
    return array_diff( $plugins, array( 'wpembed' ) );
}
 
/**
 * Remove all rewrite rules related to embeds.
 *
 * @since 1.2.0
 *
 * @param array $rules WordPress rewrite rules.
 * @return array Rewrite rules without embeds rules.
 */
function disable_embeds_rewrites( $rules ) {
    foreach ( $rules as $rule => $rewrite ) {
        if ( false !== strpos( $rewrite, 'embed=true' ) ) {
            unset( $rules[ $rule ] );
        }
    }
 
    return $rules;
}
/**
 * Remove embeds rewrite rules on plugin activation.
 *
 * @since 1.2.0
 */
function disable_embeds_remove_rewrite_rules() {
    add_filter( 'rewrite_rules_array', 'disable_embeds_rewrites' );
    flush_rewrite_rules();
}
register_activation_hook( __FILE__, 'disable_embeds_remove_rewrite_rules' );
/**
 * Flush rewrite rules on plugin deactivation.
 *
 * @since 1.2.0
 */
function disable_embeds_flush_rewrite_rules() {
    remove_filter( 'rewrite_rules_array', 'disable_embeds_rewrites' );
    flush_rewrite_rules();
}
register_deactivation_hook( __FILE__, 'disable_embeds_flush_rewrite_rules' );

// 功能优化
# 百度推送
date_default_timezone_set('Asia/Shanghai');
add_action('publish_post', 'publish_bd_submit', 999);
function publish_bd_submit($post_ID){
	global $post;
	$bd_submit_enabled = true;
	if($bd_submit_enabled){
		$api ="http://data.zz.baidu.com/urls?site=http://www.fei580.com&token=FLvCyZVkmRxCOpsE";
		if($post->post_status != "publish"){
			$url = get_permalink($post_ID);
			$ch = curl_init();
			$options =  array(
				CURLOPT_URL => $api,
				CURLOPT_POST => true,
				CURLOPT_RETURNTRANSFER => true,
				CURLOPT_POSTFIELDS => $url,
				CURLOPT_HTTPHEADER => array('Content-Type: text/plain')
			);
			curl_setopt_array($ch, $options);
			$result = curl_exec($ch);
			$result = json_decode($result, true);
				$time = time();
				$file =  get_bloginfo('wpurl').'/baiduSubmit.txt';//生成日志文件,与代码所处文件同目录
				if(date('Y-m-d',filemtime($file)) != date('Y-m-d')){
					$handle = fopen($file,"w");
				}else{
					$handle = fopen($file,"a");
				}
			$resultMessage="";
			if($result['message']){
				  $resultMessage= date('Y-m-d G:i:s',$time)."\n提交失败：".$result['message'].":\n网址：".$url."\n\n";
			}
			if($result['success']){
				$resultMessage= date('Y-m-d G:i:s',$time)."\n提交成功：".":".$url."\n\n";
			}
			fwrite($handle,$resultMessage);
			fclose($handle);
		}
	}
}
# 清除描述标签
function deletehtml($description) {
	$description = trim($description);
	$description = strip_tags($description,"");
	return ($description);
}
add_filter('category_description', 'deletehtml'); 
# 后台登录背景
function custom_login_head(){
$str=file_get_contents('http://cn.bing.com/HPImageArchive.aspx?idx=0&n=1');
if(preg_match("/<url>(.+?)<\/url>/ies",$str,$matches)){
$imgurl='http://cn.bing.com'.$matches[1];
    echo'<style type="text/css">body{background: url('.$imgurl.');width:100%;height:100%;background-image:url('.$imgurl.');-moz-background-size: 100% 100%;-o-background-size: 100% 100%;-webkit-background-size: 100% 100%;background-size: 100% 100%;-moz-border-image: url('.$imgurl.') 0;background-repeat:no-repeat\9;background-image:none\9;}#backtoblog a {color:#fff!important;}.login h1 {display:none!important;}</style>';
}}
add_action('login_head', 'custom_login_head');
# Avatar 头像
function get_ssl_avatar($avatar) {
	$avatar = preg_replace('/.*\/avatar\/(.*)\?s=([\d]+)&.*/','<img src="https://secure.gravatar.com/avatar/$1?s=$2" class="avatar avatar-$2" height="$2" width="$2">',$avatar);
	return $avatar;
}
add_filter('get_avatar', 'get_ssl_avatar');
# 分类目录斜线
function nice_trailingslashit($string, $type_of_url) {
	if ( $type_of_url != 'single' && $type_of_url != 'page' )
		$string = trailingslashit($string);
	return $string;
}
add_filter('user_trailingslashit', 'nice_trailingslashit', 10, 2);
# 页面html后缀
function html_page_permalink() {
	global $wp_rewrite;
	if ( !strpos($wp_rewrite->get_page_permastruct(), '.html')){
		$wp_rewrite->page_structure = $wp_rewrite->page_structure . '.html';
	}
}
add_action('init', 'html_page_permalink', -1);
# 标签名称
function get_terms_name($tax) {
	$terms = get_the_terms( $post->ID, $tax );
	if ( $terms && ! is_wp_error( $terms ) ) :
		$taxs = array();
		foreach ( $terms as $term ) {
			$taxs[] = $term->name;
		}
		$taxs = join( ", ", $taxs );
		echo $taxs;
	endif;
}
# 标签别名
function get_terms_slug($tax) {
	$terms = get_the_terms( $post->ID, $tax );
	if ( $terms && ! is_wp_error( $terms ) ) :
		$taxs = array();
		foreach ( $terms as $term ) {
			$taxs[] = $term->slug;
		}
		$taxs = join( ", ", $taxs );
		echo strtoupper($taxs);
	endif;
}
function get_terms_slug_by_name($name,$tax) {
    $terms=get_term_by( 'name', $name, $tax); //用 get_term_by函数获取别名对应的标签数组
    if ($terms) {
		echo strtoupper($terms->slug);
	} else {
		echo $name;
	}
}
# 标签描述
function get_terms_des($tax) {
	$terms = get_the_terms( $post->ID, $tax );
	if ( $terms && ! is_wp_error( $terms ) ) :
		$taxs = array();
		foreach ( $terms as $term ) {
			$taxs[] = $term->description;
		}
		$taxs = join( ", ", $taxs );
		echo $taxs;
	endif;
}
# 标签链接
function get_terms_link_by_name($name,$tax) {
    $terms=get_term_by( 'name', $name, $tax); //用 get_term_by函数获取别名对应的标签数组
    if ($terms) {
		$link = '<a href="'.get_term_link($terms->term_id).'">'.$name.'</a>'; //用 get_tag_link 函数获取标签别名的链接
		echo $link;
	} else {
		echo $name;
	}
}
# 行程选择
function get_tripType() {
	global $post;
	$trip = get_post_custom_values("ft");
	$tripDate = get_post_custom_values("depdate");
	$backDate = get_post_custom_values("ararrdate");
	if($trip[0]==1){
		echo '<span class="tripch">单程</span><span class="flytime">';
		echo $tripDate[0].'</span><span class="arrtime"></span>';
  } else {
        echo '<span class="tripch">往返</span><span class="flytime">';
		echo $tripDate[0].'</span><span class="arrtime">';
		echo $backDate[0].'</span>';
  }
}
# 自定义字段值
function get_custom_value($tax) {
	global $post;
	$value = get_post_custom_values($tax);
	if (empty($value[0])){
		return '';
	} else {
		return $value[0];
	}
}

// 全部结束
?>