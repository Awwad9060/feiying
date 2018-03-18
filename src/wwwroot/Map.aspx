<%@ Page Language="C#" AutoEventWireup="true" CodeFile="Map.aspx.cs" Inherits="Map" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml" >
<head runat="server">
    <title>map</title>
    <script src="http://ditu.google.cn/maps?file=api&amp;v=2&amp;key=ABQIAAAAceTzoeNbjTvpB5Sl7uN-HRTvZIOCZ_xgjFFs2A4m0sESQwHI2xQ3p5nEzI8Q6jRpTj5xwaKzd08ivQ" type="text/javascript"></script> 
    <script src="http://www.fei580.com/js/map.js" type="text/javascript"></script>
    <script type="text/javascript">
    function start(){
        var point = new Point('<%=lat %>', '<%=lng %>', '<%=name %>');
        initMap(point);
    }
    </script>
    <style type="text/css">
    #tip
    {
    	color:#fff;text-align: center;
        opacity: .90;
        -moz-opacity:.90;
        filter:Alpha(opacity=90);
        white-space: nowrap;
        margin: 0;
        padding: 2px 0.5ex;
        border: 1px solid #000;
        font-size: 9pt;
        font-family: Verdana;
        background-color: #456D07;
    }
    </style>
</head>
<body onload="start()">
    <div id="map_canvas" style="width: 542px; height: 322px;"></div>
</body>
</html>
