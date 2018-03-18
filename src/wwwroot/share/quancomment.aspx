<%@ Page Language="C#" AutoEventWireup="true" CodeFile="quancomment.aspx.cs" Inherits="share_quancomment" %>

<div class="qiuanadmin_sharetitle"><strong><%=this.repArtComment.Items.Count%>&nbsp;条<%if (quanDetailOne["typeId"].ToString()=="4") %><%{ %>回答<%}else if (quanDetailOne["typeId"].ToString() == "5") %><%{ %>结伴
<%}else{ %>
评论
<%} %>
</strong></div>
<asp:Panel ID="panCommentn" runat="server">
<dl>

 <dd>暂无评论</dd>
</dl>
</asp:Panel>

<asp:Repeater ID="repArtComment" runat="server">
<ItemTemplate>
 <dt><code>[<%#Eval("mem_type")%>]</code><a href="javascript:void(0)" title="" class="bluestr"><%#Eval("loginname") %></a>&nbsp;&nbsp;&nbsp;&nbsp;<%#Eval("addtime")%></dt>
 <dd><%#Eval("comtcontent")%></dd>
</ItemTemplate>
</asp:Repeater>
            
