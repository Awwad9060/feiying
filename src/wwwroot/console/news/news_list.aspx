<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_list.aspx.cs" Inherits="console_works_works_list" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>新闻资讯</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" src="../js/JScript.js"></script>

</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
            <tr>
                <td>
                </td>
                <td>
                    <div>
                        <table align="center" cellpadding="4" cellspacing="1" border="0" width="100%" class="toptable grid">
                            <tr>
                                <td height="25" width="100" style="color: Red;">
                                    新闻资讯管理</td>
                            </tr>
                        </table>
                        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
                            <tr>
                                <td style="width: 7%; height: 25px;" align="center">
                                    类型：
                                </td>
                                <td style="width: 8%; height: 25px;">
                                    <select id="Select1" runat="server">
                         <option value="">请选择类型</option>
                         <option value="1">旅游资讯</option>
                         <option value="2">民航新闻</option>
                         <option value="3">业界动态</option>
                         <option value="4">机场新闻</option>
                         <option value="5">出行智囊</option>
                         <option value="6">旅行日记</option>
                         <option value="7">酒店快讯</option>
                         <option value="8">航空快讯</option>
                                    </select>
                                </td>
                                <td style="width: 8%; height: 25px;" align="center">
                                    关键字：
                                </td>
                                <td style="width: 27%; height: 25px;">
                                    <input id="txtsearch" type="text" runat="server" style="width: 90%; height: 19px;" />
                                </td>
                                <td align="left" style="width: 55%; height: 25px;">
                                    <asp:Button ID="btnsearch" runat="server" Text="查   询" Height="23" OnClick="btnsearch_Click">
                                    </asp:Button>
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width: 100%;">
                                    <asp:Repeater ID="rptshopnews" runat="server">
                                        <HeaderTemplate>
                                            <table width="100%" border="1" cellspacing="0" cellpadding="4" style="border-collapse: collapse">
                                                <tr style="background-color: #799AE1; color: White;">
                                                    <th style="width: 5%">
                                                        选择</th>
                                                    <th style="width: 20%">
                                                        标题</th>
                                                    <th style="width: 20%">
                                                        类型</th>
                                                    <th style="width: 10%">
                                                        添加时间</th>
                                                    <th style="width: 10%">
                                                        焦点新闻</th>
                                                        <th style="width: 10%">
                                                        封面新闻</th>
                                                    <th style="width: 10%">
                                                        操作</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("id") %>" />
                                                </td>
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "title")%> 
                                                </td>
                                                <td>    
                                                     <%#Type_stat(Convert.ToInt32(Eval("type")))%>
                                                </td>
                                                <td>
                                                    <%#DataBinder.Eval(Container.DataItem, "addtime", "{0:yyyy-MM-dd}")%>
                                                </td>
                                                 <td>
                                                    <%#Check_stat(Convert.ToInt32(Eval("isTop")))%>
                                                </td>
                                                 <td>
                                                    <%#Recom_stat(Convert.ToInt32(Eval("isRecom")))%>
                                                </td>
                                                 <td>
                                                   <a href="news_add.aspx?id=<%# Eval("id") %>">修改</a>&nbsp;
                                                    <a href="../../news_<%# Eval("id") %>.htm" target="_blank">查看</a>
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                        <FooterTemplate>
                                            </table>
                                        </FooterTemplate>
                                    </asp:Repeater>
                                </td>
                            </tr>
                            <tr>
                                <td style="height: 36px">
                                    <table border="0" cellpadding="0" cellspacing="0" style="width: 100%">
                                        <tr bgcolor="#E7E7E7">
                                            <td style="width: 10%; height: 28px;">
                                                <input id="chkall" type="checkbox" style="margin-left: 15px;" onclick="CheckAll(this.form)" />全选</td>
                                            <td style="width: 50%; height: 28px;" align="center">
                                                <asp:Button ID="btncheck" runat="server" Text="设为焦点" Height="23px" OnClientClick="return check()"
                                                    OnClick="btncheck_Click" />
                                                    <asp:Button ID="btncancelchk" runat="server" Text="取消焦点" Height="23px" OnClientClick="return check()" OnClick="btncancelchk_Click"
                                                   />
                                                <asp:Button ID="btnrecom" runat="server" Text="设为封面" Height="23px" OnClientClick="return check()"
                                                    OnClick="btnrecom_Click" />
                                                    <asp:Button ID="btncancelrecom" runat="server" Text="取消封面" Height="23px" OnClientClick="return check()" OnClick="btncancelrecom_Click"
                                                    />
                                                <asp:Button ID="btndel" runat="server" Text="删 除" Height="23px" OnClientClick="return check()"
                                                    OnClick="btndel_Click" />
                                            </td>
                                            <td align="right" bgcolor="#E7E7E7" style="color: #000000; height: 28px; width: 50%;">
                                                <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" HorizontalAlign="Right"
                                                    LastPageText="末页" NextPageText="下一页" PageSize="20" PrevPageText="上一页" ShowPageIndexBox="Always"
                                                    SubmitButtonText="转到" OnPageChanged="Pager_PageChanged" AlwaysShow="True">
                                                </webdiyer:AspNetPager>
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
