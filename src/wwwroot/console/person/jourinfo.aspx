<%@ Page Language="C#" AutoEventWireup="true" CodeFile="jourinfo.aspx.cs" Inherits="cms_person_jourinfo" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>会员文章内容信息</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
            <tr>
                <td width="18%" align="center" bgcolor="#799AE1" class="B" >
                    </td>
                <td width="61%" height="25" align="left" bgcolor="#799AE1" class="B">
                    <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td align="center" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    标题：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
               <input  id="title" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    类型：</td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                     <select id="type" runat="server">
                         <option value="1">攻略游记</option>
                         <option value="2">旅游点评</option>
                         <option value="3">图片故事</option>
                         <option value="4">旅游问答</option>
                         <option value="5">录找结伴</option>
                    </select></td>
                <td bgcolor="#F6F6F6" style="height: 27px; width: 253px;">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6">
                    内容：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                   <FCKeditorV2:FCKeditor id="FCKeditor1" BasePath="../../tools/fckeditor/"  
                  Height="500" 
                  Width="700"  runat="server">
              </FCKeditorV2:FCKeditor>              
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
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
