<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NowSearchingAdd.aspx.cs" Inherits="NowSearchingAdd" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加数据(大家正在查)</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
    <script type="text/javascript" language="javascript">

        function checkInfo() {
            if (document.getElementById("txtFromCity").value == "") {
                alert("出发城市不能为空！");
                return false;
            }
            if (document.getElementById("txtToCity").value == "") {
                alert("到达城市不能为空！");
                return false;
            }
            if (document.getElementById("txtAirline").value == "") {
                alert("航空公司不能为空！");
                return false;
            }
            if (document.getElementById("txtPrice").value == "") {
                alert("价格不能为空！");
                return false;
            }
            return true;
        }
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
        <tr>
            <td align="center" bgcolor="#799AE1" class="B" style="width: 413px">
            </td>
            <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 839px">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </td>
            <td align="center" bgcolor="#799AE1" class="B" style="width: 253px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                航线类型：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <asp:DropDownList ID="ddlLineType" runat="server" Width="100px">
                    <asp:ListItem Value="国际" Selected="True">国际</asp:ListItem>
                    <asp:ListItem Value="国内">国内</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td bgcolor="#F6F6F6" style="width: 253px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                出发城市：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txtFromCity" runat="server" type="text" size="58" style=" width:100px;" />
            </td>
            <td bgcolor="#F6F6F6" style="width: 253px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                到达城市：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txtToCity" runat="server" type="text" size="58" style=" width:100px;" />
            </td>
            <td bgcolor="#F6F6F6" style="width: 253px">
            </td>
        </tr>
        <%--<tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                日期：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <input  id="txtDate" name="fromsaleDate_more" runat="server" readonly="readonly" onfocus="return setday(this)" type="text" style="width: 90px" />
            </td>
            <td bgcolor="#F6F6F6" style="width: 253px">
            </td>
        </tr>--%>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                航向：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <asp:DropDownList ID="ddlToward" runat="server" Width="100px">
                    <asp:ListItem Value="单程">单程</asp:ListItem>
                    <asp:ListItem Value="往返" Selected="True">往返</asp:ListItem>
                </asp:DropDownList>
            </td>
            <td bgcolor="#F6F6F6" style="width: 253px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                航空公司：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txtAirline" runat="server" type="text" size="58" style=" width:100px;" />
            </td>
            <td bgcolor="#F6F6F6" style="width: 253px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                价格：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <table>
                    <tr>
                        <td>
                            <input  id="txtPrice" runat="server" type="text" size="58" style=" width:60px;"  />
                       </td>
                        <td>
                            <input  id="txtPrice2" runat="server" type="text" size="58" style=" width:60px;"  />
                       </td>
                        <td>
                            <input  id="txtPrice3" runat="server" type="text" size="58" style=" width:60px;"  />
                       </td>
                        <td>
                            <input  id="txtPrice4" runat="server" type="text" size="58" style=" width:60px;"  />
                       </td>
                        <td>
                            <input  id="txtPrice5" runat="server" type="text" size="58" style=" width:60px;"  />
                       </td>
                    </tr>
                </table>
            </td>
            <td bgcolor="#F6F6F6" style="width: 253px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                <asp:Button ID="btnSave" runat="server" Text="保 存" Height="23" OnClientClick="return checkInfo()" OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="Submit3" type="button" style="height: 23px;" onclick="location.href='NowSearchinglist.aspx'" value="返 回" />
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
