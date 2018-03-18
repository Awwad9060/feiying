<%@ Page Language="C#" AutoEventWireup="true" CodeFile="tax_add.aspx.cs" Inherits="console_taxManager_add" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head id="Head1" runat="server">
     <title>税费信息编辑</title>
     <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../tools/fckeditor/fckeditor.js"></script>
    <script type="text/javascript" language="javascript">
    
    function checkInfo()
    { 
    /*
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
     */
       return true; 
             
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
                    税费类型：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <asp:RadioButton ID="taxType0" GroupName="taxType" runat="server" Text="单程" Checked="true"/> <asp:RadioButton ID="taxType1" GroupName="taxType"   runat="server" Text="双程" />
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
            <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    航空公司：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <input  id="txtSearch" runat="server" type="text" size="40" /> *支持智能搜索，支持二字码和中文
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr> 
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    出发城市：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <select id="fromCity" name="fromCity_more" runat="server"></select>&nbsp;&nbsp;&nbsp;
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    目的城市：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <input  id="txtSearch_tocity" runat="server" type="text" size="18" /> *支持智能搜索，支持代码和中文
               </td>
                <td bgcolor="#F6F6F6" style="width: 253px">
                  </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="width: 413px">
                    税费：</td>
                <td height="25" align="left" bgcolor="#F6F6F6" style="width: 500px">
               <input  id="airlineTax" runat="server" type="text" size="40" />
               </td>
               <td bgcolor="#F6F6F6" style="width: 253px">
               </td>
            </tr>
             <tr>
                <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
                    <asp:Button ID="btnSave" runat="server" Text="保 存"  Height="23" OnClientClick="return checkInfo()" OnClick="btnSave_Click" />&nbsp;&nbsp;&nbsp;&nbsp;
                    <input name="Submit3" type="button" style="height: 23px;"onclick="location.href='airline_list.aspx'" value="返 回" />
                </td>
            </tr>

    
        </table>
    </form>
</body>
</html>

<script type="text/javascript">
    var arrList = new Array();//要搜索的数据
    var objouter, objInput, objInputId = "txtSearch";//控件ID
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

        arrList.sort(function(a, b) {
            if (a.length > b.length) return 1;
            else if (a.length == b.length) return a.localeCompare(b);
            else return -1;
        });
        objouter = document.getElementById("__smanDisp") //显示的DIV对象 
        objInput = document.getElementById(objInputId);  //文本框对象
        if (objInput == null) {
            alert('smanPromptList初始化失败:没有找到"' + objInputId + '"文本框');
            return;
        }
        objInput.onblur = function() { objouter.style.display = 'none'; }
        objInput.onkeyup = checkKeyCode;
        objInput.onfocus = checkAndShow;
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
    function outSelection(Index) {
        objInput.value = objouter.children[Index].innerText.Trim();
        objouter.style.display = 'none';
    }
    function divPosition() {
        objouter.style.top = getAbsoluteHeight(objInput) + getAbsoluteTop(objInput);
        objouter.style.left = getAbsoluteLeft(objInput);
        objouter.style.width = getAbsoluteWidth(objInput);
    }
    function chageSelection(isUp) {
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
                objInput.value = objouter.children[selectedIndex].innerText.Trim();
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
                chageSelection(isUp)
            }
            else if (keyCode == 13) {
                outSelection(selectedIndex);
            }
            else {
                checkAndShow();
            }
        }
        else {
            checkAndShow();
        }
        divPosition();
    }
    function checkAndShow() {
        var strInput = objInput.value.Trim();
        if (strInput != "") {
            divPosition();
            selectedIndex = -1;
            arrList.length = 0;
            objouter.innerHTML = "";
            //=======================这里修改数据================================
            var result = console_taxManager_add.GetArray(strInput).value;
            //===================================================================
            var data = eval('(' + result + ')');
            for (var j = 0; j < data.length; j++) {

                arrList[j] = data[j];
            }

            for (intTmp = 0; intTmp < arrList.length; intTmp++) {
                for (i = 0; i < arrList[intTmp].length; i++) {
                    if (arrList[intTmp].substr(i, strInput.length).toUpperCase() == strInput.toUpperCase()) {
                        addOption(arrList[intTmp], strInput);
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
    function addOption(value, keyw) {
        var v = value.replace(keyw, "<b><font color=\"red\">" + keyw + "</font></b>");
        objouter.innerHTML += "<div style=\"width:395px;height:22px\" onmouseover=\"this.className='sman_selectedStyle'\" onmouseout=\"this.className=''\" onmousedown=\"document.getElementById('" + objInputId + "').value='" + value + "'\">" + v + "</div>"
    }
    String.prototype.Trim = function() {
        return this.replace(/(^\s*)|(\s*$)/g, "");
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
        objouter1.style.top = getAbsoluteHeight1(objInput1) + getAbsoluteTop1(objInput1);
        objouter1.style.left = getAbsoluteLeft1(objInput1);
        objouter1.style.width = getAbsoluteWidth1(objInput1);
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
            var result = console_taxManager_add.GetCity_to(strInput).value;
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

