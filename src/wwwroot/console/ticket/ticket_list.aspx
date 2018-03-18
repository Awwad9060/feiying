<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticket_list.aspx.cs" Inherits="console_airline_airline_list" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>机票列表信息</title>
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
                                   机票列表信息管理</td>
                            </tr>
                        </table>
                        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
                            <tr>
                                
                                <td style="width: 37%; height: 25px;" align="left">
                                     &nbsp;出发城市： <asp:DropDownList ID="fromCity" runat="server" >
                                                </asp:DropDownList>
                                    目的城市：<input id="tocitytxt" type="text" runat="server" style="width:70px; height: 15px;" />
                                </td>
                                <td style="width:35%; height: 25px;">
                                    航空公司：<input id="airlinetxt" type="text" runat="server" style="width:90px; height: 15px;" />
                                              &nbsp;
                                              <select name="orderFiled" id="orderFiled" runat="server" >
                                              <option value="0">按ID排序</option>
                                              <option value="1">价格低到高</option>
                                              <option value="2">价格高到低</option>
                                              </select>
                                </td>
                                <td>
                                    未过期：<input id="che_pastdue" runat="server" type="checkbox" />
                                </td>
                                <td align="left" style="width:15%; height: 25px;">
                                    <asp:Button ID="btnsearch" runat="server" Text="查询" Height="23" OnClick="btnsearch_Click"></asp:Button>
                                    <input name="Submit3" type="button" style="height:23px"  id="add" runat="server" onclick="location.href='ticket_add.aspx'" value="添加" />
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
                                                    <th style="width: 12%">
                                                        航程</th>
                                                     <th style="width: 5%">
                                                        行程</th>
                                                    <th style="width: 10%">
                                                        航空公司</th>
                                                     <th style="width: 8%">
                                                        客票类型</th>
                                                     <th style="width: 8%">
                                                        开始时间</th>   
                                                    <th style="width: 8%">
                                                        结束时间</th> 
                                                    <th style="width: 6%">
                                                        价格</th>
                                                    <th style="width: 8%">
                                                        最长停留</th>
                                                    <th style="width: 8%">
                                                        操作</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("tId") %>" />
                                                </td>
                                                <td>
                                                   <%#getColorTicktName(Eval("fromCityname").ToString(), Eval("toCityname").ToString(), Convert.ToInt32(Eval("isChear")), Convert.ToInt32(Eval("isRecom")))%>
                                                </td>
                                                <td>
                                                    <%#(Eval("tripType").ToString()=="1")?"往返":"单程"%>
                                                </td>
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "airname")%>
                                                </td>
                                                <td>
                                                 <%#DataBinder.Eval(Container.DataItem, "engerTicket")%>
                                                </td>
                                                <td>
                                                   <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "fromsaleDate")).ToShortDateString()%> 
                                                </td>
                                                 <td>
                                                   <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "tosaleDate")).ToShortDateString()%> 
                                                </td>
                                                 <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "untaxPrice")%> 
                                                </td>
                                                 <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "longstayDate")%>天
                                                </td>
                                                 <td>
                                                  <a style="color:blue" href="../../ticket_<%# Eval("tId") %>.htm" target="_blank">预览</a>&nbsp;&nbsp;
                                                
                                                   <a style="color:Red" href="ticket_add.aspx?id=<%# Eval("tId") %>">修改</a>
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
