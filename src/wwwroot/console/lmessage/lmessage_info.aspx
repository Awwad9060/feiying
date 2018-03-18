<%@ Page Language="C#" AutoEventWireup="true" CodeFile="lmessage_info.aspx.cs" Inherits="console_lmessage_lmessage_info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>客户投诉建议详情</title>
         <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
     <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
</head>
<body>
    <form id="form1" action="ticket_add.aspx" runat="server">
    <div >
        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="ticket_table">
            <tr>
                <td align="right" bgcolor="#799AE1" class="B" style="width: 413px" >
                    </td>
                <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 500px">
                    <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td align="right" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    标题：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  readonly="readonly"   id="title" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>       
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    类型：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                 <input  readonly="readonly"   id="lType" runat="server" type="text" size="58" />
              </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    称呼：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input   readonly="readonly"  id="contact" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    电话：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  readonly="readonly"   id="telephone" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px;">
                    内容：</td>
                <td  align="left" bgcolor="#F6F6F6" style="width: 500px">              
                <textarea runat="server" name="ocontent" id="content" readonly="readonly" style="width: 359px; height: 131px"></textarea>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    eMail：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  readonly="readonly"  id="eMail" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    时间：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input readonly="readonly"  id="addtime" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='lmessage_list.aspx'" value="返 回" />
                 </td>
            </tr>
            <tr>
                <td align="right" colspan="3">
                 </td>
            </tr>
        </table>
        </div>
    </form>
</body>
</html>
