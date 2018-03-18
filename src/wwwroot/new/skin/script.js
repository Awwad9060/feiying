//谷歌分析
  (function(i,s,o,g,r,a,m){i['GoogleAnalyticsObject']=r;i[r]=i[r]||function(){
  (i[r].q=i[r].q||[]).push(arguments)},i[r].l=1*new Date();a=s.createElement(o),
  m=s.getElementsByTagName(o)[0];a.async=1;a.src=g;m.parentNode.insertBefore(a,m)
  })(window,document,'script','https://www.google-analytics.com/analytics.js','ga');
  ga('create', 'UA-93569714-2', 'auto');
  ga('send', 'pageview');
//百度统计代码
var _hmt = _hmt || [];
(function() {
  var hm = document.createElement("script");
  hm.src = "//hm.baidu.com/hm.js?ca5e9c7fe4ba2457d6da5b2bfcecb0f4";
  var s = document.getElementsByTagName("script")[0]; 
  s.parentNode.insertBefore(hm, s);
})();
//商桥监控
_hmt.push(['_setAccount', 'ca5e9c7fe4ba2457d6da5b2bfcecb0f4']);
document.getElementById('BaiduBridge').onmouseup = function() {
_hmt.push(['_trackPageview', '/chat']);
};
//声明_czc对象:
var _czc = _czc || [];
//绑定siteid，请用您的siteid替换下方"XXXXXXXX"部分
_czc.push(["_setAccount", "3579146"]);
_czc.push(["_setCustomVar","访客来源","baidu",1]);


//New头部
function header() {
document.writeln("<div class=\"remebernav\"><a href=\"http://www.fei580.com/login.aspx?url=http%3a%2f%2fwww.fei580.com%2findex.aspx\" title=\"会员登录\" rel=\"nofollow\">会员登录</a>|<a href=\"http://www.fei580.com/regAgree.aspx\" title=\"会员注册\" rel=\"nofollow\">会员注册</a>|<a href=\"http://www.fei580.com/sm/\" title=\"飞瀛服务\">关于飞瀛</a></div>");
document.writeln("<ul class=\"menu\">");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/\" title=\"首页\" rel=\"nofollow\">首&nbsp;页</a></li>");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/recommend.aspx\" title=\"特价机票\">特价机票</a></li>");
document.writeln("<li class=\"one\"><a href=\"http://www.fei580.com/international.aspx\" title=\"国际机票\">国际机票</a></li>");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/visa.html\" title=\"国际签证\">国际签证</a></li>");
document.writeln("<li class=\"two\"><a href=\"http://hotel.fei580.com/\" target=\"_blank\" title=\"国际酒店\" rel=\"nofollow\">国际酒店</a></li>");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/quan.aspx\" title=\"飞瀛圈\" rel=\"nofollow\">飞瀛圈</a></li>");
document.writeln("<li class=\"two\" style=\"background:none;\"><a href=\"http://www.fei580.com/yinlian/\" target=\"_blank\" title=\"在线支付方式\" rel=\"nofollow\">支付方式</a></li>");
document.writeln("</ul>");
document.writeln("<div class=\"submenu\">");
document.writeln("<ul class=\"nohidden\">");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/airline.aspx\" title=\"航空公司\">航空公司</a></li>");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/airport.aspx\" title=\"世界机场\">世界机场</a></li>");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/airplane.aspx\" title=\"民航机型\">民航机型</a></li>");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/news.aspx\" title=\"新闻资讯\">新闻资讯</a></li>");
document.writeln("<li class=\"two\"><a href=\"http://www.fei580.com/prizes.aspx\" title=\"积分广场\" rel=\"nofollow\">积分广场</a></li>");
document.writeln("</ul>");
document.writeln("<div class=\"tripsearch\">");
document.writeln("<form action=\"http://zhannei.baidu.com/cse/search\" target=\"_blank\"  method=\"get\" >");
document.writeln("<input name=\"q\" class=\"tripinput\" placeholder=\"站内搜索\" />");
document.writeln("<input type=\"submit\" name=\"submit\" class=\"tripsubmit\" value=\"\" />");
document.writeln("<input type=\"hidden\" name=\"s\" value=\"7002993507200652835\">");
document.writeln("<input type=\"hidden\" name=\"entry\" value=\"1\">");
document.writeln("</form>");
document.writeln("</div>");
document.writeln("</div>");
}
//New首页机票
function sticket() {
document.writeln("<ul class=\"sticket\">");
document.writeln("<li>");
document.writeln("<a href=\"http://www.fei580.com/searchTicket.aspx?fromcity=1&tocityName=%u591A%u4F26%u591A&tripType=2&tripDate=2017-10-21&backDate=2017-10-28\" target=\"_blank\">");
document.writeln("<div class=\"info\">");
document.writeln("<h4>广州 <i>至</i> 多伦多 <i>机票</i></h4>");
document.writeln("<p><span class=\"go\">去</span><em>2017.10.21</em><span class=\"back\">回</span><em>2017.10.28</em></p>");
document.writeln("<p><span class=\"air\">东方航空</span></p>");
document.writeln("</div>");
document.writeln("<div class=\"price\">");
document.writeln("<span>往返</span>");
document.writeln("<b>¥4100</b>起");
document.writeln("<span>不含税价</span>");
document.writeln("</div>");
document.writeln("</a>");
document.writeln("</li>");
document.writeln("<li>");
document.writeln("<a href=\"http://www.fei580.com/searchTicket.aspx?fromcity=4&tocityName=%u7EBD%u7EA6&tripType=2&tripDate=2017-10-21&backDate=2017-10-28\" target=\"_blank\">");
document.writeln("<div class=\"info\">");
document.writeln("<h4>香港 <i>至</i> 纽约 <i>机票</i></h4>");
document.writeln("<p><span class=\"go\">去</span><em>2017.10.21</em></p>");
document.writeln("<p><span class=\"air\">俄罗斯国际航空</span></p>");
document.writeln("</div>");
document.writeln("<div class=\"price\">");
document.writeln("<span>单程</span>");
document.writeln("<b>¥2600</b>起");
document.writeln("<span>不含税价</span>");
document.writeln("</div>");
document.writeln("</a>");
document.writeln("</li>");
document.writeln("<li>");
document.writeln("<a href=\"http://www.fei580.com/searchTicket.aspx?fromcity=2&tocityName=%u4F26%u6566&tripType=2&tripDate=2017-10-21&backDate=2017-10-28\" target=\"_blank\">");
document.writeln("<div class=\"info\">");
document.writeln("<h4>北京 <i>至</i> 伦敦 <i>机票</i></h4>");
document.writeln("<p><span class=\"go\">去</span><em>2017.10.21</em><span class=\"back\">回</span><em>2017.10.28</em></p>");
document.writeln("<p><span class=\"air\">土耳其航空</span></p>");
document.writeln("</div>");
document.writeln("<div class=\"price\">");
document.writeln("<span>往返</span>");
document.writeln("<b>¥1120</b>起");
document.writeln("<span>不含税价</span>");
document.writeln("</div>");
document.writeln("</a>");
document.writeln("</li>");
document.writeln("<li>");
document.writeln("<a href=\"http://www.fei580.com/searchTicket.aspx?fromcity=3&tocityName=%u5E03%u91CC%u65AF%u73ED&tripType=2&tripDate=2017-10-21&backDate=2017-10-28\" target=\"_blank\">");
document.writeln("<div class=\"info\">");
document.writeln("<h4>上海 <i>至</i> 布里斯班 <i>机票</i></h4>");
document.writeln("<p><span class=\"go\">去</span><em>2017.10.21</em></p>");
document.writeln("<p><span class=\"air\">澳洲航空</span></p>");
document.writeln("</div>");
document.writeln("<div class=\"price\">");
document.writeln("<span>单程</span>");
document.writeln("<b>¥2010</b>起");
document.writeln("<span>不含税价</span>");
document.writeln("</div>");
document.writeln("</a>");
document.writeln("</li>");
document.writeln("<li>");
document.writeln("<a href=\"http://www.fei580.com/searchTicket.aspx?fromcity=1&tocityName=%u52A0%u5FB7%u6EE1%u90FD&tripType=2&tripDate=2017-10-21&backDate=2017-10-28\" target=\"_blank\">");
document.writeln("<div class=\"info\">");
document.writeln("<h4>广州 <i>至</i> 加德满都 <i>机票</i></h4>");
document.writeln("<p><span class=\"go\">去</span><em>2017.10.21</em><span class=\"back\">回</span><em>2017.10.28</em></p>");
document.writeln("<p><span class=\"air\">南方航空</span></p>");
document.writeln("</div>");
document.writeln("<div class=\"price\">");
document.writeln("<span>往返</span>");
document.writeln("<b>¥3079</b>起");
document.writeln("<span>不含税价</span>");
document.writeln("</div>");
document.writeln("</a>");
document.writeln("</li>");
document.writeln("<li>");
document.writeln("<a href=\"http://www.fei580.com/searchTicket.aspx?fromcity=4&tocityName=%u6BDB%u91CC%u6C42%u65AF&tripType=2&tripDate=2017-10-21&backDate=2017-10-28\" target=\"_blank\">");
document.writeln("<div class=\"info\">");
document.writeln("<h4>香港 <i>至</i> 毛里求斯 <i>机票</i></h4>");
document.writeln("<p><span class=\"go\">去</span><em>2017.10.21</em></p>");
document.writeln("<p><span class=\"air\">阿联酋航空</span></p>");
document.writeln("</div>");
document.writeln("<div class=\"price\">");
document.writeln("<span>单程</span>");
document.writeln("<b>¥3020</b>起");
document.writeln("<span>不含税价</span>");
document.writeln("</div>");
document.writeln("</a>");
document.writeln("</li>");
document.writeln("</ul>");
}
//咨询链接
function chatlink() {
document.writeln("<a href=\"http://www.fei580.com/chat/?utm_source=OutLink&utm_medium=Substations&utm_campaign=Plugins&utm_content=Online\" class=\"chatbtn\" target=\"_blank\" rel=\"nofollow\">咨询</a>");
}
//在线咨询
function chat() {
document.writeln("<div class=\"activity-btn\"><a class=\"like-btn\" href=\"http://www.fei580.com/chat/?utm_source=OutLink&utm_medium=Substations&utm_campaign=Plugins&utm_content=Online\" target=\"_blank\" title=\"在线咨询\" rel=\"nofollow\">在线咨询</a><a class=\"collect-btn collect-no\" href=\"tencent://message/?uin=531658630&Site=飞瀛网&Menu=yes\" target=\"_blank\" title=\"联系QQ客服\" rel=\"nofollow\">QQ客服</a></div>");
document.writeln("<div class=\"clear\"></div>");
}
//底部
function footer() {
document.writeln("<div class=\"footer\">");
document.writeln("<div class=\"gotop\"><code><a href=\"#\" title=\"返回顶部\" class=\"white\" rel=\"nofollow\">TOP</a></code><span><a href=\"http://www.fei580.com\" title=\"飞瀛首页\" class=\"white\" rel=\"nofollow\">HOME</a></span></div>");
document.writeln("<div class=\"footerinfo\">");
document.writeln("<div class=\"footerlogo\"><a href=\"http://www.fei580.com\" target=\"_blank\" title=\"国际机票\" rel=\"nofollow\"><img src=\"http://www.fei580.com/images/bottomlogo.jpg\" alt=\"飞瀛LOGO\" /></a></div>");
document.writeln("<div class=\"copyright\">");
document.writeln("<a href=\"http://www.fei580.com/\" title=\"飞瀛网\" rel=\"nofollow\">飞瀛网</a> <a href=\"http://www.fei580.com/sm/\" rel=\"nofollow\">广州市飞瀛商务服务有限公司</a>旗下网站 <a href=\"http://www.miibeian.gov.cn/\" target=\"_blank\" rel=\"nofollow\">粤ICP备11023295号-2</a> <a href=\"http://www.fei580.com/sm/19.htm\" rel=\"nofollow\"><img src=\"http://www.fei580.com/images/copyright.jpg\" alt=\"版权认证\"  border=\"0\" /></a> <a rel=\"nofollow\" href=\"http://www.fei580.com/sm/19.htm\" title=\"设计版权\"  target=\"_blank\" style=\"color:#0053a0;\">版权认证网站</a>");
document.writeln("<br />Copyright &copy; 1999 - 2016 <a href=\"http://www.fei580.com/\" rel=\"nofollow\">fei580.com</a>  All Rights Reserved E-Mail：<a href=\"mailto:flying@fei580.com\">flying@fei580.com</a>");
document.writeln("<br />热线：400-885-0663(免费) 020-22382632(国际) 020-22382631(国内) 办公时间：9:00～18:00");
document.writeln("<br />地址：广州市天河区珠江新城 华明路9号华普广场西塔1603 <a href=\"http://www.fei580.com/sm/s5.html\" target=\"_blank\" rel=\"nofollow\">地址地图</a>");
document.writeln("</div>");
document.writeln("<div class=\"tongji\">");
document.writeln("<!--站长工具统计-->");
document.writeln("<script type=\"text/javascript\">var cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");document.write(unescape(\"%3Cspan id=\'cnzz_stat_icon_3579146\'%3E%3C/span%3E%3Cscript src=\'\" + cnzz_protocol + \"s6.cnzz.com/stat.php%3Fid%3D3579146\' type=\'text/javascript\'%3E%3C/script%3E\"));</script>");
document.writeln("<script type=\"text/javascript\">var cnzz_protocol = ((\"https:\" == document.location.protocol) ? \" https://\" : \" http://\");document.write(unescape(\"%3Cspan id=\'cnzz_stat_icon_2990839\'%3E%3C/span%3E%3Cscript src=\'\" + cnzz_protocol + \"s4.cnzz.com/stat.php%3Fid%3D2990839\' type=\'text/javascript\'%3E%3C/script%3E\"));</script>");
document.writeln("<!--SiteMaster 网站分析代码-->");
document.writeln("<script src=\"http://www.fei580.com/js/SiteMaster.Analytics.js\" language=\"JavaScript\"></script>");
document.writeln("</div>");
document.writeln("</div>");
document.writeln("</div>");
}
function kefu() {
document.writeln("<script type=\"text/javascript\" src=\"http://cdn.bootcss.com/jquery/3.0.0-beta1/jquery.min.js\" ></script>");
document.writeln("<script type=\"text/javascript\" src=\"http://v.fei580.com/js/scrolltop.js\" ></script>");
document.writeln("<div id=\"scrolltop\"></div>");
document.writeln("<script src=\"http://vip.fei580.com/kf/kf.js\" type=\"text/javascript\"></script>");
document.writeln("<script src=\"http://www.fei580.com/new/skin/bdpush.js\" type=\"text/javascript\"></script>");
}
