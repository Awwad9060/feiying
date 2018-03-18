<%@ Page Language="C#" AutoEventWireup="true" CodeFile="admin_edit.aspx.cs" Inherits="console_admin_admin_edit" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>管理员修改页-天维网络科技</title>
   <link href="../css/control.css" rel="stylesheet" type="text/css" />
   <script type="text/javascript" language="javascript">
   function check_adminname(adminname)
   {
      var admin_sn= document.getElementById("adminname");
      var res = console_admin_admin_edit.CheckAdminName(adminname).value;
      
      if(adminname!="")
      {
          if(res=="ok")
          {
             admin_sn.innerHTML="<font color='#009900'>该用户名可以使用！</font>";   
          }
          if(res=="false")
          {
            admin_sn.innerHTML="<font color='#FF0000'>该用户名以被占用！</font>";
          }
      }
      else
        admin_sn.innerHTML="<font color='#FF0000'>请输入用户名！</font>";
     
      
   }
   </script>
</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
            <tr>
                <td width="18%" align="center" bgcolor="#799AE1" class="B" >
                    设置名称</td>
                <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 426px">
                
                    基本参数设置</td>
                <td width="21%" align="center" bgcolor="#799AE1" class="B">
                    </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 30px">
                    用户名：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 426px; height: 30px">
                    <asp:TextBox ID="txtadname" runat="server" Width="227px"></asp:TextBox><div id='adminname'></div></td>
                    
                <td bgcolor="#F6F6F6" style="height: 30px">
                  </td>
            </tr>
            <tr runat="server" id="controlright">
                <td align="center" bgcolor="#f6f6f6" style="height: 30px">
                    操作员类型：</td>
                <td align="left" bgcolor="#f6f6f6" style="width: 426px; height: 30px">
                    <select id="sel_admin" runat="server" >
                        <option value="0" selected="selected" >系统管理员</option>
                        <option value="1">普通管理员</option>
                        <option value="2">编辑审核员</option>
                        <option value="3">航司管理员</option>
                        <option value="4">机场管理员</option>
                        <option value="5">机型管理员</option>
                        <option value="6">机票管理员</option>
                        <option value="7">酒店管理员</option>
                        <option value="8">新闻管理员</option>
                        <option value="9">IDS管理员</option>
			            <option value="10">客户维系管理员</option>
                        <option value="11">飞赢圈管理员</option>
                        <option value="12">税费管理员</option>
                    </select>
                    </td>
                <td bgcolor="#f6f6f6" style="height: 30px">
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" id="pwd" runat="server">
                    密码：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 436px">
                    <asp:TextBox ID="txtpwd" runat="server" Width="227px" TextMode="Password"></asp:TextBox>
                    <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" ControlToValidate="txtpwd"
                        ErrorMessage="密码不能为空"></asp:RequiredFieldValidator>
                        <asp:RegularExpressionValidator ID="chack_password" runat="server" Display="Dynamic"
                        ErrorMessage="*请输入6-12位的密码&lt;br/&gt;" ValidationExpression="((\w){6,12})+" ControlToValidate="txtpwd"></asp:RegularExpressionValidator>
                        </td>
                <td bgcolor="#F6F6F6">
                   </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#f6f6f6" style="height: 16px" id="pwd1" runat="server">
                    确认密码：</td>
                <td align="left" bgcolor="#f6f6f6" style="width: 426px; height: 16px">
                    <asp:TextBox ID="txtpwd2" runat="server" Width="227px" TextMode="Password"></asp:TextBox>
                    <asp:CompareValidator ID="CompareValidator1" runat="server" ErrorMessage="您两次输入的密码不一致" ControlToValidate="txtpwd2" ControlToCompare="txtpwd"></asp:CompareValidator>
                    </td>
                <td bgcolor="#f6f6f6" style="height: 16px">
                </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    </td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px; width: 426px;">
                    <asp:Button ID="btnok" runat="server" Text="提  交"  Width="100px" Height="25px" OnClick="btnok_Click"/></td>
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
