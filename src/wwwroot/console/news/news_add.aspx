<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_add.aspx.cs" Inherits="cms_news_news_add" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>新闻资讯内容信息</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
    <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
      if(document.getElementById("name").value=="")
       {
          alert("资讯标题不能为空！");
          return false;
       }       
      if(document.getElementById("type").value=="")
       {
          alert("资讯来源不能为空！");
          return false;
       }
       return true; 
             
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
                    标题：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
               <input  id="title" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    类型：</td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                     <select id="type" runat="server">
                         <option value="">请选择类型</option>
                         <option value="1">旅游资讯</option>
                         <option value="2">民航新闻</option>
                         <option value="3">业界动态</option>
                         <option value="4">机场新闻</option>
                         <option value="5">出行智囊</option>
                         <option value="6">旅行日记</option>
                         <option value="7">酒店快讯</option>
                         <option value="8">航空快讯</option>
                    </select></td>
                <td bgcolor="#F6F6F6" style="height: 27px; width: 253px;">
                  </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    来源：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <input  id="from" value="飞瀛网" runat="server" type="text" size="58" /></td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                    新闻图片：</td>
                <td align="left" bgcolor="#F6F6F6" style="width: 839px; height: 30px">
                <asp:Label ID="isUploadPic" runat="server" Text=""></asp:Label>
	  	               <input id="isReload" type="hidden" runat="server" value="0" />
	  	               <input id="oldPic" type="hidden" runat="server" value="" />
                    </td>
                <td bgcolor="#F6F6F6" style="width: 253px; height: 30px;">
                  </td>
            </tr>
            <tr id="picUpload" >
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    图片路径：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                 <asp:FileUpload ID="FileUpload_picPath" runat="server" Width="285px" />
            <label>
          &nbsp;</label><asp:CustomValidator ID="CustomValidator_pic" runat="server" 
                ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath" 
                Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg , gif , bmp , png 等图片格式"></asp:CustomValidator>   </td>       
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>             

            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                    焦点推荐：</td>
                <td align="left" bgcolor="#F6F6F6" style="height: 27px">
                    <asp:RadioButton ID="radisTop1" runat="server" GroupName="isTopp" Text="是"/>
                    &nbsp;&nbsp; &nbsp;&nbsp;               
                    <asp:RadioButton ID="radisTop0" runat="server" GroupName="isTopp" Text="否" Checked="True" /> </td>
                <td bgcolor="#F6F6F6" style="height: 27px; width: 253px;">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6">
                    封面推荐：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                    <asp:RadioButton ID="radisRecom1" runat="server" GroupName="isRecomm" Text="是"  />
                    &nbsp;&nbsp; &nbsp;&nbsp;               
                    <asp:RadioButton ID="radisRecom0" runat="server" GroupName="isRecomm" Text="否" Checked="True"/> </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>  
             <tr>
                <td align="center" bgcolor="#F6F6F6">
                    点击量：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
               <input  id="hits" value="0" runat="server" type="text" size="58" disabled="disabled" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6">
                    资讯内容：</td>
                <td height="25" align="left" bgcolor="#F6F6F6">
                   <FCKeditorV2:FCKeditor id="FCKeditor1" BasePath="../../tools/fckeditor/"  
                  Height="500" 
                  Width="700"  runat="server">
              </FCKeditorV2:FCKeditor>              
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>        
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkInfo()"
                      OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='news_list.aspx'" value="返 回" />
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
