

$(document).ready(function () {

    $("#divKFA").Scroll({ line: 1, speed: 500, timer: 3000, up: "but_up", down: "but_down" });
    $("#divKFB").Scroll({ line: 1, speed: 500, timer: 3000, up: "but_up", down: "but_down" });
    setAuto();
});

var currentSearchingShow = 0;
function setAuto() {
    autoStartA = setInterval("changSearching()", 3000);
//    autoStartB = setInterval("changCS()", 3000)
}

//更新“大家正在查”的数据
function changSearching() {
    var txtSearh = document.getElementById("txtSearching");
    var searchingData = eval(txtSearh.value);
    if (searchingData.length > 0) {
        if (currentSearchingShow >= searchingData.length) {
            currentSearchingShow = 0;
        }
        var rowData = searchingData[currentSearchingShow];
        //设置信息
        var txtPrc = document.getElementById("txtSearchingPrice");
        txtPrc.innerHTML = rowData.price;
        var txtFlyDate = document.getElementById("txtSearchingFlyDate");
        txtFlyDate.innerHTML = rowData.flyDateShow;
        var txtAirline = document.getElementById("txtSearchingAirline");
        txtAirline.innerHTML = rowData.airline;
        var txtFromTo = document.getElementById("txtSearchingFromTo");
        txtFromTo.innerHTML = rowData.fromCity + "-" + rowData.toCity + "(" + rowData.toward + ")";

        //设置div点击后的链接地址
        var txtCityFromId = document.getElementById("txtSearchingCityFromId");
        txtCityFromId.value = rowData.fromCityId;
        var txtCityToName = document.getElementById("txtSearchingCityToName");
        txtCityToName.value = rowData.toCity;
        var txtTripType = document.getElementById("txtSearchingTripType");
        txtTripType.value = (rowData.toward == "往返" ? 1 : 0);
        var txtTripDate = document.getElementById("txtSearchingTripDate");
        txtTripDate.value = rowData.flyDate;
        var txtTripDateBack = document.getElementById("txtSearchingBackDate");
        txtTripDateBack.value = rowData.flyDateBack;
        //url格式：  searchTicket.aspx?fromcity=2&tocityName=新加坡&tripType=0&tripDate=2014-01-12&backDate=2014-02-02
        var txtSearchingLinkUrl = document.getElementById("txtSearchingLinkUrl");
        txtSearchingLinkUrl.value = "searchTicket.aspx?fromcity=" + rowData.fromCityId + "&tocityName=" + encodeURI(rowData.toCity) + "&tripType=" + txtTripType.value + "&tripDate=" + rowData.flyDate + "&backDate=" + rowData.flyDateBack;

        //航线的地图图片
        var imgLine = document.getElementById("imgLine");
        imgLine.src = "../images/linemap/internation/cityto_" + rowData.toCity + ".png";

        //设置位置
        var top = 100;
        var left = 200;
        if (rowData.top != "" && rowData.left != "") {
                top = rowData.top;
                left = rowData.left;
        }
        var divPtB = document.getElementById("divPointA");
        divPtB.style.top = top + "px";
        divPtB.style.left = left + "px";
        divPtB.style.display = "";  //显示线路div


        var divPrc = document.getElementById("divPrice");
        //标价的图片
        if (rowData.priceDirect == "左边") {
            divPrc.style.backgroundImage = "url('../images/airline_price_bkg_left.png')";
        } else {
            divPrc.style.backgroundImage = "url('../images/airline_price_bkg.png')";
        }

        var topPrc = rowData.priceTop;  //  parseInt(top) - 50;
        var leftPrc = rowData.priceLeft; // parseInt(left) + 20;
        divPrc.style.top = topPrc + "px";
        divPrc.style.left = leftPrc + "px";
        divPrc.style.display = "";  //显示价钱div
        currentSearchingShow += 1;
    }
}


(function($) {
    $.fn.extend({
        Scroll: function(opt, callback) {
            //参数初始化
            if (!opt) var opt = {};
            var _btnUp = $("#" + opt.up); //Shawphy:向上按钮
            var _btnDown = $("#" + opt.down); //Shawphy:向下按钮
            var timerID;
            var _this = this.eq(0).find("ul:first");
            var lineH = _this.find("li:first").height(); //获取行高
            
            var line = opt.line ? parseInt(opt.line, 10) : parseInt((this.height()/lineH), 10); //每次滚动的行数，默认为一屏，即父容器高度
            var speed = opt.speed ? parseInt(opt.speed, 10) : 500; //卷动速度，数值越大，速度越慢（毫秒）
            var timer = opt.timer; //?parseInt(opt.timer,10):3000; //滚动的时间间隔（毫秒）
            if (line == 0) line = 1;
            var upHeight = 0 - line * lineH;
            //滚动函数
            var scrollUp = function() {
                _btnUp.unbind("click", scrollUp); //Shawphy:取消向上按钮的函数绑定
                _this.animate({
                    marginTop: upHeight
                }, speed, function() {
                    for (i = 1; i <= line; i++) {
                        _this.find("li:first").appendTo(_this);
                    }
                    _this.css({ marginTop: 0 });
                    _btnUp.bind("click", scrollUp); //Shawphy:绑定向上按钮的点击事件
                });

            };
            //Shawphy:向下翻页函数
            var scrollDown = function() {
                _btnDown.unbind("click", scrollDown);
                for (i = 1; i <= line; i++) {
                    _this.find("li:last").show().prependTo(_this);
                }
                _this.css({ marginTop: upHeight });
                _this.animate({
                    marginTop: 0
                }, speed, function() {
                    _btnDown.bind("click", scrollDown);
                });
            };
            //Shawphy:自动播放
            var autoPlay = function() {
                if (timer) timerID = window.setInterval(scrollUp, timer);
            };
            var autoStop = function() {
                if (timer) window.clearInterval(timerID);
            };
            //鼠标事件绑定
            _this.hover(autoStop, autoPlay).mouseout();
            _btnUp.css("cursor", "pointer").click(scrollUp).hover(autoStop, autoPlay); //Shawphy:向上向下鼠标事件绑定
            _btnDown.css("cursor", "pointer").click(scrollDown).hover(autoStop, autoPlay);

        }
    });
})(jQuery);

jQuery.divselect = function(divselectid, inputselectid) {
    var inputselect = $(inputselectid);
    $(divselectid + " cite").click(function() {
        var ul = $(divselectid + " ul");
        if (ul.css("display") == "none") {
            ul.slideDown("fast");
        } else {
            ul.slideUp("fast");
        }
    });
    $(divselectid + " ul li a").click(function() {
        var txt = $(this).text();
        $(divselectid + " cite").html(txt);
        var value = $(this).attr("selectid");
        inputselect.val(value);
        $(divselectid + " ul").hide();

    });
    $(document).click(function() {
        $(divselectid + " ul").hide();
    });
};

////更新“动态客服”的数据
//function changCS() {
//    var txtA_Index = document.getElementById("csDataA_Index");
//    var txtA_Json = document.getElementById("csDataA");
//    var txtB_Index = document.getElementById("csDataB_Index");
//    var txtB_Json = document.getElementById("csDataB");

//    var DataA = eval(txtA_Json.value);
//    var DataB = eval(txtB_Json.value);


//    var indexA = parseInt(txtA_Index.value);
//    var indexB = parseInt(txtB_Index.value);
//    var newIdexA = 0;
//    var newIndexB = 0;

//    //设置客服A
//    var csA_BookTime = document.getElementById("csA_BookTime");
//    var csA_CustomerNum = document.getElementById("csA_CustomerNum");
//    var csA_CityFrom = document.getElementById("csA_CityFrom");
//    var csA_CityTo = document.getElementById("csA_CityTo");

//    if (indexA + 1 >= DataA.length) {
//        newIdexA = 0;
//    } else {
//        newIdexA = indexA + 1;
//    }
//    txtA_Index.value = newIdexA;
//    csA_BookTime.innerText = DataA[newIdexA].BookTimeDesc;
//    csA_CustomerNum.innerText = DataA[newIdexA].CustomerNumber;
//    csA_CityFrom.innerText = DataA[newIdexA].CityFrom;
//    csA_CityTo.innerText = DataA[newIdexA].CityTo;

//    //设置客服B
//    var csB_BookTime = document.getElementById("csB_BookTime");
//    var csB_CustomerNum = document.getElementById("csB_CustomerNum");
//    var csB_CityFrom = document.getElementById("csB_CityFrom");
//    var csB_CityTo = document.getElementById("csB_CityTo");

//    if (indexB + 1 >= DataB.length) {
//        newIdexB = 0;
//    } else {
//        newIdexB = indexB + 1;
//    }
//    txtB_Index.value = newIdexB;
//    csB_BookTime.innerText = DataA[indexB].BookTimeDesc;
//    csB_CustomerNum.innerText = DataA[indexB].CustomerNumber;
//    csB_CityFrom.innerText = DataA[indexB].CityFrom;
//    csB_CityTo.innerText = DataA[indexB].CityTo;

//}
