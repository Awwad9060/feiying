
//获取评论
function getairplancomment(id){
    $("#divcomment").html("评论加载中......");
    $.get("http://www.fei580.com/share/airplancomment.aspx?rand="+parseInt(10*Math.random()), { id: id }, function(html) {
        $("#divcomment").html(html);
    });
}

function insertairplancomment(id){
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
    
    var type=0;
    
    if($("#cheNiming").attr("checked")){
        type=1;
    }
    
    $.get("http://www.fei580.com/share/insertairplancomment.aspx", { id: id,comtcontent: comtcontent,type: type}, function(html) {
        if(html=="True"){
            getairplancomment(id);
        }else
        {
            alert(html);
        } 
    });
}