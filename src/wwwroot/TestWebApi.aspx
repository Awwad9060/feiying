<%@ Page Language="C#" AutoEventWireup="true" CodeFile="TestWebApi.aspx.cs" Inherits="TestWebApi" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <title></title>
    <script src="js/jquery-1.4.2.min.js"></script>
    <script type="text/javascript">
        $(function () {
            //$.post("/WebService/Flights.ashx", { startairport: "SHA", endairport: "HKG", startdate: "2017-12-16" }, function (result) {
            //    debugger;
            //    $("div").html(result);
            //});
            $.ajax({
                url: "Handler.ashx",
                type: 'post',
                dataType: 'json',
                data:{ startairport: "SHA", endairport: "HKG", startdate: "2017-12-16" },
                success: function (data, status) {
                    debugger;
                    console.log(data)
                },
                fail: function (err, status) {
                    console.log(err)
                },
                error: function (e) {
                    debugger;
                }
            })
        });
    </script>
</head>
<body>
    <form id="form1" runat="server">
    <div>
    
    </div>
    </form>
</body>
</html>
