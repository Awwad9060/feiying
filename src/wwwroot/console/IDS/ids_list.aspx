<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ids_list.aspx.cs" Inherits="console_IDS_ids_list" %>
<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
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
                                   IDS服务管理</td>
                            </tr>
                        </table>
                          <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
                            <tr><td style="width: 45%; height: 25px;" align="left">
                                    出发城市： <asp:DropDownList ID="fromCity" runat="server" >
                                                </asp:DropDownList>
                                    
                                    目的城市：<input id="tocitytxt" type="text" runat="server" style="width:90px; height: 15px;" />
                                </td>
                               
                                <td align="left" style="width:20%; height: 25px;">
                                    <asp:Button ID="btnsearch" runat="server" Text="查   询" Height="23" OnClick="btnsearch_Click">
                                    </asp:Button>
                                       <input name="Submit3" type="button" style="height:23px"  id="Button1" onclick="location.href='ids_add.aspx'" value="添加IDS服务" />
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
                                                     
                                                    <th style="width: 20%">航线</th>
                                                    <th style="width: 25%">
                                                        年份</th>
                                                        <th style="width: 15%">
                                                        平均价格</th>
                                                     <th style="width: 10%">
                                                        热卖度</th>
                                                     <th style="width: 10%">
                                                        满意度</th>
                                                        
                                                    <th style="width: 10%">
                                                        查看</th>
                                                    <th style="width: 10%">
                                                        操作</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("iId") %>" />
                                                </td>
                                               <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "fromCityName")%> -   <%#DataBinder.Eval(Container.DataItem, "toCityName")%>
                                                </td>
                                                   <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "idsYear")%>  
                                                </td>
                                                 
                                                 <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "idsPrice")%> 
                                                </td>
                                                
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "remai")%> 
                                                </td>
                                                 <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "manyi")%> 
                                                </td>
                                                 <td>
                                                  <a style="color:blue" href="../../IDS.aspx?fromcity=<%#DataBinder.Eval(Container.DataItem, "fromCityName")%>&tocity=<%#DataBinder.Eval(Container.DataItem, "toCityName")%>&year=<%#DataBinder.Eval(Container.DataItem, "idsYear")%>" target="_blank">预览</a>
                                                </td>
                                                 <td>
                                                   <a style="color:Red" href="ids_add.aspx?id=<%# Eval("iId") %>">修改</a>
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