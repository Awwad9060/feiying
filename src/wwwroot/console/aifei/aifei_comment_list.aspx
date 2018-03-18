<%@ Page Language="C#" AutoEventWireup="true" CodeFile="aifei_comment_list.aspx.cs" Inherits="console_aifei_Default" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>爱飞网接口查询</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
    <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
    <script type="text/javascript" src="../js/JScript.js"></script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
       <table align="center" cellpadding="4" cellspacing="1" border="0" width="100%" class="toptable grid">
            <tr>
               <td height="25" width="100" style="color: Red;">爱飞网接口查询</td>
            </tr>
       </table>
       <table width="100%" border="0" cellspacing="0" cellpadding="0" style="background-color: #E7E7E7">
            <tr>
                <td width="50">&nbsp;</td>
                <td width="550"> 出发城市：<asp:DropDownList ID="fromCity" runat="server" >
                                                </asp:DropDownList>&nbsp;&nbsp;
                     目的城市：<input  id="txtSearch_tocity" runat="server" type="text" size="18" /> *支持智能搜索，支持代码和中文
                </td>
                <td width="360"> 开始时间：<input  id="fromtripDate_more" readonly="readonly"  name="fromtripDate_more" onfocus="return setday(this)" runat="server" type="text" style="width: 90px" />&nbsp;&nbsp;
                     结束时间：<input  id="totripDate_more" readonly="readonly"  name="totripDate_more" onfocus="return setday(this)" runat="server" type="text" style="width: 90px" />
                </td>
                
                <td width="160"> 
                    航线类型：
                    <select id="cateSelect" name="cateSelect" runat="server">
                        <option value="DC">单程</option>
                        <option value="SF">往返</option>
                    </select>
                </td>
                <td >
                    <asp:Button ID="btnsearch" runat="server" Text="查询" Height="23" OnClick="btnSearch_Click"></asp:Button>
                </td>
                <td>&nbsp;</td>
            </tr>
       </table>    
   
       
       
       <table width="100%" border="0" cellspacing="0" cellpadding="0" align="center">
                            <tr>
                                <td style="width: 100%;">
                                <table width="100%" border="1" cellspacing="0" cellpadding="4" style="border-collapse: collapse">
                                    <asp:Repeater ID="rptshopnews" OnItemCommand="rptshopnews_ItemCommand" runat="server">
                                        <HeaderTemplate>
                                            <tr style="background-color: #799AE1; color: White;">
                                                <th style="width: 12%">出发地城市</th>
                                                 <th style="width: 5%">目的地城市</th>
                                                <th style="width: 10%">类型</th>
                                                 <th style="width: 8%">舱位</th>
                                                 <th style="width: 8%">
                                                    最短停留期</th>   
                                                <th style="width: 8%">
                                                    最长停留期</th> 
                                                <th style="width: 6%">
                                                    截止出发日期</th>
                                                <th style="width: 8%"><asp:LinkButton ID="airlineCode" runat="server" CommandName="airlineCode">航空公司二字代码</asp:LinkButton></th>
                                                <th style="width: 8%"><asp:LinkButton ID="ticketPrice" runat="server" CommandName="ticketPrice">机票价格</asp:LinkButton></th>
                                                <th style="width: 8%">
                                                    中转机场</th>                                              
                                                <th style="width: 8%">
                                                    机票编码</th>  
                                            </tr>
                                        </HeaderTemplate>
                                        <ItemTemplate>
                                            <tr style="background-color: #F6F6F6; text-align: center;">
                                                <td>
                                                   <%#getFromCityNameByCode(((AiFeiTicketEntity)Container.DataItem).fromCity.Trim())%> 
                                                </td>
                                                <td>
                                                   <%#getToCityNameByCode(((AiFeiTicketEntity)Container.DataItem).toCity.Trim())%> 
                                                </td>
                                                <td>
                                                   <%#getTicketType(((AiFeiTicketEntity)Container.DataItem).type.Trim())%> 
                                                </td>
                                                <td>
                                                   <%#((AiFeiTicketEntity)Container.DataItem).seatShip%> 
                                                </td>
                                                <td>
                                                   <%#((AiFeiTicketEntity)Container.DataItem).shotstayDate%> 
                                                </td>
                                                 <td>
                                                   <%#((AiFeiTicketEntity)Container.DataItem).longstayDate%> 
                                                </td>
                                                 <td>
                                                   <%#((AiFeiTicketEntity)Container.DataItem).totripDate%> 
                                                </td>
                                                 <td>
                                                   <%#((AiFeiTicketEntity)Container.DataItem).airlineCode%> 
                                                </td>
                                                 <td style="color:Red;font-weight:bold;">
                                                   ￥<%#((AiFeiTicketEntity)Container.DataItem).ticketPrice%> 
                                                </td>
                                                 <td>
                                                   <%#((AiFeiTicketEntity)Container.DataItem).relayPort%> 
                                                </td>
                                                 <td>
                                                   <%#((AiFeiTicketEntity)Container.DataItem).ticketCode%> 
                                                </td>
                                            </tr>
                                        </ItemTemplate>
                                    </asp:Repeater>
                                    </table>
                                </td>
                            </tr>
          </table>
    </div>
    </form>
</body>
</html>

<script type="text/javascript">
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

        arrList1.sort(function(a, b) {
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
        objInput1.onblur = function() { objouter1.style.display = 'none'; }
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
            var result = console_aifei_Default.GetCity_to(strInput).value;
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
    String.prototype.Trim = function() {
        return this.replace(/(^\s*)|(\s*$)/g, "");
    }
    smanPromptList1();
</script> 