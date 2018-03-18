<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticketBook2_list2.aspx.cs" Inherits="console_book_ticketBook2_list2" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>手机网站机票预定记录列表</title>
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
                                   手机网站机票预定列表</td>
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
                                                     <th style="width: 6%">
                                                        姓名</th>
                                                    <th style="width: 8%">
                                                        出发</th> 
                                                    <th style="width: 8%">
                                                        回程</th>
                                                     <th style="width: 8%">
                                                        联系电话</th>
                                                     <th style="width:4%">
                                                        数量</th>   
                                                    <th style="width: 8%">
                                                        备注</th>
                                                    <th style="width:12%">
                                                        时间</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("bId") %>" />
                                                </td>
                                                <td>
                                                    [<%#Eval("tripType") %>]<%#Eval("fromcityName") %>-<%#Eval("tocityName") %>[￥<%#Eval("price") %>]
                                                </td>
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "name")%>
                                                </td>
                                                <td>
                                                   <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "tripDate")).ToShortDateString()%> 
                                                </td>
                                                 <td>
                                                   <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "backDate")).ToShortDateString()%> 
                                                </td>
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "telephone")%>
                                                </td>
                                                <td>
                                                 <%#DataBinder.Eval(Container.DataItem, "num")%>
                                                </td>
                                                 <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "otherMess")%>
                                                </td>
                                                 <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "bookDate")%>
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
                                            </td>
                                            <td  style="width: 42%; height: 28px;" align="left">
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
