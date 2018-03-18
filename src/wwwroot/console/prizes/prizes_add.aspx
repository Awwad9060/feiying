<%@ Page Language="C#" AutoEventWireup="true" CodeFile="prizes_add.aspx.cs" Inherits="console_prizes_prizes_add" %>
<%@ Register assembly="FredCK.FCKeditorV2" namespace="FredCK.FCKeditorV2" tagprefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
      if(document.getElementById("txt_pName").value=="")
       {
          alert("名称不能为空！");
          return false;
       }    
       
       
       if(document.getElementById("type").value=="")
       {
          alert("请选择类别！");
          return false;
       }     
      if(document.getElementById("txt_needScore").value=="")
       {
          alert("所需积分不能为空！");
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
                <td align="center" bgcolor="#799AE1" class="B" style="width: 413px" >
                    </td>
                <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 839px">
                    <asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
                <td align="center" bgcolor="#799AE1" class="B" style="width: 253px">
                    </td>
            </tr>
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    奖品名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_pName" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    奖品名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <select id="type" runat="server">
                         <option value="">选择类型</option>
                         <option value="1">时尚达人</option>
                         <option value="2">数码精品</option>
                         <option value="3">旅行专家</option>
                         <option value="4">机票折扣</option>
                         <option value="5">酒店住宿</option>
                         </select>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            
            
            
           
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                   奖品图片：</td>
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
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    兑换积分：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_needScore" runat="server" type="text" size="12" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
              <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    抽奖积分：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_lotteryScore" runat="server" type="text" size="12" />
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
                  Width="650"  runat="server">
              </FCKeditorV2:FCKeditor>              
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>    
           
            
              <tr>
                <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                    是否推荐：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                <asp:RadioButton ID="isRecom1" GroupName="isRecom"   runat="server" Text="是" /><asp:RadioButton ID="isRecom2" Checked="true" GroupName="isRecom" runat="server" Text="否" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>

            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkInfo()"
                      OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='prizes_list.aspx'" value="返 回" />
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

