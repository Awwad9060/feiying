var oPopup = window.createPopup();

var tr01_01 = "#E7E3E7"; //��һ�б����ɫ
var tr01_02 = "#D6D3D6"; //�ڶ��б����ɫ
var tr01_03 = "#FFFFFF";
var tab01 = "#6595D6";  //�߿��ɫ
var kongj;

var style1   = 'style="background-color:#6595D6;color: #FFFFFF;font-weight: bold;font-size: 9pt;"';
var style2   = 'style="background-color:#FFFFFF;color: #FFFFFF;font-weight: bold;font-size: 9pt;"';
var style3 = 'style="position: relative; left: 0px; top: 0px; width: 100%;overflow:hidden; text-overflow:ellipsis;"';

//����|PEK|B  ����|���ִ���|ƴ������ĸ

var shcs = new Array("�����׶�|PEK|B","�Ϻ�����|SHA|S","�Ϻ��ֶ�|PVG|S","����|CAN|G","����|SZX|S","��ɳ|CSX|C","������Է|NAY|B","�人|WUH|W","�Ͼ�|NKG|N","����|HGH|H","����|DLC|D","�ൺ|TAO|Q","����|CKG|C","���ͺ���|HET|H","֣��|CGO|Z","����|XIY|X","�c��|SHE|S","����|CGQ|C","����|KMG|K","��³ľ��|URC|W","���|TSN|T","̫ԭ|TYN|T","�Ϸ�|HFE|H","����|FOC|F","�ϲ�|KHN|N","������|HRB|H","����|TNA|J","�ό�|NNG|N","����|HAK|H","����|KWE|G","����|LHW|L","����|INC|Y","����|XNN|X");
var qtcs = new Array("����̩|AAT|A","����|AQG|A","������|AKU|A","����|AKA|A","��ɽ|IOB|A","��ɽ|BSD|B","��ͷ|BAV|B","����|BHY|B","�����׶�|PEK|B","������Է|NAY|B","��ɳ|CSX|C","����|CGQ|C","����|CGD|C","����|CIH|C","����|CZX|C","����|BPX|C","����|CHG|C","�ɶ�|CTU|C","���|CIF|C","����|CKG|C","�ػ�|DNH|D","����|DLU|D","����|DLC|D","��ͬ|DAT|D","����|DDG|D","����|DAX|D","�º�â��|LUM|D","�����������|DIG|D","��Ӫ|DOY|D","��ʩ|ENH|E","����|FUG|F","����|FOC|F","����|KOW|G","���ľ|GOQ|G","��Ԫ|GYS|G","����|CAN|G","�㺺|GHN|G","����|KWL|G","����|KWE|G","����|HJJ|H","������|HRB|H","����|HAK|H","������|HLD|H","����|HMI|H","����|HZG|H","����|HGH|H","�Ϸ�|HFE|H","����|HNY|H","����|HTN|H","���ͺ���|HET|H","��ɽ|TXN|H","�Ǝr|HYN|H","����|AHE|H","����|JIL|J","����|TNA|J","����|KNC|J","����|JNZ|J","������|JDZ|J","���ݡ�ɳ��|SHS|J","�Ž�|JIU|J","��կ��|JZH|J","�����|KRL|K","�⳵|KCA|K","��ʲ|KHG|K","��������|KRY|K","����|KMG|K","����|LXA|L","����|LHW|L","���Ƹ�|LYG|L","��ƽ|LIA|L","����|LYI|L","�ٲ�|LNJ|L","����|LLF|L","����|LZH|L","�o��|LZO|Z","����|LYA|L","������|NZH|M","÷��|MXZ|M","����|MIG|M","ĵ����|MDG|M","�Ͼ�|NKG|N","�ϲ�|KHN|N","�ϳ�|NAO|N","�ό�|NNG|N","��ͨ|NTG|N","����|NNY|N","����|NGB|N","�������|NDG|Q","��ĩ|IQM|Q","�ػʵ�|SHP|Q","�ൺ|TAO|Q","����|IQN|Q","����|JUZ|Z","Ȫ�ݽ���|JJN|Q","��ˮ|SUB|Z","����|SYX|S","��ͷ|SWA|S","�Ϻ�����|SHA|S","�Ϻ��ֶ�|PVG|S","۷��|SXJ|Z","�ع�|SHG|S","�c��|SHE|S","����|SZX|S","ʯ��ׯ|SJW|S","˼é|SYM|S","����|TCG|T","̫ԭ|TYN|T","���|TSN|T","ͭ��|TEN|T","����|WXN|W","Ϋ��|WEF|W","����|WEH|W","����|WNZ|W","�人|WUH|W","��³ľ��|URC|W","����ɽ|WUS|W","����|WUX|W","����|WUZ|W","���ֺ���|XIL|X","����|XIY|X","����|XNN|X","��˫���ɾ���|JHG|X","����|XMN|X","�差|XFN|X","����|XIC|X","����|XUZ|X","�γ�|YNZ|Y","�˲�|YIH|Y","����|INC|Y","�Ӽ�|YNJ|Y","��̨|YNT|Y","�Ӱ�|ENY|Y","�˱�|YBP|Y","����|YIW|Y","����|YIN|Y","����|UYN|Y","տ��|ZHA|Z","�żҽ�|DYG|Z","��ͨ|ZAT|Z","֣��|CGO|Z","��ɽ|HSN|Z","�麣|ZUH|Z","����|ZYI|Z","����|LJG|L");
var ywzm = new Array("A","B","C","D","E","F","G","H","J","K","L","M","N","Q","S","T","W","X","Y","Z") 
var popup_gd=25;  //������ʾ�߶�
var popup_i; 
var popup_int0=0;
var popup_int1=0;
var popup_int2=0;
var popup_int3=0;


function Split(popup_str,popup_n,popup_s){ //�ַ���,ȡ�ڼ�������,�ָ��ַ�
	var popup_split;
	 popup_split=popup_str.split(popup_s);
	return popup_split[popup_n];
}

function popUp(abc){
if(typeof(abc)=='string')
	kongj=document.all(abc);
else
	kongj=abc;

var posLib = {
    getClientLeft:function (el) {
      var r = el.getBoundingClientRect();
      return r.left - this.getBorderLeftWidth(this.getCanvasElement(el));
    },

    getClientTop:    function (el) {
      var r = el.getBoundingClientRect();
      return r.top - this.getBorderTopWidth(this.getCanvasElement(el));
    },

    getLeft:    function (el) {
      return this.getClientLeft(el) + this.getCanvasElement(el).scrollLeft;
    },

    getTop:    function (el) {
      return this.getClientTop(el) + this.getCanvasElement(el).scrollTop;
    },

    getInnerLeft:    function (el) {
      return this.getLeft(el) + this.getBorderLeftWidth(el);
    },

    getInnerTop:    function (el) {
      return this.getTop(el) + this.getBorderTopWidth(el);
    },

    getWidth:    function (el) {
      return el.offsetWidth;
    },

    getHeight:    function (el) {
      return el.offsetHeight;
    },

    getCanvasElement:    function (el) {
      var doc = el.ownerDocument || el.document;    // IE55 bug
      if (doc.compatMode == "CSS1Compat")
        return doc.documentElement;
      else
        return doc.body;
    },

    getBorderLeftWidth:    function (el) {
      return el.clientLeft;
    },

    getBorderTopWidth:    function (el) {
      return el.clientTop;
    },

    getScreenLeft:    function (el) {
      var doc = el.ownerDocument || el.document;    // IE55 bug
      var w = doc.parentWindow;
      return w.screenLeft + this.getBorderLeftWidth(this.getCanvasElement(el)) + this.getClientLeft(el);
    },

    getScreenTop:    function (el) {
      var doc = el.ownerDocument || el.document;    // IE55 bug
      var w = doc.parentWindow;
      return w.screenTop  + this.getClientTop(el);//+ this.getBorderTopWidth(this.getCanvasElement(el))
    }
  }
  
popup_int0=0;
popup_int1=0;
popup_int2=0;
popup_int3=0;
var tab;
tab = '<table width="350" border="0" cellpadding="0" cellspacing="2" bgcolor="' +tab01+ '">';
tab+= '<tr>';
tab+= '<td>';
tab+= '<table width="100%" border="0" cellpadding="0" cellspacing="0" style="background-color:' +tr01_02+ ';">';
tab+= '  <tr align="center">';
tab+= '    <td height="23"'+style1+'>��ѡ�����(�������ƴ������ĸ����)</td>';
tab+= '  </tr>';
tab+= '  <tr align="center">';
tab+= '    <td height="23"'+style2+'>';
tab+= '      <table width="100%" align="center" border="0" cellspacing="0" cellpadding="0" style="font-size: 9pt"><tr><td width="10"></td><td><table width="100%" border="0" cellpadding="0" cellspacing="0" style="font-size: 10pt"><tr align="center">';
for(var ywzm_i=0;ywzm_i<26;ywzm_i++){
	if(!ywzm[ywzm_i])break;
	tab+= '<td id=H_"'+ywzm[ywzm_i]+'"><label id="'+ywzm[ywzm_i]+'" style="color:#0000FF; cursor:hand" title="����鿴��������ĸ�� '+ywzm[ywzm_i]+' �ĳ���">'+ywzm[ywzm_i]+'</label></td>';
}
tab+= '        <td id="H_SH"><label id="SH" style="color:#FF0000; cursor:hand" title="����鿴���ó���">����</label></td>';
tab+= '      </tr></table></td></tr></table>';
tab+= '    </td>';
tab+= '  </tr>';
tab+= '  <tr align="center">';
tab+= '   <td id="Popup_Tab">';
tab+= '    <table width="100%" border="0" cellspacing="1" cellpadding="0" style="font-size: 9pt">';

for(popup_i=0;popup_i<36;popup_i++){
	if(popup_i==0 || popup_i % 6 ==0){
		tab+= '  <tr align="center" style="background-color:' +tr01_03+ ';">';
	}
	if(shcs[popup_i]){
	    //var strId='popup_NOBR_cszm_'+Split(shcs[popup_i],1,"|")+'_'+popup_int0;
	    //onclick="javascript:ClickCity(\'' + strId + '\');"
		tab+= '    <td  height="'+popup_gd+'" width="14.3%" ID="popup_td_cszm_'+popup_int0+'" title="'+Split(shcs[popup_i],0,"|")+'" style="font-size: 9pt"><NOBR '+style3+' ID="popup_NOBR_cszm_'+Split(shcs[popup_i],1,"|")+'_'+popup_int0+'">'+Split(shcs[popup_i],0,"|")+'</NOBR></td>';
		popup_int0++;
	}else{
		tab+= '    <td height="'+popup_gd+'" width="14.3%">&nbsp;</td>';
	}
	popup_int3 = popup_i+1;
	if(popup_int3 % 6 ==0){
		tab+= '  </tr>';
	}
}

tab+= '    </table>';
tab+= '   </td>';
tab+= '  </tr>';
tab+= '</table>';
tab+= '</td>';
tab+= '</tr>';
tab+= '</table>';

var newX = posLib.getClientLeft(kongj) + posLib.getCanvasElement(kongj).clientLeft;
var newY = posLib.getClientTop(kongj) + kongj.offsetHeight + posLib.getCanvasElement(kongj).clientTop;
oPopup.document.body.innerHTML = tab;
oPopup.document.body.onclick = Htc_OnClick;
oPopup.document.body.onmousemove = Htc_onmousemove;
oPopup.show(newX,newY,350,209,document.body);
}

function Htc_OnClick(){  //������¼�
var Htc_str;
var obj=this.document.parentWindow;
var e = obj.event.srcElement;
  
 if (e.id.toString().indexOf("popup_td")>=0)
 {
   return ;
 }
    
  if (e.tagName == "LABEL")  {
	  if(e.id!=""){
		  yc_dt(e.id);
	  }
  }
  if (e.tagName == "NOBR")  {
	  f_z(Split(e.id,3,"_"));
	  oPopup.hide(); 
  }
  
  if (e.tagName == "TD"){//H_
	  if(e.id!=""){
		  yc_dt(Split(e.id,1,"_").replace("\"","").replace("\"",""));
	  }
  }
}

var ll="popup_td_cszm_0";

function Htc_onmousemove(){   //����ƶ��¼�
var obj=this.document.parentWindow;
var e = obj.event.srcElement;
  if (e.tagName == "TD")  {
	  if(e.id!=""){turnrowcolor(e.id,ll);}
  }
  if (e.tagName == "NOBR")  {
	  if(e.id!=""){turnrowcolor("popup_td_cszm_"+Split(e.id,4,"_"),ll);}
  }
}

function turnrowcolor(ss,ls){   //����ƶ�TD�����ɫ
 var bc="#FFD373";
 if(oPopup.document.all(ls))oPopup.document.all(ls).style.backgroundColor="";
 if(oPopup.document.all(ss))oPopup.document.all(ss).style.backgroundColor=bc;
 if(oPopup.document.all(ss))oPopup.document.all(ss).style.cursor="hand";
 ll=ss;	
}

var yc_dt_cs="SH";
function yc_dt(sint){
	if(sint!=yc_dt_cs){
		oPopup.document.all(yc_dt_cs).style.color="#0000FF";
		oPopup.document.all(sint).style.color="#FF0000";
		yc_dt_cs=sint;
		if(sint!="SH"){
			Popup_tab(sint,0);
		}else{
			Popup_tab(sint,1);
		}
	}
}

function Popup_tab(str,lx){ //��������
	var Popup_dat_i=0;
	var Popup_dat_n;
	var Popup_dat_tab="";
	var Popup_dat =new Array()
	if(lx==0){
		for(Popup_dat_n=0;Popup_dat_n<qtcs.length;Popup_dat_n++){
			if(Split(qtcs[Popup_dat_n],2,"|")==str){
				Popup_dat[Popup_dat_i++]=qtcs[Popup_dat_n];
			}
		}
	}else{
		Popup_dat=shcs;
	}
	popup_int0=0;
	
	Popup_dat_tab+= '<table width="100%" border="0" cellspacing="1" cellpadding="0" style="font-size: 9pt">';
	for(Popup_dat_n=0;Popup_dat_n<36;Popup_dat_n++){
		if(Popup_dat_n==0 || Popup_dat_n % 6 ==0){
			Popup_dat_tab+= '  <tr align="center" style="background-color:' +tr01_03+ ';">';
		}
		if(Popup_dat[Popup_dat_n]){
			Popup_dat_tab+= '    <td height="'+popup_gd+'" width="14.3%" ID="popup_td_cszm_'+popup_int0+'" title="'+Split(Popup_dat[Popup_dat_n],0,"|")+'" style="font-size: 9pt"><NOBR '+style3+' ID="popup_NOBR_cszm_'+Split(Popup_dat[Popup_dat_n],1,"|")+'_'+popup_int0+'">'+Split(Popup_dat[Popup_dat_n],0,"|")+'</NOBR></td>';
			popup_int0++;
		}else{
			Popup_dat_tab+= '    <td height="'+popup_gd+'" width="14.3%">&nbsp;</td>';
		}
		popup_int3 = Popup_dat_n+1;
		if(popup_int3 % 6 ==0){
			Popup_dat_tab+= '  </tr>';
		}
	}
	Popup_dat_tab+= '    </table>';
	oPopup.document.all("Popup_Tab").innerHTML=Popup_dat_tab;
}

function f_z(temp){    //��ֵ���ؼ�
  kongj.value=temp;
}