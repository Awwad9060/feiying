<%@ Page Language="C#" AutoEventWireup="true" Inherits="index" EnableViewState="false" CodeFile="index.aspx.cs" %>
<%@ Register Src="share/searchControlB.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl1.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <title>国际机票查询_特价国际机票预订_国际机票查询网站 - 飞瀛网</title>
    <meta name="baidu-tc-verification" content="48118eea2a66982221ed9492fdd6f9e5" />
    <meta http-equiv="Cache-Control" content="no-transform" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta name="keywords" content="国际机票,国际机票查询,特价国际机票,国际机票预订,国际机票网站,国际机票价格,广州国际机票,飞瀛网" />
    <meta name="description" content="飞瀛网为您提供广州,深圳,香港,澳门等全国各地出发特价国际机票查询,国际打折机票预订,国际机票税费查询服务.免费咨询：400-885-0663.飞瀛商旅提供最新广州国际机票预定,查询国际机票税费,国际机票价格,国际航班查询,国际酒店及东南亚签证服务." />
    <meta property="og:image" content="http://www.fei580.com/logo.jpg"/>
    <link rel="Baidu-Search-icon" sizes="121x75" href="http://www.fei580.com/logo.jpg" />
    <link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
    <link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/index131222.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/select.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/hotcity.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/datepicker.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/chatModal.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/CityClient/CitySelector2.css" rel="stylesheet" type="text/css" />
    <link rel="canonical" href="http://www.fei580.com/" />
    <script type="text/javascript" src="http://www.fei580.com/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
    <script src="http://www.fei580.com/js/postdata.min.js" type="text/javascript"></script>
    <script src="http://www.fei580.com/js/index.min.js" type="text/javascript"></script>
    <script src="http://www.fei580.com/js/indexAuto.min.js" type="text/javascript"></script>
    <script type="text/javascript" src="http://www.fei580.com/js/ticket.search.index.js"></script>
    <script type="text/javascript" src="http://www.fei580.com/js/JQuery.cookie.js"></script>
    <script type="text/javascript" src="http://www.fei580.com/CityClient/CityData.js"></script>
    <script type="text/javascript" src="http://www.fei580.com/CityClient/CitySelector.min.js"></script>
    <script type="text/javascript" src="http://www.fei580.com/js/jquery.SuperSlide.2.1.1.js"></script>
    <script type="text/javascript">
        $(function() {
            //$("<div id='modalDiv' class='bigModal modalShow'><div class='modal-Body'><div class='ChatImg'><img src='http://www.fei580.com/images/small-chat-bg.png' /><a href='http://www.fei580.com/chat/' target='_blank' rel='nofollow'></a><button type='button' class='close-submit'>X</button></div></div><div class='modal-Overlay'></div></div>").insertBefore("#div_indextop");
            //目的城市
            var dx = new VSxClientCountrySelector('tocityName', CityData);
            dx.Init();
            //日期控件
            TripBackDate(document.getElementById("fromtripDate"), document.getElementById("backtripDate"));
            //日期控件
            TripBackDate(document.getElementById("fDate"), document.getElementById("tDate"));

            $("#focus").hover(function() { $("#focus-prev,#focus-next").show(); }, function() { $("#focus-prev,#focus-next").hide(); });
            $("#focus").slide({
                mainCell: "#focus-bar-box ul",
                targetCell: "#focus-title a",
                titCell: "#focus-num a",
                prevCell: "#focus-prev",
                nextCell: "#focus-next",
                effect: "left",
                easing: "easeInOutCirc",
                autoPlay: true,
                delayTime: 200
            });

            $.divselect("#divselect", "#inputselect");
            //广告
            var indtop = $("#div_indextop");
            indtop.css('left', ($(window).width() - indtop.width()) / 2).slideDown(1500);
            setTimeout(closeIndexTop, 6000);
            //滚动客服数据
            //$("#divKFA li").eq(1).remove();
            $("button").click(function() {
                $(".bigModal").removeClass("modalShow");
            });
            $(".modal-Overlay").click(function() {
                $(".bigModal").removeClass("modalShow");
            });
        });
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
</head>
<body onload="modalClick()">
    <div id="div_indextop" style="position: absolute; margin: 0 auto; padding: 0; width: 1000px; height: 170px; overflow: hidden; display:none">
        <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=1000&height=140&id=8"></script>
    </div>
    <div class="mainbody">
        <form id="form1" runat="server">
        <!--header start-->
        <div class="headertop">
            <span><img src="http://www.fei580.com/images/home.jpg" alt="飞瀛网" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="飞瀛客服电话" /><strong>国际机票查询</strong>热线：400-885-0663(免费)<!--<span style="color:#f30;font-weight:550;margin-top:-5px;">公告：5月28日到5月30日休假，5月31日正常营业。祝您端午节快乐！</span>--></span>
            <span style="float: right; margin-right: 5px;">
            <a href="http://www.fei580.com/sm/19.htm" target="_blank" rel="nofollow"><img style="margin-right: 5px; margin-top: -2px" src="http://www.fei580.com/images/djqq.gif" /></a>
            <a id="mo_home" href="javascript:void(0);" style="margin-left:5px;"><img src="http://www.fei580.com/favicon.ico" style="margin-right: 2px; margin-top: -1px"/>手机飞瀛网<div id="mobile" class="wx"><img src="http://www.fei580.com/images/mobile-qrcode.png" alt="手机飞瀛网" /></div></a>
            <a id="wx_a" href="javascript:void(0);"><img src="http://www.fei580.com/images/wx.gif" style="margin-right: 2px; margin-top: -1px"/>官方订阅号<div id="wx" class="wx"><img src="http://www.fei580.com/images/fei580_wx.jpg" alt="飞瀛官方微信" /></div></a>&nbsp;
            <a href="http://weibo.com/gzfeiying" target="_blank" rel="nofollow"><img style="margin-right: 5px" src="http://www.fei580.com/images/ico_sina.gif" alt="飞瀛官方微博"/>关注官方微博</a></span>
        </div>
        <div class="headerbottom" style="height: 205px">
            <div class="headerbottom_left">
            <a href="http://www.fei580.com" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="飞瀛网" /></a></div>
            <div class="headerbottom_right" style="height: 103px;">
                <div class="headerbottom_rightone">
                    <% if (Session["Mem_LoginName"] == null)
                       { %>
                    <a href="http://www.fei580.com/login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="会员登录" rel="nofollow">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册" rel="nofollow">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
                    <%
                        }
                       else
                       {
                    %>
                    <a href="http://www.fei580.com/person/myticket.aspx" title="飞瀛会员" rel="nofollow">您好，<%=Session["Mem_LoginName"].ToString() %></a>| <a href="http://www.fei580.com/person/myticket.aspx" title="会员积分" rel="nofollow">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="个人中心" rel="nofollow">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="退出登录" rel="nofollow">退出登录</a>
                    <%}
                    %>
                </div>
                 <ul class="menu_1">
                  <li class="one"><a href="http://www.fei580.com" title="首页" rel="nofollow">首&nbsp;页</a></li>
                  <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
                  <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
                  <!--li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li-->
                  <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
                  <li class="two"><a href="http://www.fei580.com/visa.html" onclick="_czc.push(['_trackEvent', '导航国际签证','签证','点击']);_hmt.push(['_trackEvent', '导航国际签证','签证','点击'])" title="国际签证">国际签证</a></li>
                  <li class="two"><a href="http://www.booking.com/index.html?aid=347436" onclick="_czc.push(['_trackEvent', '导航国际酒店','酒店','点击']);_hmt.push(['_trackEvent', '导航国际酒店','酒店','点击'])" target="_blank" title="国际酒店" rel="nofollow">国际酒店</a></li>
                  <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" rel="nofollow">飞瀛圈</a></li>
                  <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
                  <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="飞瀛圈子最新话题" /></li>
                 </ul>
                <div class="menubottom">
                    <ul class="nohidden">
                        <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司">航空公司</a></li>
                        <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
                        <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型">民航机型</a></li>
                        <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯">新闻资讯</a></li>
                        <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="积分广场" rel="nofollow">积分广场</a></li>
                    </ul>
                    <uc2:searchControl ID="SearchControl1" runat="server" />
                </div>
                <div class="header_nav" style="height: 60px;">
                    您现在位置：<a href="http://www.fei580.com" title="飞瀛首页" rel="nofollow">飞瀛网</a></div>
            </div>
        </div>
        
        <!--header end-->
        <div style="margin: 15px auto 0px auto; width: 990px;">
            <div id="leftsida">
                <div class="searchbar">
                    <div class="searchnav"><img src="http://www.fei580.com/images/searchbar.jpg" alt="机票查询"  usemap="#Maps"/><h1>国际机票查询</h1></div>
                    <div class="searchform">
                        <div class="searchchoose">
                            <input id="tripType1" type="radio" name="tripType" checked="checked" value="2" />&nbsp;全部&nbsp;
                            <input id="tripType2" type="radio" name="tripType" value="0" />&nbsp;单程&nbsp;
                            <input id="tripType3" type="radio" name="tripType" value="1" />&nbsp;往返
                        </div>
                        <div class="searchare">
                            <table width="100%" border="0" cellspacing="0">
                                <tr>
                                    <td width="95" height="55">
                                     <div class="stit">出发城市</div>
                                    </td>
                                    <td>
                                     <div id="divselect" runat="server"></div>
                                     <input name="fromCity" type="hidden" value="1" id="fromCity"/>
                                     <input name="fromCity" type="hidden" value="广州" id="fromCityName"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="95" height="55">
                                     <div class="stit">到达城市</div>
                                    </td>
                                    <td>
                                     <input type="text" class="sinput" id="tocityName" />
                                    </td>
                                </tr>
                                <tr>
                                    <td width="95" height="55">
                                     <div class="stit2">出发日期</div>
                                    </td>
                                    <td>
                                     <input name="fromtripDate" type="text" id="fromtripDate" class="sdate"  runat="server"/>
                                    </td>
                                </tr>
                                <tr>
                                    <td width="95" height="55">
                                     <div class="stit2">到达日期</div>
                                    </td>
                                    <td>
                                     <input name="backtripDate" type="text" id="backtripDate" class="sdate"  runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                        <script language="javascript" type="text/javascript" src="http://www.fei580.com/js/tocity.js"></script>
                <div class="searchbtn" style="cursor: pointer;text-align:center;"><img alt="查询机票"  src="http://www.fei580.com/images/searchbtn.jpg" id="btnSearch" onclick="_czc.push(['_trackEvent', '首页搜索','查询','点击']);" /></div>
                <div class="searchbottom"></div>
                </div>
                </div>
                <script type="text/javascript">var ts = TicketSearch();</script>
                <!--searchbar-->
                <div class="clear">
                </div>
                <div class="xhrz">
                 <a href="http://www.fei580.com/cata.html" target="_blank" rel="nofollow"><img src="http://www.fei580.com/images/xhrz.jpg" alt="协航认证 权威代理" /></a>
                </div>
                <div class="kfteam">
                    <div class="kufutit">
                        <img src="../images/kfteam.jpg" alt="客服团队" /></div>
                    <div id="divCusBook" class="abteam">
                        <div class="kfpic">
                            <ul>
                                <li><img src="http://www.fei580.com/images/kfimg/cs<%=csA_num %>.jpg" alt="明星客服1" /></li>
                                <li><img src="http://www.fei580.com/images/kfimg/cs<%=csB_num %>.jpg" alt="明星客服2" /></li>
                            </ul>
                        </div>
                        <div class="kfcontent">
                            <div class="kfonline">
                             <div class="onlinekf1"><a target="_blank" rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=32335510&site=qq&menu=yes" title="点击QQ，咨询在线客服" onclick="_czc.push(['_trackEvent', '首页QQ客服','咨询','点击']);"><img src="http://www.fei580.com/images/online.jpg" alt="在线客服" /></a></div>
                             <div class="kfxy">用我的真诚 完美你的旅程</div>
                            </div>
                            <div class="clear"></div>
                            <div class="kfc" id="divKFA" runat="server">
                            </div>
                            <div class="kfonline2">
                             <div class="onlinekf2"><a target="_blank" rel="nofollow" href="http://wpa.qq.com/msgrd?v=3&uin=531658630&site=qq&menu=yes" title="点击QQ，咨询在线客服" onclick="_czc.push(['_trackEvent', '首页QQ客服','咨询','点击']);"><img src="http://www.fei580.com/images/online.jpg" alt="在线客服" /></a></div>
                             <div class="kfxy">用我的耐心 助你行程开心</div>
                            </div>
                            <div class="clear"></div>
                            <div class="kfb"  id="divKFB" runat="server">
                            </div>
                        </div>
                        <input type="text" id="csDataA_Index" runat="server" />
                        <input type="text" id="csDataA" runat="server" />
                        <input type="text" id="csDataB_Index" runat="server" />
                        <input type="text" id="csDataB" runat="server" />
                    </div>
                </div>
                <!--kfteam-->
                <div class="clear"></div>
                <div class="idsfx">
                 <a href="http://www.fei580.com/IdsSearch.aspx" rel="nofollow"><img src="http://www.fei580.com/images/sideids.jpg" alt="IDS系统 国际机票价格分析" /></a>
                </div>
                <div class="clear"></div>
                <div class="spayaway">
                    <ul>
                        <li><a href="http://www.fei580.com/alipay2/" target="_blank" rel="nofollow" title="支付宝担保支付"></a></li>
                        <li><a href="http://www.fei580.com/yinlian/" target="_blank" rel="nofollow" title="银联在线支付"></a></li>
                        <li><a href="http://www.fei580.com/sm/" target="_blank" rel="nofollow" title="星级商户"></a></li>
                    </ul>
                </div>
                <!--spayaway-->
                <div class="clear"></div>
                <div class="cxtool">
                    <div class="cxtit"></div>
                    <div class="elticket">
                        <input name="eticket" type="text" id="eticket" runat="server"  class="eticket" value="填写你的机票下载号" onfocus="focusEticket(this);" onblur="blurEticket(this);" /> <asp:ImageButton ID="btnDownload" runat="server" ImageUrl="http://www.fei580.com/images/dticketbtn.jpg" CssClass="dticket" OnClick="btnDownloadTicket_Click"/>
                    </div>
                    <!--elticket-->
                    <div class="mytool">
                        <ul>
                            <li><a href="http://www.fei580.com/login.aspx?url=http%3a%2f%2fwww.fei580.com%2findex.aspx" target="_blank" rel="nofollow">
                                <div class="tico"><img src="http://www.fei580.com//images/mytool1.jpg" alt="我的机票" /></div>
                                <div class="tname">我的机票</div>
                            </a></li>
                            <li><a href="http://www.fei580.com/quan.aspx" target="_blank" rel="nofollow">
                                <div class="tico"><img src="http://www.fei580.com/images/mytool2.jpg" alt="旅行分享" /></div>
                                <div class="tname">旅行分享</div>
                            </a></li>
                            <li><a href="http://www.fei580.com/chat/" id="xc" target="_blank" rel="nofollow">
                                <div class="tico"><img src="http://www.fei580.com/images/mytool3.jpg" alt="紧急行程" /></div>
                                <div class="tname">紧急行程</div>
                            </a></li>
                        </ul>
                    </div>
                    <!--mytool-->
                    <div class="gtools">
                        <ul>
                            <li><a href="http://www.tianqi.com/worldcity.html" target="_blank" rel="nofollow" title="天气预报"></a></li>
                            <li><a href="http://time.123cha.com/" target="_blank" rel="nofollow" title="国际时差"></a></li>
                            <li><a href="http://ditu.google.cn/" target="_blank" rel="nofollow" title="电子地图"></a></li>
                            <li><a href="http://qq.ip138.com/hl.asp" target="_blank" rel="nofollow" title="汇率查询"></a></li>
                            <li><a href="http://www.fei580.com/visa.html" target="_blank" rel="nofollow" title="旅游签证"></a></li>
                            <li><a href="http://www.travelsky.com/" target="_blank" rel="nofollow" title="机票真伪"></a></li>
                        </ul>
                    </div>
                </div>
                <!--cxtool-->
                <div class="clear"></div>
            </div>
            <!--leftsida-end-->
            <div id="rmain">
                <div class="serzz">
                <!--服务星级资质-->
                 <div class="serzzc">
                  飞瀛网是中国在线商旅服务行业的创先者，提供专业<strong>国际机票查询</strong>服务，个性化行程设计。承诺客户至上，<strong>国际机票预订</strong>可以先开票验真，满意再付款。钻石级售后服务，行程无顾虑。飞瀛网支持实时<strong>国际机票查询</strong>及<strong>特价国际机票预订</strong>，领先同行的专业水平。
                 </div>
                </div>
                <div class="slide">
                    <div id="focus">
                        <div class="focus-bar-box" id="focus-bar-box">
                            <ul class="focus-bar">
                                <%
                                    if (focuNews.Count != 0)
                                    {

                                        for (int i = 0; i < focuNews.Count; i++)
                                        {
                                            System.Data.DataRow focuNews_row = focuNews[i];
                                            string picUrl = "http://www.fei580.com/images/focus.jpg";
                                            if (focuNews_row["newsPic"].ToString() != "")
                                            {
                                                picUrl = focuNews_row["newsPic"].ToString();
                                            }
                                            %>
                                                <li><a href="http://www.fei580.com/news_<%=focuNews_row["id"].ToString()%>.htm" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=picUrl%>" alt="国际机票"></a></li>
                                            <%
                                        }
                                    }
                                %>
                            </ul>
                        </div>
                        <a href="http://www.fei580.com" class="btn-prev" onclick="return false;" hidefocus="" id="focus-prev" rel="nofollow"></a><a href="http://www.fei580.com" class="btn-next" onclick="return false;" hidefocus="" id="focus-next" rel="nofollow"></a>
                        <div class="ft">
                            <div class="ftbg">
                            </div>
                            <div id="focus-num" class="change"><a class="t"></a><a class="t"></a><a class="t"></a><a class="t"></a><a class="t"></a></div>
                        </div>
                    </div>
                </div>
                <!--幻灯片效果-->
                <div class="isbanner">
                    <ul>
                        <li class="isli">
                            <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=176&height=124&id=12"></script></li>
                        <li class="isli islim">
                            <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=176&height=124&id=13"></script></li>
                        <li class="isli">
                            <script type="text/javascript" src="http://www.fei580.com/ad/getad.aspx?width=176&height=124&id=14"></script></li>
                    </ul>
                </div>
                <!--isbanner-->
                <div class="clear">
                </div>
                <div class="supdate">
                    <div class="sdtit"><!--<img src="http://www.fei580.com/images/sdtit.jpg" alt="机票实时查询图" />--><h2>实时国际机票查询</h2></div>
                    <div class="supmap" style="background:url('http://www.fei580.com/images/world_map.jpg');">
                        <div id="divPointA" style="top:100px;left:200px; position:relative; display:none; background-repeat:no-repeat;">
                         <img alt="国际线路" id="imgLine" src="http://www.fei580.com/images/map_point.png" runat="server" />
                         <img alt="阿德莱德线路图" src="http://www.fei580.com/images/linemap/internation/cityto_阿德莱德.png" _src="http://www.fei580.com/images/linemap/internation/cityto_阿德莱德.gif" style="display:none;" />
                         <img alt="巴黎线路图" src="http://www.fei580.com/images/linemap/internation/cityto_巴黎.png" _src="http://www.fei580.com/images/linemap/internation/cityto_巴黎.gif" style="display:none;" />
                         <img alt="布里斯本线路图" src="http://www.fei580.com/images/linemap/internation/cityto_布里斯本.png" _src="http://www.fei580.com/images/linemap/internation/cityto_布里斯本.gif" style="display:none;" />
                         <img alt="迪拜线路图" src="http://www.fei580.com/images/linemap/internation/cityto_迪拜.png" _src="http://www.fei580.com/images/linemap/internation/cityto_迪拜.gif" style="display:none;" />
                         <img alt="东京线路图" src="http://www.fei580.com/images/linemap/internation/cityto_东京.png" _src="http://www.fei580.com/images/linemap/internation/cityto_东京.gif" style="display:none;" />
                         <img alt="多伦多线路图" src="http://www.fei580.com/images/linemap/internation/cityto_多伦多.png" _src="http://www.fei580.com/images/linemap/internation/cityto_多伦多.gif" style="display:none;" />
                         <img alt="法兰克福线路图" src="http://www.fei580.com/images/linemap/internation/cityto_法兰克福.png" _src="http://www.fei580.com/images/linemap/internation/cityto_法兰克福.gif" style="display:none;" />
                         <img alt="伦敦线路图" src="http://www.fei580.com/images/linemap/internation/cityto_伦敦.png" _src="http://www.fei580.com/images/linemap/internation/cityto_伦敦.gif" style="display:none;" />
                         <img alt="洛杉矶线路图" src="http://www.fei580.com/images/linemap/internation/cityto_洛杉矶.png" _src="http://www.fei580.com/images/linemap/internation/cityto_洛杉矶.gif" style="display:none;" />
                         <img alt="马德里线路图" src="http://www.fei580.com/images/linemap/internation/cityto_马德里.png" _src="http://www.fei580.com/images/linemap/internation/cityto_马德里.gif" style="display:none;" />
                         <img alt="曼彻斯特线路图" src="http://www.fei580.com/images/linemap/internation/cityto_曼彻斯特.png" _src="http://www.fei580.com/images/linemap/internation/cityto_曼彻斯特.gif" style="display:none;" />
                         <img alt="曼谷线路图" src="http://www.fei580.com/images/linemap/internation/cityto_曼谷.png" _src="http://www.fei580.com/images/linemap/internation/cityto_曼谷.gif" style="display:none;" />
                         <img alt="蒙特利尔线路图" src="http://www.fei580.com/images/linemap/internation/cityto_蒙特利尔.png" _src="http://www.fei580.com/images/linemap/internation/cityto_蒙特利尔.gif" style="display:none;" />
                         <img alt="墨尔本线路图" src="http://www.fei580.com/images/linemap/internation/cityto_墨尔本.png" _src="http://www.fei580.com/images/linemap/internation/cityto_墨尔本.gif" style="display:none;" />
                         <img alt="墨西哥城线路图" src="http://www.fei580.com/images/linemap/internation/cityto_墨西哥城.png" _src="http://www.fei580.com/images/linemap/internation/cityto_墨西哥城.gif" style="display:none;" />
                         <img alt="纽约线路图" src="http://www.fei580.com/images/linemap/internation/cityto_纽约.png" _src="http://www.fei580.com/images/linemap/internation/cityto_纽约.gif" style="display:none;" />
                         <img alt="三藩市线路图" src="http://www.fei580.com/images/linemap/internation/cityto_三藩市.png" _src="http://www.fei580.com/images/linemap/internation/cityto_三藩市.gif" style="display:none;" />
                         <img alt="苏黎世线路图" src="http://www.fei580.com/images/linemap/internation/cityto_苏黎世.png" _src="http://www.fei580.com/images/linemap/internation/cityto_苏黎世.gif" style="display:none;" />
                         <img alt="温哥华线路图" src="http://www.fei580.com/images/linemap/internation/cityto_温哥华.png" _src="http://www.fei580.com/images/linemap/internation/cityto_温哥华.gif" style="display:none;" />
                         <img alt="渥太华线路图" src="http://www.fei580.com/images/linemap/internation/cityto_渥太华.png" _src="http://www.fei580.com/images/linemap/internation/cityto_渥太华.gif" style="display:none;" />
                         <img alt="悉尼线路图" src="http://www.fei580.com/images/linemap/internation/cityto_悉尼.png" _src="http://www.fei580.com/images/linemap/internation/cityto_悉尼.gif" style="display:none;" />
                         <img alt="芝加哥线路图" src="http://www.fei580.com/images/linemap/internation/cityto_芝加哥.png" _src="http://www.fei580.com/images/linemap/internation/cityto_芝加哥.gif" style="display:none;" />

                        </div>
                        <div id="divPrice" style="width:236px; height:77px;top:50px;left:220px; position:relative; background-image:url('http://www.fei580.com/images/airline_price_bkg.png'); _background-image:url('http://www.fei580.com/images/airline_price_bkg.gif'); background-repeat:no-repeat; display:none;cursor: pointer;" onclick="clickFlySearching(this);" onmouseover="mouseOverSearching();" onmouseout="mouseOutSearching();">
                            <table style="border-collapse:collapse; border:0px; font-family:微软雅黑; color:White;">
                                <tr>
                                    <td style=" width:20px; height:53px;"></td>
                                    <td style=" vertical-align:bottom;">
                                        <table style=" color:White;" >
                                            <tr>
                                                <td>
                                                     <span style=" font-size:25px; width:20px;">¥</span><span id="txtSearchingPrice" runat="server" style=" font-size:30px;">8250</span>
                                                </td>
                                                <td>
                                                    <table>
                                                        <tr>
                                                            <td>
                                                                 <span id="txtSearchingFlyDate" runat="server" style=" font-size:14px;">12月28日</span>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>
                                                                 <span id="txtSearchingAirline" runat="server" style="font-size:14px;">阿德莱德航空</span>
                                                            </td>
                                                        </tr>
                                                    </table>
                                                </td>
                                            </tr>
                                        </table>
                                    </td>
                                </tr>
                                <tr>
                                    <td style=" width:20px; height:23px;"></td>
                                    <td >
                                        <span style="width:20px;">&nbsp;&nbsp;&nbsp;&nbsp;</span><span id="txtSearchingFromTo"  runat="server" style=" font-size:14px;">广州-阿姆斯特丹（往返）</span>
                                        <input type="hidden" id="txtSearchingCityFromId" runat="server" />
                                        <input type="hidden" id="txtSearchingCityToName" runat="server" />
                                        <input type="hidden" id="txtSearchingTripType" runat="server" />
                                        <input type="hidden" id="txtSearchingTripDate" runat="server" />
                                        <input type="hidden" id="txtSearchingBackDate" runat="server" />
                                        <input type="hidden" id="txtSearchingLinkUrl" runat="server" />
                                        <input type="hidden" id="txtSearching" runat="server" />
                                    </td>
                                </tr>
                            </table>
                        </div>
                    </div>
                </div>
                <!--supdate-->
                <div class="clear">
                </div>
                <div class="shticket">
                    <div class="shtit"><!--<img src="http://www.fei580.com/images/shticket.jpg" alt="特价机票" />--><h3>特价国际机票</h3></div>
                    <div class="shadsense">
                        <%
                            if (recommendThree.Count != 0)
                            {
                                for (int i = 0; i < recommendThree.Count; i++)
                                {
                                    string className = "shads";
                                    System.Data.DataRow recommendThree_row = recommendThree[i];
                                    if (i == 1 || i == 4)
                                    {
                                        className = "shads shadsm";
                                    }
                                %>
                                    <div class="<%=className%>">
                                    <a href="<%=recommendThree_row["ticketUrl"].ToString()%>" target="_blank" rel="nofollow">
                                        <img src="http://www.fei580.com/<%=recommendThree_row["ticketPic"].ToString()%>" alt="特价国际机票" /></a></div>
                                <%
                                }
                            }
                        %>
                    </div>
                </div>
                <!--shticket-->
                <div class="clear">
                </div>
                <div class="ihotel">
                    <div class="htit">
                        <img src="http://www.fei580.com/images/goodhotel.jpg" alt="国际酒店精选" /></div>
                    <div class="hotellist">
                        <%
                            if (hotelList.Count != 0)
                            {
                                string aLinkUrl = "";
                                string aImageSrc = "";
                                string aHName = "";
                                string b1LinkUrl = "";
                                string b1ImageSrc = "";
                                string b1HName = "";
                                string b2LinkUrl = "";
                                string b2ImageSrc = "";
                                string b2HName = "";
                                string c1LinkUrl = "";
                                string c1ImageSrc = "";
                                string c1HName = "";
                                string c2LinkUrl = "";
                                string c2ImageSrc = "";
                                string c2HName = "";
                                
                                for (int i = 0; i < hotelList.Count; i++)
                                {
                                    System.Data.DataRow hotelList_row = hotelList[i];
                                    string position = hotelList_row["position"].ToString();
                                    string linkUrl = hotelList_row["linkUrl"].ToString();
                                    string imageSrc = hotelList_row["picPath"].ToString();
                                    string hName = hotelList_row["hName"].ToString();
                                    
                                    if (position != "")
                                    {
                                        switch (position)
                                        {
                                            case "a":
                                                aLinkUrl = linkUrl;
                                                aImageSrc = imageSrc;
                                                aHName = hName;
                                                break;
                                            case "b1":
                                                b1LinkUrl = linkUrl;
                                                b1ImageSrc = imageSrc;
                                                b1HName = hName;
                                                break;
                                            case "b2":
                                                b2LinkUrl = linkUrl;
                                                b2ImageSrc = imageSrc;
                                                b2HName = hName;
                                                break;
                                            case "c1":
                                                c1LinkUrl = linkUrl;
                                                c1ImageSrc = imageSrc;
                                                c1HName = hName;
                                                break;
                                            case "c2":
                                                c2LinkUrl = linkUrl;
                                                c2ImageSrc = imageSrc;
                                                c2HName = hName;
                                                break;
                                        }
                                    }
                                 }
                                %>
                                <div class="hotela"><a href="http://www.booking.com/hotel/th/intercontinental-bangkok.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=-3414440;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=2e237cf6d12f44239b0ff6df2f3b764fab60d7a3X1;type=total;ucfs=1&" title="<%=aHName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=aImageSrc %>" alt="<%=aHName %>" /></a></div>
                                <div class="hotelb">
                                    <div class="hotelb1">
                                      <a href="http://www.booking.com/hotel/gb/the-savoy.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=-2601889;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=8d451b30414d4328fff969ec97df95fcd519c6d7X1;type=total;ucfs=1&" title="<%=b1HName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=b1ImageSrc %>" alt="<%=b1HName %>" /></a>
                                    </div>
                                    <div class="hotelb2">
                                      <a href="http://www.booking.com/hotel/ca/hilton-toronto.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=-574890;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=31d64cf8890b49b5d1572d77f10a48ddd7739258X1;type=total;ucfs=1&" title="<%=b2HName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=b2ImageSrc %>" alt="<%=b2HName %>" /></a>
                                    </div>
                                </div>
                                <div class="hotelc">
                                    <div class="hotelc1">
                                      <a href="http://www.booking.com/hotel/us/giraffe.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=20088325;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=eca8cfc7697f421f8bc44e52d4c494cde61f3885X1;type=total;ucfs=1&" title="<%=c1HName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=c1ImageSrc %>" alt="<%=c1HName %>" /></a>
                                    </div>
                                    <div class="hotelc2">
                                      <a href="http://www.booking.com/hotel/fr/keppler.zh-cn.html?aid=347436;sid=0c14516cb7d3eeddc1ffc4d5d0960e6d;dest_id=-1456928;dest_type=city;dist=0;group_adults=2;room1=A%2CA;sb_price_type=total;srfid=a8c3f15b4ba534d452aadf28ceb271630ca42677X1;type=total;ucfs=1&" title="<%=c2HName %>" target="_blank" rel="nofollow"><img src="http://www.fei580.com/<%=c2ImageSrc %>" alt="<%=c2HName %>" /></a>
                                    </div>
                                </div>
                                <%
                            }
                        %>
                    </div>
                </div>
                <!--ihotel-->
            </div>
            <!--rmain-end-->
            <div class="clear">
            </div>
            <!--fivelinebox start-->
            <div class="clearbox">
                <div class="inews">
                    <div class="inewslist">
                        <ul class="inewstt">
                            <li class="one"><span><strong>商旅资讯</strong></span></li>
                            <li class="two"><a href="http://www.fei580.com/news.aspx" title="商旅资讯频道" class="blackline" target="_blank" rel="nofollow">更多</a></li>
                        </ul>
                        <ul class="inewscontent">
                            <%
                                if (travelNewsList.Count != 0)
                                {

                                    for (int i = 0; i < travelNewsList.Count; i++)
                                    {
                                        System.Data.DataRow travelNewsList_row = travelNewsList[i];
                            %>
                            <li><span><a href="http://www.fei580.com/news_<%=travelNewsList_row["id"]%>.htm" title="<%=travelNewsList_row["title"].ToString()%>" target="_blank" rel="nofollow">
                                <%=travelNewsList_row["title"].ToString()%></a></span><code><%=Convert.ToDateTime(travelNewsList_row["addtime"].ToString()).ToShortDateString()%></code></li>
                            <%
                                }
                 }
	         
                            %>
                        </ul>
                    </div>
                    <div class="inewslist flostr">
                        <ul class="inewstt">
                            <li class="one"><span><strong>圈子话题</strong></span></li>
                            <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" class="blackline" target="_blank" rel="nofollow">更多</a></li>
                        </ul>
                        <ul class="inewscontent">
                            <%
                                if (clickOrder.Count != 0)
                                {

                                    for (int i = 0; i < clickOrder.Count; i++)
                                    {
                                        System.Data.DataRow clickOrder_row = clickOrder[i];
                            %>
                            <li><span><a href="http://www.fei580.com/trip/<%=clickOrder_row["aId"].ToString()%>.htm" target="_blank">
                                <%=clickOrder_row["title"].ToString()%></a></span><code><%=Convert.ToDateTime(clickOrder_row["addtime"].ToString()).ToShortDateString()%></code></li>
                            <%
                                }
                 }
                            %>
                        </ul>
                    </div>
                </div>
            </div>
            <!--fivelinebox start-->
        </div>
        </form>
        <div class="clear"></div>
        <div class="fyabout">
         <h3>飞瀛国际机票查询</h3>
         <p>飞瀛网主要提供全国各地出发<strong>国际机票查询</strong>，<strong>国际机票预订</strong>，实时国际航班查询服务。凡注册成为飞瀛网会员，可优先享有<strong>特价国际机票</strong>预订及<strong>国际机票价格</strong>查询服务。同时，关注飞瀛官方微信服务号，通过官方微信号<strong>查询国际机票</strong>及<strong>国际机票预订</strong>，可优惠300-1000。查找 飞瀛官方微信服务号：fei580_com 或 直接扫描右边二维码。</p>
        </div>
        <uc1:footControl ID="FootControl" runat="server" />
    </div>
    <div class="clear">
    </div>
    <div id="duilian02" style="top: 250px; left: 0px;" class="kf_2012_box">
        <div class="kf_2012_lbox">
            <img src="http://www.fei580.com/images/kf_l.gif" border="0" usemap="#Map3" />
            <map name="Map3" id="map4">
                <area style="cursor: pointer;" onclick='show(1)' shape="rect" coords="4,12,26,101" href="javascript:void(0);" />
                <area style="cursor: pointer;" onclick='show(2)' shape="rect" coords="3,110,26,201" href="javascript:void(0);" />
            </map>
        </div>
        <div id="tip4341" class="kf_2012_rbox1" style="display: none;">
            <img src="http://www.fei580.com/images/kf_r1.gif" border="0" usemap="#Map" />
            <input id="eMsg_tel" type="text" class="kf_2012_input" />
            <map name="Map" id="map5">
                <area shape="rect" style="cursor: pointer;" coords="237,5,267,31" onclick='show("tip4341")' href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="186,110,259,138" onclick="sendTelMsg()" href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="123,160,260,183" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '首页客服','咨询','点击']);" id="ochat" rel="nofollow"  target="_blank" title="在线客服" />
            </map>
        </div>
        <div id="tip4342" class="kf_2012_rbox2" style="display: none;">
            <img src="http://www.fei580.com/images/kf_r2.gif" border="0" usemap="#Map2" />
            <map name="Map2">
                <area shape="rect" style="cursor: pointer;" coords="237,5,267,31" onclick='show("tip4342")' href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="83,36,256,62" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '首页客服','咨询','点击']);" id="mchat" rel="nofollow" target="_blank" title="在线客服" />
                <area shape="rect" style="cursor: pointer;" coords="84,72,167,98" href="tencent://message/?uin=32335510&Site=飞瀛网&;Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="84,100,167,123" href="tencent://message/?uin=937056717&Site=飞瀛网&Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="83,127,167,147" href="tencent://message/?uin=531658630&Site=飞瀛网&Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="173,71,258,96" id="msn1" href="http://www.fei580.com/chat/" target="_blank" />
                <area shape="rect" style="cursor: pointer;" coords="172,126,256,149" id="msn2" href="http://www.fei580.com/chat/" target="_blank" />
                <area shape="rect" style="cursor: pointer;" coords="173,99,256,122" id="msn3" href="http://www.fei580.com/chat/" target="_blank" />
            </map>
        </div>
    </div>
    <script language="javascript" type="text/javascript" src="http://www.fei580.com/js/datepicker.js"></script>
    <script language="javascript" type="text/javascript" src="http://www.fei580.com/js/scrolljs.js"></script>
    
    <map name="Map2" id="Map2">
        <area shape="rect" coords="12,7,278,66" href="http://www.fei580.com/sm/cata.html" target="_blank"  />
        <area shape="rect" coords="209,46,210,47" href="http://www.fei580.com/" />
    </map>
    <map name="Map3" id="Map3">
        <area shape="rect" coords="13,4,94,42" href="http://www.fei580.com/alipay/" />
        <area shape="rect" coords="107,5,181,43" href="http://www.fei580.com/yinlian/" />
    </map>
    <map name="Map6" id="Map6">
        <area shape="rect" coords="16,6,93,42" href="http://www.fei580.com/alipay/" target="_blank"  />
        <area shape="rect" coords="104,4,177,41" href="http://www.fei580.com/yinlian/" target="_blank"  />
    </map>
    <map name="Maps" id="Maps">
     <area shape="rect" style="cursor: pointer;" coords="13,12,118,42" href="http://www.fei580.com/international.aspx" />
     <area shape="rect" style="cursor: pointer;" coords="118,12,228,42" href="http://hotel.fei580.com/"  target="_blank" rel="nofollow"/>
     <area shape="rect" style="cursor: pointer;" coords="228,12,340,42" href="http://www.fei580.com/visa.html"   target="_blank" rel="nofollow"/>
    </map>
<div id="goTop">
    <div class="hotword">
     <img src="http://www.fei580.com/images/fei580_com_wx.gif" height="255" width="150" alt="飞瀛官方微信">
     <!--<p align="center">微信省下￥300-1000</p>-->
    </div>
</div>
<link href="http://www.fei580.com/source/kuxun.css" rel="stylesheet" type="text/css" />
<div id="gg" class="footer_soft">
 <div class="footer_soft_bg"></div>
 <div class="footer_soft_Pos">	
  <div class="footer_soft_MiddleBox">		
  <i class="footer_soft_img"><a href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '底部横幅商桥客服','咨询','点击']);" target="_blank" title="咨询客服" rel="nofollow" class="baidu-brige-chat"></a></i>		
  <a href="javascript:void(0)" onclick="$('#gg').slideUp('slow');_czc.push(['_trackEvent', '底部横幅咨询关闭','关闭','点击']);" title="关闭" class="footer_soft_close"></a>
  <div class="footer_soft_tx"></div>		
  <div class="footer_soft_link">
  <p class="footer_soft_hd"></p>
  <p class="footer_soft_cn"></p>						
  </div>		
  </div>
 </div>
</div>
<!--[if lte IE 6]>
<div id="ie6-warning">您正在使用 Internet Explorer 6，在本页面的显示效果可能有差异。建议您升级到 <a href="http://www.microsoft.com/china/windows/internet-explorer/" target="_blank" rel="nofollow">Internet Explorer 8</a> 或以下浏览器： <a href="http://www.mozillaonline.com/" target="_blank" rel="nofollow">Firefox</a> / <a href="http://www.google.com/chrome/?hl=zh-CN" target="_blank" rel="nofollow">Chrome</a> / <a href="http://www.apple.com.cn/safari/" target="_blank" rel="nofollow">Safari</a> / <a href="http://www.operachina.com/" target="_blank" rel="nofollow">Opera</a> | <a href="javascript:void(0)" onclick="$('#ie6-warning').slideUp('slow');" title="关闭">关闭提示</a>
</div>
<![endif]-->
</body>
</html>
<script type="text/javascript">
    //首页顶部微信二维码
    $(function() {
        $("#wx_a").mouseover(function() { $("#wx").attr('class', 'divhover'); }).mouseout(function() { $("#wx").attr('class', 'wx'); });
        $("#mo_home").mouseover(function() { $("#mobile").attr('class', 'moqrcode'); }).mouseout(function() { $("#mobile").attr('class', 'wx'); });
    });
</script>
