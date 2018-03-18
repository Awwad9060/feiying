<%@ Page Language="C#" AutoEventWireup="true" CodeFile="myinfo.aspx.cs" Inherits="person_myinfo" %>
<%@ Register Src="../share/searchControl.ascx" TagName="searchControl" TagPrefix="uc2" %>
<%@ Register Src="../share/footControl.ascx" TagName="footControl" TagPrefix="uc2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>修改个人资料-飞瀛网</title>
    <link href="../css/main.css" rel="stylesheet" type="text/css" />
    <link href="../css/person.css" rel="stylesheet" type="text/css" />
    <link href="../css/datepicker.css" rel="stylesheet" type="text/css"/>
    <script type="text/javascript" src="../js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript" src="../js/index.js"></script>
    <meta name="Description"  content="飞瀛网" />
    <meta name="keywords" content="飞瀛网" />
    <script type="text/javascript" language="javascript">
      //表单验证
     function checkperregister()
     {
        var username = document.getElementById("username");
        if(username.value=='')
        {
            alert('请填写您的姓名！');
            return false;
        }
        
        var nickname = document.getElementById("nickname");
        if(nickname.value=='')
        {
            alert('请填写您的昵称！');
            return false;
        }
      
        var email = document.getElementById("email");
        if(email.value=='')
        {
            alert('请填写您的邮箱！');
            return false;
        }

    }
    $(document).ready(function() {
        OneWayDate(document.getElementById("date"));
    });
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

      <div class="persontopnav">你当前的积分是：<code><%=memberitem.Mem_Money%></code><span>赶快兑换吧!</span></div>
       <div class="person_leftboxtwo">
         <h2>个人中心主页</h2>
         <ul>
          <li><a class="person_leftboxtwo_on" href="myinfo.aspx" title="个人资料">个人资料</a><a class="person_leftboxtwo_out" href="myticket.aspx" title="我的机票">我的机票</a></li>
          <li><a class="person_leftboxtwo_out" href="../quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a><a class="person_leftboxtwo_out" href="../quanPublish.aspx" title="我的话题">发表话题</a><a class="person_leftboxtwo_out" href="../quanList.aspx?username=<%=Session["Mem_LoginName"]%>" title="">我的话题</a></li>
          <li><a class="person_leftboxtwo_out" href="http://quan.fei580.com" title="" target="_blank">飞瀛社区</a></li>
          <li><a class="person_leftboxtwo_out" href="../prizes.aspx" title="" target="_blank">兑换奖品</a></li>
          <li style="background:none;"><a class="person_leftboxtwo_out" href="mypwdedit.aspx" title="修改密码">修改密码</a><a class="person_leftboxtwo_out" href="myfeedlist.aspx" title="意见反馈">意见反馈</a></li>
         </ul>
       </div>

       
      <div class="person_rightbox" style="width:719px;">
      
       <%
           string headPic = memberitem.Mem_pic;
           if (memberitem.Mem_pic == "")
           {
               headPic = "../images/onein029.jpg";
           }
           
        %>
           
           <div class="person_rightboxone">
             
             <div class="person_rightboxthree">
               <ul class="person_rightultwo">
                 <li class="one"><img src="../<%=headPic%>" alt="" width="120px" height="120px" /></li>
                 <li class="two"><a href="javascript:showfileUploadli(1)" title="" class="bluestr">修改头像</a></li>
               </ul>
               <ul class="person_rightulthree">
                
                 <li class="two">
                   性别：<span><%=memberitem.Mem_Sex.Trim().Equals("M")?"男":"女"%>
    </span><br />
                   
                   出生日期：<span> <%if (!string.IsNullOrEmpty(memberitem.Mem_birthday)) %>
                    <%{ %><%=Convert.ToDateTime(memberitem.Mem_birthday.Trim()).ToLongDateString()%><%} %></span><br />
                   
    现居住地：<span><%=memberitem.Mem_Addr %></span>
                 </li>
                 <script type="text/javascript">
                 function showfileUploadli(res){
                    if(res==1){
                        document.getElementById("fileUploadli").style.display="block";
                    }
                    else{
                        document.getElementById("fileUploadli").style.display="none";
                        var file=document.getElementById("FileUpload_picPath");
                        file.outerHTML=file.outerHTML;
                    }
                 }
                 
                    //检测图片后缀名
                    function CheckFile(sender,arg)
                    {
                        var enableExt =["jpg","gif","bmp","png"]; // add your enable extension on that
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
                 
                 <li id="fileUploadli"  style="display:none" class="two">
                    图片路径：
                 <span><asp:FileUpload ID="FileUpload_picPath" runat="server" Width="285px" />&nbsp;&nbsp;<a href="javascript:showfileUploadli(0)" title="" class="bluestr">收起</a></span><br />
                
                <span><asp:CustomValidator ID="CustomValidator_pic" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath" 
                Display="Dynamic" ErrorMessage="*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator></span>
                 </li>
               </ul>
             </div>
             
             <div class="person_rightboxtwo">
               <table cellpadding="0" cellspacing="8">
                 <tr>
                   <th>登录用户名：</th>
                   <td><input id="username" runat="server" type="text" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>真实姓名：</th>
                   <td><input id="nickname" runat="server" type="text" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>电话：</th>
                   <td><input id="tel" runat="server" type="text" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>E-mail：</th>
                   <td><input id="email" runat="server" type="text" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>公司：</th>
                   <td><input id="company"  runat="server" type="text" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>Q&nbsp;&nbsp;Q：</th>
                   <td><input id="qq" runat="server" type="text" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>MSN：</th>
                   <td><input id="msn" runat="server" type="text" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>性别：</th>
                   <td><input id="sexm"  name="sex" runat="server" value="M" type="radio" />男&nbsp;&nbsp;&nbsp;&nbsp;<input id="sexr" name="sex" runat="server" value="S" type="radio" />女</td>
                 </tr>
                 <tr>
                   <th>出生日期：</th>
                   <td><input id="date" runat="server" type="text" class="persontext_two" /></td>
                 </tr>
                 <tr>
                   <th>居住地：</th>
                   <td><input id="post" runat="server" type="text" class="persontext_two" style="width:300px" /></td>
                 </tr>
               </table>
               
             </div>
                <asp:Button ID="But_update" runat="server" CssClass="person_submitone" OnClientClick="return checkperregister()" Text="提&nbsp;&nbsp;交" OnClick="But_update_Click" />
           </div>
      </div>
    </div>
    </form>
        <script type="text/javascript" src="../js/datepicker.js"></script>
    
    <uc2:footControl ID="FootControl" runat="server" />
    </div>
</body>
</html>
