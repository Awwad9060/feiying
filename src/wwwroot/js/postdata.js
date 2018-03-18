function checkBrowse(){
	if(!window.XMLHttpRequest){
		window.XMLHttpRequest=function(){
			var xmlHttp=null;
			var progids=['Microsoft.XMLHTTP', 'MSXML2.XMLHTTP.5.0', 'MSXML2.XMLHTTP.4.0', 'MSXML2.XMLHTTP.3.0', 'MSXML2.XMLHTTP'];
			for(var i=0;i<progids.length;i++){
				try{
					xmlHttp=new ActiveXObject(progids[i]);
					break;
				}
				catch(e){}
			}
			if(xmlHttp==null){
				//alert('无法创建对象');
			}
			return xmlHttp;
		};
	}
}
checkBrowse();

function postData(url,postValue,fun,method){
	var xmlObj = null;
	if(window.XMLHttpRequest){
		xmlObj = new XMLHttpRequest();
	}
	else {
		return;
	}
	var async=false;
	method=method=='GET'?'GET':'POST';
	if(typeof(fun)=='function')async=true;
	if(async) xmlObj.onreadystatechange = doData;
	xmlObj.open (method, url, async);
	xmlObj.setRequestHeader("Content-Type", "application/x-www-form-urlencoded");
	xmlObj.setRequestHeader("Accept-Encoding", "GB2312" );
	xmlObj.send (postValue);
	if(!async){
		return getData();
	}

	function doScript(str){
		var regStr='<script.*?>((.|\n|\r)*?)<\/script.*?>';
		var reg1=new RegExp(regStr,'img');
		var reg2=new RegExp(regStr,'im');
		var scripts=str.match(reg1);
		if(!scripts) return;
		for(var i=0;i<scripts.length;i++){
			var script=scripts[i].match(reg2)[1];
			eval(script);
		}
	}

	function getData(){

		if(xmlObj.getResponseHeader('Content-Type')=='text/xml')
			return xmlObj.responseXML;
		else{
			var str=xmlObj.responseText;
			setTimeout(function(){doScript(str);},500);
			return xmlObj.responseText;
		}
	}

	function doData(){
		if(xmlObj.readyState!=4){
			return;
		}
		if(xmlObj.status==200){
			fun(getData());
			xmlObj.onreadystatechange=function(){};
			xmlObj.abort();
			xmlObj=null;
			delete xmlObj;
		}
		else{
			fun(null);
			xmlObj.onreadystatechange=function(){};
			xmlObj.abort();
			xmlObj=null;
			delete xmlObj;
		}
	}
}

// JavaScript Document
function createXMLHttp() {
    if (window.XMLHttpRequest) {
        return new XMLHttpRequest();
    } else if (window.ActiveXObject) {
        return new ActiveXObject("Microsoft.XMLHTTP");
    }
    throw new Error("XMLHttp object could be created.");
}


function ajaxRead(file, fun) {
    var xmlObj = createXMLHttp();

    xmlObj.onreadystatechange = function() {
        if (xmlObj.readyState == 4) {
            if (xmlObj.status == 200) {
                obj_value = xmlObj.responseText;
                eval(fun);
            }
            else {
                //alert("读取文件出错,错误号为 [" + xmlObj.status  + "]");
            }
        }
    }
    xmlObj.open('GET', file, true);
    xmlObj.send(null);
}