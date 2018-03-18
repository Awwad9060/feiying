<%@ Page Language="C#" AutoEventWireup="true" CodeFile="templet_add.aspx.cs" Inherits="cms_templet_add"  ValidateRequest="false"%>
<%@ Import Namespace="System"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>编辑资讯模版信息</title>
      <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" language="javascript">
    //保存时检查 javascript:window.history.back();
        
   function checkInfo()
    { 
      if(document.getElementById("txttpName").value=="")
       {
          alert("资讯模版名不能为空！");
          return false;
       }  
       
     if(document.getElementById("txtmodel").value=="")
       {
          alert("资讯模版内容不能为空！");
          return false;
       } 
          
//      var oEditor = FCKeditorAPI.GetInstance('FCKeditor1') ;
//     
//        var diaryContent = oEditor.GetXHTML();      
//       
//        if(trim(diaryContent)=="")
//        {
//            alert('文章模版内容不能为空');
//            oEditor.Focus();
//            return false;
//        }
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
                    资讯模版名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <input name="textfield23" id="txttpName" runat="server" type="text" size="58" /></td>
                <td bgcolor="#F6F6F6">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6">
                    资讯模版内容：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <asp:TextBox ID="txtmodel" runat="server" TextMode="MultiLine" Width="700" Height="600"></asp:TextBox></td>
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
                 <input name="Submit3" type="button" onclick="location.href='templet_list.aspx'" value="返 回"                                    style="height: 22px;"/>
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
