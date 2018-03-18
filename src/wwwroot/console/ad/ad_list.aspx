<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_list.aspx.cs" Inherits="console_ad_ad_list" %>

<%@ Register Assembly="AspNetPager" Namespace="Wuqi.Webdiyer" TagPrefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>广告信息</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" src="../js/JScript.js"></script>
    <script language="javascript" type="text/javascript">
       function testChecked()
        {     
           var aa=document.getElementsByName("chk");
             for (var i=0; i<aa.length; i++)
             {
              if(aa[i].checked==true)
               {
                 return confirm("你确定要删除你选择的项吗？");
               }
              }
            
            alert("请选择要删除的项！");
            return false;
       } 
    </script>
</head>
<body>
    <form id="form1" runat="server">
      <input id="hiddenkeep" type="hidden"  name="hiddenkeep"/>
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
                                <td height="25" width="80" style="color: Red;">
                                   广告管理 
                                     </td>
                                     <td>
                                     <input name="Submit3" type="button" style="height:23px" onclick="location.href='ad_add.aspx'" value="添 加" />
                                     </td>
                                     <td align="right">
                                     <input name="Submit3" type="button" style="height:23px" onclick="location.href='top_add.aspx'" value="更新首页TOP底图" />
                                     </td>   
                            </tr>
                        </table>
                   
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width: 100%;">
                                    <asp:DataGrid ID="dgList" AutoGenerateColumns="False" CellPadding="0" CellSpacing="0"
                                        PageSize="15" runat="server" Width="100%" AllowPaging="True" >
                                        <HeaderStyle Height="30px" BackColor="#799AE1" HorizontalAlign="Center" />
                                        <ItemStyle BackColor="#F6F6F6" Height="25px" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="标题">
                                                <ItemTemplate>
                                                    <%# Eval("title")%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="广告">
                                                <ItemTemplate>
                                                <%#Operator_State(Convert.ToInt32(Eval("adKind")), Convert.ToString(Eval("adPath")).ToString())%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                             <asp:TemplateColumn HeaderText="广告位置">
                                                <ItemTemplate>
                                                    <%# Eval("adPosition")%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                             <asp:TemplateColumn HeaderText="广告像素">
                                                <ItemTemplate>
                                                    <%# Eval("adPx")%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                                                                       
                                            <asp:TemplateColumn HeaderText="广告赞助商">
                                                <ItemTemplate>
                                                    <%# Eval("adCompany")%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                            
                                          <asp:TemplateColumn HeaderText="操　　作">
                                                <ItemTemplate>
                                                 <a href="ad_add.aspx?Oper=modify&Id=<%#Eval("id")%>">编辑</a> 
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
                                            
                                            <td align="center" bgcolor="#E7E7E7" style="color: #000000; height: 28px; width: 84%;">
                                                <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" HorizontalAlign="Right"
                                                    LastPageText="末页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowPageIndexBox="Always"
                                                    SubmitButtonText="转到"  AlwaysShow="True">
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
