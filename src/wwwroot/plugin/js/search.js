// 机票查询、旅游攻略查询、用户登录 JS文件
function TicketSearch(){
    this.right1 = $("#right1");//国际机票
    this.right2 =$("#right2");//国内机票
    this.right3 =$("#right3");//特价酒店
    
    this.tripType1 = $("#tripType1");//全部
    this.tripType2 = $("#tripType2");//单程
    this.tripType3 = $("#tripType3");//往返
    //this.tripType = $('input[@name=tripType][@checked]');

    //this.fromCity = $("#fromCity");//出发城市
    this.tocityName = $("#tocityName");//目的城市
    this.towhere = $("#towhere");//目的城市
    
    this.fromtripDate = $("#fromtripDate");//出发日期
    this.backtripDate = $("#backtripDate");//回程日期
    
    this.btnSearch = $("#btnSearch");//搜索
    this.toWhereButt = $("#toWhereButt");//搜索
    
    me = this;
    
    this.right2.click(function(){
        window.location.href='http://www.fei580.com/ticket/';
    });
    this.right3.click(function(){
        window.location.href='http://hotel.fei580.com/';
    });
    this.tripType1.click(function(){
        me.backtripDate.removeAttr("disabled");
    });
    this.tripType2.click(function(){
        me.backtripDate.attr("disabled","true");
    });
    this.tripType3.click(function(){
        me.backtripDate.removeAttr("disabled");
    });
    
    this.tocityName.keydown(function(e){
        if(e.keyCode==13){
            me.btnSearch.click();
        }
    });
    this.fromtripDate.keydown(function(e){
        if(e.keyCode==13){
            me.btnSearch.click();
        }
    });
    this.backtripDate.keydown(function(e){
        if(e.keyCode==13){
            me.btnSearch.click();
        }
    });

    //设置Gookie值
    if (($.cookie("fromcity") || "") != "") {
        //$("#fromCity").val($.cookie("fromcity"));
    }
    if (($.cookie("tocityName") || "") != "") {
        this.tocityName.val(unescape($.cookie("tocityName")));
    }
    if (($.cookie("tripType") || "") != "") {
        if ($.cookie("tripType") == 2) {
            this.tripType1.click();
        }
        else if ($.cookie("tripType") == 0) {
            this.tripType2.click();
        }
        else if ($.cookie("tripType") == 1) {
            this.tripType3.click();
        }
    }   
    if (($.cookie("fromtripDate") || "") != "") {
        this.fromtripDate.val($.cookie("fromtripDate"));
    }
    if (($.cookie("backtripDate") || "") != "") {
        this.backtripDate.val($.cookie("backtripDate"));
    }

    this.btnSearch.click(function() {
        var fromcity = $("#fromCity").val();
        if (fromcity == "") {
            alert("请选择出发地");
            return;
        }
        var tocityName = me.tocityName.val();
        if (tocityName == "") {
            alert("请输入目的地");
            return;
        } else if (tocityName == "输入中文/英文") {
            me.tocityName.focus();
            return;
        }

        var fromtripDate = me.fromtripDate.val();
        if (fromtripDate == "") {
            alert("请选择出发日期");
            me.fromtripDate.focus();
            return;
        }
        var backtripDate = me.backtripDate.val();
        if (backtripDate == "") {
            alert("请选择回程日期");
            me.backtripDate.focus();
            return;
        }

        if (!CheckDatesBS(fromtripDate)) {
            alert("出发日期不能小于当天日期");
            me.fromtripDate.focus();
            return;
        }
        
        var tripType = $("input[name='tripType']:checked").val();
        if (tripType != "0") {
            var dateCha = (Date.parse(fromtripDate.replace("-", "/")) - Date.parse(backtripDate.replace("-", "/"))) / 86400000 * 24;
            if (dateCha > 0) {
                alert("出发日期不能小于回程日期");
                me.fromtripDate.focus();
                return;
            } 
        }

        // 将值存入 cookie
        $.cookie("fromcity", escape(fromcity), { expires: 7, path: "/" });
        $.cookie("tocityName", escape(tocityName), { expires: 7, path: "/" });
        $.cookie("tripType", escape(tripType), { expires: 7, path: "/" });
        $.cookie("fromtripDate", escape(fromtripDate), { expires: 7, path: "/" });
        $.cookie("backtripDate", escape(backtripDate), { expires: 7, path: "/" });

        window.location.href = "/searchTicket.aspx?fromcity=" + fromcity + "&tocityName=" + escape(tocityName) + "&tripType=" + tripType + "&tripDate=" + fromtripDate + "&backDate=" + backtripDate + "";
    }); 
    this.toWhereButt.click(function(){
        var fromcity = $("#fromCity").val();
        if(fromcity==""){
            alert("请选择出发地");
            return;
        }
        var towhere = me.towhere.val();
        if(towhere==""){
            alert("请输入目的地");
            return;
        } else if (tocityName == "输入中文/英文") {
            me.tocityName.focus();
            return;
        }
        
        var fromtripDate = me.fromtripDate.val();
        if(fromtripDate==""){
            alert("请选择出发日期");
            return;
        }
        var backtripDate = me.backtripDate.val();
        if(backtripDate==""){
            alert("请选择回程日期");
            return;
        }
        var tripType = $('input[@name=tripType][@checked]').val();   
        window.location.href="searchTicket.aspx?fromcity=" + fromcity + "&tocityName=" + escape(towhere) + "&tripType=" + tripType + "&tripDate=" + fromtripDate + "&backDate=" + backtripDate+"";
    });
};

//大小判断，转成日期变量，然后比较符判断即可
function CheckDatesBS(date) {
    try {
        var v1Ary = date.split('-');
        var v2Ary = new Date();
        //出发日期
        var d1 = new Date(v1Ary[1] + '/' + v1Ary[2] + '/' + v1Ary[0]);
        //返回日期
        var d2 = new Date((v2Ary.getMonth() + 1) + '/' + v2Ary.getDate() + '/' + v2Ary.getFullYear());
        if (d2 > d1)
            return false;
        else
            return true;
    }
    catch (e) { throw e; };
}

function SearchTicketByFromCity(fromcity) {
    var tocityName = me.tocityName.val();
    if (tocityName == "") {
        alert("请输入目的地");
        return;
    } else if (tocityName == "输入中文/英文") {
        me.tocityName.focus();
        return;
    }

    var fromtripDate = me.fromtripDate.val();
    if (fromtripDate == "") {
        alert("请选择出发日期");
        me.fromtripDate.focus();
        return;
    }
    var backtripDate = me.backtripDate.val();
    if (backtripDate == "") {
        alert("请选择回程日期");
        me.backtripDate.focus();
        return;
    }

    if (!CheckDatesBS(fromtripDate)) {
        alert("出发日期不能小于当天日期");
        me.fromtripDate.focus();
        return;
    }
    
    var tripType = $("input[name='tripType']:checked").val();
    if (tripType != "0") {
        var dateCha = (Date.parse(fromtripDate.replace("-", "/")) - Date.parse(backtripDate.replace("-", "/"))) / 86400000 * 24;
        if (dateCha > 0) {
            alert("出发日期不能小于回程日期");
            me.fromtripDate.focus();
            return;
        }
    }

    // 将值存入 cookie
    $.cookie("fromcity", escape(fromcity), { expires: 7, path: "/" });
    $.cookie("tocityName", escape(tocityName), { expires: 7, path: "/" });
    $.cookie("tripType", escape(tripType), { expires: 7, path: "/" });
    $.cookie("fromtripDate", escape(fromtripDate), { expires: 7, path: "/" });
    $.cookie("backtripDate", escape(backtripDate), { expires: 7, path: "/" });

    window.location.href = "searchTicket.aspx?fromcity=" + fromcity + "&tocityName=" + escape(tocityName) + "&tripType=" + tripType + "&tripDate=" + fromtripDate + "&backDate=" + backtripDate + "";
}

function TicketLogin(where){
    this.url = "share/checklogin.aspx";
    this.name = $("#shortname");//用户名
    this.pwd = $("#pwd1");//密码
    this.lblerrmes =$("#lblerrmes");//提示
    
    this.btnok = $("#btnok");//登录
    lo = this;
    this.name.keydown(function(e){
        if(e.keyCode==13){
            lo.btnok.click();
        }
    });
    this.pwd.keydown(function(e){
        if(e.keyCode==13){
            lo.btnok.click();
        }
    });
    this.btnok.click(function(){
        var name = lo.name.val();
        if(name==""){
            alert("请输入用户名！");
            lo.name.focus();
            return;
        }
        var pwd = lo.pwd.val();
        if(pwd==""){
            alert("请输入用户密码！");
            lo.pwd.focus();
            return;
        }      
        $.ajax({
            type: "get",
            url: lo.url+"?name="+name+"&pwd="+pwd+"",
            success: function(data){
                if(data=="0")
                    window.location.href = where;
                else
                    lo.lblerrmes.html(data);
            },
            error: function(){
                alert('验证数据异常！');
            }
        });
    });
}

//查询机票
function SearchAifeiTicket(div, from, to, airline, totime, fromtime,ticketType) {
    var url = "share/AifeiRequest.aspx";
    $.ajax({
        type: "get",
        cache: false,
        url: url + "?from=" + from + "&to=" + to + "&airline=" + airline + "&totime=" + totime + "&ticketType=" + ticketType + "&fromtime=" + fromtime,
        success: function(data) {
            if (data == "false")
                return;

            if (data == "") 
                return;
                
            $("#ulaifei_0_" + div).html($(data).find('.aifeifrom').html());
            $("#ulaifei_1_" + div).html($(data).find('.aifeiline').html());
            $("#ulaifei_2_" + div).html($(data).find('.aifeito').html());

            if ($("#ulaifei_3_" + div).html() == "") {
                var relay = $(data).find('.relay').html();
                if ($.trim(relay)!='')
                    $("#ulaifei_3_" + div).html(relay);
            }
        },
        error: function() {
            return;
            //alert('验证数据异常！');
        }
    });
}

//查询机型
function SearchAifeiPlan(from, to, airline) {
    var url = "share/AifeiInfoRequest.aspx";
    $.ajax({
        type: "get",
        cache: false,
        url: url + "?from=" + from + "&to=" + to + "&airline=" + airline,
        success: function(data) {
            if (data == "false")
                return;

            $("#ticketplan").html(data);
        },
        error: function() {
            return;
            //alert('验证数据异常！');
        }
    });
}
