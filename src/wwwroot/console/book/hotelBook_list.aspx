<%@ Page Language="C#" AutoEventWireup="true" CodeFile="hotelBook_list.aspx.cs" Inherits="console_book_hotelBook_list" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>酒店预定记录列表</title>
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
                                   酒店预定记录列表</td>
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
                                                    <th style="width: 15%">
                                                        酒店名称</th>
                                                     <th style="width: 10%">
                                                        会员</th>
                                                     <th style="width: 15%">
                                                        均价*天数*间数</th>  
                                                    <th style="width: 15%">
                                                        入住时间</th> 
                                                    <th style="width: 5%">
                                                        人数</th>
                                                    <th style="width: 10%">
                                                        电话</th>
                                                    <th style="width: 10%">
                                                        附加说明</th>
                                                    <th style="width:10%">
                                                        时间</th>
                                                    <th style="width: 10%">
                                                        状态</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("bId") %>" />
                                                </td>
                                                <td style=" cursor:hand" >
                                                    <a href="FY_Hotel_add.aspx?id=<%# Eval("hId") %>"><%# Eval("hotelName")%></a>
                                                </td>
                                                <td>
                                                   <a href="personadd.aspx?id=<%# Eval("memberId") %>"><%#DataBinder.Eval(Container.DataItem, "Mem_LoginName")%></a>
                                                </td>
                                                <td>
                                                 <%#Eval("Price")%>*<%#(Convert.ToDateTime(Eval("toDate")) - Convert.ToDateTime(Eval("fromDate"))).Days%>*<%#Eval("roomNum")%>
                                                </td>
                                                <td>
                                                   <%#Convert.ToDateTime(Eval("fromDate")).ToShortDateString()%>至<%#Convert.ToDateTime(Eval("toDate")).ToShortDateString()%> 
                                                </td>
                                                <td>
                                                   <%#Eval("personNum")%>
                                                </td>
                                                <td>
                                                   <%#Eval("booktel")%>
                                                </td>
                                                <td title="<%#Eval("bookinfo")%>">
                                                   <%#eap.share.Sys.truncate(Eval("bookinfo").ToString(),10,"..")%>
                                                </td>
                                                 <td>
                                                   <%#Eval("addtime")%>
                                                </td>
                                                 <td>
                                                    <%#Eval("state").ToString().Trim()=="0"?"未处理":"已处理"%>
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
                                                <asp:Button ID="btncheck" runat="server" Text="设为已处理" Height="23px" OnClientClick="return check()"
                                                    OnClick="btncheck_Click" />
                                                <asp:Button ID="btncancelchk" runat="server" Text="设为未处理" Height="23px" OnClientClick="return check()" OnClick="btncancelchk_Click"
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
