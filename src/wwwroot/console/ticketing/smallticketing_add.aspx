<%@ Page Language="C#" AutoEventWireup="true" CodeFile="smallticketing_add.aspx.cs" Inherits="console_ticketing_smallticketing_add" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>www.fei580.com飞赢商旅-电子票添加</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
     <script type="text/javascript">
        //全部检查
         function checkInfo()
         {
               if(document.getElementById("txt_fromcity").value=="")
               {
                  alert("请输入出发地！");
                  document.getElementById("txt_fromcity").focus();
                  return false;
               }
               if(document.getElementById("txt_tocity").value=="")
               {
                  alert("请输入目的地！");
                  document.getElementById("txt_tocity").focus();
                  return false;
               }
               if(document.getElementById("txt_airline").value=="")
               {
                  alert("请输入航空公司！");
                  document.getElementById("txt_airline").focus();
                  return false;
               }
//               if(document.getElementById("txt_chufa").value=="")
//               {
//                  alert("请选择出发日期！");
//                  document.getElementById("txt_chufa").focus();
//                  return false;
//               }
//               if(document.getElementById("txt_huicheng").value=="")
//               {
//                  alert("请选择回程日期！");
//                  document.getElementById("txt_huicheng").focus();
//                  return false;
//               }
               return true;
         }
        
        //检测文件后缀名
        function CheckFile(sender,arg)
        {
            var enableExt =["jpg","doc", "docx", "rar", "zip"];
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
    <div style="margin:auto 0;text-align:center;">
    <table  width="500px" height="100px" border="0" align="center" cellpadding="1" cellspacing="1">
        <tr>
            <td width="18%" align="center" bgcolor="#799AE1" class="B" ></td>
            <td width="61%" height="25" align="left" bgcolor="#799AE1" class="B"><asp:Label ID ="lblTitle" runat ="server"></asp:Label></td>
            <td width="21%" align="center" bgcolor="#799AE1" class="B"></td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6"></td>
            <td height="25" align="left" bgcolor="#F6F6F6"></td>
            <td bgcolor="#F6F6F6"></td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                出发地：</td>
            <td height="25" align="left" bgcolor="#F6F6F6" colspan="2" style="width: 839px">
                <input id="txt_fromcity" style="width:150px;" runat="server" type="text" />&nbsp;必填
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                目的地：</td>
            <td height="25" align="left" bgcolor="#F6F6F6" colspan="2" style="width: 839px">
                <input id="txt_tocity"  style="width:150px;" runat="server" type="text" />&nbsp;必填
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                航空公司：</td>
            <td height="25" align="left" bgcolor="#F6F6F6" colspan="2" style="width: 839px">
                <input id="txt_airline" style="width:150px;" runat="server" type="text" />&nbsp;必填
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                出发日期：</td>
            <td height="25" align="left" bgcolor="#F6F6F6" colspan="2" style="width: 839px">
                <input id="txt_chufa"  style="width:150px;"  readonly="readonly" onfocus="return setday(this)" runat="server" type="text" />
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                回程日期：</td>
            <td height="25" align="left" bgcolor="#F6F6F6" colspan="2" style="width: 839px">
                <input id="txt_huicheng" style="width:150px;" readonly="readonly" onfocus="return setday(this)" runat="server" type="text" />
            </td>
        </tr>
        <tr>
            <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                机票数量：</td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <select id="sel_number" style="width:55px;" runat="server">
                    <option value="1">1</option>
                    <option value="2">2</option>
                    <option value="3">3</option>
                    <option value="4">4</option>
                    <option value="5">5</option>
                    <option value="6">6</option>
                    <option value="7">7</option>
                    <option value="8">8</option>
                    <option value="9">9</option>
                    <option value="10">10</option>
                    <option value="11">11</option>
                    <option value="12">12</option>
                    <option value="13">13</option>
                    <option value="14">14</option>
                    <option value="15">15</option>
                    <option value="16">16</option>
                    <option value="17">17</option>
                    <option value="18">18</option>
                    <option value="19">19</option>
                    <option value="20">20</option>
                </select>
            </td>
            <td bgcolor="#F6F6F6"></td>
        </tr>
          <tr>
            <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                奖励积分：</td>
            <td height="25" align="left" bgcolor="#F6F6F6" colspan="2" style="width: 839px">
                <input id="txt_jifen" value="100" style="width:50px;" runat="server" type="text" />&nbsp;积分为数字格式&nbsp;
            </td>
        </tr>     
        <tr id="picUpload" >
            <td align="right" bgcolor="#F6F6F6" style="width: 413px">
                选择电子票：</td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
             <asp:FileUpload ID="FileUpload_picPath" runat="server" Width="285px" />
            </td>
            <td bgcolor="#F6F6F6"></td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6"></td>
            <td height="25" align="left" bgcolor="#F6F6F6">
            <asp:CustomValidator ID="CustomValidator_pic" runat="server"  ClientValidationFunction="CheckFile" ControlToValidate="FileUpload_picPath" 
            Display="Dynamic" ErrorMessage="&lt;br/&gt;*只支持 jpg ，doc , docx , rar ,zip 等文件格式"></asp:CustomValidator></td>       
            <td bgcolor="#F6F6F6" style="width: 253px">
            </td>
            <td bgcolor="#F6F6F6"></td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="height: 27px">
                </td>
            <td align="center" bgcolor="#F6F6F6" style="height: 27px">                    
             <asp:Button ID="btnSave" runat="server" Text="保 存" OnClientClick="return checkInfo();"  Height="23" OnClick="btnSave_Click" />
            </td>
            <td bgcolor="#F6F6F6" style="height: 27px">
                </td>
        </tr>
        <tr>
            <td align="center" colspan="3">
             </td>
        </tr>
    </table>
    </div>
    </form>
</body>
</html>
