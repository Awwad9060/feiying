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

	   if(!isChar(cityname)){	//����Ǻ���	
		 for(var i=0;i<form1.cityequal.length;i++){ 
			if(form1.cityequal.options[i].text==cityname){
			    //alert(fobj.cityequal.options[i].value);
				form1.freecityname.value=form1.cityequal.options[i].value;
				cityname=form1.cityequal.options[i].value;
				break; //hxy
			}
		 }		
	   }else{    //�����������
	        
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
		   alert('û���ҵ�������ĳ���,����������!');
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
		myEle.text = "ѡ�����λ��" ;
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
		myEleReg.text = "ѡ��������" ;
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

	
	function isChar(src) {//�ж��ַ�ȫ����a-Z������A-Z������ĸ���
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
			alert("����д��ס���ڣ�");
			return ;
		}
		if(fobj.checkOutDate.value==""){
			alert("����д������ڣ�");
			return ;
		}
		
		if(!isDate(fobj.checkInDate.value)){
			alert("��ס���ڲ����ϸ�ʽ�淶����Ч������!");
			fobj.checkInDate.focus();
			return;
	    }
		if(!isDate(fobj.checkOutDate.value)){
			alert("������ڲ����ϸ�ʽ�淶����Ч������!");
			fobj.checkOutDate.focus();
			return;
	    }
		
		if(fobj.freecityname.value==""){
			alert("��ѡ���������У�");
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
		//			alert("��ͼ۱���������");
		//		return ;
		//	}
		//}
		//reg = /^[1-9]\d*$/gi;
		//if(rateMax!="") {
		//	if(!reg.test(rateMax)) {
		//		alert("��߼۱���������");
		//		return ;
		//	}
		//}
		//if(rateMax!=""&&rateMin!=""&&parseFloat(rateMax)<parseFloat(rateMin)) {
		//	alert("��߼۲��ܵ����ͼ�");
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
	  // 	falseInfo="��סʱ�䲻�����"+NowDate.getYear()+"-"+showMonth+"-"+NowDate.getDate()+"!";
	//}else if(eD.getTime()-bD.getTime()<=0)
	//   falseInfo="�������"+eDate+"������춻�����סʱ��"+bDate+"!";
	//else if(eD.getTime()-NowDate.getTime()<0)
	//   falseInfo="������ڲ�����춵���!";
	//else if(Math.floor((eD.getTime()-bD.getTime())/86400000)>=30)
	//   falseInfo="�����������סʱ�������ܳ���30��!";
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