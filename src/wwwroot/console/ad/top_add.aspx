<%@ Page Language="C#" AutoEventWireup="true" CodeFile="top_add.aspx.cs" Inherits="console_ad_top_add" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>编辑首页头部底图内容信息</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script type="text/javascript" src="../js/JScript.js"></script>
     <script type="text/javascript" language="javascript">
     //检测图片后缀名
    function CheckFile(sender,arg)
    {
        var enableExt =["jpg","gif","bmp","png"]; // add your enable extension on that
        if (arg.Value=="")
        {
            arg.IsValid =true;
        }
        else
        {
            var temp = arg.Value.split(".");
            var extension = temp[temp.length-1];
            extension = extension.toLowerCase();
            var isValid = false;
            
            for(i=0;i<enableExt.length;i++)
            {
               if (extension==enableExt[i])
               {
                    isValid=true;
               }
            }
            arg.IsValid = isValid;
        }
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
                <td align="center" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    首页TOP底图：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                 <asp:Image ID="img_top" runat="server" Width="200px" Height="80px" />
                &nbsp;像素1000*120
                </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
               <tr id="picUpload" >
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    替换图片：</td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                 <asp:FileUpload ID="FileUpload_adPath" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator_pic" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_adPath" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png等格式文件"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px; height: 27px;">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                 <asp:Button ID="btnSave" runat="server" Text="替 换"  Height="23" OnClientClick="return isConFirm()" OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='ad_list.aspx'" value="返 回" />
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

