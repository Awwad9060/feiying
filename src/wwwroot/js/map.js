/*没蒙板*/
var mask, box;
var UI = {
    mask: function() {
        var height = document.documentElement.clientHeight > document.body.offsetHeight ? document.documentElement.clientHeight : document.body.offsetHeight;
        var width = document.documentElement.clientWidth;
        var m = document.createElement("DIV");
        var s = m.style;
        m.id = "UI_Mask";
        s.position = "absolute";
        s.background = "#000000";
        s.left = "0px";
        s.top = "0px";
        s.width = width + "px";
        s.height = height + "px";
        s.filter = "alpha(opacity=50)"; //设置透明度(相对IE)
        s.opacity = 0.5; //透明度设置(相对火狐浏览器)
        document.body.appendChild(m);
        return m;
    },
    openForm: function(div) {
        var o = document.getElementById(div);
        var s = o.style;
        s.display = ""; //默认block
        var left = (document.documentElement.clientWidth - o.offsetWidth) / 2;
        var top = (document.documentElement.clientHeight - o.offsetHeight) / 2 + document.documentElement.scrollTop;
        s.left = left + "px";
        s.top = top + "px";
        return o;
    }
}


/*地图*/
/*lat经度*/
/*lng纬度*/
var map, marker, iconPic, zoomControl;
function Point(lat, lng,hotelName) {
    this.lat = lat;
    this.lng = lng;
    this.hotelName = hotelName;
}
/*地图初始化*/
function initMap(point) {
    if (GBrowserIsCompatible()) {
        map = new GMap2(document.getElementById("map_canvas"));
        map.setCenter(new GLatLng(point.lat, point.lng), 8);
        /*缩略图*/
        zoomControl = new GOverviewMapControl();
        map.addControl(zoomControl);
        var customUI = map.getDefaultUI();
        customUI.maptypes.hybrid = true;
        map.setUI(customUI);
        createMarker(point);
    }
}
function showTip(hotelName) {
    createTip("tip1");
    marker.tooltip = hotelName;
    //showTooltip(marker, "tip1");
}
/*创建标点*/
function createMarker(p) {
    if (p == undefined)
        return;
    var point = new GLatLng(p.lat, p.lng);
    marker = new GMarker(point);
    map.addOverlay(marker);
    //showTip(p.hotelName);
    /*根据缩放级别触发的事件*/
    //GEvent.addListener(map, "zoomend", function() {
    //    removeInfo();
    //    showTip(p.hotelName);
    //});
}
/*创建提示信息*/
function createTip(id) {
    var tooltip = document.createElement("div");
    tooltip.id = id;
    map.getPane(G_MAP_MARKER_PANE).appendChild(tooltip);
}
/*显示提示信息*/
function showTooltip(marker, id) {
    var tooltip = document.getElementById(id);
    tooltip.innerHTML = marker.tooltip;
    tooltip.style.display = "block";
    if (typeof (tooltip.style.filter) == "string") {
        tooltip.style.filter = "alpha(opacity:90)";
    }
    var currtype = map.getCurrentMapType().getProjection();
    var point = currtype.fromLatLngToPixel(map.fromDivPixelToLatLng(new GPoint(0, 0), true), map.getZoom());
    var offset = currtype.fromLatLngToPixel(marker.getLatLng(), map.getZoom());
    var anchor = marker.getIcon().iconAnchor;
    var width = marker.getIcon().iconSize.width + 2;
    var height = id == "tip" ? 10 : -13;
    var pos = new GControlPosition(G_ANCHOR_TOP_LEFT, new GSize(offset.x - point.x - anchor.x + width, offset.y - point.y - anchor.y - height));
    pos.apply(tooltip);
}
/*移除提示信息*/
function removeInfo() {
    if (document.getElementById("tip"))
        map.getPane(G_MAP_MARKER_PANE).removeChild(document.getElementById("tip"));
}

/*酒店详情图片*/
/*点击小图 查看大图片*/
function showBigPic(imgUrl, imgName) {
	document.getElementById("bigImg").src = imgUrl;
	document.getElementById("bigImg").title = imgName;
	if (timer) {
		clearTimeout(timer);
		return;
	} 
}
/*大图效果*/
function PicItem(picUrl, picName, picId) {
    this.picUrl = picUrl;
    this.picName = picName;
    this.picId = picId;
}
var flag = 0,timer;
function PlayPic() {
    if (flag < picList.length) {
        flag++;
    }
    else {
        flag = 1;
    }
    try
    {
    showBigPic(picList[flag - 1].picUrl, picList[flag - 1].picName)
    }catch(e){
    }
    timer=setTimeout(PlayPic, 2000);
}