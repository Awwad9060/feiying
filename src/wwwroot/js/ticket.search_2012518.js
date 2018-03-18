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
        window.location.href='http://www.fei580.com/hotel.aspx';
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
    this.btnSearch.click(function(){
        var fromcity = $("#fromCity").val();
        if(fromcity==""){
            alert("请选择出发地");
            return;
        }
        var tocityName = me.tocityName.val();
        if(tocityName==""){
            alert("请输入目的地");
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
        var tripType= $('input[@name=tripType][@checked]').val();      
        window.location.href="/searchTicket.aspx?fromcity=" + fromcity + "&tocityName=" + escape(tocityName) + "&tripType=" + tripType + "&tripDate=" + fromtripDate + "&backDate=" + backtripDate+"";
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
        var tripType= $('input[@name=tripType][@checked]').val();      
        window.location.href="/searchTicket.aspx?fromcity=" + fromcity + "&tocityName=" + escape(towhere) + "&tripType=" + tripType + "&tripDate=" + fromtripDate + "&backDate=" + backtripDate+"";
    });  
};

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

