<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ad_add.aspx.cs" Inherits="console_ad_ad_add" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>编辑航空公司内容信息</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
    <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
      if(document.getElementById("txtadPosition").value=="")
       {
          alert("广告位置不能为空！");
          return false;
       }       
     
       if(document.getElementById("txtadPx").value=="")
       {
          alert("广告像素不能为空！");
          return false;
        }
  
  
       return true; 
             
    }
    
     //检测图片后缀名
    function CheckFile(sender,arg)
    {
        var enableExt =["jpg","gif","bmp","png","swf"]; // add your enable extension on that
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
                <td align="center" bgcolor="#F6F6F6">
                    位置：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
               <input name="textfield23" id="txtadPosition" runat="server" type="text" size="58" />&nbsp;&nbsp;
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    是否打开：</td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                    &nbsp;&nbsp;<asp:RadioButton ID="yDisplay"  runat="server" GroupName="isDisplay" Text="打开" />
                    <asp:RadioButton ID="nDisplay" runat="server" GroupName="isDisplay" Text="关闭" /></td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 27px;">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    标题：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
               <input  id="txt_title" runat="server" type="text" size="58" />&nbsp;&nbsp;
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    LinkUrl：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
               <input name="textfield23" id="txt_linkUrl" runat="server" type="text" size="58" />&nbsp;&nbsp;
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            <tr>
                <td align="center" bgcolor="#f6f6f6">
                    像素：</td>
                <td align="left" bgcolor="#f6f6f6" height="25">
                    <asp:TextBox ID="txtadPx" runat="server" Width="250px"></asp:TextBox>
                    (如 300*300)
                </td>
                <td bgcolor="#f6f6f6" style="width: 253px">
                </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    类型：</td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                    &nbsp;&nbsp;<asp:RadioButton ID="yFlash"  runat="server" GroupName="isFlash" Text="Flash" />
                    <asp:RadioButton ID="nFlash" runat="server" GroupName="isFlash" Text="图片" /></td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 27px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    广告图片：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic" runat="server" Text=""></asp:Label>
	  	               <input id="isReload" type="hidden" runat="server" value="0" />
	  	               <input id="oldPic" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            
               <tr id="picUpload" >
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    上传广告：</td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                 <asp:FileUpload ID="FileUpload_adPath" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator_pic" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_adPath" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png , swf 等格式文件"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px; height: 27px;">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    赞助商：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <input  id="txtadCompany" runat="server" type="text" size="58" /></td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>        
         
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    说明：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                   <asp:TextBox ID="txtadDetail" runat="server" TextMode="MultiLine"　Width="450px" Height="60px"></asp:TextBox></td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
           
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkInfo()"
                      OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
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

