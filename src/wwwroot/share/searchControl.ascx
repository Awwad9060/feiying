<%@ Control Language="C#" AutoEventWireup="true" CodeFile="searchControl.ascx.cs" Inherits="share_searchControl" %>
<script type="text/javascript">
    function buttSearchNews() {
        var v = $("#SearchControl1_searchkey").val();
        if ($.trim(v) == '搜索旅行攻略') v = '';
        var url="/searchQuan.aspx?typeId=0&key=" + escape(v);
        window.location.href=url;
    }
</script>
<div class="menu_rightinput">
    <input id="searchkey" onfocus="searchkeyfocus()" onblur="searchkeyblur()" value="搜索旅行攻略"  type="text" runat="server" class="headerinput serchcolor" />
    <input id="buttSearch" runat="server" type="button" class="heaersubmit" value="" onclick="buttSearchNews()" />
</div>