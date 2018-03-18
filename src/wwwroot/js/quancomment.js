
//获取评论
function getquancomment(id){
    $("#divcomment").html("评论加载中......");
    $.get("http://www.fei580.com/share/quancomment.aspx?rand="+parseInt(10*Math.random()), { id: id }, function(html) {
        $("#divcomment").html(html);
    });
}

function insertquancomment(id){
    var comtcontent=$("#txt_comtcontent").val();
    if(comtcontent==""){
        alert("请输入评论内容");
        $("#comtcontent").focus();
        return false;
    }
    else
    {
        if(comtcontent.length>500)
        {
            alert("评论内容最多为500字符！");
            $("#comtcontent").focus();
            return false;
        }
    }

    $.get("http://www.fei580.com/share/insertquancomment.aspx", { id: id,comtcontent: comtcontent}, function(html) {
        if(html=="True"){
            getquancomment(id);
        }else
        {
            alert(html);
        } 
    });
}