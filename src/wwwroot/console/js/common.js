//**----------------------------------------------------------------------------
//** Function:common.js
//** Copyright (c) ----------Dongguan Zensee Printing Ltd--------------------
//** Creator: IT_WangPeng
//** Create date: 2006/03/23
//** Modify: 
//** Modify date: 
//** Description: 常用JavaScript函數
//** version: version 1.001（Revise an version to increase by 0.001）
//**----------------------------------------------------------------------------

/*==============================================================================
description:打開流程審批頁面
parameters:
	name: form_id			value: 表單ID.
	name: serialno			value: 流水號.
	name: oState        	value: 傳入狀態（標識是在那個頁面調用的).
	name: objHiddSession	value: 裝載郵件內容信息Hidden文本框.
================================================================================*/
function openEditApprover(form_id, serialno, oState, objHiddSession)
{
	return window.showModalDialog("/QpNewFrame/WorkFlow/WF_Interface_New_Form_flowUserEdit.aspx?form_id="+form_id+"&serialno="+serialno + "&state=" + oState,objHiddSession,"scroll:yes;dialogWidth:576px;status:yes;dialogHeight:425px;edge: Sunken");
}

/*==============================================================================
description:打開補發郵件頁面
parameters:
	name: form_id			value: 表單ID.
	name: serialno			value: 流水號.
	name: type				value: 類型.
	name: isAgainSend		value: 是否是補發郵件.
================================================================================*/
function openEditSendMail(form_id,serialno,type,isAgainSend)
{
	window.showModalDialog("/QpNewFrame/WorkFlow/WF_Flow_Dynamic_Edit_MailContent.aspx?form_id="+form_id+"&serialno="+serialno+"&type="+type+"&isAgainSend="+isAgainSend,window.document.all.hidd_session,"scroll:yes;dialogWidth:600px;status:yes;dialogHeight:525px;edge: Sunken");
}

/*==============================================================================
description:根據傳入的狀態返回不同的用戶信息
parameters:
	name: state			value: 狀態.
================================================================================*/
function getUserNameInfo(state)
{
	return strReturnValue=window.showModalDialog("/QpNewFrame/WorkFlow/WF_Form_Authorization_INDV.aspx?form_state="+state,"window","scroll:yes;dialogWidth:575px;status:yes;dialogHeight:425px;edge: Sunken");
}

/*==============================================================================
description:根據傳入的狀態返回不同的用戶信息(可以同時返回多個)
parameters:
	name: state			value: 狀態.
	name: obj			value: 要傳到子頁面的控件.
================================================================================*/
function getUserNameInfoByMore(state, obj)
{
	return strReturnValue = window.showModalDialog("/QpNewFrame/Dialogs/QA_Log_ChooseEmployees.aspx?form_state=" + state, obj, "scroll:yes;dialogWidth:610px;status:yes;dialogHeight:485px;edge: Sunken");
}

/*==============================================================================
description:根據傳入的狀態返回不同的員工信息
parameters:
	name: state			value: 狀態.
================================================================================*/
function getEmployeeInfo(state)
{
	return strReturnValue=window.showModalDialog("/QpNewFrame/Dialogs/HR_Assess_ChooseEmployee.aspx?form_state="+state,"window","scroll:yes;dialogWidth:575px;status:yes;dialogHeight:425px;edge: Sunken");
}

/*==============================================================================
description:獲取職位編碼
parameters:
	name: state			value: 狀態.
================================================================================*/
function getJobInfo(state)
{
	return strReturnValue=window.showModalDialog("/QpNewFrame/WorkFlow/WF_Form_Authorization_POSN.aspx?form_state="+state,"window","scroll:yes;dialogWidth:420px;status:yes;dialogHeight:430px;edge: Sunken");
}

/*==============================================================================
description:獲取部門
parameters:
	name: state			value: 狀態.
================================================================================*/
function getDeptInfo(state)
{
	return strReturnValue=window.showModalDialog("/QpNewFrame/WorkFlow/WF_Form_Authorization_DEPT.aspx?form_state="+state,"window","scroll:yes;dialogWidth:425pxpx;status:yes;dialogHeight:410pxpx;edge: Sunken");
}

/*==============================================================================
description:根據傳入的操作類型、表單ID、流水號打開批核窗體並進行審批
parameters:
	name: type				value: 類型.
	name: form_id			value: 表單ID.
	name: serialno			value: 流水號.
================================================================================*/
function getApproveInfo(type,form_id,serialno,obj_hidd_session)
{
	return strReturnValue=window.showModalDialog("/QpNewFrame/WorkFlow/WF_Interface_My_Approve_Checkup.aspx?type="+type+"&form_id="+form_id +"&serialno="+serialno,obj_hidd_session,"scroll:yes;dialogWidth:720px;status:yes;dialogHeight:550px;edge: Sunken");
}

/*==============================================================================
description:獲取用戶所選擇的角色
parameters:
	name: roles				value: 角色
================================================================================*/
function getBindingRolesInfo(roles)
{
	return strReturnValue=window.showModalDialog("/QpNewFrame/WorkFlow/WF_Form_Authorization_ROLE.aspx?roles="+roles,"window","scroll:yes;dialogWidth:450pxpx;status:yes;dialogHeight:480pxpx;edge: Sunken");
}

/*==============================================================================
description:打開SQL語句選擇頁面
parameters:
	name: oState				value: 狀態
================================================================================*/
function getSqlIdByOpenQuery(oState)
{
	return window.showModalDialog("PJ_SQL_Choose.aspx?state=" + oState, "window", "scroll:no;dialogWidth:720px;status:no;dialogHeight:500px;edge: Sunken");
}

/*==============================================================================
description:獲取指定文本的光標位置
parameters:
	name: oTextBox			value: 文本框對象.
================================================================================*/
function getCursorPos(oTextBox) 
{ 
	var qswh="@#%#^&#*$"
	oTextBox.focus();
	rng=document.selection.createRange();
	rng.text=qswh;
	var nPosition=oTextBox.value.indexOf(qswh)
	rng.moveStart("character", -qswh.length)
	rng.text="";
	return nPosition;
}

/*==============================================================================
description:設置指定文本的光標位置
parameters:
	name: oTextBox			value: 文本框對象.
	name: position			value: 光標位置.
================================================================================*/
function setCursorPosition(oTextBox,position)
{
	range=oTextBox.createTextRange(); 
	range.collapse(true); 
	range.moveStart('character',position); 
	range.select();
}

/*==============================================================================
description:判斷指定的年份是否是閏年
parameters:
	name: oYear				value: 年份.
==============================================================================*/
function isLeapYear(oYear)
{
	//如果對100整除,則再判斷是否對400整除
	if(parseInt(oYear)%100==0)
	{
		if(parseInt(oYear)%400==0)
			return true;
	}
	//否則，不對100整除，則判斷是否對4整除，如果整除，則是閏年
	else
	{
		if(parseInt(oYear)%4==0)
			return true;
	}
	
	return false;
}

/*==============================================================================
description:用正則表達式限制文本框的輸入字符的非法性(日期)
parameters:
	name: dateTimeValue				value: 要校驗的日期值.
	name: strFormat					value: 格式
==============================================================================*/
function checkCommonDataTime(dateTimeValue,strFormat)
{
	var pattern="";
	var isOtherCheck=1;
	
	var datePar=/[^\d|^\/|^\-|^\:|^\s]/g;
	var dateResult=dateTimeValue.match(datePar);
	if(dateResult!=null)
	{
		alert("DateTime format error!       ");
		return false;
	}	
	
	if(strFormat.toString()=="yyyy/MM/dd HH:mm:ss")
		pattern=/^\b(\d{4}){1}(\/|\-){1}([0]?[1-9]|[1][0-2]){1}(\/|\-){1}([0]?[1-9]|[1-2][0-9]|[3][0-1]){1}((\s){1}([0-1]?[0-9]|[2][0-3]){1}(\:){1}([0-5]?[0-9]){1}(\:){1}([0-5]?[0-9]){1}){1}\b$/g;
	else if(strFormat.toString()=="yyyy/MM/dd HH:mm")
		pattern=/^\b(\d{4}){1}(\/|\-){1}([0]?[1-9]|[1][0-2]){1}(\/|\-){1}([0]?[1-9]|[1-2][0-9]|[3][0-1]){1}((\s){1}([0-1]?[0-9]|[2][0-3]){1}(\:){1}([0-5]?[0-9]){1}((\:){1}([0-5]?[0-9]){1})?){1}\b$/g;
	else if(strFormat.toString()=="yyyy/MM/dd")
		pattern=/^\b(\d{4}){1}(\/|\-){1}([0]?[1-9]|[1][0-2]){1}(\/|\-){1}([0]?[1-9]|[1-2][0-9]|[3][0-1]){1}\b$/g;
	else if(strFormat.toString()=="HH:mm")
	{
		pattern=/^\b([0-1]?[0-9]|[2][0-3]){1}(\:){1}([0-5]?[0-9]){1}\b$/g;
		isOtherCheck=0;
	}
	if (dateTimeValue.length>0)
	{
		var strResult=dateTimeValue.match(pattern);
		if(strResult != null)
		{
			if(isOtherCheck==1)
			{
				pattern=/(\-)/gi;
				strResult=strResult.toString().replace(pattern,"/");
				var strArrResult=leftChar(strResult,10).toString().split("/");
				var lYear=strArrResult[0];
				var lMonth=strArrResult[1];
				var lDay=strArrResult[2];

				if((lYear%4!=0 && lMonth==2 && lDay>28) || (lYear%4==0 && lMonth==2 && lDay>29))
				{
					alert("DateTime format error!       ");
					return false;
				}
				else if(((lMonth<=7 && (Math.abs(lMonth)+2)%2!=0) || (lMonth>=8 && (Math.abs(lMonth)+2)%2==0)) && lDay>31)
				{
					alert("DateTime format error!       ");
					return false;
				}
				else if(((lMonth<=7 && (Math.abs(lMonth)+2)%2==0) || (lMonth>=8 && (Math.abs(lMonth)+2)%2!=0)) && lDay>30)
				{
					alert("DateTime format error!       ");
					return false;
				}
			}
		}
		else if(strResult == null)
		{
			alert("DateTime format error!        ");
			return false;
		}
	}
	return true;
}

//設置當前光標位置控件的輸入法不可用
function control_imeMode_disabled()
{
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";
}

//設置當前光標位置控件的輸入法可用
function control_imeMode_enabled()
{
	var control=window.event.srcElement;
	control.style.imeMode = "";
}

//==============================================================================
//用正則表達式限制文本框的輸入字符的非法性(英文或數字)
//==============================================================================
function controlEnglishInt_onkeypress()
{
	var code=String.fromCharCode(window.event.keyCode);
	code=code.replace(/[^a-zA-Z0-9]/g,'');
	window.event.keyCode=code.charCodeAt(0);
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";
}
function controlEnglishInt_onbeforepaste()
{
	clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9]/g,''));
}
function controlRestrictEnglishInt(control)
{
	control.attachEvent('onbeforepaste',controlEnglishInt_onbeforepaste);
	control.attachEvent('onkeypress',controlEnglishInt_onkeypress);
	control.attachEvent('onbeforeeditfocus',control_imeMode_disabled);
}

//==============================================================================
//用正則表達式限制文本框的輸入字符的非法性(數字)
//==============================================================================
function controlInt_onkeypress()
{
	var code=String.fromCharCode(window.event.keyCode);
	code=code.replace(/[^\d]/g,'');
	window.event.keyCode=code.charCodeAt(0);
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";
}
function controlInt_onbeforepaste()
{
	clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d]/g,''));
}
function controlRestrictInt(control)
{
	control.attachEvent('onbeforepaste',controlInt_onbeforepaste);
	control.attachEvent('onkeypress',controlInt_onkeypress);
	control.attachEvent('onbeforeeditfocus',control_imeMode_disabled);
}

//==============================================================================
//用正則表達式限制文本框的輸入字符的非法性(Code)
//==============================================================================
function controlCode_onkeypress()
{
	var code=String.fromCharCode(window.event.keyCode);
	code=code.replace(/[^a-zA-Z0-9\-\_\.\,\;\(\)\[\]\{\}\/\!\@\#\$\%\^\&\*\'\|\\]/g,'');
	window.event.keyCode=code.charCodeAt(0);
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";
}
function controlCode_onbeforepaste()
{
	clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9\-\_\.\,\;\(\)\[\]\{\}\/\!\@\#\$\%\^\&\*\'\|\\]/g,''));
}
function controlRestrictCode(control)
{
	control.attachEvent('onbeforepaste',controlCode_onbeforepaste);
	control.attachEvent('onkeypress',controlCode_onkeypress);
	control.attachEvent('onbeforeeditfocus',control_imeMode_disabled);
}

//==============================================================================
//用正則表達式限制文本框的輸入字符的非法性(數字包括小數點)
//==============================================================================
function controlNumeric_onkeypress()
{
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";
	var text=control.value;
	var selectText=document.selection.createRange().text;
	
	var code=String.fromCharCode(window.event.keyCode);
	code=code.replace(/[^\d|^\.]/g,'');
	
	//如果文本框全選中, 並且當前的輸入為'0'或'.'時
	if(text==selectText)
	{
		//如果輸入"0"或"."時，強行把它改為"0."
		if(code=="." || code=="0")
		{
			control.value="0";
			setCursorPosition(control,1);
			code=".";
		}
	}
	//否則, 不是全選中時
	else
	{
		var isDot=text.match(/[\.]{1}/g);
		var pos=getCursorPos(control);
		
		//如果當前輸入時為'.', 但文本框中已經有一個小數點時,則不能再輸入小數點
		if(code=="." && text.match(/[\.]{1}/g)!=null)
			code="";
		//如果當前輸入時為'.', 但文本框中還沒有一個小數點,並且當前光標位置為第一位時,則強行把文本框的值為'0.'
		else if(code=="." && pos==0)
		{
			control.value="0"+text;
			setCursorPosition(control,pos+1);
		}
		//如果當前輸入時為'0'
		else if(code=="0")
		{
			//如果當前光標位置為0,但已經有小數點時，不能再在最前面輸入"0";
			//如: 不能在"32.225"之前再輸入"0"-->"032.225"是不允許的
			if(pos==0 && isDot!=null)
				code="";
			//如果已經有小數點，但當前光標位置大於0時
			else if(isDot!=null && pos>0)
			{
				var dotIndex=text.indexOf(".");
				
				//如果當前光標在小數點之前
				if(pos<=dotIndex)
				{
					var beforeText=leftChar(text,dotIndex);
					//如果小數點前的數為0時，但也不能再輸入"0'(如"00."是不允許的)
					if(beforeText=="0")
						code="";
				}
			}
			//如果還沒有小數點時
			else if(isDot==null)
			{
				var beforeText=leftChar(text,pos);
				//如果當前光標位置之前的值為空時，也就是光標位置為0時，噹輸入"0"時則強行改為“0.”
				if(beforeText=="")
				{
					control.value="0"+text;
					setCursorPosition(control,pos+1);
					code=".";
				}
				//如果當前光標位置之前的值為"0"時，則不能再輸入"0"(如"00"是不允許的)
				else if(beforeText=="0")
					code="";
			}
		}
		//除了以上情況以外的
		else
		{
			//已經有小數點時
			if(isDot!=null)
			{
				var dotIndex=text.indexOf(".");
				//如果當前光標位置在小點之前時
				if(pos<=dotIndex)
				{
					var beforeText=leftChar(text,dotIndex);
					//如果小數點之前的數為"0"，並且當前光標在"0"的位置後,則不能再輸入任何數
					//如："0.3"的"0'後小數點前不能再輸入任何數字("05.3"是不允許的),只能在"0"
					//的前面輸入數字("30.3","2550.3"等等);
					if(beforeText=="0" && pos>0)
						code="";
				}
			}
		}
	}
	window.event.keyCode=code.charCodeAt(0);
}
function controlNumeric_onblur()
{
	var control=window.event.srcElement;
	control.value=control.value.toString().replace(/[\.]+$/g,"");
	
	control.value=checkNumericData(control.value);
}
function checkNumericData(oValue)
{
	if(oValue==null){return}
	
	var isHaveZero=oValue.match(/[0]+/g);
	
	oValue = oValue.replace(/^[0]+/g,'');
	oValue = oValue.replace(/^[\.]+/g,'0.');
	
	if(oValue.match(/[\d]+[\.]*[^\.]*/g)!=null)
		oValue=oValue.match(/[\d]+[\.]*[^\.]*/g)[0];
	oValue = oValue.replace(/[\.]+/g,'.');
	oValue = oValue.replace(/[\.]+$/g,'');

	if(oValue=="" && isHaveZero!=null)
		oValue="0";
	return oValue;
}
function controlNumeric_onbeforepaste()
{
	var control=window.event.srcElement;
	var copyData=clipboardData.getData('text').replace(/[^\d|^\.]/g,"");
	var pos=getCursorPos(control);
	
	var beforeText=leftChar(control.value,pos);
	var backText=rightChar(control.value,control.value.length-pos);
	
	var tempData=beforeText.toString()+copyData.toString()+backText.toString();
	
	control.value=checkNumericData(tempData);
	
	clipboardData.setData('text',"");
}
function controlRestrictNumeric(control)
{
	control.attachEvent('onbeforepaste',controlNumeric_onbeforepaste);
	control.attachEvent('onkeypress',controlNumeric_onkeypress);
	control.attachEvent('onblur',controlNumeric_onblur);
	control.attachEvent('onbeforeeditfocus',control_imeMode_disabled);
}

//==============================================================================
//用正則表達式限制文本框的輸入字符的非法性(不能輸入中文)
//==============================================================================
function controlChinese_onkeypress()
{
	var code=String.fromCharCode(window.event.keyCode);
	code=code.replace(/[\u4e00-\u9fa5]/g,'');
	window.event.keyCode=code.charCodeAt(0);
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";
}
function controlChinese_onbeforepaste()
{
	clipboardData.setData('text',clipboardData.getData('text').replace(/[\u4e00-\u9fa5]/g,''));
}
function controlRestrictChinese(control)
{
	control.attachEvent('onbeforepaste',controlChinese_onbeforepaste);
	control.attachEvent('onkeypress',controlChinese_onkeypress);
	control.attachEvent('onbeforeeditfocus',control_imeMode_disabled);
}

//==============================================================================
//用正則表達式限制文本框的輸入字符的非法性(用戶名專用)
//==============================================================================
function controlUserName_onkeypress()
{
	var code=String.fromCharCode(window.event.keyCode);
	code=code.replace(/[^a-zA-Z0-9\_\-]/g,'');
	window.event.keyCode=code.charCodeAt(0);
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";
}
function controlUserName_onbeforepaste()
{
	clipboardData.setData('text',clipboardData.getData('text').replace(/[^a-zA-Z0-9\_\-]/g,''));
}
function controlRestrictUserName(control)
{
	control.attachEvent('onbeforepaste',controlUserName_onbeforepaste);
	control.attachEvent('onkeypress',controlUserName_onkeypress);
	control.attachEvent('onbeforeeditfocus',control_imeMode_disabled);
}

//==============================================================================
//用正則表達式限制文本框的輸入字符的非法性(日期格式)
//==============================================================================

//yyyy/MM/dd格式
function controlDateShort_onkeypress()
{
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";
	var text=control.value;
	var selectText=document.selection.createRange().text;
	
	var code=String.fromCharCode(window.event.keyCode);
	code=code.replace(/[^\d|^\/]+/g,'');
	
	//如果文本框全選中, 則當前字符一定要是數字
	if(text==selectText)
	{
		//如果輸入"/"時，強行把它改為空
		if(code=="/")
			code="";
	}
	//否則, 不是全選中時
	else
	{
		//當前光標位置
		var pos=getCursorPos(control);
		
		//如果超過日期總長度，則不能再輸入
		if(pos<=9)
		{
			//只有當光標位置在第4或第7位時才能輸入"/"
			if((code=="/" && pos!=4 && pos!=7) || ((pos==4 || pos==7) && code!="/"))
				code="";
			else
			{
				//當前光標為第3位時,如果輸入了數字，則把第4位的'/'一起寫入
				if((pos==3 || pos==6) && code!="/")
				{
					//如果是第6位時
					if(pos==6)
					{
						var beforeText=rightChar(control.value,1);
						
						//如果第5位是0，則第6位不能再輸入0
						if(beforeText=="0" && code=="0")
							code="";
						//如果是1，則只能輸入0或1或2
						else if(beforeText=="1" && code!="0" && code!="1" && code!="2")
							code="";
						else
						{
							control.value+=code;
							code="/";
							setCursorPosition(control,pos+1);
						}
					}
					else					
					{
						control.value+=code;
						code="/";
						setCursorPosition(control,pos+1);
					}
				}
				
				//如果是第5位時則只能輸入0或1，因為月份只有12個月;
				if(pos==5 && code!="0" && code!="1")
					code="";
				
				//如果在第8位或第9位時
				if(pos==8 || pos==9)
				{
					//獲月份
					var oMonth=substringChar(control.value,5,2);
					
					//第8位只能輸入0.1.2.3
					if(pos==8)
					{
						if(oMonth!="02")
						{
							if(code!="0" && code!="1" && code!="2" && code!="3")
								code="";
						}
						else
						{
							if(code!="0" && code!="1" && code!="2")
								code="";
						}						
					}
					//第9位時
					else if(pos==9)
					{
						//取第8位數字
						var eightChar=substringChar(control.value,8,1);
						
						if(eightChar=="0" && code=="0")
							code="";
						//如果月份為2月時，則要判斷是否潤年
						else if(oMonth=="02" && eightChar=="2")
						{
							//獲取年份							
							var oYear=leftChar(control.value,4);
							
							//如果是閏年
							if(!isLeapYear(oYear))
							{
								if(code=="9")
									code="";
							}							
						}
						else if(eightChar=="3")
						{
							//月份有31天時
							if(oMonth=="01" || oMonth=="03" || oMonth=="05" || oMonth=="07" || oMonth=="08" || oMonth=="10" || oMonth=="12")
							{
								if(code!="0" && code!="1")
									code="";
							}
							//只有30天時
							else
							{
								if(code!="0")
									code="";
							}
						}					
					}			
				}	
			}			
		}
		else
			code="";
	}	
	
	window.event.keyCode=code.charCodeAt(0);
}

//通用格式
function controlDate_onkeypress()
{
	var code=String.fromCharCode(window.event.keyCode);
	code=code.replace(/[^\d|^\/|^\-|^\:|^\s]/g,'');
	window.event.keyCode=code.charCodeAt(0);//返回字符串指定位置
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";//輸入法編輯器關閉
}
function controlDate_onbeforepaste()
{
	clipboardData.setData('text',clipboardData.getData('text').replace(/[^\d|^\/|^\-|^\:|^\s]/g,''));
}
function controRestrictDate(control)
{
	control.attachEvent('onbeforepaste',controlDate_onbeforepaste);
	control.attachEvent('onkeypress',controlDate_onkeypress);
	control.attachEvent('onbeforeeditfocus',control_imeMode_disabled);
}
//不允許輸入任何字符
function controlEmpty_onkeypress()
{
	code="";
	window.event.keyCode=code.charCodeAt(0);//返回字符串指定位置
	var control=window.event.srcElement;
	control.style.imeMode = "disabled";//輸入法編輯器關閉
}
function controlEmpty_onbeforepaste()
{
	try
	{
		clipboardData.setData('text','');
	}
	catch(e){}
}
function controRestrictEmpty(control)
{
	control.attachEvent('onbeforepaste',controlEmpty_onbeforepaste);
	control.attachEvent('onkeypress',controlEmpty_onkeypress);
	control.attachEvent('onbeforeeditfocus',control_imeMode_disabled);
}

//設置當前光標位置控件的輸入法不可用
function controlMaxLength_disabled()
{
	var control=window.event.srcElement;
	if (control != null && parseInt(control.maxLength) > 0 && control.value.length >= parseInt(control.maxLength))
		control.style.imeMode = "disabled";
	else
		control.style.imeMode = "";
}
function controlMaxLength_onbeforepaste()
{
	try
	{
		var control=window.event.srcElement;
		if (control != null && parseInt(control.maxLength) > 0 && control.value.length >= parseInt(control.maxLength))
			clipboardData.setData('text','');
		else if (control != null && parseInt(control.maxLength) > 0 )
		{
			var oldLength = control.value.length;
			var newLength = clipboardData.getData('text').length;
			if ( parseInt(oldLength) + parseInt(newLength) > parseInt(control.maxLength))
			{
				var leftLength = parseInt(control.maxLength) - parseInt(oldLength);
				clipboardData.setData('text',leftChar(clipboardData.getData('text'), leftLength));
			}
		}
	}
	catch(e){}
}
//不允許輸入任何字符,並拋出提示
function controlMaxLength_onkeypress()
{
	var control=window.event.srcElement;
	if (control != null && parseInt(control.maxLength) > 0 && control.value.length >= parseInt(control.maxLength))
	{
		code="";
		window.event.keyCode=code.charCodeAt(0);
		control.style.imeMode = "disabled";
		control.isAlert = "no";
		alert("對不起，已經達到最大長度！");
		control.isAlert = "";
		
	}
}
function controlMaxLength_onblur()
{
	var control=window.event.srcElement;
	if (control != null && parseInt(control.maxLength) > 0 && control.value.length > parseInt(control.maxLength))
	{
		if (control.isAlert != "no")
		{
			alert("對不起，此輸入框中的內容超過了所允許的最大長度!");
		}
		control.focus();
		setCursorPosition(control, control.value.length);
	}
}



/*==============================================================================
description:用新的字符replacestring字符串替換掉目標的findString變量的字符串
parameters:
	name: sourceString			value: 源字符串
	name: findString			value: 被替換的字符串
	name: replacestring			value: 新的字符串
	name: sign					value: 分割符
================================================================================*/
function replaceString(sourceString,findString,replacestring,sign)
{
	var strPattern=new RegExp("("+findString+"=){1}[^\\"+sign+"]*","g");
	sourceString=sourceString.toString().replace(strPattern,replacestring);
	return sourceString;
}

/*==============================================================================
description:根據filter及sign, 從源字符串中獲到指定的字符串
parameters:
	name: sourceString			value: 源字符串
	name: filterString			value: 過濾項目
	name: sign					value: 分割符
================================================================================*/
function getTargetStringSign(sourceString,filterString,sign)
{
	var strReturnString="";
	var strPattern=new RegExp("\\b("+filterString+"=){1}[^\\"+sign+"]+","g");
	var strResult=sourceString.toString().match(strPattern);
	if(strResult!=null)
	{
		strReturnString=strResult.toString().replace(new RegExp("^("+filterString+"=){1}","g"),"");
	}
	return strReturnString;
}

/*==============================================================================
description:根據傳入的分割符(sign)及索引值, 獲取源字符串數組中相應的值
parameters:
	name: listValue				value: 源字符串
	name: sign					value: 分割符
	name: index					value: 數組索引值
================================================================================*/
function getArrayIndexValue(listValue,sign,index)
{
	try
	{
		var strArray=listValue.toString().split(sign);
		if(Math.abs(index)<=strArray.length-1)
		{
			return strArray[index];
		}else{return null;}
	}catch(e){}
}

/*==============================================================================
description:右截取字符串函數
parameters:
	name: strSourceChar			value: 源字符串
	name: length				value: 要截取的長度
================================================================================*/
function rightChar(strSourceChar,length)
{
	strSourceChar=strSourceChar.toString().substring(strSourceChar.length-length,strSourceChar.length);
	return strSourceChar;
}

/*==============================================================================
description:左截取字符串函數
parameters:
	name: strSourceChar			value: 源字符串
	name: length				value: 要截取的長度
================================================================================*/
function leftChar(strSourceChar,length)
{
	strSourceChar=strSourceChar.toString().substring(0,length);
	return strSourceChar;
}

/*==============================================================================
description:從指定開始位置截取到指定長度的字符串函數
parameters:
	name: strSourceChar			value: 源字符串
	name: start					value: 開始位置
	name: length				value: 要截取的長度
================================================================================*/
function substringChar(strSourceChar,start,length)
{
	strSourceChar=strSourceChar.toString().substring(start,Math.abs(start)+Math.abs(length));
	return strSourceChar
}

/*==============================================================================
description:去掉從後面開始到指定長度的字符串函數
parameters:
	name: strSourceChar			value: 源字符串
	name: length				value: 要去掉長度
================================================================================*/
function removeBackChar(strSourceChar,length)
{
	strSourceChar=strSourceChar.toString().substring(0,strSourceChar.length-length);
	return strSourceChar
}

/*==============================================================================
description:去掉從前面開始到指定長度的字符串函數
parameters:
	name: strSourceChar			value: 源字符串
	name: length				value: 要去掉長度
================================================================================*/
function removeFrontChar(strSourceChar,length)
{
	strSourceChar=strSourceChar.toString().substring(length,strSourceChar.length);
	return strSourceChar
}

/*==============================================================================
description:去掉左右兩邊空格字符串函數
parameters:
	name: strSourceChar			value: 源字符串
================================================================================*/
function Trim(strSourceChar)
{
	strSourceChar=LTrim(strSourceChar);
	strSourceChar=RTrim(strSourceChar);
	return strSourceChar;
}

/*==============================================================================
description:去掉左邊空格字符串函數
parameters:
	name: strSourceChar			value: 源字符串
================================================================================*/
function LTrim(strSourceChar)
{
	strSourceChar=strSourceChar.toString().replace(/^[\s|\n|\r| ]+/g,"");
	return strSourceChar;
}

/*==============================================================================
description:去掉右邊空格字符串函數
parameters:
	name: strSourceChar			value: 源字符串
================================================================================*/
function RTrim(strSourceChar)
{
	strSourceChar=strSourceChar.toString().replace(/[\s|\n|\r| ]+$/g,"");
	return strSourceChar;
}

/*==========================================================================
description:根據指定的sign字符,刪除其多余的部分
parameters:
	name: sourceChar				value: 源字符串.
	name: sign						value: 分割符.
example: ;125;35;;525;;;551;		result: 125;35;525;551
============================================================================*/
function replaceSurplusChar(sourceChar,sign)
{
	sourceChar=sourceChar.toString().replace(new RegExp("[\\"+sign+"]{2,100}","g"),sign);
	sourceChar=sourceChar.toString().replace(new RegExp("^[\\"+sign+"]+","g"),"");
	sourceChar=sourceChar.toString().replace(new RegExp("[\\"+sign+"]+$","g"),"");

	return sourceChar;	
}

/*==============================================================================
description:四捨五入函數
parameters:
	name: numeric			value: 要四捨五入的數值.
	name: scale				value: 小數點的位數。
================================================================================*/
function Round(numeric,scale)
{
	var example="1=0;2=00;3=000;4=0000;5=00000;6=000000;7=0000000;8=00000000;9=000000000;10=0000000000;";
		example+="11=00000000000;12=000000000000;13=0000000000000;14=00000000000000;15=000000000000000;";
	if(parseInt(scale)<0 || parseInt(scale)>15)
		return numeric;
	else
	{
		var smallScale=getTargetStringSign(example,scale,";");
			smallScale="0."+smallScale+"5";
		var iIntLength=numeric.toString().replace(/[^\.]+$/g,"").length-1;
		if(iIntLength==-1)
			return numeric;
		else
		{
			numeric=parseFloat(numeric)+parseFloat(smallScale);
			if(Math.abs(scale)==0)
				numeric=leftChar(numeric,Math.abs(iIntLength));
			else
				numeric=leftChar(numeric,Math.abs(iIntLength)+Math.abs(scale)+1);
		}
	}
	return numeric;
}

/*==========================================================================
description:查看字符串裡是否含有目標字串，用sign作分隔符
parameters:
	name: sourceString			value: 源字串.
	name: filterString			value: 字串中的項目名稱.
	name: sign					value: 分割符.
============================================================================*/
function hasTargetString(sourceString,filterString,sign)
{
	//把小a-z大A-Z及數字、中文以外的所有符號找出來,並強行在其前面加'\'(下劃線除外)
	var result=filterString.match(/[^a-zA-Z0-9\u4e00-\u9fa5]/g);
	
	if(result != null)
	{
		var arrayResult=result.toString().split(',');
		for(sys_i = 0; sys_i < arrayResult.length; sys_i++)
		{
			if(arrayResult[sys_i] != "_")
			{
				var prttern=new RegExp("[\\"+arrayResult[sys_i]+"]{1}","g");
				filterString=filterString.replace(prttern,"\\"+arrayResult[sys_i]);
			}
		}
	}

	sourceString = sign+sourceString+sign;
	sourceString = sourceString.replace(new RegExp("^[\\"+sign+"]{2,100}","g"),sign);
	sourceString = sourceString.replace(new RegExp("[\\"+sign+"]{2,100}$","g"),sign);
	var strPattern=new RegExp("[\\"+sign+"]{1}("+filterString+"){1}[\\"+sign+"]{1}","g");
	if(sourceString.match(strPattern))
		return true;
	
	return false;
}

/*==============================================================================
description:顛倒字符串(如:ABC----CBA)
parameters:
	name: sourceString			value: 要顛倒的字符串.
================================================================================*/
function Reverse(sourceString)
{
	if(sourceString!=null)
	{
		var newString="";
		for(i=0;i<sourceString.length;i++)
		{	
			newString=substringChar(sourceString,i,1)+newString;
		}
		sourceString=newString;
	}
	
	return sourceString;	
}

/*==============================================================================
description:貨幣格式轉換函數
parameters:
	name: sourceValue			value: 要轉換的貸幣值.
	name: firstSign				value: 要顯示的貸幣符號(如: $).
	name: splitSign				value: 每三位數之間的分隔符(如: $123,00.2).
	name: scale					value: 小數點的位數.
returns: 返回格式後的貨幣字符串值(如: $123,520,2.32)
================================================================================*/
function CurrencyFormat(sourceValue,firstSign,splitSign,scale)
{
	//先把不是數字及小數點的所有字符串去掉
	sourceValue=sourceValue.toString().replace(/[^\d|\.]/g,"");
	
	//獲取整數部分
	var int_Value=sourceValue.toString().match(/^[\d]*[^\.]/);

	//獲取是否有小數點
	var isScale=sourceValue.toString().match(/[\.]/g);
	
	//小數點後的數
	var scale_Value=null;
	
	//如果有小數點,則截取小數點後的數
	if(isScale!=null)
		scale_Value=sourceValue.toString().match(/[\d]*[^\.]+$/);
		
	var newIntValue="";
	//如果有整數部分
	if(int_Value!=null)
	{
		//字符串顛倒,以便給每隔三個數字之間加特定的符號
		int_Value=Reverse(int_Value.toString());
		
		var i=3;
		while(i>0)
		{
			newIntValue+=leftChar(int_Value,i)+splitSign;
			
			if(int_Value.length-i>0)
				int_Value=rightChar(int_Value,Math.abs(int_Value.toString().length-i));
			else
				int_Value="";
			
			if(int_Value==null || int_Value.toString().length<=0)
				i=0;
		}
		//把字符串重新倒回來
		int_Value=Reverse(removeBackChar(newIntValue,1));
	}
	
	var strScale="";
	
	//如果有小數點,如果當前的小數位數比傳入的小數點參數小，則補零
	if(scale_Value!=null)
	{

		if(scale_Value.toString().length<scale)
		{
			for(i=1;i<=scale-scale_Value.toString().length;i++)
			{
				strScale+="0";
			}
		}
		scale_Value+=strScale;
	}
	//如果沒有小數點,則根據傳入的小數點位數全部補零
	else
	{
		for(i=1;i<=scale;i++)
		{
			strScale+="0";
		}
		scale_Value=strScale;
	}
	
	var temp=firstSign+int_Value+'.'+scale_Value;
	temp=temp.toString().replace(/(null)+/g,"0");
	return temp;
}

/*==============================================================================
description:根據控件ID名返回控件(object)
parameters:
	name: id			value: 控件ID.
================================================================================*/
function getControl(id)
{
	if(id.length==0){return null};
	var ctrl;
	ctrl=eval("window.document.all."+id.toString());
	return ctrl;
}

/*==============================================================================
description:獲取指定控件的所有子控件,,返回類型為id或object
parameters:
	name: TargetPanel			value: 裝載控件的Panel.
	name: ReturnSort			value: 返回到數組中的類型(控件或控件ID).
================================================================================*/
function getAllControlId(TargetPanel,ReturnSort)
{
	var strCtrlID="";
	var ctrl_Array=new Array();
	var k=0;
	for(i=0;i<TargetPanel.children.length;i++)
	{
		var ctrl=TargetPanel.children[i];
		if(leftChar(ctrl.id,3)!="sys")
		{
			strCtrlID+=ctrl.id + ";";
			ctrl_Array[k]=ctrl;
			k++;
		}
	}
	if(ReturnSort=="id")
		return removeBackChar(strCtrlID,1);
	else if(ReturnSort=="object")
		return ctrl_Array;
}

/*==============================================================================
description:獲取指定控件的前綴為prefixList變量指定的所有子控件,
			返回類型為id或object
parameters:
	name: TargetPanel			value: 裝載控件的Panel.
	name: ReturnSort			value: 返回到數組中的類型(控件或控件ID).
	name: prefixList			value: 前綴
================================================================================*/
function getAllControlIdHavePrefix(TargetPanel,ReturnSort,prefixList)
{
	prefixList=prefixList+";";
	prefixList=prefixList.toString().replace(/[\;]+/g,"=1;");
	var strCtrlID="";
	var ctrl_Array=new Array();
	var k=0;
	for(i=0;i<TargetPanel.children.length;i++)
	{
		var ctrl=TargetPanel.children[i];
		if(leftChar(ctrl.id,3)!="sys" && getTargetStringSign(prefixList,leftChar(ctrl.id,3),";").length>0)
		{
			strCtrlID+=ctrl.id + ";";
			ctrl_Array[k]=ctrl;
			k++;
		}
	}
	if(ReturnSort=="id")
		return removeBackChar(strCtrlID,1);
	else if(ReturnSort=="object")
		return ctrl_Array;
}

/*==============================================================================
description:在數據操作頁面，防止用戶按Tab鍵跳到隱藏的服務端的保存或刪除數據
			按鈕(btn_saveServer、btn_deleteServer)時按回車鍵觸發保存或刪除操作
parameters:
	name: arrayId			value: 控件數組字符串.
	name: sign				value: 分割符.
================================================================================*/
function setEveryControlTab(arrayId,sign)
{
	if(window.event.keyCode==13)
	{
		if(event.srcElement.type!=null && event.srcElement.type=="button")
		{
			if(hasTargetString(arrayId,event.srcElement.id,sign))
				window.event.keyCode=9;
		}
		else
			window.event.keyCode=9;
	}
}

/*==========================================================================
description:根據傳入的參數打開窗體
parameters:
	name: url					value: URL地址.
	name: left					value: 左邊距.
	name: top					value: 上邊距.
	name: width					value: 窗體寬度.
	name: height				value: 窗體高度.
	name: status				value: 狀態--0,1.
	name: toolbar				value: 是否有工具條--0,1.
	name: menubar				value: 是否有菜單項--0,1.
	name: scrollbar				value: 是否有滾動條--0,1.
	name: resizable				value: 是否可改變窗體大小--0,1.
============================================================================*/
function openFrmUrl(url,left,top,width,height,status,toolbar,menubar,scrollbar,resizable)
{
	window.open(url,"_blank","left=" + left +",top="+ top + 
	",width=" + width + ",height="+ height +
	",status="+status+",toolbar="+toolbar+",menubar="+menubar+",location=0,scrollbars="+
	scrollbar+",resizable="+resizable,false); 
}

/*==============================================================================
description:把當前光標置於指定網格單元格
parameters:
	name: oRow					value: 網格行對象.
	name: objColumnName			value: 網各列名.
	name: oUltraWebGridName		value: 網格名稱.
================================================================================*/
function setGridFocus(oRow,objColumnName,oUltraWebGridName)
{
	oRow.getCellFromKey(objColumnName).setSelected(true);
	oRow.getCellFromKey(objColumnName).activate();
	igtbl_EnterEditMode(oUltraWebGridName);
}

/*==============================================================================
description:校驗網格的值為空時,拋出提示,並返回False
parameters:
	name: strAlertInfo				value: 提示信息
	name: oRow						value: 網格行對象
	name: objColumnName				value: 網格列Key
	name: oUltraWebGridName			value: 網格名稱.

================================================================================*/
function returnFalseByGrid(strAlertInfo,oRow,objColumnName,oUltraWebGridName)
{
	alert(strAlertInfo);
	setGridFocus(oRow,objColumnName,oUltraWebGridName);			
	
	return false;
}

/*==============================================================================
description:根據指定的網格單元格ID來獲取網格行的所在位置(索引號)
parameters:
	name: cellId					value: 網格單元格ID.
================================================================================*/
function getRowIndex(cellId)
{
	var oRowId=cellId.match(/[\_]+[\d]+[\_]+/g);
	if(oRowId!=null)
		oRowId=oRowId.toString().replace(/[^\d]/g,"");
		
	return oRowId!=null? oRowId:"";
}

/*==============================================================================
description:校驗控件時如果指定的控件的值為空時,拋出提示,並返回False
parameters:
	name: control					value: 控件對象
	name: strAlert					value: 要拋出的提示
================================================================================*/
function alertAndFocusControl(control,strAlert)
{
	alert(strAlert);
	control.focus();
	return false;
}

//校驗網格數據(EP、PP、新產品會議、R&D新產品會議專用)
function checkGridData(oGrid)
{
	if(oGrid==null){return true}
	var oRows=oGrid.Rows;
	
	if(oRows.length>0)
	{
		var oRow=null;
		
		for(var i=0;i<oRows.length;i++)
		{
			oRow=oRows.getRow(i);
			if(oRow.getCellFromKey("problem_desc").getValue()==null || Trim(oRow.getCellFromKey("problem_desc").getValue())=="")
				return returnFalseByGrid("請輸入問題總結!",oRow,"problem_desc","UltraWebGrid1");
			else if(oRow.getCellFromKey("reason_analysis").getValue()==null || Trim(oRow.getCellFromKey("reason_analysis").getValue())=="")
				return returnFalseByGrid("請輸入原因分析!",oRow,"reason_analysis","UltraWebGrid1");
			else if(oRow.getCellFromKey("solution").getValue()==null || Trim(oRow.getCellFromKey("solution").getValue())=="")
				return returnFalseByGrid("請輸入解決方案!",oRow,"solution","UltraWebGrid1");
			else if(oRow.getCellFromKey("expect_date").getValue()==null || Trim(oRow.getCellFromKey("expect_date").getValue())=="")
				return returnFalseByGrid("請輸入計劃日期!",oRow,"expect_date","UltraWebGrid1");
			else if(oRow.getCellFromKey("charge_person").getValue()==null || Trim(oRow.getCellFromKey("charge_person").getValue())=="")
				return returnFalseByGrid("請選擇負責人!",oRow,"charge_person_desc","UltraWebGrid1");
		}
	}
	
	return true;
}

/*==============================================================================
description:求兩數相乘結果
parameters:
	name: oValue1			value: 第一個數.
	name: oValue2			value: 第二個數.
================================================================================*/
function getScaleValue(oValue1,oValue2)
{
	var oReturnValue;
	
	var pos1 = 0;
	var pos2 = 0;
	
	var scale1 = 0;
	var scale2 = 0;
	
	//第一個數的小數點位置
	pos1 = oValue1.toString().lastIndexOf(".");
	//如果有小數點時
	if(pos1!= -1)
	{
		//計算第一個數的小數點長度	
		scale1 = oValue1.toString().length-pos1-1;
	}
	
	//第二個數的小數點位置
	pos2 = oValue2.toString().lastIndexOf(".");
	//如果有小數點時
	if(pos2!= -1)
	{
		//計算第二個數的小數點長度	
		scale2 = oValue2.toString().length-pos2-1;
	}
	
	//去掉小數點後的數
	oValue1 = oValue1.toString().replace(/[\.]/g,"");
	oValue2 = oValue2.toString().replace(/[\.]/g,"");
	
	//把前面所有的零去掉
	oValue1 = oValue1.toString().replace(/^[0]+/,"");
	oValue2 = oValue2.toString().replace(/^[0]+/,"");
	
	//去掉零後的空值處理
	if(oValue1=="")
		oValue1 = 0;
	if(oValue2=="")
		oValue2 = 0;
	
	//兩個整數相乘結果
	var oTotal = parseInt(oValue1) * parseInt(oValue2);
	//總的小數位數
	var oScaleTotal = parseInt(scale1) + parseInt(scale2);
	
	//如果有小數點
	if(oScaleTotal > 0)
	{
		if(oScaleTotal < oTotal.toString().length)
		{
			//小數點之前的數
			var oBeforeValue = oTotal.toString().substring(0,oTotal.toString().length - oScaleTotal);
			//小數點之後的數
			var oAfterValue = oTotal.toString().substring(oTotal.toString().length - oScaleTotal);
			
			//要輸出的結果數
			oReturnValue = oBeforeValue + "." + oAfterValue;
		}
		else
		{
			var pre_zero = "";
			if(oScaleTotal  > oTotal.toString().length)
				pre_zero = "000000000000000".substring(0,oScaleTotal  - oTotal.toString().length);
				
			oReturnValue  = "0." + pre_zero + oTotal;
		}
	}
	else
	{
		oReturnValue = oTotal ;
	}

	return oReturnValue;
}

