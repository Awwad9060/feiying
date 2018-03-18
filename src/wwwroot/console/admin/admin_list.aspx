<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_list.aspx.cs" Inherits="console_admin_admin_list" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员管理-天维网络科技</title>
    <link type="text/css" href="../css/control.css" rel="Stylesheet" />
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
            <tr>
                <td>
                    <img src="../images/r_1.gif" alt="" /></td>
                <td width="100%" background="../images/r_0.gif">
                </td>
                <td>
                </td>
                
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <div>
                        <table align="center" cellpadding="4" cellspacing="1" border="0" width="100%" class="toptable grid">
                            <tr>
                                <td height="25" width="100" style="color: Red;">
                                    管理员管理</td>
                            </tr>
                        </table>
                        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
                            <tr>
                                <td style="width: 12%; height: 28px;" align="center"><a  href="admin_edit.aspx">添加操作员</a></td>
                                
                                <td style="width: 10%; height: 28px;">
                                </td>
                                <td bgcolor="#E7E7E7" style="color: #000000; height: 28px; width: 82%;">
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width: 100%;">
                                    <asp:DataGrid ID="adminlist" AutoGenerateColumns="False" CellPadding="0" CellSpacing="0"
                                        PageSize="20" runat="server" Width="100%" AllowPaging="True">
                                        <HeaderStyle Height="30px" BackColor="#799AE1" HorizontalAlign="Center" />
                                        <ItemStyle BackColor="#F6F6F6" Height="25px" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="编号">
                                                <ItemTemplate>
                                                    <%# Eval("id")%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="管理员名称">
                                                <ItemTemplate>
                                                    <%# Eval("adminName")%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                            
                                            <asp:TemplateColumn HeaderText="管理类型">
                                                <ItemTemplate>
                                                    <%#Operator_stat(Convert.ToInt32(Eval("flag")))%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                            
                                           
                                            <asp:TemplateColumn HeaderText="操　　作">
                                                <ItemTemplate>
                                                    <a href="admin_edit.aspx?Oper=modify&Id=<%#Eval("id")%>">编辑</a> 
                                                    <a href="?Oper=del&Id=<%#Eval("id")%>" onclick="return isdel()">删除</a>  
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                        </Columns>
                                        <PagerStyle Visible="False" />
                                    </asp:DataGrid>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 36px">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr bgcolor="#E7E7E7">
                                            <td style="width: 8%; height: 28px;">
                                            </td>
                                            <td style="width: 12%; height: 28px;">
                                            </td>
                                            <td bgcolor="#E7E7E7" style="color: #000000; height: 28px; width: 84%;">
                                            </td>
                                        </tr>
                                    </table>
                                </td>
                            </tr>
                        </table>
                    </div>
                </td>
                <td>
                </td>
            </tr>
            <tr>
                <td>
                    <img src="../images/r_4.gif" alt="" /></td>
                <td>
                </td>
                <td>
                    <img src="../images/r_3.gif" alt="" /></td>
            </tr>
        </table>
    </form>
</body>
</html>
