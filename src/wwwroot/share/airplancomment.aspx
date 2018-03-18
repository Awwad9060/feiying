<%@ Page Language="C#" AutoEventWireup="true" CodeFile="airplancomment.aspx.cs" Inherits="share_airplancomment" %>
<asp:Panel ID="panCommentn" runat="server">
<li class="one">目前未有评论...</li>
</asp:Panel>
<asp:Panel ID="panCommenty" runat="server">
<li class="one">目前有<b><%=this.repNewsComment.Items.Count%></b>评论...</li>
</asp:Panel>
<asp:Repeater ID="repNewsComment" runat="server">
<ItemTemplate>
<li>
<dl>
 <dt><code style="color:#419C01;" >[<%#Eval("mem_type")%>]</code><%#Eval("name")%>&nbsp;&nbsp;&nbsp;&nbsp;<%#Eval("addtime")%></dt>
 <dd><%#Eval("comtcontent") %></dd>
</dl>
</li>
</ItemTemplate>
</asp:Repeater>