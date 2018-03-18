
var ticketNum=1;
var dateNum=1;
function price_more(){
    //接点加1
    ticketNum=ticketNum+1;

    var htmlStr = "<div id=\"priceMore" + ticketNum + "\"><table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"1\" cellspacing=\"1\"><hr style=\"border:1px dashed; height:1px; width:600px\"  align=\"left\" color=\"#DDDDDD\" /><tr><td align=\"right\" bgcolor=\"#F6F6F6\" style=\"width: 310px\">不含税价格：</td><td height=\"25\" align=\"left\" bgcolor=\"#F6F6F6\" style=\"width: 1239px\"><input  id=\"untaxPrice_more_id" + ticketNum + "\" name=\"untaxPrice_more\" type=\"text\" size=\"58\" /> *纯数字</td><td bgcolor=\"#F6F6F6\" style=\"width: 253px\"><input  id=\"IsLimited" + ticketNum + "\" name=\"IsLimited\" runat=\"server\" value=\"0\" type=\"text\" size=\"4\" /> 1 表示机位有限，0表示无限制机位有限</td></tr><tr><td align=\"right\" bgcolor=\"#F6F6F6\" style=\"width: 310px; height: 42px;\">最短停留天数：</td><td align=\"left\" bgcolor=\"#F6F6F6\" style=\"width: 1239px; height: 42px;\"><input  id=\"shortstayDate_more_id" + ticketNum + "\" name=\"shortstayDate_more\" type=\"text\" size=\"58\" value=\"3\"/> *纯数字</td><td bgcolor=\"#F6F6F6\" style=\"width: 253px; height: 42px;\"></td></tr><tr><td align=\"right\" bgcolor=\"#F6F6F6\" style=\"width: 310px\">最长停留天数：</td><td height=\"25\" align=\"left\" bgcolor=\"#F6F6F6\" style=\"width: 1239px\"><input  id=\"longstayDate_more_id" + ticketNum + "\" name=\"longstayDate_more\" type=\"text\" size=\"58\"  value=\"30\"/> *纯数字&nbsp;&nbsp;&nbsp;(<span style=\"text-decoration:underline; cursor:hand;\" onclick=\"return price_del('priceMore" + ticketNum + "')\">删除</span>)</td><td bgcolor=\"#F6F6F6\" style=\"width: 253px\"></td></tr></table></div>";
         
    document.getElementById("priceMore").innerHTML=document.getElementById("priceMore").innerHTML+htmlStr; 
    
   }
   
function date_more(){

    dateNum=dateNum+1;
    var htmlStr1="<div id=\"dateMore"+dateNum+"\"><table width=\"100%\" border=\"0\" align=\"center\" cellpadding=\"1\" cellspacing=\"1\"><hr style=\"border:1px dashed; height:1px; width:600px;\" align=\"left\" color=\"#DDDDDD\" /><tr><td align=\"right\" bgcolor=\"#F6F6F6\" style=\"width: 200px\">售票：</td><td height=\"25\" align=\"left\" bgcolor=\"#F6F6F6\" style=\"width: 500px\">开始售票<input  id=\"fromsaleDate_more_id"+dateNum+"\"  name=\"fromsaleDate_more\"  readonly=\"readonly\" onfocus=\"return setday(this)\" type=\"text\" style=\"width: 90px\" />结束售票<input  id=\"tosaleDate_more_id"+dateNum+"\" name=\"tosaleDate_more\" readonly=\"readonly\" onfocus=\"return setday(this)\" type=\"text\" style=\"width: 90px\" /></td><td bgcolor=\"#F6F6F6\" style=\"width: 253px\"></td></tr><tr><td align=\"right\" bgcolor=\"#F6F6F6\" style=\"width: 200px\">出发：</td><td height=\"25\" align=\"left\" bgcolor=\"#F6F6F6\" style=\"width: 500px\">开始旅行<input  id=\"fromtripDate_more_id"+dateNum+"\"  name=\"fromtripDate_more\" readonly=\"readonly\" onfocus=\"return setday(this)\" runat=\"server\" type=\"text\" style=\"width: 90px\" />最迟出发<input  id=\"totripDate_more_id"+dateNum+"\" readonly=\"readonly\"   name=\"totripDate_more\" onfocus=\"return setday(this)\"   type=\"text\" style=\"width: 90px\" />&nbsp;&nbsp;&nbsp;(<span style=\"text-decoration:underline; cursor:hand;\" onclick=\"return price_del('dateMore"+dateNum+"')\">删除</span>)</td><td bgcolor=\"#F6F6F6\" style=\"width: 253px\"></td></tr></table></div>";  

    document.getElementById("dateMore").innerHTML=document.getElementById("dateMore").innerHTML+htmlStr1; 

}   

    
//删除操作
function price_del(res){
    document.getElementById(res).innerHTML="";
    document.getElementById(res).style.display="none";
}

