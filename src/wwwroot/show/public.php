<?php
header("Content-Type:text/html;charset=utf-8");
$url='http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"];
$urlarr=parse_url($url);
parse_str($urlarr['query'],$parr);
$source=$parr["hmsr"];
$keywords=$parr["hmkw"];
if ($source==null || $source=="") {
	$source=$parr["utm_source"];
	$par_source='&utm_source='.$source;
} else {
	$source=$parr["hmsr"];
	$par_source='&hmsr='.$source;
}
if ($keywords==null || $keywords=="") {
	$keywords=$parr["utm_content"];
	$par_keywords='&utm_content='.$keywords;
} else {
	$keywords=$parr["hmkw"];
	$par_keywords='&hmkw='.$keywords;
}
if ($source=="" && $keywords=="") {
	
} else if ($source=="") {
	$parurl=$par_keywords;
} else if ($keywords=="") {
	$parurl=$par_source;
} else {
	$parurl=$par_source.$par_keywords;
}
function the_content(){
	echo '<div id="loader-container"><p id="loadingText">光速查询中...</p></div>';
}
?>