<%@ Page Language="C#" AutoEventWireup="true" CodeFile="state_list.aspx.cs" Inherits="console_state_state_list" %>
<%@ Register assembly="AspNetPager" namespace="Wuqi.Webdiyer" tagprefix="webdiyer" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
<title>大洲列表信息</title>
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
             return confirm("你确定要删除你选择的项吗？确定将同时删除出发、到达城市内容！");
           }
          }
        
        alert("请选择要删除的项！");
        return false;
   } 

       
  </script>
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
                                <td height="25"  width="150"  style="color:Red;">大洲信息管理</td>    
                            </tr>
                        </table>
                        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
                            <tr>
                               <td colspan="2"   align="right" valign="middle" class="Enquiries" >
                                   <input name="Submit3" type="button" style="height:23px"  id="add" runat="server" onclick="location.href='state_add.aspx'" value="添 加" />
                                    &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp; &nbsp;&nbsp;
                                </td>
                            </tr>
                        </table>
                        <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width:100%;">
                                    <asp:DataGrid ID="dgList" AutoGenerateColumns="False" CellPadding="0" CellSpacing="0"
                                        PageSize="15" runat="server" Width="100%" AllowPaging="True">
                                        <HeaderStyle Height="30px" BackColor="#799AE1" HorizontalAlign="Center" />
                                        <ItemStyle BackColor="#F6F6F6" Height="25px" HorizontalAlign="Center" />
                                        <Columns>
                                            <asp:TemplateColumn HeaderText="选   择">
                                                <ItemTemplate>
                                                    <input id="chk" name="chk" type="checkbox" style="border: 0" value="<%# Eval("sId") %>" />
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="大洲中文名称">
                                                <ItemTemplate>
                                                    <%# Eval("chName")%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                            <asp:TemplateColumn HeaderText="大洲英文名称">
                                                <ItemTemplate>
                                                    <%# Eval("enName")%>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                             <asp:TemplateColumn HeaderText="所属出发城市">
                                                <ItemTemplate>
                                                 <a href="fromCity_list.aspx?bId=<%#Eval("sId")%>" style="color:Red;">
                                                        所属出发城市
                                                    </a>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>
                                              <asp:TemplateColumn HeaderText="所属到达城市">
                                                <ItemTemplate>
                                                 <a href="toCity_list.aspx?bId=<%#Eval("sId")%>" style="color:Red;">
                                                        所属到达城市
                                                    </a>
                                                </ItemTemplate>
                                                <HeaderStyle CssClass="B" />
                                            </asp:TemplateColumn>                                                            
                                            <asp:TemplateColumn HeaderText="操　　作">
                                                <ItemTemplate>
                                                    <%# Operator_State(Convert.ToInt32(Eval("sId")))%>
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
                                        <td style="width:12%; height: 28px;" align="center"><input id="chkall" type="checkbox" style="margin-left:15px;" onclick="CheckAll(this.form)"/>全选</td>
                                        <td style="width:18%; height: 28px;">
                                        <asp:Button ID="btndel" runat="server" Height="23" Text="删 除" OnClientClick="return testChecked()" OnClick="btndel_Click" /></td>
                                            <td align="right" bgcolor="#E7E7E7" style="color: #000000; height: 28px; width:70%;">
                                              <webdiyer:AspNetPager ID="Pager" runat="server" FirstPageText="首页" HorizontalAlign="Right"
                                          LastPageText="末页" NextPageText="下一页" PageSize="10" PrevPageText="上一页" ShowPageIndexBox="Always" SubmitButtonText="转到" OnPageChanged="Pager_PageChanged">
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
