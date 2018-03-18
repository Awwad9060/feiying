<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prizes_list.aspx.cs" Inherits="console_prizes_prizes_list" %>
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
                                   兑换奖品管理</td>
                            </tr>
                        </table>
                        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
                            <tr>
                                <td align="right" style="width:100%; height: 25px;">
                                    <input name="Submit3" type="button" style="height:23px"  id="add" onclick="location.href='prizes_add.aspx'" value="添加奖品" />
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
                                                     
                                                    <th style="width: 15%">奖品缩略图</th>
                                                    <th style="width: 20%">
                                                        奖品名称</th>
                                                         <th style="width: 10%">
                                                        类别</th> 
                                                        <th style="width: 10%">
                                                        兑换积分</th>
                                                        <th style="width: 10%">
                                                        抽奖积分</th>
                                                       
                                                        <th style="width: 10%">
                                                        兑换次数</th>
    
                                                
                                                    <th style="width: 10%">
                                                        操作</th>
                                                </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("pId") %>" />
                                                </td>
                                              <td><img src="../../<%#DataBinder.Eval(Container.DataItem, "picPath")%>" alt="" width="120" height="100" /></td>
                                                 
                                                <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "pName")%>  
                                                </td>
                                                 
                                                <td>
                                                   <%#getTypeName(Eval("type").ToString())%> 
                                                </td>
                                                   <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "needScore")%>  
                                                </td>
                                                  <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "lotteryScore")%>  
                                                </td>
                                                   <td>
                                                   <%#DataBinder.Eval(Container.DataItem, "getNum")%>  
                                                </td>
                                             
                                                 <td>
                                                  <a style="color:Red" href="../../prizesDetail.aspx?pId=<%# Eval("pId") %>" target="_blank">预览</a>
                                                  
                                                   <a style="color:Red" href="prizes_add.aspx?id=<%# Eval("pId") %>">修改</a>
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