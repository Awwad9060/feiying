
function turnit(o){
	 document.getElementById("right"+o).className="one";//newsearchinsider
	 document.getElementById("rightChild"+o).className="nohidden";
	 var j;
	 var g;
	 var id;
	 var e;
	 var f;
	 for(var i=1;i<=3;i++){
	   j = document.getElementById("right"+i);
	   //alert(o.id);
	   e = document.getElementById("rightChild"+i);
	   if(o != i){
	   	 j.className="two";//newsearchinsidew
	   	 e.className="hidden";
	   }	   
	 }		 
}	


function In_turnit(o){
	 document.getElementById("In_right"+o).className="one";//newsearchinsider
	 document.getElementById("In_rightChild"+o).className="nohidden";
	 var j;
	 var g;
	 var id;
	 var e;
	 var f;
	 for(var i=1;i<=3;i++){
	   j = document.getElementById("In_right"+i);
	   //alert(o.id);
	   e = document.getElementById("In_rightChild"+i);
	   if(o != i){
	   	 j.className="two";//newsearchinsidew
	   	 e.className="hidden";
	   }	   
	 }		 
}	





function show(c_Str)
{
	if(document.all(c_Str).style.display=='none')
{
	document.all(c_Str).style.display='block';
}
else{
document.all(c_Str).style.display='none';
}
}

function showlist(o){ 
document.getElementById("mylist"+o).style.top=document.getElementById("txt"+o).parentNode.style.top; 
document.getElementById("mylist"+o).style.left=document.getElementById("txt"+o).parentNode.style.left; 
document.getElementById("mylist"+o).style.display='block'; 
} 
function hidelist(o){ 
document.getElementById("mylist"+o).style.display='none'; 
} 
function insertValue(s,o){ 
document.getElementById("txt"+o).value=document.getElementById("v"+s).innerHTML; 
hidelist(o); 
} 

function changeDiv(value){
document.getElementById("memnu").className="menu_"+value;
}

function showhotcity(){
document.getElementById("hotcityDiv").style.display="block";
}
function closehotcity(){
document.getElementById("hotcityDiv").style.display="none";
}
function showStateCity(value){
for(var i=1;i<=6;i++){
if(i==value){
document.getElementById("citylist00"+i).style.display="block";
document.getElementById("state00"+i).className="now";
}else{
document.getElementById("citylist00"+i).style.display="none";
document.getElementById("state00"+i).className="";
}
}
}
function selectCity(value){
document.getElementById("tocityName").value=value;
closehotcity();
}

function changeDiv(value){
document.getElementById("memnu").className="menu_"+value;
}

function showPicRec(value1,value2){
document.getElementById(value1).className='one';
document.getElementById(value2).className='two';
document.getElementById(value1+"_ul").style.display="block";
document.getElementById(value2+"_ul").style.display="none";
}

function showFromTicket(value1,value2){
document.getElementById("from"+value1).className='one';
document.getElementById("from"+value2).className='two';
document.getElementById(value1+"_TicketDiv").style.display="block";
document.getElementById(value2+"_TicketDiv").style.display="none";
}
