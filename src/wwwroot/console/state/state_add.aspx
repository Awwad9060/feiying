<%@ Page Language="C#" AutoEventWireup="true" CodeFile="state_add.aspx.cs" Inherits="console_state_state_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>编辑大洲信息</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" language="javascript">
    function checkInfo()
    { 
       if(document.getElementById("txt_enName").value=="")
       {
          alert("大洲英文名称不能为空！");
          document.getElementById("txt_enName").focus();
          return false;
       }
      if(document.getElementById("txt_chName").value=="")
       {
          alert("大洲中文名称不能为空！");
          document.getElementById("txt_chName").focus();
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
                    英文名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <input  id="txt_enName" runat="server" type="text" size="58" /></td>
                <td bgcolor="#F6F6F6">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6">
                    中文名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <input  id="txt_chName" runat="server" type="text" size="58" /></td>
                <td bgcolor="#F6F6F6">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    </td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                   
                </td>
                <td bgcolor="#F6F6F6" style="height: 27px">
                   </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    </td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">                    
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  OnClientClick="return checkInfo()"
                    Height="23" OnClick="btnSave_Click" />
                 <input name="Submit3" type="button" onclick="location.href='bigclass_list.aspx'" value="返 回"  style="height:23px;"/>
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
