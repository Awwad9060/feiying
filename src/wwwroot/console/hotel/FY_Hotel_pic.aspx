<%@ Page Language="C#" AutoEventWireup="true" CodeFile="FY_Hotel_pic.aspx.cs" Inherits="cms_hotel_FY_Hotel_pic" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>编辑航空公司内容信息</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
    <script type="text/javascript" language="javascript">   
    function FCKeditor_OnComplete(editorInstance) {
        oEditer = editorInstance;
    }
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
        <asp:HiddenField ID="hidpic1" runat="server" />
        <asp:HiddenField ID="hidpic2" runat="server" />
        <asp:HiddenField ID="hidpic3" runat="server" />
        <asp:HiddenField ID="hidpic4" runat="server" />
        <asp:HiddenField ID="hidpic5" runat="server" />
        <asp:HiddenField ID="hidpic6" runat="server" />
        <asp:HiddenField ID="hidpic7" runat="server" />
        <asp:HiddenField ID="hidpic8" runat="server" />
        <asp:HiddenField ID="hidpic9" runat="server" />
        <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
            <tr>
                <td width="18%" align="center" bgcolor="#799AE1" class="B" >
                    </td>
                <td width="61%" height="25" align="left" bgcolor="#799AE1" class="B">
                     <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td align="center" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro1" runat="server"  Width="80px" Height="60px" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称1： <input  id="txt_hotel1" runat="server" type="text" style="width:230px" /><br />
                图片1：
                 <asp:FileUpload ID="f1" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf1" runat="server" CssClass="cominputssubmit" Text="上传1" OnClick="btnf1_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator_pic1" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f1" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro2" runat="server"  Width="80px" Height="60px"  BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称2： <input  id="txt_hotel2" runat="server" type="text" style="width:230px" /><br />
                图片2：
                 <asp:FileUpload ID="f2" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp; 
                            <asp:Button id="btnf2" runat="server" CssClass="cominputssubmit" Text="上传2" OnClick="btnf2_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator_pic2" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f2" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro3" runat="server"  Width="80px" Height="60px"  BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称3： <input  id="txt_hotel3" runat="server" type="text" style="width:230px" /><br />
                图片3：
                 <asp:FileUpload ID="f3" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf3" runat="server" CssClass="cominputssubmit" Text="上传3" OnClick="btnf3_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator_pic3" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f3" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
               <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro4" runat="server" Width="80px" Height="60px"  BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称4： <input  id="txt_hotel4" runat="server" type="text" style="width:230px" /><br />
                图片4：
                 <asp:FileUpload ID="f4" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf4" runat="server" CssClass="cominputssubmit" Text="上传4" OnClick="btnf4_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator3" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f4" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
               <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro5" runat="server"  Width="80px" Height="60px" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称5： <input  id="txt_hotel5" runat="server" type="text" style="width:230px" /><br />
                图片5：
                 <asp:FileUpload ID="f5" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp; 
                            <asp:Button id="btnf5" runat="server" CssClass="cominputssubmit" Text="上传5" OnClick="btnf5_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator4" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f5" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro6" runat="server"  Width="80px" Height="60px"  BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称6： <input  id="txt_hotel6" runat="server" type="text" style="width:230px" /><br />
                图片6：
                 <asp:FileUpload ID="f6" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp; 
                            <asp:Button id="btnf6" runat="server" CssClass="cominputssubmit" Text="上传6" OnClick="btnf6_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator5" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f6" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro7" runat="server"  Width="80px" Height="60px" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称7： <input  id="txt_hotel7" runat="server" type="text" style="width:230px" /><br />
                图片7：
                 <asp:FileUpload ID="f7" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf7" runat="server" CssClass="cominputssubmit" Text="上传7" OnClick="btnf7_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator6" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f7" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro8" runat="server" Width="80px" Height="60px" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称8： <input  id="txt_hotel8" runat="server" type="text" style="width:230px" /><br />
                图片8：
                 <asp:FileUpload ID="f8" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf8" runat="server" CssClass="cominputssubmit" Text="上传8" OnClick="btnf8_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator7" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f8" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro9" runat="server"  Width="80px" Height="60px" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                名称9： <input  id="txt_hotel9" runat="server" type="text" style="width:230px" /><br />
                图片9：
                 <asp:FileUpload ID="f9" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp; 
                            <asp:Button id="btnf9" runat="server" CssClass="cominputssubmit" Text="上传9" OnClick="btnf9_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator8" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f9" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
           
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    </td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">                    
                    &nbsp;&nbsp; &nbsp;&nbsp; <asp:Button ID="btnSave" runat="server" Text="保 存"  OnClick="btnok_Click"  Height="23"  />&nbsp;&nbsp; &nbsp;&nbsp; 
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='FY_Hotel_list.aspx'" value="返 回" />
                </td>
                <td bgcolor="#F6F6F6" style="height: 27px; width: 253px;">
                    </td>
            </tr>
            <tr>
                <td align="center" colspan="3" style="height: 22px">
                 </td>
            </tr>
        </table>
    </form>
</body>
</html>

