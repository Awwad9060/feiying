<%@ Control Language="C#" AutoEventWireup="true" CodeFile="myleft.ascx.cs" Inherits="person_share_myleft" %>
   <div class="person_leftboxtwo">
     <h2>个人中心主页</h2>
     <ul>
      <li><a id="my_1" class="<%=classArray[0] %>" href="myinfo.aspx" title="个人资料">个人资料</a><a id="my_2" class="<%=classArray[1] %>"  href="myticket.aspx" title="我的机票">我的机票</a></li>
      <li><a id="my_3" class="<%=classArray[2] %>"  href="../quan.aspx" title="飞瀛圈" target="_blank">飞瀛圈</a><a id="my_4" class="<%=classArray[3] %>"  href="../quanPublish.aspx" title="我的话题">发表话题</a><a id="my_5" class="<%=classArray[4] %>"  href="../quanList.aspx?username=<%=Session["Mem_LoginName"]%>" title="">我的话题</a></li>
      <li><a id="my_6" class="<%=classArray[5] %>"  href="http://quan.fei580.com" title="" target="_blank">飞瀛社区</a></li>
      <li><a id="my_7" class="<%=classArray[6] %>"  href="../prizes.aspx" title="" target="_blank">兑换奖品</a></li>
      <li  style="background:none;"><a id="my_8" class="<%=classArray[7] %>" href="mypwdedit.aspx" title="修改密码">修改密码</a><a id="my_9" class="<%=classArray[8] %>" href="myfeedlist.aspx" title="意见反馈">意见反馈</a></li>
     </ul>
   </div>   