<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quanPublish.aspx.cs" Inherits="quanPublish"  validateRequest=false %>

<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<title>飞瀛圈 - 飞瀛网（国际商旅专家）</title>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<meta name="keywords" content="飞瀛圈,飞行日记" />
<meta name="description" content="飞瀛圈,飞行日记，预订热线：400-885-0663" />
<link rel="shortcut icon" href="http://www.fei580.com/favicon.ico" />
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/index.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/news.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script src="http://www.fei580.com/js/index.js" type="text/javascript"></script>
<script src="http://www.fei580.com/js/jquery.js" type="text/javascript"></script>
<script  type="text/javascript" charset="utf-8" src="http://www.fei580.com/kindeditor-4.1.10/kindeditor.js"></script>
<script  type="text/javascript" charset="utf-8" src="http://www.fei580.com/kindeditor-4.1.10/lang/zh_CN.js"></script>
<script  type="text/javascript" charset="utf-8" src="http://www.fei580.com/kindeditor-4.1.10/kindeditor-all.js"></script>
<script  type="text/javascript" charset="utf-8" src="http://www.fei580.com/kindeditor-4.1.10/code/prettify.js"></script>
<!--<script src="Script/xheditor-1.2.1/xheditor-1.2.1.min.js"></script>-->
<script type="text/javascript">
    $(function () {
        KindEditor.ready(function (K) {
            editor = K.create('textarea[name="intro"]', {
            cssPath: 'http://www.fei580.com/kindeditor-4.1.10/code/prettify.css',
            uploadJson: 'http://www.fei580.com/kindeditor-4.1.10/jsp/upload_json.asp',
            fileManagerJson: 'http://www.fei580.com/kindeditor-4.1.10/jsp/file_manager_json.asp',
                allowFileManager: true,
                pasteType: 2,
                afterCreate: function () {
                    var self = this;
                    K.ctrl(document, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                    K.ctrl(self.edit.doc, 13, function () {
                        self.sync();
                        K('form[name=form1]')[0].submit();
                    });
                }
            });
            prettyPrint();
        });
    });
</script>

 <script type="text/javascript">
 $(document).ready(function() {
        //绑定类型
        $("#type").bind("change", function() {
            var html1="发表图片请先上传到<strong style=\"color:#0078D3;\"><a href=\"http://www.meego.com.cn/do.php?ac=7425A44C74E5AEF7BCEA672669EEA200\" >指定空间</a></strong>，再粘贴到发布框内，<strong style=\"color:#0078D3;\"><a href=\"http://www.fei580.com/news_479.htm\" >查看帮助</a></strong>。";
            var html2="请在文章的下方提供自己的联系方式，方便同游者与你联系。";
        
            var r=this.value;
            if(r=="1"){
                $("#codeText").html(html1);
            }
            else if(r=="2"){
                $("#codeText").html(html1);
            }
            else if(r=="3"){
                $("#codeText").html(html1);
            }
            else if(r=="4"){
                $("#codeText").html(html1);
            }
            else if(r=="5"){
                $("#codeText").html(html2);
            }
        })
 });		 
 </script>
</head>
<body>
  <div class="mainbody" >
   <form id="form1" runat="server">
    <!--header start-->
    <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="飞瀛网" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="国际机票专家" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
    <div class="headerbottom">
      <div class="headerbottom_left"><a href="http://www.fei580.com/" title="飞瀛网"><img src="http://www.fei580.com/images/logo.jpg" alt="" /></a></div>
      <div class="headerbottom_right">
        <div class="headerbottom_rightone">
        <% if (Session["Mem_LoginName"] == null)
           { %>
        <a href="http://www.fei580.com/login.aspx?url=<%=Server.UrlEncode(Request.Url.ToString()) %>" title="">会员登录</a>|<a href="http://www.fei580.com/regAgree.aspx" title="会员注册">会员注册</a>|<a href="http://www.fei580.com/sm/" title="飞瀛服务">关于飞瀛</a>
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
          <li class="two"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
          <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
          <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
          <!--li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li-->
          <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
          <li class="two"><a rel="nofollow" href="http://hotel.fei580.com/" target="_blank" title="国际酒店">国际酒店</a></li>
     <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
          <li class="one"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a></li>
          <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
          <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
        </ul>
        <div class="menubottom">
	        <ul class="nohidden">
	          <li class="two"><a href="http://www.fei580.com/airline.aspx" title="航空公司">航空公司</a></li>
	          <li class="two"><a href="http://www.fei580.com/airport.aspx" title="世界机场">世界机场</a></li>
	          <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="民航机型">民航机型</a></li>
	          <li class="two"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	          <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	        </ul>
                <uc2:searchControl ID="SearchControl1" runat="server" />
        </div>
         <div class="header_nav">您现在位置：<a href="http://www.fei580.com/" title="飞瀛网首页">飞瀛网</a>&gt;&nbsp;<a href="http://www.fei580.com/quan.aspx" title="">飞瀛圈</a>&gt;&nbsp;发表文章</div>
      </div>
    </div>
    <!--header end-->

     
    <div style="margin:0px auto;width:748px;position:relative;">
      

      <div class="articles_boxone clearfix">
		      <div class="articles_boxtwo"><a href="http://www.fei580.com/person/myinfo.aspx" title=""><img alt="" height="64px" src="http://www.fei580.com/<%=memberitem.Mem_pic%>" width="69px" /></a><a href="http://www.fei580.com/person/myinfo.aspx" title="" class="bluestr"><%=memberitem.Mem_LoginName %></a></div>
		      <div class="articles_boxthree">
			     <ul>
			       <li>你的积分：<strong><%=memberitem.Mem_Money %> </strong></li>
			       <li>你已发表<strong><a href="http://www.fei580.com/quanList.aspx?username=<%=memberitem.Mem_LoginName%>"><%=artNum %></a></strong>篇文章</li>
			       <li><a href="http://www.fei580.com/quanList.aspx?username=<%=memberitem.Mem_LoginName%>">查看我的文章列表</a></li>
			     </ul>

			     <dl>
			       <dt>标题：<input type="text" id="txtTitle" runat="server" maxlength="100" /></dt>
			       <dd>分类：<select id="type"  runat="server">
                             <option value="">选择类型</option>
                             <option value="1">攻略游记</option>
                             <option value="2">旅游点评</option>
                             <option value="3">图片故事</option>
                             <option value="4">旅游问答</option>
                             <option value="5">录找结伴</option>
                             </select>&nbsp;&nbsp;<code id="codeText">发表图片请先上传到<strong style="color:#0078D3;"><a href="http://www.meego.com.cn/do.php?ac=7425A44C74E5AEF7BCEA672669EEA200" >指定空间</a></strong>，再粘贴到发布框内，<strong style="color:#0078D3;">查看帮助</strong>。</code></dd>
                           
			     </dl>		 
		      </div>
      </div>

      <div class="articles_inputbox">
       <textarea id="intro" name="intro" style="width:750px;height:320px;"  runat="server"></textarea>
      </div>

      <div class="articles_submit">
      请输入验证码&nbsp;<input id="txtCheckCode" type="text" runat="server" style="width: 65px; height:20px;" />
      <img src="http://www.fei580.com/share/VerifyImagePage.aspx?time=0" id="vcodeimg" onclick="this.src='http://www.fei580.com/share/verifyimagepage.aspx?time=' + Math.random();" style="width: 90px; height: 25px;" />
      
      <asp:Button ID="Butt_submit" CssClass="articles_submitinput person_submitone"  runat="server" Text="发&nbsp;&nbsp;布" OnClick="Butt_submit_Click" />
      <input class="articles_submitinput" type="button" value="返&nbsp;&nbsp;回" onclick="history.go(-1);"/>
      </div>
    </div>
      </form>
      
  <uc1:footControl ID="FootControl" runat="server" />
  </div>
 </body>
</html>
