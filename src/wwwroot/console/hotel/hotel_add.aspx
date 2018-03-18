<%@ Page Language="C#" AutoEventWireup="true" Inherits="console_hotel_hotel_add" CodeFile="hotel_add.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
    <title>无标题页</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
      if(document.getElementById("txt_hName").value=="")
       {
          alert("名称不能为空！");
          return false;
       }       
      if(document.getElementById("txt_price").value=="")
       {
          alert("价格不能为空！");
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
                    酒店名称：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_hName" runat="server" type="text" size="58" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    所在城市：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <asp:DropDownList ID="cityNameList" runat="server">
                <asp:ListItem Value="曼谷" Selected="True">曼谷酒店</asp:ListItem>
                <asp:ListItem Value="新加波" >新加波酒店</asp:ListItem>
                <asp:ListItem Value="伦敦">伦敦酒店</asp:ListItem>
                <asp:ListItem Value="多伦多">多伦多酒店</asp:ListItem>
                <asp:ListItem Value="纽约" >纽约酒店</asp:ListItem>
                <asp:ListItem Value="巴黎" >巴黎酒店</asp:ListItem>
                </asp:DropDownList>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    所在城市：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <asp:DropDownList ID="starFlagList" runat="server">
                <asp:ListItem Value="三星级" Selected="True">三星级</asp:ListItem>
                <asp:ListItem Value="四星级" >四星级</asp:ListItem>
                <asp:ListItem Value="五星级" >五星级</asp:ListItem>
                 </asp:DropDownList>
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            
              <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    平均消费：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_price" runat="server" type="text" size="30" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            
              <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    酒店位置：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_location" runat="server" type="text" size="50" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
             
            
               <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    连接地址：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
               <input  id="txt_linkUrl" runat="server" type="text" size="80" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
            
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px; height: 30px;">
                   推荐图片：</td>
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
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">显示位置：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px; vertical-align:middle;">
                    <table>
                        <tr>
                            <td style="vertical-align:middle;">
                                <asp:DropDownList ID="ddlPosition" runat="server" Width="100px">
                                    <asp:ListItem Text="" Value="" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="a" Value="a" ></asp:ListItem>
                                    <asp:ListItem Text="b1" Value="b1" ></asp:ListItem>
                                    <asp:ListItem Text="b2" Value="b2" ></asp:ListItem>
                                    <asp:ListItem Text="c1" Value="c1" ></asp:ListItem>
                                    <asp:ListItem Text="c2" Value="c2" ></asp:ListItem>
                                </asp:DropDownList>
                            
                            </td>
                            <td style="vertical-align:middle;">
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
                                <img src="../images/position_demo.jpg" />
                            
                            </td>
                            <td style="vertical-align:top;">
                                图片大小说明(宽 * 高)：
                               <p /> &nbsp;a:  190  *  210
                               <p /> b1:  150  *  130
                               <p /> b2:  150  *  70
                               <p /> c1:  180  *  95
                               <p /> c2:  180  *  105
                            </td>
                        </tr>
                    </table>
                </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            

            <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkInfo()"
                      OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='ticketRec_list.aspx'" value="返 回" />
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
