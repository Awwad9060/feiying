<%@ Page Language="C#" AutoEventWireup="true" CodeFile="news_html.aspx.cs" Inherits="console_cms_news_html" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>生成Fei580.com资讯内容</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />

</head>
<body>
    <form id="form1" runat="server">
        <table width="100%" border="0" cellpadding="0" cellspacing="0" bgcolor="#C4D8ED">
            <tr>
                <td>
                    <img src="../images/r_1.gif" alt="" /></td>
                <td width="100%" background="../images/r_0.gif">
                </td>
                <td style="width: 7px">
                </td>
            </tr>
            <tr>
                <td>
                </td>
                <td>
                    <div>
                        <table align="center" cellpadding="4" cellspacing="1" border="0" width="100%" class="toptable grid">
                            <tr>
                                <td height="25" width="150" style="color: Red;">
                                    Fei580.com资讯生成页</td>
                            </tr>
                        </table>
                        <table width="100%" height="20" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7"> 
                            <tr>
                                <td style="width: 20%; height: 51px; text-align:center;">批量生成Fei580.com资讯页
                                   </td>
                                
                                <td style="width: 80%; height: 51px;">
                                   
                                    <asp:Button ID="btntypeOK" runat="server" Text="执行生成"  Height="25px" OnClick="btntypeOK_Click"/>
                                     <font color="red">*执行需要一段时间，请耐心等待!</font>
                                    </td>
                               
                            </tr>
                            
                                   
                        </table>
                        
                    </div>
                </td>
                <td style="width: 7px">
                </td>
            </tr>
            <tr>
                <td>
                    <img src="../images/r_4.gif" alt="" /></td>
                <td>
                </td>
                <td style="width: 7px">
                    <img src="../images/r_3.gif" alt="" /></td>
            </tr>
        </table>
    </form>
</body>
</html>

