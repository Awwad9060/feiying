<%@ Page Language="C#" AutoEventWireup="true" CodeFile="regAgree.aspx.cs" Inherits="regAgree" %>
<%@ Register Src="share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="share/footControl.ascx" TagName="footControl" TagPrefix="uc1" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
<title>注册协议 - 飞瀛网</title>
<link href="http://www.fei580.com/css/main.css" rel="stylesheet" type="text/css" />
<link href="http://www.fei580.com/css/reg.css" rel="stylesheet" type="text/css" />
<script type="text/javascript" src="http://www.fei580.com/ticket/script.js"></script>
<script type="text/javascript" src="http://www.fei580.com/js/register.js"></script>
<script src="http://www.fei580.com/js/jquery-1.2.6.js" type="text/javascript"></script>
<script type="text/javascript" src="http://www.fei580.com/js/postdata.js"></script>
<script type="text/javascript" language="javascript" defer="defer">
  //表单验证
 function checkperregister()
 {
    if(!checkusername('per')){
        document.getElementById('shortname').focus();
        return false;
    }
 
    if(!checkpwd()){
        document.getElementById('pwd1').focus();
        return false;
    }
    
    if(!confirmpwd()){
        document.getElementById('pwd2').focus();
        return false;
    }
    
    if(!checkTruename()){
        document.getElementById('trueName').focus();
        return false;
    }
    
    if(!chkTel('tel','errTel')){
        document.getElementById('tel').focus();
        return false;
    }
    
    if(!checkemail()){
        document.getElementById('emailusername').focus();
        return false;
    }
    return true; 
 }
     </script>
<style type="text/css">
<!--
.STYLE1 {
	font-size: 16px;
	font-weight: bold;
}
 .input  {   
                border:0px;   
                background-image:url(http://www.fei580.com/images/long-input.png);   
                background-repeat:no-repeat;   
                background-position-x:left;   
                padding-left:5px;   
                padding-right:3px;  
				*padding-top:5px;  
                height:26px;   
                font-size:14px;   
                width:200px;   
			  
            } 
.f_blue{ color:#0056BD};  
-->
</style>
</head>
<body>
    <div class="mainbody" >
    <form id="form1" runat="server">
    <div class="headertop"><span><img src="http://www.fei580.com/images/home.jpg" alt="home" /><img src="http://www.fei580.com/images/homeinfor.jpg" alt="mail" />国际、国内机票服务热线：400-885-0663(免费)</span></div>
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
    </div>  <ul class="menu_1">
      <li class="four"><a href="http://www.fei580.com/" title="首页">首&nbsp;页</a></li>
      <li class="two"><a href="http://www.fei580.com/recommend.aspx" title="特价机票">特价机票</a></li>
      <li class="two"><a href="http://www.fei580.com/international.aspx" title="国际机票">国际机票</a></li>
      <!--li class="two"><a href="http://www.fei580.com/ticket" title="会员专区" target="_blank">会员专区</a></li-->
      <!--<li class="two"><a href="http://cn.fei580.com" title="国内机票" rel="nofollow">国内机票</a></li>-->
      <li class="two"><a href="http://www.fei580.com/visa.html" title="国际签证">国际签证</a></li>
      <li class="two"><a rel="nofollow" href="http://hotel.fei580.com/" target="_blank" title="国际酒店">国际酒店</a></li>
      <!--<li class="two"><a href="http://www.fei580.com/hotel.aspx" title="特价酒店">特价酒店</a></li>--> 
      <li class="two"><a href="http://www.fei580.com/quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a></li>
      <li class="two" style="background:none;"><a href="http://www.fei580.com/yinlian/" target="_blank" title="在线支付方式">支付方式</a></li>
      <li class="new_imgs" style="padding:0px;background:none;"><img src="http://www.fei580.com/images/new.gif" alt="" /></li>
    </ul>
    <div class="menubottom">
	    <ul class="nohidden">
	      <li class="two"><a href="http://www.fei580.com/airline.aspx" title="">航空公司</a></li>
	      <li class="two"><a href="http://www.fei580.com/airport.aspx" title="">世界机场</a></li>
	      <li class="two"><a href="http://www.fei580.com/airplane.aspx" title="">民航机型</a></li>
	      <li class="two"><a href="http://www.fei580.com/news.aspx" title="">新闻资讯</a></li>
	      <li class="two"><a href="http://www.fei580.com/prizes.aspx" title="">积分广场</a></li>
	    </ul>
            <uc2:searchControl ID="SearchControl1" runat="server" />
    </div>
  </div>
</div>

<div style=" margin:auto; width:968px; height:520px; background:url(http://www.fei580.com/images/reg_bg.jpg) no-repeat; margin-top:18px; font-size:12px;">
<div style="float:left; width:490px; height:400px; "><table width="502" height="367" border="0">
  <tr>
    <td width="75" height="88">&nbsp;</td>
    <td colspan="2">&nbsp;</td>
  </tr>
  <tr>
    <td height="33">&nbsp;</td>
    <td height="33" colspan="2"><div align="left">带有<span class="f_blue">*</span>的必填项目</div></td>
  </tr>
  <tr>
    <td ><div align="right"><span class="f_blue">*</span>账号：</div></td>
    <td width="201">
       <input class="input" type="text" id="shortname" runat="server" onblur="checkusername('per');"/>
   </td>
    <td><span class="f_blue">*</span>&nbsp;<span id="peruser">6-18位英文字符(如：welcome)</span></td>
  </tr>
  <tr>
    <td><div align="right"><span class="f_blue">*</span>密码：</div></td>
    <td><input class="input" type="password" id="pwd1" runat="server" onblur="checkpwd();"/></td>
    <td><span class="f_blue">*</span>&nbsp;<span id="errpwd">长度为6个字符以上</span></td>
  </tr>
  <tr>
    <td><div align="right"><span class="f_blue">*</span>确认密码：</div></td>
    <td><input class="input" type="password" id="pwd2" runat="server"  name="chkpwd" onblur="confirmpwd();"/></td>
    <td><span class="f_blue">*</span>&nbsp;<span id="errchkpwd">请再次输入密码</span></td>
  </tr>
  <tr>
    <td>&nbsp;</td>
    <td colspan="2"><span class="f_blue">*</span><input type="radio" id="sex1" name="sex"  value="m" runat="server" checked/>男 <input  id="sex2" type="radio" name="sex"  value="w" runat="server"/>女 </td>
  </tr>
  <tr>
    <td><div align="right">真实姓名:</div></td>
    <td><input class="input" type="text" id="trueName" runat="server" onblur="checkTruename();"/></td>
    <td><span class="f_blue">*</span>&nbsp;<span id="errTrueName">用于积分兑换礼品</span></td>
  </tr>
  <tr>
    <td ><div align="right">联系电话：</div></td>
    <td><input class="input" type="text" id="tel" runat="server" onblur="chkTel('tel','errTel');"/></td>
    <td><span class="f_blue">*</span>&nbsp;<span id="errTel">方便与您取得联系</span></td>
  </tr>
  <tr>
    <td ><div align="right">E-mail：</div></td>
    <td><input class="input" type="text" id="emailusername" runat="server" onblur="checkemail();"/></td>
    <td valign="middle"><span class="f_blue">*</span>&nbsp;<span id="erremail">请填写邮件</span></td>
  </tr>
  <tr>
    <td height="14">&nbsp;</td>
    <td colspan="2">&nbsp;</td>
  </tr>
</table>
</div>
<div style="float:left; width:460px; height:360px;overflow:hidden;">
<div style="float:left; width:450px; height:20px;padding-left:40px;margin-top:100px; overflow:hidden;">请阅读飞瀛网网络条款</div>
<div style="float:left; width:380px; height:205px;margin-left:40px;_margin-left:20px; border:#CCC 1px solid;margin-top:10px;margin-top:10px; overflow-y:scroll; padding:10px;">
 <p>&nbsp;</p>
           <p>&nbsp;</p>
	      <p>普通会员注册</p>
	      <p>请仔细阅读以下使用许可, 如果您不同意以下任何一点, 请立即停止使用。</p><br />
	      <p>一、用户承诺<br />
	        不得利用本站危害国家安全、泄露国家秘密，不得侵犯国家社会集体的和公民的合法权益，不得利用本站制作、复制和传播下列信息： </p>
	      <p>（一）煽动抗拒、破坏宪法和法律、行政法规实施的；<br />
	        （二）煽动颠覆国家政权，推翻社会主义制度的，损害国家机关信誉的；<br />
	        （三）煽动分裂国家、破坏国家统一的；<br />
	        （四）煽动民族仇恨、民族歧视，破坏民族团结的；<br />
	        （五）捏造或者歪曲事实，散布谣言，扰乱社会秩序的；<br />
	        （六）宣扬封建迷信、淫秽、色情、赌博、暴力、凶杀、恐怖、教唆犯罪的；<br />
	        （七）公然侮辱他人或者捏造事实诽谤他人的，或者进行其他恶意攻击的；<br />
	        （八）从事商业诈骗行为；<br />
	        （九）从事不法交易行为；<br />
	        （十）各类黑客教程和不道德行为。</p>
              <p>&nbsp;</p>
	      <p>二、用户注意条款<br />
	        （一）未完整填写注册资料，或使用不雅或者不恰当的帐号名称和昵称者，将不会通过身份确认；<br />
	        （二）对于非过错或不可抗力原因导致的数据损失、丢失或服务停止，飞瀛网将不承担任何责任，请用户自行进行本地数据备份；<br />
	        （三）如用户使用飞瀛网服务，即表示用户愿意接受飞瀛网发出的旅游产品相关资讯邮件，此群发邮件的最终解释权归飞瀛网所有；<br />
	        （四）飞瀛网在必要时会对服务条款进行修改，服务条款发生任何变动前会即时通知用户。用户可随时根据实际情况决定是否接受服务条款。<br />
	        用户若违反相关的服务条款，飞瀛网有权立即中止该用户服务。用户如果反对本服务条款，或对后来的条款修改有异议，或对飞瀛网服务不满，<br />
	       <br /> 用户有以下权利：<br />
	        （1）不再使用飞瀛网所提供的服务；<br />
	        （2）通知管理员注销在飞瀛网的使用帐号；<br />
          结束用户服务后，用户使用飞瀛网的权利和义务马上中止。</p>
          <br />
</div>
</div>
<div style="float:left; width:950px; height:110px; line-height:110px; text-align:center;">
<asp:ImageButton ID="btnok" ImageUrl="images/reg2_btn.jpg" OnClick="btnok_Click"  OnClientClick="return checkperregister();" runat="server" />
</div>
</div>
    </form>
     <uc1:footControl ID="FootControl" runat="server" />
     </div>
</body>
</html>
