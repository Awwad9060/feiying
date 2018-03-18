<%@ Page Language="C#" AutoEventWireup="true" CodeFile="ticket_add2.aspx.cs" Inherits="cms_ticket_ticket_add2" %>

<%@ Register Assembly="FredCK.FCKeditorV2" Namespace="FredCK.FCKeditorV2" TagPrefix="FCKeditorV2" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加机票信息</title>
    <script type="text/javascript" src="../js/ticketadd.js"></script>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
    <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
    <%--<script language="javascript" src="../js/jquery.js"></script>--%>
    <script src="../js/jquery-1.10.2.min.js"></script>
    <script type="text/javascript" language="javascript">

        function checkInfo() {
            if (document.getElementById("txtSearch_tocity").value == "") {
                alert("到达城市不能为空！");
                document.getElementById("txtSearch_tocity").focus();
                return false;
            }
            if (document.getElementById("txtSearch_fromport").value == "") {
                alert("出发机场不能为空！");
                document.getElementById("txtSearch_fromport").focus();
                return false;
            }
            if (document.getElementById("txtSearch_toport").value == "") {
                alert("到达机场不能为空！");
                document.getElementById("txtSearch_toport").focus();
                return false;
            }
            if (document.getElementById("txtSearch").value == "") {
                alert("航空公司不能为空！");
                document.getElementById("txtSearch").focus();
                return false;
            }
            if (document.getElementById("untaxPrice_more").value == "") {
                alert("价格不能为空！");
                document.getElementById("untaxPrice").focus();
                return false;
            }


            return true;
        }

    </script>
</head>
<body>
    <form id="form1" action="ticket_add2.aspx" runat="server">
        <div>
            <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="ticket_table">
                <tr>
                    <td align="right" bgcolor="#799AE1" class="B" style="width: 278px"></td>
                    <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 1101px">
                        <asp:Label ID="lblTitle" runat="server"></asp:Label></td>
                    <td align="right" bgcolor="#799AE1" class="B" style="width: 253px"></td>
                </tr>


                <%-- 添加航线 --%>
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 278px" valign="top">航线：
                    </td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                        <div id="add_airall">
                            <div id="add_air1">
                                出发城市：
                                <select id="fromCity" name="fromCity_more" runat="server">
                                </select>
                                &nbsp;&nbsp;&nbsp;
                        目的城市：
                        <input id="txtSearch_tocity" runat="server" type="text" size="18" />
                                *支持智能搜索，支持代码和中文
                            <br />
                                <br />
                                &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;行程：<select id="selTripType" name="selTripType" runat="server">
                                    <option value="1">往返</option>
                                    <option value="0">单程</option>
                                </select>
                                &nbsp;&nbsp;&nbsp;&nbsp;
                            <select id="selZz" name="selZz" runat="server">
                                <option value="1">中转</option>
                                <option value="0">不中转</option>
                                <option value="2">二次中转</option>
                            </select>
                            </div>
                        </div>
                    </td>
                    <td align="left" bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 278px">机场：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                        <br />
                        出发机场：
                        <input id="txtSearch_fromport" runat="server" type="text" size="40" />
                        *支持智能搜索，支持代码和中文
                        <br />
                        目的机场：
                        <input id="txtSearch_toport" runat="server" type="text" size="40" />
                        *支持智能搜索，支持代码和中文
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
                <tr class="zz">
                    <td align="right" bgcolor="#F6F6F6" style="width: 278px">中转机场：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                        <input id="txtSearch_relayport" runat="server" type="text" size="58" />
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 278px">客票类型：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                        <input id="engerTicket" runat="server" type="text" size="58" value="电子客票" />
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>


                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 278px">舱位：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                        <input id="seatShip" runat="server" type="text" size="58" value="经济舱" />
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
            </table>
            <%-- 去程 --%>
            <p style="color: red; background-color: #F6F6F6; padding-left: 5%; font-size: 14px; padding-bottom: 10px; padding-top: 10px;">去程：</p>
            <div style="width: 100%; background-color: #F6F6F6;">
                <table id="tabFormCity" width="90%" border="0" align="center" cellpadding="5" cellspacing="0" style="border: 1px solid #808080;">
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航空公司：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">

                            <input id="txtSearchAline" runat="server" type="text" size="40" />
                            *支持智能搜索，支持二字码和中文
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航班号：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtFlightNumber" name="flightNumber" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>

                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">机型：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtPlaneType" name="planeType" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">出发时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtStartDate" name="startDate" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">到达时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtEndDate" name="endDate" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                </table>
            </div>
            <div style="width: 100%; padding-top: 10px; padding-bottom: 10px; background-color: #F6F6F6;">
                <%--<div style="width: 100%; border-bottom: 1px solid #e4dfdf;"></div>--%>
            </div>
            <div class="zz" style="width: 100%; background-color: #F6F6F6;">
                <table id="tabFormCity-transfer" width="90%" border="0" align="center" cellpadding="5" cellspacing="0" style="border: 1px solid #808080;">
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航空公司：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">

                            <input id="txtSearchAline2" runat="server" type="text" size="40" />
                            *支持智能搜索，支持二字码和中文<a id="txtSearchAlineDitto" href="javascript:void(0)" style="color: red;">【同上】</a>
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">中转机场：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtSearch_relayport2" runat="server" type="text" size="58" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航班号：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtFlightNumber2" name="flightNumber2" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>

                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">机型：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtPlaneType2" name="planeType2" runat="server" type="text" size="58" value="" /><a id="txtPlaneTypeDitto" href="javascript:void(0)" style="color: red;">【同上】</a>
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">出发时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtStartDate2" name="startDate2" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">到达时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtEndDate2" name="endDate2" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                </table>
            </div>
            <div class="twozz" style="width: 100%; padding-top: 10px; padding-bottom: 10px; background-color: #F6F6F6;display:none;">
                <%--<div style="width: 100%; border-bottom: 1px solid #e4dfdf;"></div>--%>
            </div>
            <div class="twozz" style="width: 100%; background-color: #F6F6F6;display:none;">
                <table id="Table2" width="90%" border="0" align="center" cellpadding="5" cellspacing="0" style="border: 1px solid #808080;">
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航空公司：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">

                            <input id="txtSearchAline5" runat="server" type="text" size="40" />
                            *支持智能搜索，支持二字码和中文<a id="txtSearchAlineDitto3" href="javascript:void(0)" style="color: red;">【同上】</a>
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">中转机场：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtSearch_relayport3" runat="server" type="text" size="58" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航班号：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtFlightNumber5" name="flightNumber5" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>

                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">机型：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtPlaneType5" name="txtPlaneType5" runat="server" type="text" size="58" value="" /><a id="txtPlaneTypeDitto3" href="javascript:void(0)" style="color: red;">【同上】</a>
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">出发时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtStartDate5" name="startDate5" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">到达时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtEndDate5" name="endDate5" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                </table>
            </div>
            <%-- 返程 --%>
            <p class="to" style="color: red; background-color: #F6F6F6; padding-left: 5%; font-size: 14px; padding-bottom: 10px; padding-top: 10px;">返程：</p>
            <div class="to" style="width: 100%; background-color: #F6F6F6;">
                <table id="tabToCity" width="90%" border="0" align="center" cellpadding="5" cellspacing="0" style="border: 1px solid #808080;">
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航空公司：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">

                            <input id="txtSearchAline3" runat="server" type="text" size="40" />
                            *支持智能搜索，支持二字码和中文
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航班号：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtFlightNumber3" name="flightNumber3" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>

                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">机型：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtPlaneType3" name="planeType3" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">出发时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtStartDate3" name="startDate3" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">到达时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtEndDate3" name="endDate3" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                </table>
            </div>
            <div class="to tozz" style="width: 100%; padding-top: 10px; padding-bottom: 10px; background-color: #F6F6F6;">
                <%--<div style="width: 100%; border-bottom: 1px solid #e4dfdf;"></div>--%>
            </div>
            <div class="to tozz" style="width: 100%; background-color: #F6F6F6;">
                <table id="tabToCity-transfer" width="90%" border="0" align="center" cellpadding="5" cellspacing="0" style="border: 1px solid #808080;">
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航空公司：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">

                            <input id="txtSearchAline4" runat="server" type="text" size="40" />
                            *支持智能搜索，支持二字码和中文<a id="txtSearchAlineDitto2" href="javascript:void(0)" style="color: red;">【同上】</a>
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">中转机场：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtSearch_relayport4" runat="server" type="text" size="58" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航班号：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtFlightNumber4" name="flightNumber4" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>

                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">机型：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtPlaneType4" name="planeType4" runat="server" type="text" size="58" value="" /><a id="txtPlaneTypeDitto2" href="javascript:void(0)" style="color: red;">【同上】</a>
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">出发时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtStartDate4" name="startDate4" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">到达时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtEndDate4" name="endDate4" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                </table>
            </div>
            <div class="to totwo" style="width: 100%; padding-top: 10px; padding-bottom: 10px; background-color: #F6F6F6;display:none;">
                <%--<div style="width: 100%; border-bottom: 1px solid #e4dfdf;"></div>--%>
            </div>
            <div class="to totwo" style="width: 100%; background-color: #F6F6F6;display:none;">
                <table id="Table1" width="90%" border="0" align="center" cellpadding="5" cellspacing="0" style="border: 1px solid #808080;">
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航空公司：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">

                            <input id="txtSearchAline6" runat="server" type="text" size="40" />
                            *支持智能搜索，支持二字码和中文<a id="txtSearchAlineDitto4" href="javascript:void(0)" style="color: red;">【同上】</a>
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">中转机场：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtSearch_relayport5" runat="server" type="text" size="58" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">航班号：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtFlightNumber6" name="flightNumber6" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>

                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">机型：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtPlaneType6" name="planeType6" runat="server" type="text" size="58" value="" /><a id="txtPlaneTypeDitto4" href="javascript:void(0)" style="color: red;">【同上】</a>
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">出发时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtStartDate6" name="startDate6" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                    <tr>
                        <td align="right" bgcolor="#F6F6F6" style="width: 278px">到达时间：</td>
                        <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                            <input id="txtEndDate6" name="endDate6" runat="server" type="text" size="58" value="" />
                        </td>
                        <td bgcolor="#F6F6F6" style="width: 253px"></td>
                    </tr>
                </table>
            </div>
            <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 278px">不含税价格：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                        <input id="txtUntaxPrice_more" name="txtUntaxPrice_more" runat="server" type="text" size="58" />
                        *纯数字
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 278px">中转机场：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                        <input id="Text9" runat="server" type="text" size="58" />
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 278px">税费：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 1101px">
                        <input id="txtFaxPrice_more" name="txtFaxPrice_more" runat="server" type="text" size="58" />
                        *纯数字
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
            </table>


            <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 200px">售票：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">开始售票<input id="fromsaleDate_more" name="fromsaleDate_more" runat="server" readonly="readonly" onfocus="return setday(this)" type="text" style="width: 90px" />
                        结束售票<input id="tosaleDate_more" name="tosaleDate_more" runat="server" readonly="readonly" onfocus="return setday(this)" type="text" style="width: 90px" />
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
            </table>
            <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1">
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 200px">是否特价：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                        <asp:RadioButton ID="isPass1" GroupName="isPass" runat="server" Text="是" /><asp:RadioButton ID="isPass2" Checked="true" GroupName="isPass" runat="server" Text="否" />
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 200px">是否精选：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
                        <asp:RadioButton ID="isRecom1" GroupName="isRecom" runat="server" Text="是" /><asp:RadioButton ID="isRecom2" Checked="true" GroupName="isRecom" runat="server" Text="否" />
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>
                <tr>
                    <td align="right" bgcolor="#F6F6F6" style="width: 200px">机票条款：</td>
                    <td height="25" align="left" bgcolor="#F6F6F6" style="width: 480px">
                        <FCKeditorV2:FCKeditor ID="FCKeditor" BasePath="../../tools/fckeditor/"
                            Height="400"
                            Width="550" runat="server">
                        </FCKeditorV2:FCKeditor>
                    </td>
                    <td bgcolor="#F6F6F6" style="width: 253px"></td>
                </tr>

                <tr>
                    <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                        <asp:Button ID="btnSave" runat="server" Text="保 存" Height="23" OnClientClick="return checkInfo()"
                            OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                 <input name="Submit3" type="button" style="height: 23px;" onclick="location.href = 'airline_list.aspx'" value="返 回" />
                        <br />
                        <br />
                        <br />
                    </td>

                </tr>
                <tr>
                    <td align="right" colspan="3"></td>
                </tr>
            </table>
        </div>
    </form>
    <script type="text/javascript">
        jQuery(function () {
            jQuery("#selTripType").change(function () {
                if (jQuery(this).val() == "0") {
                    jQuery(".to").hide();
                    if (jQuery("#selZz").val() == "0") {
                        jQuery(".twozz").hide();
                        jQuery(".zz").hide();
                    }
                    if (jQuery("#selZz").val() == "1") {
                        jQuery(".tozz").hide();
                        jQuery(".twozz").hide();
                        jQuery(".zz").show();
                    }
                    if (jQuery("#selZz").val() == "2") {
                        jQuery(".twozz").show();
                        jQuery(".zz").show();
                    }
                }
                if (jQuery(this).val() == "1") {
                    jQuery(".to").show();
                    if (jQuery("#selZz").val() == "0") {
                        jQuery(".tozz").hide();
                        jQuery(".zz").hide();
                        jQuery(".totwo").hide();
                        jQuery(".twozz").hide();
                    }
                    if (jQuery("#selZz").val() == "1") {
                        jQuery(".tozz").show();
                        jQuery(".zz").show();
                        jQuery(".totwo").hide();
                        jQuery(".twozz").hide();
                    }
                    if (jQuery("#selZz").val() == "2") {
                        jQuery(".tozz").show();
                        jQuery(".zz").show();
                        jQuery(".totwo").show();
                        jQuery(".twozz").show();
                    }
                }
            });
            jQuery("#selZz").change(function () {
                if (jQuery(this).val() == "0") {
                    jQuery(".zz").hide();
                    jQuery(".tozz").hide();
                    jQuery(".twozz").hide();
                    jQuery(".totwo").hide();
                }
                if (jQuery(this).val() == "1") {
                    jQuery(".zz").show();
                    jQuery(".twozz").hide();
                    jQuery(".totwo").hide();
                    if (jQuery("#selTripType").val() == "1") {
                        jQuery(".tozz").show();
                    }
                }
                if (jQuery(this).val() == "2") {
                    jQuery(".zz").show();
                    jQuery(".twozz").show();
                    if (jQuery("#selTripType").val() == "1") {
                        jQuery(".tozz").show();
                        jQuery(".totwo").show();
                    }
                }
            });
            jQuery("#txtSearchAlineDitto").click(function () {
                jQuery("#txtSearchAline2").val(jQuery("#txtSearchAline").val());
            });
            jQuery("#txtPlaneTypeDitto").click(function () {
                jQuery("#txtPlaneType2").val(jQuery("#txtPlaneType").val());
            });
            jQuery("#txtSearchAlineDitto3").click(function () {
                jQuery("#txtSearchAline5").val(jQuery("#txtSearchAline2").val());
            });
            jQuery("#txtPlaneTypeDitto3").click(function () {
                jQuery("#txtPlaneType5").val(jQuery("#txtPlaneType2").val());
            });

            jQuery("#txtSearchAlineDitto2").click(function () {
                jQuery("#txtSearchAline4").val(jQuery("#txtSearchAline3").val());
            });
            jQuery("#txtPlaneTypeDitto2").click(function () {
                jQuery("#txtPlaneType4").val(jQuery("#txtPlaneType3").val());
            });
            jQuery("#txtSearchAlineDitto4").click(function () {
                jQuery("#txtSearchAline6").val(jQuery("#txtSearchAline4").val());
            });
            jQuery("#txtPlaneTypeDitto4").click(function () {
                jQuery("#txtPlaneType6").val(jQuery("#txtPlaneType4").val());
            });
        });
        String.prototype.Trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }

        var arrList = new Array();//要搜索的数据

        var alineArrayInput = new Array();
        var alineArrayInputId = new Array();
        alineArrayInputId.push("txtSearchAline");
        alineArrayInputId.push("txtSearchAline2");
        alineArrayInputId.push("txtSearchAline3");
        alineArrayInputId.push("txtSearchAline4");
        var objouter;//, objInput, objInputId = "txtSearch";//控件ID
        var selectedIndex = -1, intTmp;
        //初始化
        function smanPromptList() {
            this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
            if (arrList.constructor != Array) {
                alert('smanPromptList初始化失败:第一个参数非数组!');
                return;
            }
            document.write("<div id='__smanDisp' style='position:absolute;display:none;" + this.style + "' onblur></div>");
            document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

            arrList.sort(function (a, b) {
                if (a.length > b.length) return 1;
                else if (a.length == b.length) return a.localeCompare(b);
                else return -1;
            });
            objouter = document.getElementById("__smanDisp") //显示的DIV对象 
            for (var i = 0; i < alineArrayInputId.length; i++) {
                alineArrayInput[i] = document.getElementById(alineArrayInputId[i]);  //文本框对象
                if (alineArrayInput[i] == null) {
                    alert('初始化航空公司失败:没有找到"' + alineArrayInputId[i] + '"文本框');
                    return;
                }
                alineArrayInput[i].onblur = function () { objouter.style.display = 'none'; }
                alineArrayInput[i].onkeyup = checkKeyCode;
                alineArrayInput[i].onfocus = checkAndShow;
            }
        }

        function getAbsoluteHeight(ob) {
            return ob.offsetHeight;
        }
        function getAbsoluteWidth(ob) {
            return ob.offsetWidth;
        }
        function getAbsoluteLeft(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetLeft;
                el = el.offsetParent;
            };
            return s_el;
        }
        function getAbsoluteTop(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetTop;
                el = el.offsetParent;
            };
            return s_el;
        }
        function outSelection(Index, e) {
            e.value = objouter.children[Index].innerText.Trim();
            objouter.style.display = 'none';
        }
        function divPosition(e) {
            objouter.style.top = getAbsoluteHeight(e) + getAbsoluteTop(e) + 'px';
            objouter.style.left = getAbsoluteLeft(e) + 'px';
            objouter.style.width = getAbsoluteWidth(e) + 'px';
        }
        function chageSelection(isUp, e) {
            if (objouter.style.display == 'none') {
                objouter.style.display = '';
            }
            else {
                if (isUp)
                    selectedIndex++;
                else
                    selectedIndex--;
            }
            var maxIndex = objouter.children.length - 1;
            if (selectedIndex < 0) { selectedIndex = 0; }
            if (selectedIndex > maxIndex) { selectedIndex = maxIndex; }
            if (selectedIndex == maxIndex) { selectedIndex = -1; }

            for (intTmp = 0; intTmp <= maxIndex; intTmp++) {
                if (intTmp == selectedIndex) {
                    objouter.children[intTmp].className = "sman_selectedStyle";
                    e.value = objouter.children[selectedIndex].innerText.Trim();
                }
                else {
                    objouter.children[intTmp].className = "";
                }
            }
        }
        function checkKeyCode() {
            var ie = (document.all) ? true : false
            if (ie) {
                var keyCode = event.keyCode
                if (keyCode == 40 || keyCode == 38) {
                    var isUp = false
                    if (keyCode == 40)
                        isUp = true;
                    chageSelection(isUp, this)
                }
                else if (keyCode == 13) {
                    outSelection(selectedIndex, this);
                }
                else {
                    checkAndShow(this);
                }
            }
            else {
                checkAndShow(this);
            }
            divPosition(this);
        }

        function checkAndShow(e) {
            var inputId = this.id == undefined ? e.id : this.id;
            var strInput = this.value == undefined ? e.value.Trim() : this.value.Trim();
            if (strInput != "") {
                divPosition(document.getElementById(inputId));
                selectedIndex = -1;
                arrList.length = 0;
                objouter.innerHTML = "";
                //=======================这里修改数据================================
                var result = cms_ticket_ticket_add2.GetArray(strInput).value;
                //===================================================================
                var data = eval('(' + result + ')');
                for (var j = 0; j < data.length; j++) {

                    arrList[j] = data[j];
                }

                for (intTmp = 0; intTmp < arrList.length; intTmp++) {
                    for (i = 0; i < arrList[intTmp].length; i++) {
                        if (arrList[intTmp].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                            addOption(arrList[intTmp], strInput, inputId);
                        }
                        if (objouter.childNodes.length >= 10) {
                            break;
                        }
                    }
                }
                if (objouter.childNodes.length > 0) {
                    objouter.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
                }
                objouter.style.display = '';
            }
            else {
                objouter.style.display = 'none';
            }
        }
        //显示搜索的数据并关键字涂色
        function addOption(value, keyw, inputId) {
            var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
            objouter.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + inputId + "').value='" + value + "'\">" + v + "</div>"
        }

        smanPromptList();




        var arrList1 = new Array();//要搜索的数据
        var objouter1, objInput1, objInputId1 = "txtSearch_tocity";//控件ID
        var selectedIndex1 = -1, intTmp1;
        //初始化
        function smanPromptList1() {
            this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
            if (arrList1.constructor != Array) {
                alert('smanPromptList1初始化失败:第一个参数非数组!');
                return;
            }
            document.write("<div id='__smanDisp1' style='position:absolute;display:none;" + this.style + "' onblur></div>");
            document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

            arrList1.sort(function (a, b) {
                if (a.length > b.length) return 1;
                else if (a.length == b.length) return a.localeCompare(b);
                else return -1;
            });
            objouter1 = document.getElementById("__smanDisp1") //显示的DIV对象 
            objInput1 = document.getElementById(objInputId1);  //文本框对象
            if (objInput1 == null) {
                alert('smanPromptList1初始化失败:没有找到"' + objInputId1 + '"文本框');
                return;
            }
            objInput1.onblur = function () { objouter1.style.display = 'none'; }
            objInput1.onkeyup = checkKeyCode1;
            objInput1.onfocus = checkAndShow1;
        }

        function getAbsoluteHeight1(ob) {
            return ob.offsetHeight;
        }
        function getAbsoluteWidth1(ob) {
            return ob.offsetWidth;
        }
        function getAbsoluteLeft1(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetLeft;
                el = el.offsetParent;
            };
            return s_el;
        }
        function getAbsoluteTop1(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetTop;
                el = el.offsetParent;
            };
            return s_el;
        }
        function outSelection1(Index) {
            objInput1.value = objouter1.children[Index].innerText.Trim();
            objouter1.style.display = 'none';
        }
        function divPosition1() {
            objouter1.style.top = getAbsoluteHeight1(objInput1) + getAbsoluteTop1(objInput1) + 'px';
            objouter1.style.left = getAbsoluteLeft1(objInput1) + 'px';
            objouter1.style.width = getAbsoluteWidth1(objInput1) + 'px';
        }
        function chageSelection1(isUp) {

            if (objouter1.style.display == 'none') {
                objouter1.style.display = '';
            }
            else {
                if (isUp)
                    selectedIndex1++;
                else
                    selectedIndex1--;
            }
            var maxIndex = objouter1.children.length - 1;
            if (selectedIndex1 < 0) { selectedIndex1 = 0; }
            if (selectedIndex1 > maxIndex) { selectedIndex1 = maxIndex; }
            if (selectedIndex1 == maxIndex) { selectedIndex1 = -1; }

            for (intTmp1 = 0; intTmp1 <= maxIndex; intTmp1++) {
                if (intTmp1 == selectedIndex1) {
                    objouter1.children[intTmp1].className = "sman_selectedStyle";
                    objInput1.value = objouter1.children[selectedIndex1].innerText.Trim();
                }
                else {
                    objouter1.children[intTmp1].className = "";
                }
            }
        }
        function checkKeyCode1() {
            var ie = (document.all) ? true : false
            if (ie) {
                var keyCode = event.keyCode
                if (keyCode == 40 || keyCode == 38) {
                    var isUp = false
                    if (keyCode == 40)
                        isUp = true;
                    chageSelection1(isUp)

                }
                else if (keyCode == 13) {
                    outSelection1(selectedIndex1);

                }
                else {

                    checkAndShow1();
                }
            }
            else {
                checkAndShow1();
            }
            divPosition1();
        }

        function checkAndShow1() {

            var strInput = objInput1.value.Trim();
            if (strInput != "") {
                divPosition1();
                selectedIndex1 = -1;
                arrList1.length = 0;
                objouter1.innerHTML = "";
                //=======================这里修改数据================================
                var result = cms_ticket_ticket_add2.GetCity_to(strInput).value;
                //===================================================================
                var data = eval('(' + result + ')');
                for (var j = 0; j < data.length; j++) {

                    arrList1[j] = data[j];
                }

                for (intTmp1 = 0; intTmp1 < arrList1.length; intTmp1++) {
                    for (i = 0; i < arrList1[intTmp1].length; i++) {
                        if (arrList1[intTmp1].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                            addOption1(arrList1[intTmp1], strInput);
                        }
                        if (objouter1.childNodes.length >= 10) {
                            break;
                        }
                    }
                }
                if (objouter1.childNodes.length > 0) {
                    objouter1.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
                }
                objouter1.style.display = '';
            }
            else {
                objouter1.style.display = 'none';
            }
        }
        //显示搜索的数据并关键字涂色
        function addOption1(value, keyw) {
            var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
            objouter1.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId1 + "').value='" + value + "'\">" + v + "</div>"
        }
        String.prototype.Trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }
        smanPromptList1();




        var arrList2 = new Array();//要搜索的数据
        var objouter2, objInput2, objInputId2 = "txtSearch_fromport";//控件ID
        var selectedIndex2 = -1, intTmp2;
        //初始化
        function smanPromptList2() {
            this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
            if (arrList2.constructor != Array) {
                alert('smanPromptList2初始化失败:第一个参数非数组!');
                return;
            }
            document.write("<div id='__smanDisp2' style='position:absolute;display:none;" + this.style + "' onblur></div>");
            document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

            arrList2.sort(function (a, b) {
                if (a.length > b.length) return 1;
                else if (a.length == b.length) return a.localeCompare(b);
                else return -1;
            });
            objouter2 = document.getElementById("__smanDisp2") //显示的DIV对象 
            objInput2 = document.getElementById(objInputId2);  //文本框对象
            if (objInput2 == null) {
                alert('smanPromptList2初始化失败:没有找到"' + objInputId2 + '"文本框');
                return;
            }
            objInput2.onblur = function () { objouter2.style.display = 'none'; }
            objInput2.onkeyup = checkKeyCode2;
            objInput2.onfocus = checkAndShow2;
        }

        function getAbsoluteHeight2(ob) {
            return ob.offsetHeight;
        }
        function getAbsoluteWidth2(ob) {
            return ob.offsetWidth;
        }
        function getAbsoluteLeft2(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetLeft;
                el = el.offsetParent;
            };
            return s_el;
        }
        function getAbsoluteTop2(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetTop;
                el = el.offsetParent;
            };
            return s_el;
        }
        function outSelection2(Index) {
            objInput2.value = objouter2.children[Index].innerText.Trim();
            objouter2.style.display = 'none';
        }
        function divPosition2() {
            objouter2.style.top = getAbsoluteHeight2(objInput2) + getAbsoluteTop2(objInput2) + 'px';
            objouter2.style.left = getAbsoluteLeft2(objInput2) + 'px';
            objouter2.style.width = getAbsoluteWidth2(objInput2) + 'px';
        }
        function chageSelection2(isUp) {

            if (objouter2.style.display == 'none') {
                objouter2.style.display = '';
            }
            else {
                if (isUp)
                    selectedIndex2++;
                else
                    selectedIndex2--;
            }
            var maxIndex = objouter2.children.length - 1;
            if (selectedIndex2 < 0) { selectedIndex2 = 0; }
            if (selectedIndex2 > maxIndex) { selectedIndex2 = maxIndex; }
            if (selectedIndex2 == maxIndex) { selectedIndex2 = -1; }

            for (intTmp2 = 0; intTmp2 <= maxIndex; intTmp2++) {
                if (intTmp2 == selectedIndex2) {
                    objouter2.children[intTmp2].className = "sman_selectedStyle";
                    objInput2.value = objouter2.children[selectedIndex2].innerText.Trim();
                }
                else {
                    objouter2.children[intTmp2].className = "";
                }
            }
        }
        function checkKeyCode2() {
            var ie = (document.all) ? true : false
            if (ie) {
                var keyCode = event.keyCode
                if (keyCode == 40 || keyCode == 38) {
                    var isUp = false
                    if (keyCode == 40)
                        isUp = true;
                    chageSelection2(isUp)

                }
                else if (keyCode == 13) {
                    outSelection2(selectedIndex2);
                }
                else {
                    checkAndShow2();
                }
            }
            else {
                checkAndShow2();
            }
            divPosition2();
        }

        function checkAndShow2() {
            var strInput = objInput2.value.Trim();
            if (strInput != "") {
                divPosition2();
                selectedIndex2 = -1;
                arrList2.length = 0;
                objouter2.innerHTML = "";
                //=======================这里修改数据================================
                var result = cms_ticket_ticket_add2.GetAirport(strInput).value;
                //===================================================================
                var data = eval('(' + result + ')');
                for (var j = 0; j < data.length; j++) {

                    arrList2[j] = data[j];
                }

                for (intTmp2 = 0; intTmp2 < arrList2.length; intTmp2++) {
                    for (i = 0; i < arrList2[intTmp2].length; i++) {
                        if (arrList2[intTmp2].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                            addOption2(arrList2[intTmp2], strInput);
                        }
                        if (objouter2.childNodes.length >= 10) {
                            break;
                        }
                    }
                }
                if (objouter2.childNodes.length > 0) {
                    objouter2.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
                }
                objouter2.style.display = '';
            }
            else {
                objouter2.style.display = 'none';
            }
        }
        //显示搜索的数据并关键字涂色
        function addOption2(value, keyw) {
            var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
            objouter2.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId2 + "').value='" + value + "'\">" + v + "</div>"
        }
        String.prototype.Trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }

        smanPromptList2();


        var arrList3 = new Array();//要搜索的数据
        var objouter3, objInput3, objInputId3 = "txtSearch_toport";//控件ID
        var selectedIndex3 = -1, intTmp3;
        //初始化
        function smanPromptList3() {
            this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
            if (arrList3.constructor != Array) {
                alert('smanPromptList3初始化失败:第一个参数非数组!');
                return;
            }
            document.write("<div id='__smanDisp3' style='position:absolute;display:none;" + this.style + "' onblur></div>");
            document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

            arrList3.sort(function (a, b) {
                if (a.length > b.length) return 1;
                else if (a.length == b.length) return a.localeCompare(b);
                else return -1;
            });
            objouter3 = document.getElementById("__smanDisp3") //显示的DIV对象 
            objInput3 = document.getElementById(objInputId3);  //文本框对象
            if (objInput3 == null) {
                alert('smanPromptList3初始化失败:没有找到"' + objInputId3 + '"文本框');
                return;
            }
            objInput3.onblur = function () { objouter3.style.display = 'none'; }
            objInput3.onkeyup = checkKeyCode3;
            objInput3.onfocus = checkAndShow3;
        }

        function getAbsoluteHeight3(ob) {
            return ob.offsetHeight;
        }
        function getAbsoluteWidth3(ob) {
            return ob.offsetWidth;
        }
        function getAbsoluteLeft3(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetLeft;
                el = el.offsetParent;
            };
            return s_el;
        }
        function getAbsoluteTop3(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetTop;
                el = el.offsetParent;
            };
            return s_el;
        }
        function outSelection3(Index) {
            objInput3.value = objouter3.children[Index].innerText.Trim();
            objouter3.style.display = 'none';
        }
        function divPosition3() {
            objouter3.style.top = getAbsoluteHeight3(objInput3) + getAbsoluteTop3(objInput3) + 'px';
            objouter3.style.left = getAbsoluteLeft3(objInput3) + 'px';
            objouter3.style.width = getAbsoluteWidth3(objInput3) + 'px';
        }
        function chageSelection3(isUp) {

            if (objouter3.style.display == 'none') {
                objouter3.style.display = '';
            }
            else {
                if (isUp)
                    selectedIndex3++;
                else
                    selectedIndex3--;
            }
            var maxIndex = objouter3.children.length - 1;
            if (selectedIndex3 < 0) { selectedIndex3 = 0; }
            if (selectedIndex3 > maxIndex) { selectedIndex3 = maxIndex; }
            if (selectedIndex3 == maxIndex) { selectedIndex3 = -1; }

            for (intTmp3 = 0; intTmp3 <= maxIndex; intTmp3++) {
                if (intTmp3 == selectedIndex3) {
                    objouter3.children[intTmp3].className = "sman_selectedStyle";
                    objInput3.value = objouter3.children[selectedIndex3].innerText.Trim();
                }
                else {
                    objouter3.children[intTmp3].className = "";
                }
            }
        }
        function checkKeyCode3() {
            var ie = (document.all) ? true : false
            if (ie) {
                var keyCode = event.keyCode
                if (keyCode == 40 || keyCode == 38) {
                    var isUp = false
                    if (keyCode == 40)
                        isUp = true;
                    chageSelection3(isUp)

                }
                else if (keyCode == 13) {
                    outSelection3(selectedIndex3);
                }
                else {
                    checkAndShow3();
                }
            }
            else {
                checkAndShow3();
            }
            divPosition3();
        }

        function checkAndShow3() {
            var strInput = objInput3.value.Trim();
            if (strInput != "") {
                divPosition3();
                selectedIndex3 = -1;
                arrList3.length = 0;
                objouter3.innerHTML = "";
                //=======================这里修改数据================================
                var result = cms_ticket_ticket_add2.GetAirport(strInput).value;
                //===================================================================
                var data = eval('(' + result + ')');
                for (var j = 0; j < data.length; j++) {

                    arrList3[j] = data[j];
                }

                for (intTmp3 = 0; intTmp3 < arrList3.length; intTmp3++) {
                    for (i = 0; i < arrList3[intTmp3].length; i++) {
                        if (arrList3[intTmp3].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                            addOption3(arrList3[intTmp3], strInput);
                        }
                        if (objouter3.childNodes.length >= 10) {
                            break;
                        }
                    }
                }
                if (objouter3.childNodes.length > 0) {
                    objouter3.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
                }
                objouter3.style.display = '';
            }
            else {
                objouter3.style.display = 'none';
            }
        }
        //显示搜索的数据并关键字涂色
        function addOption3(value, keyw) {
            var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
            objouter3.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId3 + "').value='" + value + "'\">" + v + "</div>"
        }
        String.prototype.Trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }

        smanPromptList3();



        var arrList4 = new Array();//要搜索的数据
        var alineArrayInput4 = new Array();
        var alineArrayInputId4 = new Array();
        alineArrayInputId4.push("txtSearch_relayport");
        alineArrayInputId4.push("txtSearch_relayport2");
        alineArrayInputId4.push("txtSearch_relayport3");
        alineArrayInputId4.push("txtSearch_relayport4");
        alineArrayInputId4.push("txtSearch_relayport5");
        var objouter4, objInput4, objInputId4 = "txtSearch_relayport";//控件ID
        var selectedIndex4 = -1, intTmp4;
        //初始化
        function smanPromptList4() {
            this.style = "overflow:hidden;width:393px;height:auto;background:#FFFFFF;border:1px solid #000000;font-size:14px;cursor:default;"
            if (arrList4.constructor != Array) {
                alert('smanPromptList4初始化失败:第一个参数非数组!');
                return;
            }
            document.write("<div id='__smanDisp4' style='position:absolute;display:none;" + this.style + "' onblur></div>");
            document.write("<style type=\"text/css\">.sman_selectedStyle{background-Color:#3366CC;color:#FFFFFF}</style>");

            arrList4.sort(function (a, b) {
                if (a.length > b.length) return 1;
                else if (a.length == b.length) return a.localeCompare(b);
                else return -1;
            });
            objouter4 = document.getElementById("__smanDisp4") //显示的DIV对象 
            //objInput4 = document.getElementById(objInputId4);  //文本框对象
            //if (objInput4 == null) {
            //    alert('selectedIndex4初始化失败:没有找到"' + objInputId4 + '"文本框');
            //    return;
            //}
            //objInput4.onblur = function () { objouter4.style.display = 'none'; }
            //objInput4.onkeyup = checkKeyCode4;
            //objInput4.onfocus = checkAndShow4;

            for (var i = 0; i < alineArrayInputId4.length; i++) {
                alineArrayInput4[i] = document.getElementById(alineArrayInputId4[i]);  //文本框对象
                if (alineArrayInput4[i] == null) {
                    alert('初始化航空公司失败:没有找到"' + alineArrayInputId4[i] + '"文本框');
                    return;
                }
                alineArrayInput4[i].onblur = function () { objouter4.style.display = 'none'; }
                alineArrayInput4[i].onkeyup = checkKeyCode4;
                alineArrayInput4[i].onfocus = checkAndShow4;
            }
        }

        function getAbsoluteHeight4(ob) {
            return ob.offsetHeight;
        }
        function getAbsoluteWidth4(ob) {
            return ob.offsetWidth;
        }
        function getAbsoluteLeft4(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetLeft;
                el = el.offsetParent;
            };
            return s_el;
        }
        function getAbsoluteTop4(ob) {
            var s_el = 0, el = ob;
            while (el) {
                s_el = s_el + el.offsetTop;
                el = el.offsetParent;
            };
            return s_el;
        }
        function outSelection4(Index, e) {
            e.value = objouter4.children[Index].innerText.Trim();
            objouter4.style.display = 'none';
        }
        function divPosition4(e) {
            objouter4.style.top = getAbsoluteHeight(e) + getAbsoluteTop(e) + 'px';
            objouter4.style.left = getAbsoluteLeft(e) + 'px';
            objouter4.style.width = getAbsoluteWidth(e) + 'px';
        }
        function chageSelection4(isUp,e) {

            if (objouter4.style.display == 'none') {
                objouter4.style.display = '';
            }
            else {
                if (isUp)
                    selectedIndex4++;
                else
                    selectedIndex4--;
            }
            var maxIndex = objouter4.children.length - 1;
            if (selectedIndex4 < 0) { selectedIndex4 = 0; }
            if (selectedIndex4 > maxIndex) { selectedIndex4 = maxIndex; }
            if (selectedIndex4 == maxIndex) { selectedIndex4 = -1; }

            for (intTmp4 = 0; intTmp4 <= maxIndex; intTmp4++) {
                if (intTmp4 == selectedIndex4) {
                    objouter4.children[intTmp4].className = "sman_selectedStyle";
                    //objInput4.value = objouter4.children[selectedIndex4].innerText.Trim();
                    e.value = objouter4.children[selectedIndex].innerText.Trim();
                }
                else {
                    objouter4.children[intTmp4].className = "";
                }
            }
        }
        function checkKeyCode4() {
            var ie = (document.all) ? true : false
            if (ie) {
                var keyCode = event.keyCode
                if (keyCode == 40 || keyCode == 38) {
                    var isUp = false
                    if (keyCode == 40)
                        isUp = true;
                    chageSelection4(isUp,this)

                }
                else if (keyCode == 13) {
                    outSelection4(selectedIndex4,this);
                }
                else {
                    checkAndShow4(this);
                }
            }
            else {
                checkAndShow4(this);
            }
            divPosition4(this);
        }

        function checkAndShow4(e) {
            //var strInput = objInput4.value.Trim();
            var inputId = this.id == undefined ? e.id : this.id;
            var strInput = this.value == undefined ? e.value.Trim() : this.value.Trim();
            if (strInput != "") {
                divPosition4(document.getElementById(inputId));
                selectedIndex4 = -1;
                arrList4.length = 0;
                objouter4.innerHTML = "";
                //=======================这里修改数据================================
                var result = cms_ticket_ticket_add2.GetAirport(strInput).value;
                //===================================================================
                var data = eval('(' + result + ')');
                for (var j = 0; j < data.length; j++) {

                    arrList4[j] = data[j];
                }

                for (intTmp4 = 0; intTmp4 < arrList4.length; intTmp4++) {
                    for (i = 0; i < arrList4[intTmp4].length; i++) {
                        if (arrList4[intTmp4].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                            addOption4(arrList4[intTmp4], strInput, inputId);
                        }
                        if (objouter4.childNodes.length >= 10) {
                            break;
                        }
                    }
                }
                if (objouter4.childNodes.length > 0) {
                    objouter4.innerHTML += "<div style=\"width:395px;height:22px;text-align:right;color:Blue;text-decoration:underline;cursor:pointer;\">关闭</div>";
                }
                objouter4.style.display = '';
            }
            else {
                objouter4.style.display = 'none';
            }
        }
        //显示搜索的数据并关键字涂色
        function addOption4(value, keyw, inputId) {
            var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
            objouter4.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + inputId + "').value='" + value + "'\">" + v + "</div>"
        }
        String.prototype.Trim = function () {
            return this.replace(/(^\s*)|(\s*$)/g, "");
        }

        smanPromptList4();
    </script>

</body>
</html>
