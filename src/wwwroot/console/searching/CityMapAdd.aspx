<%@ Page Language="C#" AutoEventWireup="true" Inherits="CityMapAdd" CodeFile="CityMapAdd.aspx.cs" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>添加数据(大家正在查)</title>
    <link rel="stylesheet" href="../css/control.css" type="text/css" />
     <script language="javascript" type="text/javascript" src="../../js/DateControls.js"></script>
    <script type="text/javascript" language="javascript">

        function selectChangedPrice(ddl) {
            var index = ddl.selectedIndex;

            var Value = ddl.options[index].value;
            var Text = ddl.options[index].text;

            var imgPrice = document.getElementById("imgPrice");
            if (Value == "左边") {
                imgPrice.src = "../images/airline_price_bkg_left.png"
            } else {
                imgPrice.src = "../images/airline_price_bkg.png"
            }
        }

        function selectChangedPriceB(ddl) {
            var index = ddl.selectedIndex;

            var Value = ddl.options[index].value;
            var Text = ddl.options[index].text;

            var imgPrice = document.getElementById("imgPriceB");
            if (Value == "左边") {
                imgPrice.src = "../images/airline_price_bkg_left.png"
            } else {
                imgPrice.src = "../images/airline_price_bkg.png"
            }
        }

        function changeCityName() {
            var txtCityName = document.getElementById("txtCityName");
            var cityName = txtCityName.value;

            var imgLine = document.getElementById("imgLine");
            imgLine.src = "../images/linemap/internation/cityto_" + cityName + ".png";
        }

        function checkInfo() {
            if (document.getElementById("txtCityName").value == "") {
                alert("城市名称不能为空！");
                return false;
            }

            var divMapWorld = document.getElementById("divMap_World");
            var divMapChina = document.getElementById("divMap_China");

            var divPointWorld = document.getElementById("divPoint");
            var divPriceWorld = document.getElementById("divPriceA");
            var divPointChina = document.getElementById("divPointB");
            var divPriceChina = document.getElementById("divPriceB");

            var pointATop = parseInt(getTop(divPointWorld)) - parseInt(getTop(divMapWorld)) ;
            var pointALeft = parseInt(getLeft(divPointWorld)) - parseInt(getLeft(divMapWorld));
            var priceATop = parseInt(getTop(divPriceWorld)) - parseInt(getTop(divMapWorld)) - divPointWorld.offsetHeight;  //因为是relative位置样式，需减去前面线路的图片高度
            var priceALeft = parseInt(getLeft(divPriceWorld)) - parseInt(getLeft(divMapWorld));
            var txtTop = document.getElementById("txtTop");
            var txtLeft = document.getElementById("txtLeft");
            var txtTop_Price = document.getElementById("txtTop_Price");
            var txtLeft_Price = document.getElementById("txtLeft_Price");

            txtTop.value = pointATop;
            txtLeft.value = pointALeft;
            txtTop_Price.value = priceATop;
            txtLeft_Price.value = priceALeft;


            var pointBTop = parseInt(getTop(divPointChina)) - parseInt(getTop(divMapChina));
            var pointBLeft = parseInt(getLeft(divPointChina)) - parseInt(getLeft(divMapChina));
            var priceBTop = parseInt(getTop(divPriceChina)) - parseInt(getTop(divMapChina)) - divPointChina.offsetHeight; //因为是relative位置样式，需减去前面线路的图片高度
            var priceBLeft = parseInt(getLeft(divPriceChina)) - parseInt(getLeft(divMapChina));
            var txtTopB = document.getElementById("txtTopB");
            var txtLeftB = document.getElementById("txtLeftB");
            var txtTopB_Price = document.getElementById("txtTopB_Price");
            var txtLeftB_Price = document.getElementById("txtLeftB_Price");

            txtTopB.value = pointBTop;
            txtLeftB.value = pointBLeft;
            txtTopB_Price.value = priceBTop;
            txtLeftB_Price.value = priceBLeft;

            return true;
        }

        window.onload = function () {
            //国际线
            var divPt = document.getElementById("divPoint");
            var top = document.getElementById("txtTop").value;
            var left = document.getElementById("txtLeft").value;
            var divPrice = document.getElementById("divPriceA");
            var top_Price = document.getElementById("txtTop_Price").value;
            var left_Price = document.getElementById("txtLeft_Price").value;
            if (top != "") {
                divPt.style.top = top + "px";
            }
            if (left != "") {
                divPt.style.left = left + "px";
            }
            if (top_Price != "") {
                divPrice.style.top = top_Price + "px";
            }
            if (left_Price != "") {
                divPrice.style.left = left_Price + "px";
            }

            //线路

            var txtCityName = document.getElementById("txtCityName");
            var cityName = txtCityName.value;

            var imgLine = document.getElementById("imgLine");
            imgLine.src = "../images/linemap/internation/cityto_" + cityName + ".png";

            //国内线
            var divPtB = document.getElementById("divPointB");
            var topB = document.getElementById("txtTopB").value;
            var leftB = document.getElementById("txtLeftB").value;
            var divPriceB = document.getElementById("divPriceB");
            var topB_Price = document.getElementById("txtTopB_Price").value;
            var leftB_Price = document.getElementById("txtLeftB_Price").value;
            if (topB != "") {
                divPtB.style.top = topB + "px";
            }
            if (leftB != "") {
                divPtB.style.left = leftB + "px";
            }
            if (topB_Price != "") {
                divPriceB.style.top = topB_Price + "px";
            }
            if (leftB_Price != "") {
                divPriceB.style.left = leftB_Price + "px";
            }
        }


        var ie = document.all;
        var nn6 = document.getElementById && !document.all;
        var isdrag = false;
        var y, x;
        var oDragObj;

        function moveMouse(e) {
            if (isdrag) {
                oDragObj.style.top = (nn6 ? nTY + e.clientY - y : nTY + event.clientY - y) + "px";
                oDragObj.style.left = (nn6 ? nTX + e.clientX - x : nTX + event.clientX - x) + "px";
                return false;
            }
        }

        function initDrag(e) {
            var oDragHandle = nn6 ? e.target : event.srcElement;
            var topElement = "HTML";
            while (oDragHandle.tagName != topElement && oDragHandle.className != "dragAble") {
                oDragHandle = nn6 ? oDragHandle.parentNode : oDragHandle.parentElement;
            }
            if (oDragHandle.className == "dragAble") {
                isdrag = true;
                oDragObj = oDragHandle;
                nTY = parseInt(oDragObj.style.top + 0);
                y = nn6 ? e.clientY : event.clientY;
                nTX = parseInt(oDragObj.style.left + 0);
                x = nn6 ? e.clientX : event.clientX;
                document.onmousemove = moveMouse;
                return false;
            }
        }
        document.onmousedown = initDrag;
        document.onmouseup = new Function("isdrag=false");



        //获取元素的纵坐标 
        function getTop(e) {
            var offset = e.offsetTop;
            if (e.offsetParent != null) offset += getTop(e.offsetParent);
            return offset;
        }
        //获取元素的横坐标 
        function getLeft(e) {
            var offset = e.offsetLeft;
            if (e.offsetParent != null) offset += getLeft(e.offsetParent);
            return offset;
        }

    </script>
</head>
<body>
    <form id="form1" runat="server">
    <table width="100%" border="0" align="center" cellpadding="1" cellspacing="1" id="TABLE1">
        <tr>
            <td align="center" bgcolor="#799AE1" class="B" style="width: 100px">
            </td>
            <td height="25" align="left" bgcolor="#799AE1" class="B" style="width: 839px">
                <asp:Label ID="lblTitle" runat="server"></asp:Label>
            </td>
            <td align="center" bgcolor="#799AE1" class="B" style="width: 33px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 100px">
                城市：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <table>
                    <tr>
                        <td>
                            <input  id="txtCityName" runat="server" type="text" size="58" style=" width:100px;" onchange="changeCityName();"  />
                        </td>
                        <td>
                            <asp:CheckBox ID="cbHasLineInter" runat="server" Text="国际线" Checked="true" />
                        </td>
                        <td>
                            <asp:CheckBox ID="cbHasLine" runat="server" Text="国内线" Checked="true"  />
                        </td>
                    </tr>
                </table>
            </td>
            <td bgcolor="#F6F6F6" style="width: 33px">
            </td>
        </tr>
        <tr style=" display:none;">
            <td align="center" bgcolor="#F6F6F6" style="width: 100px">
                国际线位置：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <table>
                    <tr>
                        <td>
                            Top(px)：
                        </td>
                        <td>
                            <input  id="txtTop" runat="server" type="text" size="58" style=" width:100px;" value="100" />
                            <input  id="txtTop_Price" runat="server" type="text" size="58" style=" width:100px;" value="54" />
                        </td>
                        <td>
                            Left(px)：
                        </td>
                        <td>
                            <input  id="txtLeft" runat="server" type="text" size="58" style=" width:100px;" value="100" />
                            <input  id="txtLeft_Price" runat="server" type="text" size="58" style=" width:100px;" value="120" />
                        </td>
                    </tr>
                </table>
            </td>
            <td bgcolor="#F6F6F6" style="width: 33px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="width: 100px">
                <table>
                    <tr>
                        <td>国际线地图：</td>
                    </tr>
                </table>
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <div>
                    <table>
                        <tr>
                            <td>价格标签</td>
                            <td>
                                <asp:DropDownList ID="ddlPriceDirect" runat="server">
                                    <asp:ListItem Text="右边" Value="右边" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="左边" Value="左边"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divMap_World" style=" width:570; height:320px; background-image:url('../images/world_map.jpg'); background-repeat:no-repeat;">
                    <div id="divPoint" style=" position:relative;  background-repeat:no-repeat;" class="dragAble">
                        <img alt="国际线路" id="imgLine" src="../images/map_point.png" runat="server" />
                    </div>
                    <div id="divPriceA" style=" width:236px; top:54px; left:120px; position:relative;background-repeat:no-repeat;" class="dragAble">
                        <img alt="国际价格" id="imgPrice" src="../images/airline_price_bkg.png" runat="server" />
                    </div>
                </div>
            </td>
            <td bgcolor="#F6F6F6" style="width: 33px">
                
            </td>
        </tr>
        <tr style=" display:none;">
            <td align="center" bgcolor="#F6F6F6" style="width: 100px">
                国内线位置：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <table>
                    <tr>
                        <td>
                            Top(px)：
                        </td>
                        <td>
                            <input  id="txtTopB" runat="server" type="text" size="58" style=" width:100px;" value="200" />
                            <input  id="txtTopB_Price" runat="server" type="text" size="58" style=" width:100px;" value="154" />
                        </td>
                        <td>
                            Left(px)：
                        </td>
                        <td>
                            <input  id="txtLeftB" runat="server" type="text" size="58" style=" width:100px;" value="200" />
                            <input  id="txtLeftB_Price" runat="server" type="text" size="58" style=" width:100px;" value="220" />
                        </td>
                    </tr>
                </table>
            </td>
            <td bgcolor="#F6F6F6" style="width: 33px">
            </td>
        </tr>
        <tr >
            <td align="center" bgcolor="#F6F6F6" style="width: 100px">
                国内线地图：
            </td>
            <td height="25" align="left" bgcolor="#F6F6F6" style="width: 839px">
                <div>
                    <table>
                        <tr>
                            <td>价格标签</td>
                            <td>
                                <asp:DropDownList ID="ddlPriceDirectB" runat="server">
                                    <asp:ListItem Text="右边" Value="右边" Selected="True"></asp:ListItem>
                                    <asp:ListItem Text="左边" Value="左边"></asp:ListItem>
                                </asp:DropDownList>
                            </td>
                        </tr>
                    </table>
                </div>
                <div id="divMap_China" style=" width:570; height:445px; background-image:url('../images/chinamap.jpg'); background-repeat:no-repeat;">
                    <div id="divPointB" style=" position:relative;  background-repeat:no-repeat;" class="dragAble">
                        <img alt="国内线路" id="imgLineB" src="../images/map_point.png"  runat="server"/>
                    </div>
                    <div id="divPriceB" style=" width:236px;  position:relative; top:154px; left:220px; background-repeat:no-repeat;" class="dragAble">
                        <img alt="国内价格" id="imgPriceB" src="../images/airline_price_bkg.png"  runat="server"/>
                    </div>
                </div>
            </td>
            <td bgcolor="#F6F6F6" style="width: 33px">
            </td>
        </tr>
        <tr>
            <td align="center" bgcolor="#F6F6F6" style="height: 27px" colspan="3">
             <%--OnClick="btnSave_Click"--%>
                <asp:Button ID="btnSave" runat="server" Text="保 存" Height="23" OnClientClick="return checkInfo()"  OnClick="btnSave_Click"/>&nbsp;&nbsp;&nbsp;&nbsp;
                <input name="Submit3" type="button" style="height: 23px;" onclick="location.href='CityMaplist.aspx'" value="返 回" />
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
