<meta name="robots" CONTENT="index,follow">
<link rel="canonical" href="<?php echo $url;?>" />
<link rel="stylesheet" href="http://www.fei580.com/plugin/style.css" type="text/css" media="screen" />
<link rel="stylesheet" href="body.css" type="text/css" media="screen" />
<link href="http://www.fei580.com/plugin/css/select.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/plugin/css/hotcity.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/plugin/css/datepicker.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/plugin/css/CitySelector2.css" rel="stylesheet" type="text/css" />
<script src="http://www.fei580.com/plugin/js/jquery-1.4.2.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/plugin/js/postdata.min.js" type="text/javascript"></script>
<script src="http://www.fei580.com/plugin/js/index.min.js" type="text/javascript"></script>
<script type="text/javascript" src="http://www.fei580.com/plugin/js/search.js"></script>
<script type="text/javascript" src="http://www.fei580.com/plugin/js/JQuery.cookie.js"></script>
<script type="text/javascript" src="http://www.fei580.com/plugin/js/CityData.js"></script>
<script type="text/javascript" src="http://www.fei580.com/plugin/js/CitySelector.js"></script>
<script type="text/javascript" src="http://www.fei580.com/plugin/js/jquery.SuperSlide.2.1.1.js"></script>
<script type="text/javascript">
    jQuery.divselect = function (divselectid, inputselectid) {
        var inputselect = $(inputselectid);
        $(divselectid + " cite").click(function () {
            var ul = $(divselectid + " ul");
            if (ul.css("display") == "none") {
                ul.slideDown("fast");
            } else {
                ul.slideUp("fast");
            }
        });
        $(divselectid + " ul li a").click(function () {
            var txt = $(this).text();
            $(divselectid + " cite").html(txt);
            var value = $(this).attr("selectid");
            inputselect.val(value);
            $(divselectid + " ul").hide();

        });
        $(document).click(function () {
            $(divselectid + " ul").hide();
        });
    };
	
	//获取当前url的参数值
	function getRequest(name){ 
		var url = location.href;  
		var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
		var paraObj = {};
		for (i=0; j=paraString[i]; i++){  
			paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
		}
		var returnValue = paraObj[name.toLowerCase()];  
		return typeof(returnValue)=="undefined" ? "" : returnValue;
	}

	//获取当前相对路径
	function GetUrlRelativePath(){
　　　　var url = document.location.toString();
　　　　var arrUrl = url.split("//");
　　　　var start = arrUrl[1].indexOf("/");
　　　　var relUrl = arrUrl[1].substring(start);//stop省略，截取从start开始到结尾的所有字符
　　　　if(relUrl.indexOf("?") != -1){
　　　　　　relUrl = relUrl.split("?")[0];
　　　　}
　　　　return relUrl;
　　}

    $(function() {
        ////目的城市
        var dx = new VSxClientCountrySelector('tocityName', CityData);
        dx.Init();
        //日期控件
        TripBackDate(document.getElementById("fromtripDate"), document.getElementById("backtripDate"));
        //日期控件
        TripBackDate(document.getElementById("fDate"), document.getElementById("tDate"));
        $.divselect("#divselect", "#inputselect");
		//调用不同的咨询链接
		var hmsr = getRequest("hmsr");
		//var source = getRequest("utm_source");
		var medium = getRequest("utm_medium");
		var campaign = getRequest("utm_campaign");
		var keywords = getRequest("utm_content");
		//var key = GetUrlRelativePath();
		if(hmsr==null || hmsr==""){hmsr = getRequest("utm_source");} else {hmsr = getRequest("hmsr");}
		if(keywords==null || keywords==""){keywords=GetUrlRelativePath();}else{keywords = getRequest("utm_content");}
		if(medium==null || medium==""){medium = "PPC";} else {medium = getRequest("utm_medium");}
		if(campaign==null || campaign==""){campaign = getRequest("hmpl");} else {campaign = getRequest("utm_campaign");}
		if(hmsr==null || hmsr==""){
			$(".chat a").attr("href",function(i,origValue){ return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=BaiduBridge&utm_content="+keywords; });
		} else {
			$(".chat a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
			$(".ticket a").attr("href",function(i,origValue){ return origValue + "&utm_source="+hmsr+"&utm_content="+keywords; });
		}
    });
	
	//平台、设备和操作系统 
        var system = { 
            win: false, 
            mac: false, 
            xll: false, 
            ipad:false 
        }; 
    //检测平台 
        var p = navigator.platform; 
        system.win = p.indexOf("Win") == 0; 
        system.mac = p.indexOf("Mac") == 0; 
        system.x11 = (p == "X11") || (p.indexOf("Linux") == 0); 
        system.ipad = (navigator.userAgent.match(/iPad/i) != null)?true:false; 
    //跳转语句，如果是手机访问就自动跳转到wap.baidu.com页面 
        if (system.win || system.mac || system.xll||system.ipad) { 
        } else { 
            window.location.href = "http://m.fei580.com<?php echo $cat; ?>"; 
        } 
</script>
<!--[if lte IE 6]>
    <script type="text/javascript">
    function position_fixed(el, eltop, elleft){
    // check if this is IE6
    if(!window.XMLHttpRequest)
    window.onscroll = function(){
    el.style.top = (document.documentElement.scrollTop + eltop)+"px";
    el.style.left = (document.documentElement.scrollLeft + elleft)+"px";
    }
    else el.style.position = "fixed";
    }
    position_fixed(document.getElementById("ie6-warning"),0, 0);
    </script>
<![endif]-->