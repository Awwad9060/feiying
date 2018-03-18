<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jouradd.aspx.cs" Inherits="console_person_jouradd" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>查看或修改会员日记信息</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" language="javascript">
      //表单验证
     function checkperregister()
     {
        var username = document.getElementById("title");
        if(username.value=='')
        {
            alert('请填写日记标题！');
            return false;
        }
     }
    </script>
</head>
<body>
    <form id="form1" runat="server">
   <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
            <tr>
                <td align="center" bgcolor="#799AE1" class="B" style="width: 413px" >
                    </td>
                <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 839px">
                    <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td align="center" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    日记标题：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="title" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    用户名：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="username" readonly="readonly" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                   电话：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="tel" readonly="readonly" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    Email：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="email" readonly="readonly" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    发表时间：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="addtime" readonly="readonly" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    内容：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                    <textarea id="context" runat="server" style="width: 491px; height: 178px"></textarea>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkperregister()"
                      OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='jourlist.aspx'" value="返 回" />
                    </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                 </td>
            </tr>
        </table>
    </form>
</body>
</html>
