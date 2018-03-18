<?php
header("Content-Type:text/html;charset=utf-8");
$url = 'http://'.$_SERVER['SERVER_NAME'].$_SERVER["REQUEST_URI"];
$parts = parse_url($url);
$cat = $parts[path];
//$path_array = array();
//$city_array = array();
//if ($cat=='/bd/adelaide/') {$city = '°¢µÂÀ³µÂ';} else {}
//$city = iconv('GB2312','UTF-8', $city);
function Doctype() {
echo '<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta http-equiv="Cache-Control" content="no-transform" />
<meta http-equiv="Cache-Control" content="no-siteapp" />
<meta http-equiv="mobile-agent" content="format=xhtml;url=http://m.fei580.com'.$_SERVER["REQUEST_URI"].'">';
}
?>