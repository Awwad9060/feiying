var arrItems1Reg = new Array();
var arrItemsValue1Reg = new Array();
var arrItemsGrp1Reg = new Array();	
function inputCityChange(obj){	
		concitysle(obj.value);
	}
	function concitysle(cityname)
	{
		var form1=QueryHotelForm;
		
		var opText;
		var opTxtLength;
		var opCityCodeText;
		var mtchIdx;

	   if(!isChar(cityname)){	//如果是汉字	
		 for(var i=0;i<form1.cityequal.length;i++){ 
			if(form1.cityequal.options[i].text==cityname){
			    //alert(fobj.cityequal.options[i].value);
				form1.freecityname.value=form1.cityequal.options[i].value;
				cityname=form1.cityequal.options[i].value;
				break; //hxy
			}
		 }		
	   }else{    //如果是三字码
	        
	         //form1.freecitycode.value=cityname;
	        
	   }
		
		
		cityname = cityname.toUpperCase();	
		
		isFound=false;
		
		for (i=0; i<form1.citycode.length; i++){
			opText = form1.citycode.options[i].getAdjacentText("beforeEnd");
			opTxtLength = opText.length;
			if (isChar(opText) == true){
				cityname = cityname.toUpperCase();
				mtchIdx = opText.indexOf(cityname);
				if (mtchIdx == 0 || mtchIdx+cityname.length == opTxtLength){
					form1.citycode.options[i].selected = true;
					selectChange(form1.citycode);
					isFound=true;
					break;
				}
			}
			else{ 
				mtchIdx = opText.indexOf(cityname);
				if (mtchIdx != -1){
					form1.citycode.options[i].selected = true;
					selectChange(form1.citycode);
					isFound=true;
					break;
				}
			}
		}		
	
		
		for (i=0; i<form1.citycode.length; i++){
			opText = form1.citycode.options[i].getAdjacentText("beforeEnd");
			opTxtLength = opText.length;
//			if (isChar(opText) == true){
//				cityname = cityname.toUpperCase();
//				mtchIdx = opText.indexOf(cityname);
//				if (mtchIdx == 0 || mtchIdx+cityname.length == opTxtLength){
			opCityCodeText=opText.substring(opTxtLength-3,opTxtLength);//get cityCode
						
			if (isChar(opCityCodeText) == true){
				if (opCityCodeText == cityname){
					form1.citycode.options[i].selected = true;
					selectChange(form1.citycode);
					isFound=true;
					break;
				}
			}
			else{ 
				mtchIdx = opText.indexOf(cityname);
				if (mtchIdx != -1){
					form1.citycode.options[i].selected = true;
					selectChange(form1.citycode);
					isFound=true;
					break;
				}
			}
			//form1.porCode.value="";
		}
		
		if (!isFound)
		{
		   alert('没有找到您输入的城市,请重新输入!');
		}
	}
	
	function selectChange(obj){
	  // alert(obj.value);
		var form1=QueryHotelForm;
		form1.freecityname.value=obj.value;
		
		for(var i=0;i<form1.cityequal.length;i++){ 
			if(form1.cityequal.options[i].value==obj.value)
			{
			    form1.freecitycode.value=form1.cityequal.options[i].text;				
			    break;
			}
		 }		
		 
		 //form1.porCode.value="";
		
		var myEle ;
		var myEleReg;
		var x ;
		for (var q=form1.pordetail.options.length;q>=0;q--) form1.pordetail.options[q] = null;
		for (var q=form1.regiondetail.options.length;q>=0;q--) form1.regiondetail.options[q] = null;
		
		myEle = document.createElement("option") ;
		myEle.value = "" ;
		myEle.text = "选择地理位置" ;
		form1.pordetail.add(myEle) ;
		for ( x=0; x<arrItems1.length ; x++ )
		{
			if ( arrItemsGrp1[x] == obj.value )
			{
				myEle = document.createElement("option") ;
				myEle.value = arrItems1[x];
				myEle.text = arrItems1[x] ;
				form1.pordetail.add(myEle) ;
			}
		}
		
		myEleReg = document.createElement("option") ;
		myEleReg.value = "" ;
		myEleReg.text = "选择行政区" ;
		form1.regiondetail.add(myEleReg) ;
		//alert(arrItems1Reg.length);
		for ( x=0; x<arrItems1Reg.length ; x++ )
		{
		   //alert(""+x+arrItems1Reg[x]); 
			if ( arrItemsGrp1Reg[x] == obj.value )
			{
				myEleReg = document.createElement("option") ;
				myEleReg.value = arrItems1Reg[x];
				myEleReg.text = arrItems1Reg[x] ;
				form1.regiondetail.add(myEleReg) ;
			}
		}		
	}

	
	function isChar(src) {//判断字符全部由a-Z或者是A-Z的字字母组成
		reg = /^[\u4E00-\u9FA5]*$/;
    	return (!reg.test(src));
	}

	
	function hideselect(){
		var form1=QueryHotelForm;

	}

	function showselect(){
		var form1=QueryHotelForm;

	}
	
	//function selectChangePor(obj){
		//var form1=QueryHotelForm;
		//form1.porCode.value=obj.value;
	//}
	
	function selectChangeRegion(obj){
		var form1=QueryHotelForm;
		form1.regionCode.value=obj.value;
	}	
	
	function queryinfo(type){
		fobj = QueryHotelForm;
		if(fobj.checkInDate.value==""){
			alert("请填写入住日期！");
			return ;
		}
		if(fobj.checkOutDate.value==""){
			alert("请填写离店日期！");
			return ;
		}
		
		if(!isDate(fobj.checkInDate.value)){
			alert("入住日期不符合格式规范或无效的日期!");
			fobj.checkInDate.focus();
			return;
	    }
		if(!isDate(fobj.checkOutDate.value)){
			alert("离店日期不符合格式规范或无效的日期!");
			fobj.checkOutDate.focus();
			return;
	    }
		
		if(fobj.freecityname.value==""){
			alert("请选择或输入城市！");
			return ;
		}

		if(fobj.propertyName.value!="") {
  			fobj.propertyName.value = fobj.propertyName.value.toUpperCase();
		}
		//if(!fobj.rateMin.value==""||!fobj.rateMax.value=="") {
		//	var reg=/^[1-9]\d*$/gi;
		//	var rateMin=fobj.rateMin.value;
		//	var rateMax=fobj.rateMax.value;
		//	if(rateMin!="") {
		//		 if(!reg.test(rateMin)) {
		//			alert("最低价必须是数字");
		//		return ;
		//	}
		//}
		//reg = /^[1-9]\d*$/gi;
		//if(rateMax!="") {
		//	if(!reg.test(rateMax)) {
		//		alert("最高价必须是数字");
		//		return ;
		//	}
		//}
		//if(rateMax!=""&&rateMin!=""&&parseFloat(rateMax)<parseFloat(rateMin)) {
		//	alert("最高价不能低於最低价");
		//	return ;
		//} 
	//}
		for(var i=0;i<fobj.cityequal.length;i++)
		{ 
			if(fobj.cityequal.options[i].text==fobj.freecityname.value)
			{
			    //alert(fobj.cityequal.options[i].value);
				fobj.freecityname.value=fobj.cityequal.options[i].value;
			}
		}
		
		
	var bDate=fobj.checkInDate.value;
	var eDate=fobj.checkOutDate.value;
	var falseInfo="";
    //var NowDate=new Date();
    //var bD=new Date(bDate.substring(0,4),parseInt(bDate.substring(5,7),10)-1,bDate.substring(8));
    //var eD=new Date(eDate.substring(0,4),parseInt(eDate.substring(5,7),10)-1,eDate.substring(8));
	//if(bD.getTime()+24*3600*1000-NowDate.getTime()<0){
	//	var showMonth = NowDate.getMonth()+1;
	  // 	falseInfo="入住时间不能早於"+NowDate.getYear()+"-"+showMonth+"-"+NowDate.getDate()+"!";
	//}else if(eD.getTime()-bD.getTime()<=0)
	//   falseInfo="离店日期"+eDate+"不能早於或等於入住时间"+bDate+"!";
	//else if(eD.getTime()-NowDate.getTime()<0)
	//   falseInfo="离店日期不能早於当日!";
	//else if(Math.floor((eD.getTime()-bD.getTime())/86400000)>=30)
	//   falseInfo="离店日期与入住时间间隔不能超过30天!";
	if(falseInfo!=""){
	  alert(falseInfo);
	  return ;
	}
	else{
	 
	 if(fobj.freecityname.value.toUpperCase()=="BJS"){
			fobj.freecityname.value="PEK";
	}
	fobj.submit();
	}
} 