<%@ Page Language="C#" AutoEventWireup="true" CodeFile="airline_pic.aspx.cs" Inherits="cms_airline_airline_pic" %>
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
      if(document.getElementById("txt_airCode").value=="")
       {
          alert("航空公司代码不能为空！");
          return false;
       }       
      if(document.getElementById("txt_enName").value=="")
       {
          alert("英文名称不能为空！");
          return false;
       }
       if(document.getElementById("txt_chName").value=="")
       {
          alert("中文名称不能为空！");
          return false;
       }
       if(document.getElementById("txt_nation").value=="")
       {
          alert("所属国家不能为空！");
          return false;
       }
       return true; 
             
    }
    
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
        <asp:HiddenField ID="hidpic10" runat="server" />
        <asp:HiddenField ID="hidpic11" runat="server" />
        <asp:HiddenField ID="hidpic12" runat="server" />
        <asp:HiddenField ID="hidpic13" runat="server" />
        <asp:HiddenField ID="hidpic14" runat="server" />
        <asp:HiddenField ID="hidpic15" runat="server" />
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
                    <asp:Image ID="imgpro1" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型1： <input  id="txt_air1" runat="server" type="text" style="width:230px" />&nbsp;*形象机款<br />
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
                    <asp:Image ID="imgpro2" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型2： <input  id="txt_air2" runat="server" type="text" style="width:230px" /><br />
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
                    <asp:Image ID="imgpro3" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型3： <input  id="txt_air3" runat="server" type="text" style="width:230px" /><br />
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
                    <asp:Image ID="imgpro4" runat="server" Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型4： <input  id="txt_air4" runat="server" type="text" style="width:230px" /><br />
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
                    <asp:Image ID="imgpro5" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型5： <input  id="txt_air5" runat="server" type="text" style="width:230px" /><br />
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
                    <asp:Image ID="imgpro6" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型6： <input  id="txt_air6" runat="server" type="text" style="width:230px" /><br />
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
                    <asp:Image ID="imgpro7" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型7： <input  id="txt_air7" runat="server" type="text" style="width:230px" /><br />
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
                    <asp:Image ID="imgpro8" runat="server" Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型8： <input  id="txt_air8" runat="server" type="text" style="width:230px" /><br />
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
                    <asp:Image ID="imgpro9" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型9： <input  id="txt_air9" runat="server" type="text" style="width:230px" /><br />
                图片9：
                 <asp:FileUpload ID="f9" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp; 
                            <asp:Button id="btnf9" runat="server" CssClass="cominputssubmit" Text="上传9" OnClick="btnf9_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator8" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f9" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro10" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型10： <input  id="txt_air10" runat="server" type="text" style="width:230px" /><br />
                图片10：
                 <asp:FileUpload ID="f10" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf10" runat="server" CssClass="cominputssubmit" Text="上传10" OnClick="btnf10_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator9" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f10" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro11" runat="server" Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型11： <input  id="txt_air11" runat="server" type="text" style="width:230px" /><br />
                图片11：
                 <asp:FileUpload ID="f11" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf11" runat="server" CssClass="cominputssubmit" Text="上传11" OnClick="btnf11_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator10" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f11" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro12" runat="server" Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型12： <input  id="txt_air12" runat="server" type="text" style="width:230px" /><br />
                图片12：
                 <asp:FileUpload ID="f12" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf12" runat="server" CssClass="cominputssubmit" Text="上传12" OnClick="btnf12_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator11" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f12" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro13" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型13： <input  id="txt_air13" runat="server" type="text" style="width:230px" /><br />
                图片13：
                 <asp:FileUpload ID="f13" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf13" runat="server" CssClass="cominputssubmit" Text="上传13" OnClick="btnf13_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator12" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f13" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro14" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型14： <input  id="txt_air14" runat="server" type="text" style="width:230px" /><br />
                图片14：
                 <asp:FileUpload ID="f14" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf14" runat="server" CssClass="cominputssubmit" Text="上传14" OnClick="btnf14_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator13" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f14" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr >
                <td align="center" bgcolor="#F6F6F6"height="25">
                    <asp:Image ID="imgpro15" runat="server"  Width="80px" Height="60px" ImageUrl="images/defaultimg.jpg" BorderStyle="Solid" BorderColor="#B0B0B0" BorderWidth="1px"/></td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                机型15： <input  id="txt_air15" runat="server" type="text" style="width:230px" /><br />
                图片15：
                 <asp:FileUpload ID="f15" runat="server"  Height="21px" Width="300px"/>&nbsp;&nbsp;  
                            <asp:Button id="btnf15" runat="server" CssClass="cominputssubmit" Text="上传15" OnClick="btnf15_Click" ></asp:Button>   
                            <asp:CustomValidator ID="CustomValidator14" runat="server" ClientValidationFunction="CheckFile"
                                    ControlToValidate="f15" Display="Dynamic" ErrorMessage="* 只支持 jpg,gif,bmp等图片格式"></asp:CustomValidator>&nbsp;  
                  </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
           
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    </td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">                    
                    &nbsp;&nbsp; &nbsp;&nbsp; <asp:Button ID="btnSave" runat="server" Text="保 存" OnClientClick="return checkInfo();" OnClick="btnok_Click"  Height="23"  />&nbsp;&nbsp; &nbsp;&nbsp; 
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='airline_list.aspx'" value="返 回" />
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

