<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prizes_order.aspx.cs" Inherits="console_prizes_prizes_order" %>
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
                                   奖品兑换管理</td>
                            </tr>
                        </table>
                        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
                            <tr>
                                <td align="right" style="width:100%; height: 25px;">
                                  &nbsp;
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
                                                     
                                                    <th style="width: 15%">奖品名称</th>
                                                    <th style="width: 10%">
                                                        获得方式</th>
                                                         <th style="width: 10%">
                                                        用户</th> 
                                                        <th style="width: 10%">
                                                        时间</th>
                                                       <th style="width: 10%">
                                                        联系人</th>
                                                         <th style="width: 10%">
                                                        地址</th> 
                                                           <th style="width: 10%">
                                                        邮编</th> 
                                                          <th style="width: 10%">
                                                        电话</th> 
                                                         <th style="width: 10%">
                                                        寄出</th> 
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("oId") %>" />
                                                </td>
                                              
                                                <td>
                                                   <a href="../../prizesDetail.aspx?pId=<%# Eval("pId") %>" target="_blank"><%#DataBinder.Eval(Container.DataItem, "pName")%></a>  
                                                </td>
                                    
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "method")%>
                                                </td>
                                                
                                                  <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "addMember")%>  
                                                </td>
                                                
                                                   <td>
                                                   <%#Convert.ToDateTime(DataBinder.Eval(Container.DataItem, "addTime")).ToShortDateString()%>  
                                                </td>
                                                
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "linkNan")%>  
                                                </td>
                                                
                                                 <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "linkAddress")%>  
                                                </td>
                                                
                                                
                                                 <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "linkCode")%>  
                                                </td>
                                                
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "linkTel")%>  
                                                </td>
                                                
                                                 <td>
                                                   <%#(Eval("status").ToString()=="1")?"已寄出":"未寄出" %> 
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
                                            
                                            <asp:Button ID="checkBut" runat="server" Text="已寄出" Height="23px" OnClientClick="return check()"
                                                    OnClick="checkBut_Click" />
                                                 
                                                 <asp:Button ID="uncheckBut" runat="server" Text="未寄出" Height="23px" OnClientClick="return check()"
                                                    OnClick="uncheckBut_Click" />
                                                    
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