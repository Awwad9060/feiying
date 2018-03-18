<%@ Page Language="C#" AutoEventWireup="true" CodeFile="toCity_add.aspx.cs" Inherits="console_state_toCity_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>编辑到达城市信息</title>
       <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
      if(document.getElementById("txt_cityCode").value=="")
       {
          alert("到达城市三字码不能为空！");
          document.getElementById("txt_cityCode").focus();
          return false;
       }
        if(document.getElementById("txt_enName").value=="")
       {
          alert("到达城市英文名称不能为空！");
          document.getElementById("txt_enName").focus();
          return false;
       } 
       if(document.getElementById("txt_chName").value=="")
       {
          alert("到达城市中文名称不能为空！");
          document.getElementById("txt_chName").focus();
          return false;
       }  
       
        var drpsort=document.getElementById('<%=DropDownList1.ClientID %>');
       
        if(drpsort.options.length==0)
        {
          alert("所属大洲不能为空！");
          return false;
          
        }
       return true;         
    }
   
    </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
            <tr>
                <td width="18%" align="center" bgcolor="#799AE1" class="B" >
                    </td>
                <td width="61%" height="25" align="left" bgcolor="#799AE1" class="B">
                    <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td width="21%" align="center" bgcolor="#799AE1" class="B">
                    </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    到达城市三字码：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <input  id="txt_cityCode" runat="server" type="text" size="58" /></td>
                <td bgcolor="#F6F6F6">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6">
                    到达城市中文名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <input  id="txt_chName" runat="server" type="text" size="58" /></td>
                <td bgcolor="#F6F6F6">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    到达城市英文名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <input  id="txt_enName" runat="server" type="text" size="58" /></td>
                <td bgcolor="#F6F6F6">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    所属大洲：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                   <asp:DropDownList ID="DropDownList1" runat="server" >
                   </asp:DropDownList></td>
                <td bgcolor="#F6F6F6">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    </td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                   
                </td>
                <td bgcolor="#F6F6F6">
                   </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    </td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">                    
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  OnClientClick="return checkInfo()"
                     Height="23" OnClick="btnSave_Click" />
                 <input name="Submit3" type="button" onclick="location.href='toCity_list.aspx'" value="返 回"    style="height: 23px;"/>
                </td>
                <td bgcolor="#F6F6F6" style="height: 27px">
                    </td>
            </tr>
            <tr>
                <td align="center" colspan="3">
                 </td>
            </tr>
        </table>
    </form>
</body>
</html>
