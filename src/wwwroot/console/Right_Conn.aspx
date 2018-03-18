<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Right_Conn.aspx.cs" Inherits="console_Right_Conn" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Fei580.com</title>
    <link href="css/MasterPage.css" type="text/css" rel="stylesheet" />

    <script type="text/javascript" language="javascript">
function tick() {
var hours, minutes, seconds, xfile;
var intHours, intMinutes, intSeconds;
var today, theday;
today = new Date();
function initArray(){
this.length=initArray.arguments.length
for(var i=0;i<this.length;i++)
this[i+1]=initArray.arguments[i] }
var d=new initArray(
"星期日",
"星期一",
"星期二",
"星期三",
"星期四",
"星期五",
"星期六");
theday = today.getYear()+"年" + [today.getMonth()+1]+"月" +today.getDate() +" "+ d[today.getDay()+1];
intHours = today.getHours();
intMinutes = today.getMinutes();
intSeconds = today.getSeconds();
if (intHours == 0) {
hours = "12:";
xfile = "午夜";
} else if (intHours < 12) {
hours = intHours+":";
xfile = "上午";
} else if (intHours == 12) {
hours = "12:";
xfile = "正午";
} else {
intHours = intHours - 12
hours = intHours + ":";
xfile = "下午";
}
if (intMinutes < 10) {
minutes = "0"+intMinutes+":";
} else {
minutes = intMinutes+":";
}
if (intSeconds < 10) {
seconds = "0"+intSeconds+" ";
} else {
seconds = intSeconds+" ";
}
timeString = theday+" "+xfile+" "+hours+minutes+seconds;
Clock.innerHTML = timeString;
window.setTimeout("tick();", 100);
}
window.onload = tick;

    </script>

</head>
<body>
    <form id="form1" runat="server">
        <div>
            <span id="Navigation_SmpNavigator" style="display: inline-block; height: 25px;"><span>
                <img src="images/localGIF.gif" style="border-width: 0px;" />后台管理 </span><span>&gt;&gt;
                </span><span><a title="系统设置">首页</a></span><span> </span></span>
            <div>
                <table class="border" cellspacing="1" cellpadding="0" border="0" id="ctl00_CphContent_EgvModel"
                    style="width: 100%;">
                    <tr class="tdbg" align="center">
                        <td>
                            <table width="100%" border="0" cellpadding="0" cellspacing="0">
                                <tr>
                                    <td width="100%" align="center" style="height: 86px">
                                        <table width="94%" border="0" cellspacing="0" cellpadding="0">
                                            <tr>
                                                <td align="left" style="height: 19px">
                                                    &nbsp;您好，今天是：<div id="Clock" style="font-size:13px; color:Red; width:423px; margin:-19px 0px 0px 100px;"></div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <td valign="top" align="left">
                                                    &nbsp;欢迎您进入后台管理系统！在这里您可以利用系统提供的强大的功能有效地管理网站。<br />
                                                    &nbsp;您可以随时使用左边的<font color="#FF0000">关闭左栏</font>功能关闭或打开左边的管理导航，以扩展操作界面。</td>
                                            </tr>
                                        </table>
                                    </td>
                                    
                                </tr>
                                
                            </table>
                        </td>
                    </tr>
                </table>
                <span style="display: inline-block; height: 5px;"></span>

                <span style="display: inline-block; height: 10px;"></span>
      
            </div>
        </div>
    </form>
</body>
</html>
