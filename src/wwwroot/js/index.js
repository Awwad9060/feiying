
function turnit(o) {
    document.getElementById("right" + o).className = "one"; //newsearchinsider
    document.getElementById("rightChild" + o).className = "nohidden";
    var j;
    var g;
    var id;
    var e;
    var f;
    for (var i = 1; i <= 3; i++) {
        j = document.getElementById("right" + i);
        //alert(o.id);
        e = document.getElementById("rightChild" + i);
        if (o != i) {
            j.className = "two"; //newsearchinsidew
            e.className = "hidden";
        }
    }
}


function In_turnit(o) {
    document.getElementById("In_right" + o).className = "one"; //newsearchinsider
    document.getElementById("In_rightChild" + o).className = "nohidden";
    var j;
    var g;
    var id;
    var e;
    var f;
    for (var i = 1; i <= 3; i++) {
        j = document.getElementById("In_right" + i);
        //alert(o.id);
        e = document.getElementById("In_rightChild" + i);
        if (o != i) {
            j.className = "two"; //newsearchinsidew
            e.className = "hidden";
        }
    }
}

function show(c_Str) {
    for (var i = 1; i <= 2; i++) {
        if (i == c_Str) {
            document.getElementById("tip434" + i).style.display = "block";
        } else {
            document.getElementById("tip434" + i).style.display = "none";
        }
    }
}

function showCompare(c_Str) {
    if (document.all(c_Str).style.display == 'none') {
        document.all(c_Str).style.display = 'block';
        document.getElementById("compareBut").style.display = 'none';
    }
    else {
        document.all(c_Str).style.display = 'none';
        document.getElementById("compareBut").style.display = 'block';
    }
}


function closeCompareBut() {
    document.getElementById("compareBut").style.display = 'none';
}

function showRec(c_Str) {
    for (var i = 1; i <= 4; i++) {
        if (i == c_Str) {
            document.getElementById("two" + i).style.display = "block";
        } else {
            document.getElementById("two" + i).style.display = "none";
        }
    }
    document.getElementById("smallleft").className = "smallleft_threenattitle" + c_Str;
}

function showlist(o) {
    document.getElementById("mylist" + o).style.top = document.getElementById("txt" + o).parentNode.style.top;
    document.getElementById("mylist" + o).style.left = document.getElementById("txt" + o).parentNode.style.left;
    document.getElementById("mylist" + o).style.display = 'block';
}
function hidelist(o) {
    document.getElementById("mylist" + o).style.display = 'none';
}
function insertValue(s, o) {
    document.getElementById("txt" + o).value = document.getElementById("v" + s).innerHTML;
    hidelist(o);
}

function changeDiv(value) {
    document.getElementById("memnu").className = "menu_" + value;
}

function showhotcity() {
    document.getElementById("hotcityDiv").style.display = "block";
    if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0") {
        document.getElementById("fromCity").disabled = true;
    }
}

function closehotcity() {
    document.getElementById("hotcityDiv").style.display = "none";
    if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0") {
        document.getElementById("fromCity").disabled = false;
    }
}

function showStateCity(value) {
    for (var i = 1; i <= 6; i++) {
        if (i == value) {
            document.getElementById("citylist00" + i).style.display = "block";
            document.getElementById("state00" + i).className = "now";
        } else {
            document.getElementById("citylist00" + i).style.display = "none";
            document.getElementById("state00" + i).className = "";
        }
    }
}
function selectCity(value) {
    if (document.getElementById("tocityName") != null) {
        document.getElementById("tocityName").value = value;
    }
    if (document.getElementById("ids_tocity") != null) {
        document.getElementById("ids_tocity").value = value;
    }
    closehotcity();
}

function changeDiv(value) {
    document.getElementById("memnu").className = "menu_" + value;
}

function showPicRec(value1, value2) {
    document.getElementById(value1).className = 'one';
    document.getElementById(value2).className = 'two';
    document.getElementById(value1 + "_ul").style.display = "block";
    document.getElementById(value2 + "_ul").style.display = "none";
}

function showFromTicket(value1, value2) {
    document.getElementById("from" + value1).className = 'one';
    document.getElementById("from" + value2).className = 'two';
    document.getElementById(value1 + "_TicketDiv").style.display = "block";
    document.getElementById(value2 + "_TicketDiv").style.display = "none";
}

function showHistory() {
    document.getElementById("historyli").className = 'one';
    document.getElementById("recomli").className = 'two';
    document.getElementById("viewHistory").style.display = "block";
    document.getElementById("recomforyou").style.display = "none";
}

function showRecommend() {
    document.getElementById("historyli").className = 'two';
    document.getElementById("recomli").className = 'one';
    document.getElementById("viewHistory").style.display = "none";
    document.getElementById("recomforyou").style.display = "block";
}


var loadingStr = "&nbsp;&nbsp;&nbsp;正在加载数据，请稍等...<br><br>";

function showHotelResults(divname, index, cityName) {
    for (var i = 1; i <= 6; i++) {
        if (i == index) {
            document.getElementById(divname + i).className = "one";
        } else {
            document.getElementById(divname + i).className = "two";
        }
    }
    function showSearchList(rs) {
        if (rs == null) { document.getElementById(divname).innerHTML = ""; } else { document.getElementById(divname).innerHTML = rs; }
    }
    var params = "";
    postData("hotelRecList.aspx?cityname=" + escape(cityName) + "", params, showSearchList);
    document.getElementById(divname).innerHTML = loadingStr;
}


function checktel(tel) {

    var str = tel;

    var Expression = /(\d{3}-)?\d{8}|(\d{4}-)(\d{7})/;

    var objExp = new RegExp(Expression);

    if (objExp.test(str) == true) {

        return true;

    } else {

        return false;

    }

}


function sendTelMsg() {
    var text = document.getElementById("eMsg_tel").value;
    if (text == "") {
        alert('  请输入电话号码！');
        document.getElementById("eMsg_tel").focus();
        return false;
    }
    else if ((checktel(text) == false) && (text != "")) {
        alert('  请输入正确电话号码！');
        document.getElementById("eMsg_tel").focus();
        return false;
    }
    else {
        try {
            ajaxRead("flow_box.aspx?telvalue=" + escape(text), "checksuccess();");
            return;
        }
        catch (e) {
            alert('提交失败,出现异常,抱歉!');
            return;
        }
    }

}
//判断是否成功
function checksuccess() {
    var result = "";
    result = obj_value;
    if (result == "1") {
        alert('提交成功,我们会第一时间联系您!');
        document.getElementById("eMsg_tel").value = "";
    }
    else {
        alert('提交失败,出现异常,抱歉!');
    }
    return;
}


function sendBookMsg() {
    var contact = document.getElementById("contact").value;
    var fCity = document.getElementById("fCity").value;
    var tCity = document.getElementById("tCity").value;
    var fDate = document.getElementById("fDate").value;
    var tDate = document.getElementById("tDate").value;

    if (contact == "") {
        alert('请输入联系电话和称呼！');
        document.getElementById("contact").focus();
        return false;
    }

    if (fCity == "") {
        alert('请输入出发城市！');
        document.getElementById("fCity").focus();
        return false;
    }

    if (tCity == "") {
        alert('请输入到达城市！');
        document.getElementById("tCity").focus();
        return false;
    }

    try {
        ajaxRead("flow_box.aspx?contact=" + escape(contact) + "&fCity=" + escape(fCity) + "&tCity=" + escape(tCity) + "&fDate=" + escape(fDate) + "&tDate=" + escape(tDate), "checkBooksuccess();");
        return;
    }
    catch (e) {
        alert('提交失败,出现异常,抱歉!');
        return;
    }

}
//判断是否成功
function checkBooksuccess() {
    var result = "";
    result = obj_value;
    if (result == "1") {
        alert('提交成功,我们会第一时间联系您!');
        document.getElementById("contact").value = "";
    }
    else {
        alert('提交失败,出现异常,抱歉!');
    }
    return;
}


function sendTicketBookMsg() {
    var contact = document.getElementById("contact").value;
    var title = document.getElementById("title").value;
    var tripDate = document.getElementById("tripDate").value;
    var backDate = document.getElementById("backDate").value;
    var telephone = document.getElementById("telephone").value;
    var tId = document.getElementById("tId").value;
    var num = document.getElementById("num").value;
    var harryGrade = document.getElementById("harryGrade").value;
    var otherMess = document.getElementById("otherMess").value;

    if (contact == "") {
        alert('请输入您的称呼！');
        document.getElementById("contact").focus();
        return false;
    }


    if (title == "") {
        alert('请输入机票标题！');
        document.getElementById("title").focus();
        return false;
    }


    if (telephone == "") {
        alert('请输入联系电话！');
        document.getElementById("telephone").focus();
        return false;
    }

    try {
        ajaxRead("book_box.aspx?contact=" + escape(contact) + "&title=" + escape(title) + "&telephone=" + escape(telephone) + "&tId=" + tId + "&num=" + num + "&tripDate=" + escape(tripDate) + "&backDate=" + escape(backDate) + "&harryGrade=" + escape(harryGrade) + "&otherMess=" + escape(otherMess), "checkTicektBooksuccess();");
        return;
    }
    catch (e) {
        alert('提交失败,出现异常,抱歉!');
        return;
    }

}
//判断是否成功
function checkTicektBooksuccess() {
    var result = "";
    result = obj_value;
    if (result == "1") {
        alert('提交成功,我们会第一时间联系您!');
        document.getElementById("contact").value = "";
    }
    else {
        alert('提交失败,出现异常,抱歉!');
    }
    return;
}

function sendLeaveMessage() {
    var contact = document.getElementById("contact").value;
    var title = document.getElementById("title").value;
    var telephone = document.getElementById("telephone").value;
    var content = document.getElementById("content").value;
    var lType = document.getElementById("lType").value;
    var email = document.getElementById("email").value;

    if (contact == "") {
        alert('请输入您的称呼！');
        document.getElementById("contact").focus();
        return false;
    }


    if (title == "") {
        alert('请输入标题！');
        document.getElementById("title").focus();
        return false;
    }


    if (telephone == "") {
        alert('请输入联系电话！');
        document.getElementById("telephone").focus();
        return false;
    }

    try {
        ajaxRead("/leave_box.aspx?title=" + escape(title) + "&lType=" + escape(lType) + "&contact=" + escape(contact) + "&telephone=" + escape(telephone) + "&email=" + escape(email) + "&content=" + escape(content), "checkLeavesuccess();");
        return;
    }
    catch (e) {
        alert('提交失败,出现异常,抱歉!');
        return;
    }

}
//判断是否成功
function checkLeavesuccess() {
    var result = "";
    result = obj_value;
    if (result == "1") {
        alert('提交成功,感谢您的建议!');
        document.getElementById("title").value = "";
        document.getElementById("contact").value = "";
        document.getElementById("telephone").value = "";
        document.getElementById("content").value = "";
        document.getElementById("email").value = "";
    }
    else {
        alert('提交失败,出现异常,抱歉!');
    }
    return;
}



function sendObjectMessage() {
    var contact = document.getElementById("ocontact").value;
    var title = document.getElementById("otitle").value;
    var telephone = document.getElementById("otelephone").value;
    var content = document.getElementById("ocontent").value;
    var lType = document.getElementById("olType").value;
    var email = document.getElementById("oemail").value;

    if (contact == "") {
        alert('请输入您的称呼！');
        document.getElementById("ocontact").focus();
        return false;
    }


    if (title == "") {
        alert('请输入投诉对象！');
        document.getElementById("otitle").focus();
        return false;
    }


    if (telephone == "") {
        alert('请输入联系电话！');
        document.getElementById("otelephone").focus();
        return false;
    }

    try {
        ajaxRead("/leave_box.aspx?title=" + escape(title) + "&lType=" + escape(lType) + "&contact=" + escape(contact) + "&telephone=" + escape(telephone) + "&email=" + escape(email) + "&content=" + escape(content), "checkObjectsuccess();");
        return;
    }
    catch (e) {
        alert('提交失败,出现异常,抱歉!');
        return;
    }

}
//判断是否成功
function checkObjectsuccess() {
    var result = "";
    result = obj_value;
    if (result == "1") {
        alert('提交成功,谢谢您的投诉!');
        document.getElementById("otitle").value = "";
        document.getElementById("ocontact").value = "";
        document.getElementById("otelephone").value = "";
        document.getElementById("ocontent").value = "";
        document.getElementById("oemail").value = "";
    }
    else {
        alert('提交失败,出现异常,抱歉!');
    }
    return;
}


function getCookieVal(offset) {
    var endstr = document.cookie.indexOf(";", offset);
    if (endstr == -1) endstr = document.cookie.length;
    return unescape(document.cookie.substring(offset, endstr));
}
function getCookie(name) {
    var arg = name + "=";
    var alen = arg.length;
    var clen = document.cookie.length;
    var i = 0;
    while (i < clen) {
        var j = i + alen;
        if (document.cookie.substring(i, j) == arg) return getCookieVal(j);
        i = document.cookie.indexOf(" ", i) + 1;
        if (i == 0) break;
    }
    return null;
}
//将浏览动作写入cookie   
function setCookie(name, value) {
    var exp = new Date();
    exp.setTime(exp.getTime() + 3600000000);
    document.cookie = name + "=" + escape(value) + "; expires=" + exp.toGMTString();
}


function setCookie1(name, value) {
    var exp = new Date();
    exp.setTime(exp.getTime() + 3600000000);
    document.cookie = name + "=" + value + "; expires=" + exp.toGMTString();
}


function addHistory(title, price, linkUrl) {
    address = linkUrl + "_www.fei580.com_"; //取出事件发生源的href值，也就是该链接的地址   
    wlink = title + "+" + price + "+" + address; //将链接名称和链接地址整合到一个变量当中       
    old_info = getCookie("history_info"); //从Cookies中取出以前纪录的浏览历史，该函数后面有声明   
    //以下程序开始判断新的浏览动作是否和已有的前6个历史重复，如果不重复则写入cookies
    var insert = true;
    if (old_info == null)//判断cookie是否为空   
    {
        insert = true;
    }
    else {
        var old_link = old_info.split("_www.fei580.com_");
        for (var j = 0; j <= 5; j++) {
            if (old_link[j].indexOf(title) != -1)
                insert = false;
            if (old_link[j] == "null")
                break;
        }
    }
    if (insert) {
        wlink += getCookie("history_info");
        setCookie("history_info", wlink); //写入cookie，该函数后面有声明
    }
}

function history_show() {
    var history_info = getCookie("history_info"); //取出cookie中的历史记录   
    var content = ""; //定义一个显示变量   
    if (history_info != null) {
        history_arg = history_info.split("_www.fei580.com_");
        var i;
        for (i = 0; i < history_arg.length; i++) {
            if (i <= 5) {
                if (history_arg[i] != "null") {
                    var wlink = history_arg[i].split("+");
                    content += ("<li><span><a href='" + wlink[2] + "' target='_blank'>" + wlink[0] + "</a></span><code>" + wlink[1] + "</code></li>");
                }
                document.getElementById("viewHistory").innerHTML = content;

            }
        }

        showHistory();
    }
    else {
        document.getElementById("viewHistory").innerHTML = "没有浏览纪录";
        showRecommend();
        document.getElementById("recomforyou").style.display = 'block';
    }
}



function addCompare(tId, title, price) {
    wlink1 = tId + "+" + title + "+" + price + "_fei580_"; //将链接名称和链接地址整合到一个变量当中       
    old_info1 = getCookie("Compare_info"); //从Cookies中取出以前纪录的浏览历史，该函数后面有声明   
    //以下程序开始判断新的浏览动作是否和已有的前6个历史重复，如果不重复则写入cookies
    var insert = true;
    if (old_info1 == null)//判断cookie是否为空   
    {
        insert = true;
    }
    else {
        var old_link1 = old_info1.split("_fei580_");
        for (var j = 0; j <= 5; j++) {
            if (old_link1[j].indexOf(tId + "+" + title + "+" + price) != -1)
                insert = false;
            if (old_link1[j] == "null")
                break;
        }
    }
    if (insert) {
        wlink1 += getCookie("Compare_info");
        setCookie("Compare_info", wlink1); //写入cookie，该函数后面有声明
        addconstrCookie(tId);
        document.getElementById("compareBut").style.display = 'none';
        Compare_show();
        alert("已成功加入比较蓝");
        showCompare('tipbi1');
    } else {
        alert("已在比较蓝，不用重复提交！");
    }
    document.getElementById("duilianb02").style.display = 'block';
    showCompare('tipbi1');

}


function addconstrCookie(tId) {
    var tlink = tId + ",";
    var oloConstr = getCookie("contrast_str");
    var insert = true;
    if (oloConstr == null)//判断cookie是否为空   
    {
        insert = true;
    }
    else {
        var old_link1 = oloConstr.split("fei");
        for (var j = 0; j <= 5; j++) {
            if (old_link1[j] == tId)
                insert = false;
            if (old_link1[j] == "null")
                break;
        }
    }
    if (insert) {
        if (getCookie("contrast_str") != "undefine" && getCookie("contrast_str") != "null") {
            tlink += getCookie("contrast_str");
            setCookie1("contrast_str", tlink); //写入cookie，该函数后面有声明 
        }
    }
}

function Compare_show() {
    var Compare_info = getCookie("Compare_info"); //取出cookie中的历史记录   
    var content1 = ""; //定义一个显示变量   
    if (Compare_info != null) {
        Compare_arg = Compare_info.split("_fei580_");
        var i;
        for (i = 0; i < Compare_arg.length; i++) {
            if (i <= 5) {
                if (Compare_arg[i] != "null") {
                    var wlink1 = Compare_arg[i].split("+");
                    content1 += ("<li><span><a href='ticket_" + wlink1[0] + ".htm' target='_blank'>" + wlink1[1] + "</a></span><code>" + wlink1[2] + "<a href=\"javascript:removecompare('" + wlink1[0] + "');\"><img src='images/qian08.jpg' /></a></code></li>");
                }
                document.getElementById("compareList").innerHTML = content1;

            }
        }

    }
    else {
        document.getElementById("compareBut").style.display = 'none';
        document.getElementById("compareList").innerHTML = "比较蓝为空...";
    }
}
function removecompare(tId) {
    var Compare_info = getCookie("Compare_info");
    if (Compare_info != null) {
        Compare_arg = Compare_info.split("_fei580_");
        var i;
        for (i = 0; i < Compare_arg.length; i++) {
            if (Compare_arg[i].indexOf(tId + "+") != -1) {
                Compare_info = Compare_info.replace(Compare_arg[i] + "_fei580_", "");
                continue;
            }
        }
    }
    var constr = getCookie("contrast_str");
    constr = constr.replace(tId + ",");
    setCookie1("contrast_str", constr); //写入cookie，该函数后面有声明    

    setCookie("Compare_info", Compare_info); //写入cookie，该函数后面有声明
    alert("已清除对应的比较项目");
    Compare_show();
}

function checkIds() {
    var fromCity1 = document.getElementById("fromcityStr").value;
    var ids_tocity = document.getElementById("ids_tocity").value;
    if (fromCity1 == "") {
        alert('请选择出发城市！');
        document.getElementById("fromcityStr").focus();
        return false;
    }
    if (ids_tocity == "") {
        alert('请选择目的城市！');
        document.getElementById("ids_tocity").focus();
        return false;
    }
    return true;
}


function showFromcity() {
    if (document.getElementById("fromList").style.display == 'none') {
        document.getElementById("fromList").style.display = 'block';
    } else {
        document.getElementById("fromList").style.display = 'none';
    }
}
function insertCityValue(value) {
    document.getElementById("fromcityStr").value = value;
    document.getElementById("fromList").style.display = 'none';
}
function showTripType() {
    if (document.getElementById("typeList").style.display == 'none') {
        document.getElementById("typeList").style.display = 'block';
    } else {
        document.getElementById("typeList").style.display = 'none';
    }
}
function insertTypeValue(value) {
    document.getElementById("tripType_str").value = value;
    document.getElementById("typeList").style.display = 'none';
}

function changServer(res) {
    for (var i = 1; i < 4; i++) {
        if (i == res) {
            document.getElementById("ulserverh" + i).style.display = "block";
            document.getElementById("ulserver" + i).style.display = "block";
        }
        else {
            document.getElementById("ulserverh" + i).style.display = "none";
            document.getElementById("ulserver" + i).style.display = "none";
        }
    }
}


//检查酒店查询
function CheckSearchHotel() {

    var tocityName = $("#tocityName").val();
    if (tocityName == "") {
        alert("请选择目的地城市！");
        $("#tocityName").focus();
        return false;
    }

    //入住日期
    var txt_fromDate = $("#txt_fromDate").val();
    if (!isDate(txt_fromDate)) {
        alert("请选择入住日期！");
        $("#txt_fromDate").focus();
        return false;
    }
    //离住日期
    var txt_toDate = $("#txt_toDate").val();
    if (!isDate(txt_toDate)) {
        alert("请选择退房日期！");
        $("#txt_toDate").focus();
        return false;
    }


    //比较入住日期和离住日期大少
    if (CheckDatesBS(txt_toDate, txt_fromDate)) {
        alert("入住日期不能大于离住日期！");
        $("#txt_toDate").focus();
        return false;
    }

    //判断入住天数是否大于28天
    if (DateDiff(txt_toDate, txt_fromDate) > 28) {
        alert("入住天数不能大于30天！");
        $("#txt_toDate").focus();
        return false;
    }

    return true;
}

// 判断日期格式
function isDate(str) {
    var reg = /^((((1[6-9]|[2-9]\d)\d{2})-(0?[13578]|1[02])-(0?[1-9]|[12]\d|3[01]))|(((1[6-9]|[2-9]\d)\d{2})-(0?[13456789]|1[012])-(0?[1-9]|[12]\d|30))|(((1[6-9]|[2-9]\d)\d{2})-0?2-(0?[1-9]|1\d|2[0-8]))|(((1[6-9]|[2-9]\d)(0[48]|[2468][048]|[13579][26])|((16|[2468][048]|[3579][26])00))-0?2-29-))$/;
    if (reg.test(str)) return true;
    return false;
}
//日期大小判断
function CheckDatesBS(date1, date2) {
    try {
        var v1Ary = date1.split('-');
        var v2Ary = date2.split('-');
        var d1 = new Date(v1Ary[1] + '/' + v1Ary[2] + '/' + v1Ary[0]); //出发日期
        var d2 = new Date(v2Ary[1] + '/' + v2Ary[2] + '/' + v2Ary[0]); //返回日期
        if (d1 > d2) { return false; }
        else { return true; }
    } catch (e) { alert(e); }
}

//两日期相减的天数
function DateDiff(sDate1, sDate2) {
    var aDate, oDate1, oDate2, iDays;
    aDate = sDate1.split("-");
    oDate1 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);  //转换为12-18-2002格式
    aDate = sDate2.split("-");
    oDate2 = new Date(aDate[1] + '-' + aDate[2] + '-' + aDate[0]);
    iDays = parseInt(Math.abs(oDate1 - oDate2) / 1000 / 60 / 60 / 24);  //把相差的毫秒数转换为天数
    return iDays;
}

function searchkeyfocus() {
    if (document.getElementById("SearchControl1_searchkey").value == "搜索旅行攻略") {
        document.getElementById("SearchControl1_searchkey").value = "";
        document.getElementById("SearchControl1_searchkey").className = "headerinput unserchcolor";
    }
}

function searchkeyblur() {
    if (document.getElementById("SearchControl1_searchkey").value == "") {
        document.getElementById("SearchControl1_searchkey").value = "搜索旅行攻略";
        document.getElementById("SearchControl1_searchkey").className = "headerinput serchcolor";
    }
}

var SetAllSelects = {
    Offset: function(e) {
        var t = e.offsetTop;
        var l = e.offsetLeft;
        var w = e.offsetWidth;
        var h = e.offsetHeight;
        while (e = e.offsetParent) { t += e.offsetTop; l += e.offsetLeft; }
        return { top: t, left: l, width: w, height: h };
    },
    setCreated: function(obj, status) { //设置属性
        obj.setAttribute("childCreated", status);
    },
    getCreated: function(obj) { //获取属性
        if (obj == null)
            return "";
        var status = obj.getAttribute("childCreated");
        if (status == null) { status = ""; }
        return status;
    },
    setSelectStyle: function(obj, idnum, showHeight) {
        var isIE6 = false;
        if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0") {
            isIE6 = true;
        }
        document.getElementById("fromCityHidden").style.display = "none";
        if (obj.id == null || obj.id == "") { obj.id = "selectID_" + idnum; }
        obj.style.visibility = "";
        var offset = this.Offset(obj);
        obj.style.visibility = "hidden";
        var mainDiv = document.createElement("div");
        var iDiv = document.createElement("div");
        var js_select_;
        var _this = this;
        iDiv.className = "select_input";
        iDiv.id = js_select_ + obj.id;
        iDiv.style.width = offset.width + "px";

        if (isIE6)
            iDiv.style.top = offset.top - 2 + "px";
        else
            iDiv.style.top = offset.top + "px";
        iDiv.style.left = offset.left + "px";
        this.setCreated(iDiv, "");
        mainDiv.appendChild(iDiv);

        //当屏幕变化时
        window.onresize = function() {
            var offset = _this.Offset(obj);
            if (isIE6)
                iDiv.style.top = offset.top - 2 + "px";
            else
                iDiv.style.top = offset.top + "px";
            iDiv.style.left = offset.left + "px";
        };

        var tValue = obj.options[obj.selectedIndex].innerHTML;
        iDiv.innerHTML = tValue;
        iDiv.onmouseover = function() { iDiv.className = "select_input select_input_over"; }
        iDiv.onmouseout = function() { iDiv.className = "select_input select_input_out"; }
        iDiv.onclick = function() {
            var created = _this.getCreated(this);
            if (created != "") {
                if (created == "open") {
                    this.nextSibling.style.display = "none";
                    _this.setCreated(this, "close");
                }
                else {
                    _this.setCreated(this, "open");
                    var arrLiObj = this.nextSibling.getElementsByTagName("li");
                    var selOjbIndex = 0;
                    for (var i = 0; i < arrLiObj.length; i++) {
                        var status = arrLiObj[i].getAttribute("liSelected");
                        if (status == null) { status = ""; }
                        if (status == "selected") { selOjbIndex = i; break; }
                    }
                    arrLiObj[selOjbIndex].style.background = "#fff";
                    arrLiObj[selOjbIndex].style.color = "#000";
                    this.nextSibling.style.display = "block";
                }
            }
            else {
                _this.setCreated(this, "open");
                var cDiv = document.createElement("div");
                cDiv.className = "cselect_input";
                cDiv.style.width = offset.width + "px";

                cDiv.style.height = obj.options.length * 20 + "px";
                if (parseInt(cDiv.style.height) > showHeight) {
                    cDiv.style.height = showHeight + "px";
                }
                var current = (this.currentStyle || document.defaultView.getComputedStyle(this, null)).height;
                cDiv.style.top = (offset.top + parseInt(current)) + "px";
                cDiv.style.left = offset.left + "px";
                cDiv.onselectstart = function() { return false; };
                var uUl = document.createElement("ul");
                cDiv.appendChild(uUl);
                mainDiv.appendChild(cDiv);

                //当屏幕变化时
                window.onresize = function() {
                    var offset = _this.Offset(obj);
                    if (isIE6) {
                        iDiv.style.top = offset.top - 2 + "px";
                        cDiv.style.top = (offset.top + parseInt(current) + 1) - 2 + "px";
                    } else {
                        iDiv.style.top = offset.top + "px";
                        cDiv.style.top = (offset.top + parseInt(current) + 1) + "px";
                    }
                    iDiv.style.left = offset.left + "px";
                    cDiv.style.left = offset.left + "px";
                };

                for (var i = 0; i < obj.options.length; i++) {
                    var lLi = document.createElement("li");
                    lLi.id = obj.options[i].value;
                    lLi.innerHTML = obj.options[i].innerHTML;
                    lLi.sValue = obj.options[i].value;
                    uUl.appendChild(lLi);
                }
                var liObj = uUl.getElementsByTagName("li");
                if (liObj.length > 0) {
                    for (var j = 0; j < obj.options.length; j++) {
                        liObj[j].onmouseover = function() {
                            var arrLiObj = this.parentNode.getElementsByTagName("li");
                            for (var i = 0; i < arrLiObj.length; i++) {
                                var status = "";
                                var _background = "#ccc";
                                var _color = "#fff";
                                if (arrLiObj[i] != this) {
                                    _background = "#fff";
                                    _color = "#000";
                                    status = "selected";
                                }
                                arrLiObj[i].style.background = _background;
                                arrLiObj[i].style.color = _color;
                                arrLiObj[i].setAttribute("liSelected", status);
                            }
                        };
                        liObj[j].onclick = function() {
                            obj.options.length = 0;
                            obj.options[0] = new Option(this.innerHTML, this.sValue);
                            this.parentNode.parentNode.style.display = "none";
                            _this.setCreated(this.parentNode.parentNode.previousSibling, "close");
                            iDiv.innerHTML = this.innerHTML;
                        };
                        liObj[0].style.background = "#ccc";
                        liObj[0].style.color = "#fff";
                        liObj[0].setAttribute("liSelected", "selected");
                    }
                }
            }
        };
        document.body.appendChild(mainDiv);
    },
    setAllSelectStyle: function() {
        var s = document.getElementsByTagName("select");
        for (var i = 0; i < s.length; i++) {
            if (s[i].className == "select") {
                this.setSelectStyle(s[i], i, 300);
            }
        }
    }
};

document.onclick = function(e) {
    e = e || window.event;
    var target = e.target || event.srcElement;
    var s = document.getElementsByTagName("select");
    var js_select_;
    for (var i = 0; i < s.length; i++) {
        if (s[i].className == "select") {
            var objdivtmp = document.getElementById(js_select_ + s[i].id);
            var created = SetAllSelects.getCreated(objdivtmp);
            if (created == "open") {
                if (target != objdivtmp) {
                    objdivtmp.nextSibling.style.display = "none";
                    SetAllSelects.setCreated(objdivtmp, "close");
                }
            }
        }
    }
};

function closeIndexTop() {
    $('#div_indextop').slideUp(1500);
}
//选择出发城市
function clickFromCity(cityId, cityName) {
    $("#fromCity").val(cityId);
    $("#fromCityName").val(cityName);
}

//
function mouseOverSearching() {
    window.clearInterval(autoStartA);
}
function mouseOutSearching() {
    setAuto();
}

//
function focusEticket(ipt) {
    if (ipt.value == "填写你的机票下载号") {
        ipt.value = "";
    }
}
function blurEticket(ipt) {
    if (ipt.value == "") {
        ipt.value = "填写你的机票下载号";
    }
}

function clickFlySearching(div) {
    var txtSearchingLinkUrl = document.getElementById("txtSearchingLinkUrl");
    window.open(txtSearchingLinkUrl.value);
}

// 关闭
function turnoff(obj) {
    document.getElementById(obj).style.display = "none";
}