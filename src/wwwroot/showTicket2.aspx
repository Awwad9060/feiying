<%@ Page Language="C#" AutoEventWireup="true" CodeFile="showTicket2.aspx.cs" Inherits="showTicket2" %>

<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl2.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=EmulateIE7" />
    <meta http-equiv="Cache-Control" content="no-transform" />
    <meta http-equiv="Cache-Control" content="no-siteapp" />
    <meta name="applicable-device" content="pc,mobile">
    <meta name="MobileOptimized" content="width" />
    <meta name="HandheldFriendly" content="true" />
    <meta http-equiv="mobile-agent" content="format=xhtml;url=http://m.fei580.com/ticket_<%= id%>.htm">
    <% if (this.FromCityName != null && this.toCityName != null)
       {%>
    <title>【<%=this.FromCityName%>到<%=this.toCityName%>机票】往返特价机票_价格_预订 - 飞瀛网</title>
    <meta name="Description" content="【<%=this.FromCityName%>到<%=this.toCityName%>机票】由飞瀛网(fei580.com)为您提供<%=this.FromCityName%>到<%=this.toCityName%>特价机票价格实时查询,在线预订服务,单程或往返均为全网最低价！" />
    <meta name="keywords" content="<%=this.toCityName%>机票,<%=this.FromCityName%>到<%=this.toCityName%>机票,<%=this.toCityName%>>往返特价机票,<%=this.FromCityName%>到<%=this.toCityName%>预订" />
    <%} %>
    <meta name="robots" content="index,follow" />
    <link rel="canonical" href="http://www.fei580.com/ticket_<%= id%>.htm" />
    <link href="../css/bootstrap.min.css" rel="stylesheet" />
    <link rel="alternate" media="only screen and(max-width: 640px)" href="http://m.fei580.com/ticket_<%= id%>.htm">
    <link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/hotcity.css" rel="stylesheet" type="text/css" />
    <link href="http://www.fei580.com/css/datepicker.css" rel="stylesheet" type="text/css" />
    <script type="text/javascript" src="http://www.fei580.com/js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
    <script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
    <script src="http://www.fei580.com/js/postdata.js" type="text/javascript"></script>
    <script type="text/javascript">
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
            if(<%= id%>!=0) window.location.href = "http://m.fei580.com/ticket_<%= id%>.htm"; 
        }
    
        //获取当前url的参数值
        function getRequest(name){ 
            var url = document.referrer;  
            var paraString = url.substring(url.indexOf("?")+1,url.length).split("&");  
            var paraObj = {};
            for (i=0; j=paraString[i]; i++){  
                paraObj[j.substring(0,j.indexOf("=")).toLowerCase()] = j.substring(j.indexOf("=")+1,j.length);  
            }
            var returnValue = paraObj[name.toLowerCase()];  
            return typeof(returnValue)=="undefined" ? "" : returnValue;
        }

        $(document).ready(function() {
            //日期控件
            TripBackDate(document.getElementById("tripDate"), document.getElementById("backDate"));
            //日期控件
            TripBackDate(document.getElementById("fDate"), document.getElementById("tDate"));
            //调用不同的咨询链接
            var hmsr = getRequest("hmsr");
            //var source = getRequest("utm_source");
            var medium = getRequest("utm_medium");
            var campaign = getRequest("utm_campaign");
            var keywords = getRequest("utm_content");
            //var key = GetUrlRelativePath();
            if(hmsr==null || hmsr==""){hmsr = getRequest("utm_source");} else {hmsr = getRequest("hmsr");}
            if(keywords==null || keywords==""){keywords= "ticket_<%= id%>";}else{keywords = getRequest("utm_content");}
            if(medium==null || medium==""){medium = "PPC";} else {medium = getRequest("utm_medium");}
            if(campaign==null || campaign==""){campaign = "DetailChat";} else {campaign = getRequest("utm_campaign");}
            if(hmsr==null || hmsr==""){
                $("#chat").attr("href",function(i,origValue){ return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=BaiduBridge&utm_content=id_<%= id%>"; });
                $("#title").attr("value",function(i,origValue){ return origValue +" - ID<%= id%>"; });
                $("#ochat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
                $("#mchat").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
                $("#msn1").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
                $("#msn2").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
                $("#msn3").attr("href", function(i, origValue) { return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=LeftSide&utm_content=" + keywords; });
            } else {
                $("#chat").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
                $("#form1").attr("action",function(i,origValue){ return origValue + "&utm_source="+hmsr+"&utm_medium="+medium+"&utm_content=id_<%= id%>"; });
                $("#title").attr("value",function(i,origValue){ return origValue +" - AD<%= id%>"; });
                $(".In_onlineultwo a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
                $(".In_tickTz .one a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
                $(".In_tickTz .two a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
                $(".ticketdoc_rightul a").attr("href",function(i,origValue){ return origValue + "?utm_source="+hmsr+"&utm_medium="+medium+"&utm_campaign="+campaign+"&utm_content="+keywords; });
                $("#ochat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
                $("#mchat").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
                $("#msn1").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
                $("#msn2").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
                $("#msn3").attr("href", function(i, origValue) { return origValue + "?utm_source=" + hmsr + "&utm_medium=" + medium + "&utm_campaign=" + campaign + "&utm_content=" + keywords; });
            }
        });
        //查询机型
        function SearchAifeiPlan(from, to, airline) {
            var url = "http://www.fei580.com/share/AifeiInfoRequest.aspx";
            $.ajax({
                type: "get",
                cache: false,
                url: url + "?from=" + from + "&to=" + to + "&airline=" + airline,
                success: function(data) {
                    if (data == "false")
                        return;

                    $("#ticketplan").html(data);
                },
                error: function() {
                    return;
                    //alert('验证数据异常！');
                }
            });
        }
    </script>
    <style type="text/css">
        .dv-main {
            margin: 0px auto;
            width: 970px;
            position: relative;
            top: 20px;
            margin-top: 20px;
        }

        .box {
            -moz-box-sizing: border-box;
            -webkit-box-sizing: border-box;
            -o-box-sizing: border-box;
            -ms-box-sizing: border-box;
            box-sizing: border-box;
        }

        .org_btn1 {
            padding: 1em;
            background: #E59B09;
            border: 1px solid #dddddd;
            color: white !important;
        }

            .org_btn1:hover {
                background: #ffcc66;
                text-decoration: none;
            }

        .org_btn2 {
            padding: 1em;
            background: #E44B08;
            border: 1px solid #dddddd;
            color: white !important;
        }

            .org_btn2:hover {
                background: #ff6666;
                text-decoration: none;
            }

        .org_btn3 {
            padding: 1em;
            background: #D4480B;
            border: 1px solid #dddddd;
            color: white !important;
        }

            .org_btn3:hover {
                background: #ff6600;
                text-decoration: none;
            }

        .blue_btn {
            padding: 1em;
            background: #096CE4;
            border: 1px solid #dddddd;
            color: white !important;
        }

            .blue_btn:hover {
                background: #0976E9;
                text-decoration: none;
            }

        .green_btn {
            padding: 1em;
            background: #096CE4;
            border: 1px solid #dddddd;
            color: white !important;
        }

            .green_btn:hover {
                background: #1196EE;
                text-decoration: none;
            }

        .z_btn {
            padding: 1em;
            background: #E4096F;
            border: 1px solid #dddddd;
            color: white !important;
        }

            .z_btn:hover {
                background: #E44A6F;
                text-decoration: none;
            }

        .pd2 {
            padding-top: 2px;
            padding-bottom: 2px;
        }

        .pd5 {
            padding-top: 5px;
            padding-bottom: 5px;
        }

        .pd10 {
            padding-top: 10px;
            padding-bottom: 10px;
        }

        .btn-max {
            display: block;
            border: 0;
            text-align: center;
            margin: 0 auto;
            padding-left: 0px;
            padding-right: 0px;
            width: 120px;
        }

        ol {
            list-style-type: decimal;
        }

            ol > li {
                list-style-position: outside;
                list-style: decimal;
                padding-top: 8px;
                color: #524E53;
            }

        .btn-confirm {
            width: 100%;
            height: 25px;
            background-color: red;
            color: white;
            text-align: center;
            font-size: 18px;
            border-bottom: solid #115DA9 10px;
            padding-bottom: 35px;
            line-height: 35px;
            cursor: pointer;
        }

            .btn-confirm:hover {
                background: #ff6666;
                text-decoration: none;
            }

        .dv-img {
            display: table;
            text-align: center;
        }

            .dv-img span {
                display: table-cell;
                vertical-align: middle;
            }
        /*防止bootstrap样式冲突*/
        .headerbottom * {
            -webkit-box-sizing: initial;
            -moz-box-sizing: initial;
            box-sizing: initial;
        }
    </style>
    <!--[if lte IE 7]>
<style type="text/css">
#box{
    position:relative;
    overflow:hidden;
}
#box span{
    position:absolute;
    left:50%;top:50%;
}
#box img{
    position:relative;
    left:-50%;top:-50%;
}
</style>
<![endif]-->
</head>
<body>
    <%--<% if (ticketOne != null)
   { %>--%>
    <div class="mainbody">
        <form id="form1" runat="server">
            <!--header start-->
            <div class="headertop">
                <span>
                    <img src="http://www.fei580.com/images/home.jpg" alt="home" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="mail" />国际、国内机票服务热线：400-885-0663(免费)</span>
            </div>
            <div class="headerbottom">
                <div class="headerbottom_left">
                    <a href="http://www.fei580.com/" title="飞瀛网">
                        <img src="http://www.fei580.com/images/logo.jpg" alt="" /></a>
                </div>
                <div class="headerbottom_right">
                    <div class="headerbottom_rightone">
                        <% if (Session["Mem_LoginName"] == null)
                           { %>
                        <a href="http://www.fei580.com/login.aspx?url=http://www.fei580.com/ticket_<%=id%>.htm" title="会员登录" rel="nofollow">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册" rel="nofollow">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务" rel="nofollow">关于飞瀛</a>
                        <%
                           }
                           else
                           {
                        %>
                        <a href="http://www.fei580.com/person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="http://www.fei580.com/person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="http://www.fei580.com/person/myinfo.aspx" title="">个人中心</a>|<a href="http://www.fei580.com/logout.aspx" title="">退出登录</a>
                        <%}
                        %>
                    </div>
                    <ul class="menu_1">
                        <li class="four"><a href="http://www.fei580.com" title="首页" rel="nofollow">首&nbsp;页</a></li>
                        <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
                        <li class="one"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
                        <!--li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li-->
                        <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
                        <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证" rel="nofollow">国际签证</a></li>
                        <li class="two"><a rel="nofollow" href="http://hotel.fei580.com/" target="_blank" title="国际酒店" rel="nofollow">国际酒店</a></li>
                        <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>-->
                        <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" rel="nofollow">飞瀛圈</a></li>
                        <li class="two" style="background: none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式" rel="nofollow">支付方式</a></li>
                        <li class="new_imgs" style="padding: 0px; background: none;">
                            <img src="http://www.fei580.com/images/new.gif" alt="" /></li>
                    </ul>
                    <div class="menubottom">
                        <ul class="nohidden">
                            <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司" rel="nofollow">航空公司</a></li>
                            <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场" rel="nofollow">世界机场</a></li>
                            <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型" rel="nofollow">民航机型</a></li>
                            <li class="two"><a href="http://www.fei580.com/news.aspx" title="新闻资讯" rel="nofollow">新闻资讯</a></li>
                            <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="积分广场" rel="nofollow">积分广场</a></li>
                        </ul>
                        <uc2:searchControl ID="SearchControl1" runat="server" />
                    </div>
                    <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="飞瀛首页" rel="nofollow">飞瀛网</a>&gt;<a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票查询</a>&gt;&nbsp;<a href="http://www.fei580.com/ticket_<%=id%>.htm"><%--<%=ticketOne["fromCityname"]%>到<%=ticketOne["toCityname"]%>机票--%></a></div>
                </div>
            </div>
            <% if (flightround != null)
               {
                   System.Collections.Generic.List<FlightDetail> fromArry = flightround.ListInterFlightInfo[0].ListInterFlightDetails;
                   System.Collections.Generic.List<FlightDetail> fromArry2 = null;
                   if (flightround.ListInterFlightInfo2.Count > 0)
                   {
                       fromArry2 = flightround.ListInterFlightInfo2[0].ListInterFlightDetails;
                   }
                   int formCount = fromArry.Count;
                   int formCount2 = fromArry2 != null ? fromArry2.Count : 0;
            %>
            <div class="dv-main">
                <div style="width: 100%; border-bottom: solid #115DA9 8px;">
                    <img src="../images/fyjg.png" style="width: 100%; height: 180px;" alt="更多优惠价格，尽在飞瀛" />
                </div>
                <div class="box" style="width: 97%; border-left: solid #115DA9 5px; border-right: solid #115DA9 5px; margin: 0px auto; background-color: #FFFBE0;">
                    <div class="dv-top" style="width: 100%; height: 130px;">
                        <div class="box" style="width: 25%; height: 130px; float: left; border-right: 3px solid #DAD9E0;">
                            <div style="width: 95%; height: 50px; border-bottom: 1px dashed #EEEED2; margin: 0px auto; line-height: 50px;">
                                <img src="../images/jt_r.gif" style="position: relative;" alt="" />
                                <span>行程：</span>
                                <a id="txtTripType" href="javacript:void(0)" style="color: #61A0C3;"><%=TripType=="0"?"单程":"往返" %> / <%=fromArry.Count==1?"直飞":"中转" %></a>
                            </div>
                            <div style="width: 95%; margin: 0px auto; margin: 0px auto; margin-top: 20px; margin-bottom: 5px;">
                                <img src="../images/jt_r_g.gif" style="position: relative; margin-right: 5px;" alt="" />
                                <span>出发日期：</span>
                                <a id="txtTripDate" href="javacript:void(0)" style="color: #61A0C3;"><%=TripDate %></a>
                            </div>
                            <div style="width: 95%; margin: 0px auto;">
                                <img src="../images/jt_r_g.gif" style="position: relative; margin-right: 5px;" alt="" />
                                <span>回程日期：</span>
                                <a id="txtBackDate" href="javacript:void(0)" style="color: #61A0C3;"><%=BackDate %></a>
                            </div>
                        </div>
                        <div class="box" style="width: 50%; height: 130px; float: left; border-right: 3px solid #DAD9E0;">
                            <div style="width: 50%; height: 130px; float: left;text-align:center;">
                                <%
                   kabe_Airline airlineInfo = CheckAirline(fromArry[0].AirCompanyCode);
                   if (airlineInfo != null)
                   {
                                %>
                                <img src="http://www.fei580.com/<%=airlineInfo.airlineLogoPic %>" style="padding: 10px;max-width:100%; max-height: 130px;" alt="深圳航空" />
                                <%} %>
                            </div>
                            <div style="width: 50%; height: 130px; float: right;">
                                <%
                   if (airlineInfo != null)
                   {%>
                                <h1 id="txtAirlineName" style="color: #001451; margin-top: 15px;"><%=airlineInfo.airlineName %> <%--（<%=fromArry[0].CabinCode %>）--%></h1>
                                <div style="width: 100%; margin: 0px auto; margin: 0px auto; margin-top: 20px; margin-bottom: 5px;">
                                    <img src="../images/fy_r.png" style="width: 10px; height: 10px; position: relative; top: 1px; margin-right: 5px;" alt="" />
                                    <span>机队情况：49+45架</span>
                                    <span style="padding-left: 20px;">平均机龄：8年</span>
                                </div>
                                <%} %>
                                <div style="width: 100%; margin: 0px auto;">
                                    <img src="../images/fy_r.png" style="width: 10px; height: 10px; position: relative; top: 1px; margin-right: 5px;" alt="" />
                                    <a href="http://www.fei580.com/airline/<%=airlineInfo.airlineId%>.htm" title="进入航空公司专区"><%=airlineInfo.airlineName %>官网</a>
                                </div>
                            </div>
                        </div>
                        <div style="width: 25%; height: 130px; float: left;">
                            <div style="width: 57%; height: 130px; float: left">
                                <a href="javascript:void(0)" id="txtPrice" class="org_btn2 pd10 btn-max" style="font-size: 20px; margin-top: 25px; padding-top: 16px; padding-bottom: 16px; margin-left: 8px;">￥<%=flightround.ListInterFlightInfo[0].TicketPrice.ToString("0.00") %></a>
                                <a href="javascript:void(0)" id="txtFaxPrice" class="org_btn3 pd5 btn-max" style="margin-left: 8px;">税费￥<%=flightround.ListInterFlightInfo[0].FaxPrice.ToString("0.00") %></a>
                            </div>
                            <div style="width: 40%; height: 130px; float: left">
                                <a href="#dv-add" class="green_btn pd10 btn-max" style="font-size: 18px; margin-top: 25px; width: 95%;">预  定</a>
                                <a href="http://www.fei580.com/chat/" class="z_btn pd10 btn-max" style="margin-top: 5px; width: 95%;" onclick="_czc.push(['_trackEvent', '航班详情页','咨询','点击']);" id="ochat" rel="nofollow" target="_blank" title="在线客服">在线咨询</a>
                            </div>
                        </div>
                    </div>

                    <%--<div class="dv-center box" style="width: 100%; height: 250px; background-color: #FFFBE0; border-top: 3px solid #DAD9E0;">

                        <div style="height: 100%; width: 23%; float: left;">
                            <div style="width: 100%; height: 100%; text-align: center;">
                                <h2 style="padding-top: 90px;">广州</h2>
                                <p>新白云国际机场</p>
                                <p>[CAN]</p>
                            </div>
                        </div>

                        <div style="height: 100%; width: 54%; float: left;">
                            <div style="width: 100%; height: 150px;">
                                <div style="width: 100%; height: 75px; margin-top: 35px;">
                                    <div style="width: 46%; float: left;">
                                        <span style="margin-left: 50px; color: #BDA7A2;">起飞&nbsp;&nbsp;05:50</span>
                                        <br>
                                        <div style="width: 100%; border-top: 4px #115DA9 dotted; height: 0px;">
                                            <img src="http://www.fei580.com/images/sgo.gif" style="position: relative; top: -10px;" alt="Alternate Text">
                                        </div>

                                    </div>
                                    <div style="width: 7%; float: left; text-align: center;">
                                        <img src="../images/addressgps.gif" style="width: 35px;" alt="Alternate Text">
                                    </div>
                                    <div style="width: 46%; float: left;">

                                        <span style="margin-left: 30px; color: #BDA7A2;">到达&nbsp;&nbsp;07:55</span>

                                        <br>
                                        <div style="width: 100%; border-top: 4px #115DA9 dotted; height: 0px;">
                                            <img src="../images/flight_right.gif" style="float: right; position: relative; top: -17px; width: 30px;" alt="Alternate Text">
                                        </div>

                                    </div>
                                    <br>
                                    <br>
                                    <br>
                                    <p style="text-align: center;">[直飞]--[飞行时长]--2小时5分钟</p>
                                </div>

                            </div>

                        </div>

                        <div style="height: 100%; width: 23%; float: left;">
                            <div style="width: 100%; height: 100%; text-align: center;">
                                <h2 style="padding-top: 90px;">曼谷</h2>
                                <p></p>
                                <p>[DMK]</p>
                            </div>
                        </div>
                    </div>--%>
                    <div class="dv-center box" style="width: 100%; height: 250px; background-color: #FFFBE0; border-top: 3px solid #DAD9E0;">
                        <%-- left --%>
                        <div style="height: 100%; width: 23%; float: left;">
                            <%-- down --%>
                            <div style="width: 100%; height: 100%; text-align: center;">
                                <h1 id="txtFromCityName" style="padding-top: 70px;"><%=this.FromCityName %></h1>
                                <p id="txtStartCityName"><%=fromArry[0].StartCityName %></p>
                                <p>[<%=fromArry[0].StartCityCode %>]</p>
                            </div>
                        </div>
                        <%-- center --%>
                        <div style="height: 100%; width: 54%; float: left;">
                            <div style="width: 100%; height: 150px;">
                                <div style="width: 100%; height: 75px; <%=Convert.ToInt32(TripType)==0?"margin-top: 75px;": "margin-top: 40px;"%>">
                                    <div style="<%=formCount>2?"width: 30%;": "width: 46%;"%> float: left; height: 75px;">
                                        <%--<span style="margin-left: 50px; color: #BDA7A2;">起飞&nbsp;&nbsp;<%=fromArry[0].FromTime.ToString("HH:mm") %></span>--%>
                                        <div style="width: 100%; text-align: center;">
                                            <table style="margin: 0 auto;">
                                                <%if (!string.IsNullOrEmpty(fromArry[0].PlaneType) && formCount > 1)
                                                  { %>
                                                <tr>
                                                    <td style="text-align: right;"><a href="javacript:void(0)" style="color: #61A0C3;">机型</a></td>
                                                    <td style="text-align: left;"><span id="txtPlaneType" style="color: #BDA7A2; padding-left: 4px;"><%=fromArry[0].PlaneType %></span></td>
                                                </tr>
                                                <%}
                                                  else
                                                  { %>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                                <%if (!string.IsNullOrEmpty(fromArry[0].FlightNumber))
                                                  { %>
                                                <tr>
                                                    <td style="text-align: right;"><a href="<%=airlineInfo!=null?"http://www.fei580.com/airline/"+airlineInfo.airlineId+".htm":"javascript:void(0)" %>" style="color: #61A0C3;"><%=airlineInfo!=null?airlineInfo.airlineName:"" %></a></td>
                                                    <td style="text-align: left;"><span style="color: #BDA7A2;">&nbsp;<%=fromArry[0].FlightNumber %></span></td>
                                                </tr>
                                                <%}
                                                  else
                                                  { %>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                            </table>
                                        </div>
                                        <div style="width: 100%; border-top: 4px #115DA9 dotted; height: 0px;">
                                            <img src="../images/from_left.gif" style="position: relative; top: -10px;" alt="Alternate Text" />
                                        </div>
                                        <div style="width: 100%; text-align: center;">
                                            <%if (formCount > 1)
                                              {%>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">起飞</a>
                                            <span id="txtStratDate" style="color: #BDA7A2;"><%=fromArry[0].FromTime.ToString("HH:mm") %></span>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">到达</a>
                                            <span style="margin-left: 5px; color: #BDA7A2;"><%=fromArry[0].ArriveTime.ToString("HH:mm") %></span>
                                            <%}
                                              else
                                              { %>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">起飞</a>
                                            <span id="txtStratDate" style="margin-left: 5px; color: #BDA7A2;"><%=fromArry[0].FromTime.ToString("HH:mm") %></span>
                                            <%} %>
                                        </div>
                                    </div>
                                    <div class="dv-img" style="width: 7%; float: left; height: 75px;">
                                        <span>
                                            <img src="../images/<%=formCount==1?"center_zf.gif":"center.gif" %>" style="width: 35px;" alt="Alternate Text" /></span>
                                    </div>
                                    <div style="width: 46%; float: left; height: 75px;">
                                        <%--<%if (formCount > 1)
                                          {%>
                                        <span style="margin-left: 30px; color: #BDA7A2;">起飞&nbsp;&nbsp;<%=fromArry[fromArry.Count-1].FromTime.ToString("HH:mm")%></span>
                                        <%}
                                          else
                                          { %>
                                        <span style="margin-left: 30px; color: #BDA7A2;">到达&nbsp;&nbsp;<%=fromArry[0].ArriveTime.ToString("HH:mm") %></span>
                                        <%} %>
                                        <br />--%>
                                        <div style="width: 100%; text-align: center;">
                                            <table style="margin: 0 auto;">
                                                <%if (!string.IsNullOrEmpty(fromArry[fromArry.Count - 1].PlaneType))
                                                  { %>

                                                <% if (formCount == 1)
                                                   {%>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                                <tr>
                                                    <td style="text-align: right;"><a href="javacript:void(0)" style="color: #61A0C3;">机型</a></td>
                                                    <td style="text-align: left;"><span style="color: #BDA7A2; padding-left: 4px;"><%=fromArry[fromArry.Count-1].PlaneType %></span></td>
                                                </tr>
                                                <%}
                                                  else
                                                  { %>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                                <%if (!string.IsNullOrEmpty(fromArry[fromArry.Count - 1].FlightNumber) && formCount > 1)
                                                  {
                                                      kabe_Airline airlineInfoLast = CheckAirline(fromArry[fromArry.Count - 1].AirCompanyCode);
                                                %>
                                                <tr>
                                                    <td style="text-align: right;"><a href="<%=airlineInfo != null ? "http://www.fei580.com/airline/" + airlineInfoLast.airlineId + ".htm" : "javascript:void(0)"%>" style="color: #61A0C3;"><%=airlineInfoLast != null ? airlineInfoLast.airlineName : ""%></a></td>
                                                    <td style="text-align: left;"><span style="color: #BDA7A2;">&nbsp;<%=fromArry[0].FlightNumber%></span></td>
                                                </tr>
                                                <%}
                                                  else
                                                  {%>
                                                <%if (!string.IsNullOrEmpty(fromArry[fromArry.Count - 1].PlaneType) && formCount == 1)
                                                  {%>
                                                <%}
                                                  else
                                                  {%>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                                <%}%>
                                            </table>
                                        </div>
                                        <div style="width: 100%; border-top: 4px #115DA9 dotted; height: 0px;">
                                            <img src="../images/f_right.gif" style="float: right; position: relative; top: -19px; width: 30px;" alt="Alternate Text" />
                                        </div>
                                        <%--<%if (formCount > 1)
                                          {%>
                                        <span style="margin-left: 30px; color: #BDA7A2;">到达&nbsp;&nbsp;<%=fromArry[fromArry.Count-1].ArriveTime.ToString("HH:mm")%></span>
                                        <%} %>--%>
                                        <div style="width: 100%; text-align: center;">
                                            <%if (formCount > 1)
                                              {%>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">起飞</a>
                                            <span style="color: #BDA7A2;"><%=fromArry[fromArry.Count-1].FromTime.ToString("HH:mm") %></span>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">到达</a>
                                            <span id="txtEndDate" style="margin-left: 5px; color: #BDA7A2;"><%=fromArry[fromArry.Count-1].ArriveTime.ToString("HH:mm") %></span>
                                            <%}
                                              else
                                              { %>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">到达</a>
                                            <span id="txtEndDate" style="margin-left: 5px; color: #BDA7A2;"><%=fromArry[fromArry.Count-1].ArriveTime.ToString("HH:mm")%></span>
                                            <%} %>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <p style="text-align: center;"><%=GetTransitTxt(fromArry) %></p>
                                </div>
                                <%if (Convert.ToInt32(TripType) == 1)
                                  {%>
                                <div style="width: 100%; height: 75px; margin-top: 40px;">
                                    <div style="width: 46%; float: left; height: 75px;">

                                        <%--<span style="margin-left: 50px; color: #BDA7A2;">起飞&nbsp;&nbsp;10:35</span>
                                                    <br />
                                                    <div style="width: 100%; border-top: 4px #cccccc dotted; height: 0px;">
                                                        <img src="images/fleft_03.gif" style="float:left; position: relative; top: -17px; width: 30px;" alt="Alternate Text" />
                                                    </div>
                                                    <span style="margin-left: 20px; color: #BDA7A2;">到达&nbsp;&nbsp;10:35</span>--%>


                                        <%--<%if (formCount2 > 1)
                                          {%>
                                        <span style="margin-left: 50px; color: #BDA7A2;">起飞&nbsp;&nbsp;<%=fromArry2[fromArry2.Count-1].FromTime.ToString("HH:mm")%></span>
                                        <%}
                                          else
                                          { %>
                                        <span style="margin-left: 50px; color: #BDA7A2;">到达&nbsp;&nbsp;<%=fromArry2[0].ArriveTime.ToString("HH:mm") %></span>
                                        <%} %>
                                        <br />--%>
                                        <div style="width: 100%; text-align: center;">
                                            <table style="margin: 0 auto;">
                                                <%if (!string.IsNullOrEmpty(fromArry2[fromArry2.Count - 1].PlaneType) && formCount2 > 1)
                                                  { %>
                                                <tr>
                                                    <td style="text-align: right;"><a href="javacript:void(0)" style="color: #61A0C3;">机型</a></td>
                                                    <td style="text-align: left;"><span style="color: #BDA7A2; padding-left: 4px;"><%=fromArry2[fromArry2.Count - 1].PlaneType %></span></td>
                                                </tr>
                                                <%}
                                                  else
                                                  { %>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                                <%if (!string.IsNullOrEmpty(fromArry2[0].FlightNumber))
                                                  {
                                                      kabe_Airline airlineInfoBackLast = CheckAirline(fromArry2[fromArry2.Count - 1].AirCompanyCode);
                                                %>
                                                <tr>
                                                    <td style="text-align: right;"><a href="<%=airlineInfo!=null?"http://www.fei580.com/airline/"+airlineInfoBackLast.airlineId+".htm":"javascript:void(0)" %>" style="color: #61A0C3;"><%=airlineInfoBackLast!=null?airlineInfoBackLast.airlineName:"" %></a></td>
                                                    <td style="text-align: left;"><span style="color: #BDA7A2;">&nbsp;<%=fromArry2[0].FlightNumber %></span></td>
                                                </tr>
                                                <%}
                                                  else
                                                  { %>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                            </table>
                                        </div>
                                        <div style="width: 100%; border-top: 4px #115DA9 dotted; height: 0px;">
                                            <img src="../images/f_left.gif" style="float: left; position: relative; top: -19px; width: 30px;" alt="Alternate Text" />
                                        </div>
                                        <%--<%if (formCount2 > 1)
                                          {%>
                                        <span style="margin-left: 20px; color: #BDA7A2;">到达&nbsp;&nbsp;<%=fromArry2[fromArry2.Count-1].ArriveTime.ToString("HH:mm")%></span>
                                        <%} %>--%>
                                        <div style="width: 100%; text-align: center;">
                                            <%if (formCount2 > 1)
                                              {%>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">起飞</a>
                                            <span style="color: #BDA7A2;"><%=fromArry2[fromArry2.Count-1].FromTime.ToString("HH:mm") %></span>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">到达</a>
                                            <span style="margin-left: 5px; color: #BDA7A2;"><%=fromArry2[fromArry2.Count-1].ArriveTime.ToString("HH:mm") %></span>
                                            <%}
                                              else
                                              { %>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">到达</a>
                                            <span style="color: #BDA7A2;"><%=fromArry2[fromArry2.Count-1].ArriveTime.ToString("HH:mm")%></span>
                                            <%} %>
                                        </div>
                                    </div>
                                    <div class="dv-img" style="width: 7%; float: left; height: 75px;">
                                        <span>
                                            <img src="../images/<%=formCount2==1?"center_zf.gif":"center.gif" %>" style="width: 35px;" alt="Alternate Text" /></span>
                                    </div>
                                    <div style="width: 46%; float: left; height: 75px;">
                                        <%--<span style="margin-left: 30px; color: #BDA7A2;">起飞&nbsp;&nbsp;10:35</span>
                                                    <br />
                                                    <div style="width: 100%; border-top: 4px #cccccc dotted; height: 0px;">
                                                        <img src="http://www.fei580.com/images/sback.gif" style="float: right; position: relative; top: -10px;" alt="Alternate Text" />
                                                    </div>
                                                    <span style="margin-left: 30px; color: #BDA7A2;">到达&nbsp;&nbsp;10:35</span>--%>

                                        <%--<span style="margin-left: 30px; color: #BDA7A2;">起飞&nbsp;&nbsp;<%=fromArry2[0].FromTime.ToString("HH:mm") %></span>
                                        <br />--%>
                                        <div style="width: 100%; text-align: center;">
                                            <table style="margin: 0 auto;">
                                                <%if (!string.IsNullOrEmpty(fromArry2[0].PlaneType) && formCount2 > 1)
                                                  { %>
                                                <tr>
                                                    <td style="text-align: right;"><a href="javacript:void(0)" style="color: #61A0C3;">机型</a></td>
                                                    <td style="text-align: left;"><span style="color: #BDA7A2; padding-left: 4px;"><%=fromArry2[0].PlaneType %></span></td>
                                                </tr>
                                                <%}
                                                  else
                                                  { %>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                                <%if (!string.IsNullOrEmpty(fromArry2[0].FlightNumber))
                                                  {
                                                      kabe_Airline airlineInfoBack = CheckAirline(fromArry2[0].AirCompanyCode);%>
                                                <tr>
                                                    <td style="text-align: right;"><a href="<%=airlineInfo!=null?"http://www.fei580.com/airline/"+airlineInfoBack.airlineId+".htm":"javascript:void(0)" %>" style="color: #61A0C3;"><%=airlineInfoBack!=null?airlineInfoBack.airlineName:"" %></a></td>
                                                    <td style="text-align: left;"><span style="color: #BDA7A2;">&nbsp;<%=fromArry2[0].FlightNumber %></span></td>
                                                </tr>
                                                <%}
                                                  else
                                                  { %>
                                                <tr style="height: 17px;">
                                                    <td></td>
                                                    <td></td>
                                                </tr>
                                                <%} %>
                                            </table>
                                        </div>
                                        <div style="width: 100%; border-top: 4px #115DA9 dotted; height: 0px;">
                                            <img src="../images/back_right.gif" style="float: right; position: relative; top: -10px;" alt="Alternate Text" />
                                        </div>
                                        <%--<%if (formCount2 > 1)
                                          {%>
                                        <span style="margin-left: 30px; color: #BDA7A2;">到达&nbsp;&nbsp;<%=fromArry2[0].ArriveTime.ToString("HH:mm") %></span>
                                        <%} %>--%>
                                        <div style="width: 100%; text-align: center;">
                                            <%if (formCount2 > 1)
                                              {%>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">起飞</a>
                                            <span style="color: #BDA7A2;"><%=fromArry2[0].FromTime.ToString("HH:mm") %></span>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">到达</a>
                                            <span style="margin-left: 5px; color: #BDA7A2;"><%=fromArry2[0].ArriveTime.ToString("HH:mm") %></span>
                                            <%}
                                              else
                                              { %>
                                            <a href="javacript:void(0)" style="color: #61A0C3;">起飞</a>
                                            <span style="color: #BDA7A2;"><%=fromArry2[0].FromTime.ToString("HH:mm") %></span>
                                            <%} %>
                                        </div>
                                    </div>
                                    <br />
                                    <br />
                                    <p style="text-align: center;"><%=GetTransitTxt(fromArry2) %></p>
                                </div>
                                <%} %>
                            </div>

                        </div>
                        <%-- right --%>
                        <div style="height: 100%; width: 23%; float: left;">
                            <div style="width: 100%; height: 100%; text-align: center;">
                                <h1 id="txtToCityName" style="padding-top: 70px;"><%=this.ToCityName %></h1>
                                <p id="txtEndCityName"><%=fromArry[fromArry.Count-1].EndCityName %></p>
                                <p>[<%=fromArry[fromArry.Count-1].EndCityCode %>]</p>
                            </div>
                        </div>
                    </div>

                    <div class="dv-bottom box" style="width: 100%; height: 180px; border-top: 3px solid #DAD9E0;">
                        <div class="box" style="width: 35%; height: 100%; float: left; border-right: 3px solid #DAD9E0;">
                            <div style="width: 95%; margin: 0px auto; margin: 0px auto; margin-top: 20px;">
                                <img src="../images/jt_r_g.png" style="width: 15px; position: relative; top: 2px; margin-right: 5px;" alt="" />
                                <span>机票类型：</span>
                                <a href="javacript:void(0)" style="color: #61A0C3;">电子机票</a>
                            </div>
                            <div style="width: 95%; margin: 0px auto; margin-top: 20px;">
                                <img src="../images/jt_r_g.png" style="width: 15px; position: relative; top: 2px; margin-right: 5px;" alt="" />
                                <span>交易形式：</span>
                                <a href="javacript:void(0)" style="color: #61A0C3;">先出票/后付款</a>
                            </div>
                            <div style="width: 95%; margin: 0px auto; margin-top: 20px;">
                                <img src="../images/jt_r_g.png" style="width: 15px; position: relative; top: 2px; margin-right: 5px;" alt="" />
                                <span>电子票下载：</span>
                                <a href="javacript:void(0)" style="color: #61A0C3;">登陆会员中心</a>
                            </div>
                        </div>
                        <div class="box" style="width: 65%; height: 100%; float: left;">
                            <div style="width: 100%; height: 100%; margin-left: 20px;">
                                <img src="../images/sytk.gif" style="width: 90px; height: 35px;" alt="Alternate Text" />
                                <br />
                                <ol style="margin-left: 20px;">
                                    <li>此票价为净票价，税费需根据航空公司当天发布为准</li>
                                    <li>误机（NOSHOW）：需收取误机费</li>
                                    <li>更改定座：允许更改，乘客必须于出发日之前取消原订的航班，否则按照‘误机’处理</li>
                                    <li>儿童票价：成人票价的75%</li>
                                    <li>婴儿票价：使用 IATA 公布成人票价的10%</li>
                                </ol>
                            </div>
                        </div>
                    </div>
                    <div class="dv-dd" style="width: 100%; background-color: #115DA9; border-bottom: solid red 6px; padding-top: 10px;">
                        <div style="width: 100px; height: 25px; background-color: red; color: white; font-size: 18px; text-align: center; font-weight: bold;">预  定</div>
                    </div>
                    <div id="dv-add" data-spy="scroll" style="width: 100%; height: auto; zoom: 1; overflow: hidden; background-color: white; padding-top: 20px;">
                        <div style="width: 50%; height: 100%; float: left;" id="dv-left">
                            <div class="col-md-12" style="margin-bottom: 20px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="basic-addon1">乘机人姓名</span>
                                    <input type="text" class="txtUserName form-control" placeholder="请输入乘机人姓名" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-bottom: 20px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="Span1">&nbsp;&nbsp;联系电话&nbsp;&nbsp;</span>
                                    <input type="text" class="txtPhone form-control" placeholder="请输入联系电话" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-bottom: 20px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="Span2">&nbsp;&nbsp;&nbsp;&nbsp;护照号&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <input type="text" class="txtPassport form-control" placeholder="请输入护照号" aria-describedby="basic-addon1">
                                </div>
                            </div>
                        </div>
                        <div style="width: 50%; height: 100%; float: left;" id="dv-right">
                            <div class="col-md-12" style="height: 34px; margin-bottom: 20px;">
                                <label class="radio-inline" style="margin-right: 50px;">
                                    <input type="radio" value="男" checked="checked" name="sex">男
                                </label>
                                <label class="radio-inline">
                                    <input type="radio" value="女" name="sex">女
                                </label>
                            </div>
                            <div class="col-md-12" style="margin-bottom: 20px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="Span3">&nbsp;&nbsp;&nbsp;&nbsp;国&nbsp;&nbsp;籍&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <input type="text" class="txtNationality form-control" placeholder="请输入国籍" aria-describedby="basic-addon1">
                                </div>
                            </div>
                            <div class="col-md-12" style="margin-bottom: 20px;">
                                <div class="input-group">
                                    <span class="input-group-addon" id="Span4">&nbsp;&nbsp;&nbsp;&nbsp;邮&nbsp;&nbsp;箱&nbsp;&nbsp;&nbsp;&nbsp;</span>
                                    <input type="text" class="txtEmaill form-control" placeholder="请输入邮箱" aria-describedby="basic-addon1">
                                </div>
                            </div>
                        </div>

                        <div style="width: 100%;">
                            <div class="col-md-6" style="margin-bottom: 20px;">
                                <a id="btnAddUser" class="btn btn-default" href="javascript:void(0)" role="button" style="float: right; color: #4689FF; border-color: #4689FF;">+添加乘客</a>
                            </div>
                        </div>
                    </div>
                    <div id="btnConfirm" class="btn-confirm">预定确认</div>
                </div>
            </div>
            <!--header end-->
            <%} %>
            <%-- <%
              string xingcheng = "往返";
		        if(ticketOne["tripType"].ToString()=="0"){
                xingcheng = "单程";
		   }      
		   %>--%>
            <uc1:footControl ID="FootControl" runat="server" />
        </form>
    </div>

    <%--<script type="text/javascript">
    addHistory('<%=ticketOne["fromCityname"]%>-<%=ticketOne["toCityname"]%>', '￥<%=ticketOne["untaxPrice"]%>', 'http://www.fei580.com/ticket_<%=ticketOne["tId"]%>.htm')
</script>--%>
    <%--<%} %>--%>

    <div class="clear"></div>
    <div id="duilian02" style="top: 400px; left: 0px;" class="kf_2012_box">
        <div class="kf_2012_lbox">
            <img src="http://www.fei580.com/images/kf_l.gif" border="0" usemap="#Map3" />
            <map name="Map3" id="map4">
                <area style="cursor: pointer;" onclick='show(1)' shape="rect" coords="4,12,26,101" href="javascript:void(0);" />
                <area style="cursor: pointer;" onclick='show(2)' shape="rect" coords="3,110,26,201" href="javascript:void(0);" />
            </map>
        </div>
        <div id="tip4341" class="kf_2012_rbox1" style="display: block">
            <img src="http://www.fei580.com/images/kf_r1.gif" border="0" usemap="#Map" />
            <input id="eMsg_tel" type="text" class="kf_2012_input" />
            <map name="Map" id="map5">
                <area shape="rect" style="cursor: pointer;" coords="237,5,267,31" onclick='show("tip4341")' href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="186,110,259,138" onclick="sendTelMsg()" href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="123,160,260,183" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '航班详情页','咨询','点击']);" id="ochat" rel="nofollow" target="_blank" title="在线客服" />
            </map>
        </div>
        <div id="tip4342" class="kf_2012_rbox2" style="display: none">
            <img src="http://www.fei580.com/images/kf_r2.gif" border="0" usemap="#Map2" />
            <map name="Map2">
                <area shape="rect" style="cursor: pointer;" coords="237,5,267,31" onclick='show("tip4342")' href="javascript:void(0);" />
                <area shape="rect" style="cursor: pointer;" coords="83,36,256,62" href="http://www.fei580.com/chat/" onclick="_czc.push(['_trackEvent', '航班详情页','咨询','点击']);" id="mchat" rel="nofollow" target="_blank" title="在线客服" />
                <area shape="rect" style="cursor: pointer;" coords="84,72,167,98" href="tencent://message/?uin=32335510&Site=飞瀛网&;Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="84,100,167,123" href="tencent://message/?uin=937056717&Site=飞瀛网&Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="83,127,167,147" href="tencent://message/?uin=531658630&Site=飞瀛网&Menu=yes" />
                <area shape="rect" style="cursor: pointer;" coords="173,71,258,96" id="msn1" href="http://www.fei580.com/chat/" target="_blank" />
                <area shape="rect" style="cursor: pointer;" coords="172,126,256,149" id="msn2" href="http://www.fei580.com/chat/" target="_blank" />
                <area shape="rect" style="cursor: pointer;" coords="173,99,256,122" id="msn3" href="http://www.fei580.com/chat/" target="_blank" />
            </map>
        </div>
    </div>
    <script type="text/javascript" src="http://www.fei580.com/js/datepicker.js"></script>
    <script language="javascript" src="http://www.fei580.com/js/scrolljs.js" type="text/javascript"></script>
    <script src="http://www.fei580.com/js/baidusubmit.js"></script>
    <script>
        $(function () {
            //预定确认
            $("#btnConfirm").click(function () {
                var txtEmaill = $('.txtEmaill').length > 0 ? "邮箱：" + $('.txtEmaill').val() : "";
                var order_input_otherWay = txtEmaill;
                var order_input_require = "";
                var order_input_contact = $('.txtUserName').val();
                var order_input_telephone = $('.txtPhone').val();
                var $order_input_users = $('.txtUserName');
                var $order_input_passport = $(".txtPassport");

                if (!$.trim(order_input_contact)) {
                    alert("请输入乘机人姓名");
                    $('.txtUserName').focus();
                    return;
                }
                if (!$.trim(order_input_telephone)) {
                    alert("请输入联系电话");
                    $('.txtPhone').focus();
                    return;
                }
                //添加的乘客信息
                var addUsers = "";
                $order_input_users.each(function (i, e) {
                    if (i >= 1) {
                        var addUserName = $(this).val();
                        if (addUserName) {
                            addUsers += "[新增乘客：" + addUserName;
                            var addUserpassport = $order_input_passport.eq(0).val();
                            if (addUserpassport) {
                                addUsers += "，护照号：" + addUserpassport + "]";;
                            }
                            else {
                                addUsers += "]";
                            }
                        }
                    }
                });

                var txtPrice = "[不含税价："+$("#txtPrice").html()+"]";
                var txtAirlineName ="[航空公司："+$("#txtAirlineName").html()+"]";
                var txtTripType ="[行程："+$("#txtTripType").html()+"]";
                var txtStartCityName = "[出发地："+$("#txtStartCityName").html()+"]";
                var txtEndCityName = "[目的地："+$("#txtEndCityName").html()+"]";
                var txtTripDate = "[出发时间："+$("#txtTripDate").html()+$("#txtStratDate").html()+"]";
                var txtBackDate = "[到达时间："+$("#txtBackDate").html()+$("#txtEndDate").html()+"]";
                var txtPlaneType = "[机型："+($("#txtPlaneType").length>0?$.trim($("#txtPlaneType").html()):"-")+"]";
                var txtPassport = "[护照号："+$(".txtPassport").val()+"]";
                var txtNationality = "[国籍："+$(".txtNationality").val()+"]";
                var txtSex = "[性别："+$('input:radio[name="sex"]:checked').val()+"]";
                var cont = txtPrice + txtAirlineName + txtTripType + txtStartCityName + txtEndCityName + txtTripDate + txtBackDate + txtPlaneType + txtPassport + txtNationality + txtSex + addUsers;
                $.get("../share/ticketbook.aspx", { contact: escape(order_input_contact), telephone: escape(order_input_telephone), otherWay: escape(order_input_otherWay), req: escape(order_input_require), content: escape(cont) }, function (result) {
                    if (result == "1") {
                        alert("提交成功，我们客服将马上与您联系！")
                        $(".dvAdd").remove();
                        return true;
                    }
                    else {
                        alert("提交失败，请重新提交！");
                        return false;
                    }
                });
            });
            //添加乘客
            $("#btnAddUser").click(function () {
                $('<div class="col-md-12 dvAdd" style="margin-bottom: 20px;">\
                                <div class="input-group">\
                                    <span class="input-group-addon" id="basic-addon1">乘机人姓名</span>\
                                    <input type="text" class="txtUserName form-control" placeholder="请输入乘机人姓名" aria-describedby="basic-addon1">\
                                </div>\
                            </div>').appendTo("#dv-left");
                $('<div class="col-md-12 dvAdd" style="margin-bottom: 20px;">\
                                <div class="input-group">\
                                    <span class="input-group-addon" id="Span2">&nbsp;&nbsp;&nbsp;&nbsp;护照号&nbsp;&nbsp;&nbsp;&nbsp;</span>\
                                    <input type="text" class="txtPassport form-control" placeholder="请输入护照号" aria-describedby="basic-addon1">\
                                </div>\
                            </div>').appendTo("#dv-right");
            });
        });
    </script>
</body>
</html>
