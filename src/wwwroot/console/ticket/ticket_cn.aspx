<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticket_cn.aspx.cs" Inherits="console_ticket_ticket_cn" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>无标题页</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
            <tr>
                <td align="right" bgcolor="#799AE1" class="B" style="width: 413px" >
                    </td>
                <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 500px">
                   国内机票推荐</td>
                <td align="right" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    今天推荐价格：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                   <FCKeditorV2:FCKeditor id="FCKeditor" BasePath="../../tools/fckeditor/"  
                  Height="350" 
                  Width="600"  runat="server">
              </FCKeditorV2:FCKeditor>              
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    天天推荐特价：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                   <FCKeditorV2:FCKeditor id="FCKeditor1" BasePath="../../tools/fckeditor/"  
                  Height="350" 
                  Width="600"  runat="server">
              </FCKeditorV2:FCKeditor>              
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>

            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="4">
                   <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" 
                      OnClick="btnSave_Click" />
                    </td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                 </td>
            </tr>
        </table>
    </form>
</body>
</html>
