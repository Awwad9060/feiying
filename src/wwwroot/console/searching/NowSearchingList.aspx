<%@ Page Language="C#" AutoEventWireup="true" CodeFile="NowSearchingList.aspx.cs" Inherits="NowSearchingList" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" src="../js/JScript.js"></script>
    <script type="text/javascript" language="javascript">
        function topById(id) {
            var topId = document.getElementById("topId");
            topId.value = id;
            var btnTop = document.getElementById("btnTop");
            btnTop.click();
        }
    </script>
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
                                   大家正在查</td>
                            </tr>
                        </table>
                        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
                            <tr>
                                <td align="right" style="width:100%; height: 25px; padding-right:10px;">
                                    <input name="Submit3" type="button" style="height:23px"  id="add" onclick="location.href='NowSearchingAdd.aspx'" value="添加数据" />
                                    <input id="topId" runat="server" type="hidden" />
                                    <asp:Button ID="btnTop" runat="server" OnClick="btnTop_Click" Width="0px" />
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
                                                    <th style="width: 3%">
                                                     
                                                    <th style="width: 10%">航线类型</th>
                                                    <th style="width: 15%">
                                                        出发城市</th>
                                                        <th style="width: 15%">
                                                        到达城市</th>
                                                     <%--<th style="width: 10%">
                                                        日期</th>--%>
                                                     <th style="width: 10%">
                                                        航向</th>
                                                     <th style="width: 15%">
                                                        航空公司</th>
                                                    <th style="width: 15%">
                                                        价格</th>
                                                    <th style="width: 7%">
                                                        操作</th>
                                                    <th style="width: 7%">
                                                        置顶</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("id") %>" />
                                                </td>
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "lineType")%>  
                                                </td>
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "fromCity")%>  
                                                </td>
                                                   <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "toCity")%>  
                                                </td>
                                                 
                                                 <%--<td>
                                                   <%#((DateTime)DataBinder.Eval(Container.DataItem, "flyDate")).ToString("yyyy-MM-dd")%> 
                                                </td>--%>
                                                
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "toward")%> 
                                                </td>
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "airline")%> 
                                                </td>
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "price")%> 
                                                </td>
                                                 <td>
                                                   <a style="color:Red" href="NowSearchingAdd.aspx?id=<%# Eval("id") %>">修改</a>
                                                </td>
                                                 <td>
                                                   <input type="button" value="置顶" onclick="topById('<%# Eval("id") %>')" />
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
                                            <td style="width: 8%; height: 28px;">
                                                <input id="chkall" type="checkbox" style="margin-left: 15px;" onclick="CheckAll(this.form)" />全选</td>
                                            <td  style="width: 42%; height: 28px;" align="left">
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
        </table>
    </form>
</body>
</html>