<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myfeedadd.aspx.cs" Inherits="person_myfeedadd" %>
<%@ Register Src="../share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="../share/footControl.ascx" TagName="footControl" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
 <title>提交意见-飞瀛网</title>
<link href="../css/main.css" rel="stylesheet" type="text/css" />
<link href="../css/person.css" rel="stylesheet" type="text/css" />
<meta name="Description"  content="飞瀛网" />
<meta name="keywords" content="飞瀛网" />
<script type="text/javascript">
   　//检测图片后缀名
function CheckFile(sender,arg)
{
    var enableExt =["jpg","gif","bmp","png","peng","rar","zip","txt","doc","xml","swf","xls","conf","rtf"]; // add your enable extension on that
    if (arg.Value=="")
    {
        arg.IsValid =true;
    }
    else
    {
        var temp = arg.Value.split(".");
        var extension = temp[temp.length-1];
        extension = extension.toLowerCase();
        var isValid = false;
        
        for(i=0;i<enableExt.length;i++)
        {
           if (extension==enableExt[i])
           {
                isValid=true;
           }
        }
        arg.IsValid = isValid;
    }
}

</script>

</head>
<body>
    <div class="mainbody" >
    <form id="form1" runat="server">
 <!--header start-->
<div class="headertop"><span><img src="../images/home.jpg" alt="飞瀛网" /><img src="../images/homeinfor.jpg" alt="国际机票专家" />国际、国内机票服务热线：4008-850-663(免费)</span></div>
<div class="headerbottom">
  <div class="headerbottom_left"><a href="http://www.fei580.com" title="飞瀛网"><img src="../images/logo.jpg" alt="" /></a></div>
  <div class="headerbottom_right">
    <div class="headerbottom_rightone">
    <% if (Session["Mem_LoginName"] == null)
       { %>
    <a href="../login.aspx" title="">会员登录</a>|<a href="../regAgree.aspx" title="会员注册">会员注册</a>
    <%
        }
        else
        {
     %>
    <a href="../person/myticket.aspx" title="">您好，<%=Session["Mem_LoginName"].ToString() %> </a>| <a href="../person/myticket.aspx" title="">积分 <%=Session["Mem_Money"].ToString() %></a>|<a href="../person/myinfo.aspx" title="">个人中心</a>|<a href="../logout.aspx" title="">退出登录</a>
    <%}
         %> 
    </div>
    <ul class="menu_1">
      <li class="two"><a href="http://www.fei580.com" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="../recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="../international.aspx" title="国际机票">国际机票</a></li>
      <li class="two"><a href="../ticket" title="国内机票">国内机票</a></li>
      <li class="two"><a href="../hotel" title="特价酒店">特价酒店</a></li>
      <li class="two"><a href="../quan.aspx"title="飞瀛圈" target="_blank">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="/sm/" title="飞瀛服务">飞瀛服务</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="../images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="../airline.aspx" title="航空公司">航空公司</a></li>
	      <li class="two"><a href="../airport.aspx" title="世界机场">世界机场</a></li>
	      <li class="two"><a href="../airplane.aspx" title="民航机型">民航机型</a></li>
	      <li class="two"><a href="../news.aspx" title="">新闻资讯</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
  </div>
</div>
<!--header end-->


    <div style="margin:0px auto;width:953px;">

      <div class="persontopnav">你当前的积分是：<code><%=Mem_Money%></code><span>赶快兑换吧!</span></div>
       <div class="person_leftboxtwo">
         <h2>个人中心主页</h2>
         <ul>
          <li><a class="person_leftboxtwo_out" href="myinfo.aspx" title="个人资料">个人资料</a><a class="person_leftboxtwo_out" href="myticket.aspx" title="我的机票">我的机票</a></li>
          <li><a class="person_leftboxtwo_out" href="../quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a><a class="person_leftboxtwo_out" href="../quanPublish.aspx" title="我的话题">发表话题</a><a class="person_leftboxtwo_out" href="../quanList.aspx?username=<%=Session["Mem_LoginName"]%>" title="">我的话题</a></li>
          <li><a class="person_leftboxtwo_out" href="http://quan.fei580.com" title="" target="_blank">飞瀛社区</a></li>
          <li><a class="person_leftboxtwo_out" href="../prizes.aspx" title="" target="_blank">兑换奖品</a></li>
          <li style="background:none;"><a class="person_leftboxtwo_out" href="mypwdedit.aspx" title="修改密码">修改密码</a><a class="person_leftboxtwo_on" href="myfeedlist.aspx" title="意见反馈">意见反馈</a></li>
         </ul>
       </div>
      <div class="person_rightbox">
        <table cellpadding="0" cellspacing="6" class="person_tablefive">
          <tr>
            <th>标题：</th>
            <td><input id="title" runat="server" type="text" class="tablefive_text" /><span class="yijancss"><a href="myfeedadd.aspx" title="发表意见" class="white">发表意见</a></span></td>
          </tr>
          <tr>
            <th valign="top">内容：</th>
            <td><textarea id="context" runat="server" ></textarea></td>
          </tr>  
          <tr>
            <th valign="top">&nbsp;</th>
            <td>
              <ul class="person_ulone">
                <li>添加附件</li>
                <li>附件#1： <asp:FileUpload ID="FileUpload_picPath1" runat="server" Width="400px" /><br />附件#2： <asp:FileUpload ID="FileUpload_picPath2" runat="server" Width="400px" /></li>
                <li>（支持的附件类型：jpg peng gif bmp rar zip txt doc xml swf xls conf rtf）</li>
                <li><asp:CustomValidator ID="CustomValidator_pic1" runat="server" 
                    ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath1" 
                    Display="Dynamic" ErrorMessage="（支持的附件类型：jpg peng gif bmp rar zip txt doc xml swf xls conf rtf）"></asp:CustomValidator>
                </li>
                <li><asp:CustomValidator ID="CustomValidator_pic2" runat="server" 
                    ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath2" 
                    Display="Dynamic" ErrorMessage="（支持的附件类型：jpg peng gif bmp rar zip txt doc xml swf xls conf rtf）"></asp:CustomValidator> </li>
              </ul>
            </td>
          </tr> 
          <tr>
            <th></th>
            <td><asp:Button ID="Butt_submit" CssClass="person_submitone"  runat="server" Text="提交意见" OnClick="Butt_submit_Click" /></td>
          </tr>
        </table>
          
      </div>
      
    </div>
       

    <!--sixlinebox start-->
    </form>
    <uc2:footControl ID="FootControl" runat="server" />
    </div>
</body>
</html>
