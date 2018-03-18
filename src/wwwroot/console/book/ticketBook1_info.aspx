<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticketBook1_info.aspx.cs" Inherits="console_book_ticketBook1_info" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>机票预定记录详情</title>
         <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
     <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
</head>
<body>
    <form id="form1" runat="server">
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
                    内容：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
              <textarea id="content" runat="server" style="width: 359px; height: 131px"></textarea>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    联系人：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="contact" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>  
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    联系电话：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="telephone" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    其他联系方式：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="otherWay" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    航程要求：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="require" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    预订日期：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="addtime" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    状态：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="state" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="right" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='ticketBook1_list.aspx'" value="返 回" />
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
