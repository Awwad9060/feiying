self.onError=null;
currentX1 = currentY1 = 0;
whichIt1 = null; 
lastScrollX1 = 0; lastScrollY1 = 0;	

if(isFirefox=navigator.userAgent.indexOf("Firefox")<=0){
    document.all.duilian02.style.pixelTop=300+(screen.height-768)*100/132;
//    if((screen.width==1024)&&(screen.height==768)) 
//        document.all.duilian02.style.pixelTop=300;
//    else 
//        document.all.duilian02.style.pixelTop=400;
}
//	NS = (document.layers) ? 1 : 0;
//	IE = (document.all) ? 1: 0;

IE1 = (window.ActiveXObject)?1:0;
NS1 = (window.ActiveXObject)?0:1;
     
var tmp11= tmp21= tmp31 =0;
tmp11 = document.documentElement.clientHeight;

var isArrayRightBanner1 = false;
var has2ndScraper1 = false;

try{    
    if (typeof(duilian02.length) == "number") {isArrayRightBanner1 = true;}
    if (typeof(duilian01) == "object") {has2ndScraper1 = true;}
}
catch(e){
    isArrayRightBanner1 = false;
    has2ndScraper1 = false;
}
function makewing1()
{	
	tmp21 = document.documentElement.clientHeight;
	if(tmp11 != tmp21){
		tmp31 =  tmp21 - tmp11; 
		tmp11 = tmp21;
		if(tmp31<0){}
	}
	
	if(IE1)
	{
		diffY1 = document.documentElement.scrollTop; 
		diffX1 = 0;
	}
	else if(NS1)
	{
		diffY1 = self.pageYOffset;
		diffX1 = self.pageXOffset; 
	}
	
	if(diffY1 != lastScrollY1)
	{
		percent1 = .1 * (diffY1 - lastScrollY1);            
		if(percent1 > 0)
			percent1 = Math.ceil(percent1);
		else 
			percent1 = Math.floor(percent1);
							
		if(IE1) 
		{
			if (isArrayRightBanner1)
			{
				if (document.all.skyflash != null) {
					document.all.skyflash.style.pixelTop += percent1;						
				}
				document.all.duilian02[0].style.pixelTop += percent1;
				document.all.duilian02[1].style.pixelTop += percent1;
			}
			else
			{
				if (document.all.skyflash != null) {
					document.all.skyflash.style.pixelTop += percent1;
				}
				document.all.duilian02.style.pixelTop += percent1;    
			}				
			
			if (has2ndScraper1) document.all.duilian01.style.pixelTop += percent1;
		}
		else if(NS1)
		{
			if (isArrayRightBanner1)
			{
				document.skyflash.top += percent1;
				document.duilian02[0].top += percent1;
				document.duilian02[1].top += percent1;
			}
			else
            {
            	//document.skyflash.top += percent;					
				//document.duilian02.top += percent;	
				
				if(isFirefox=navigator.userAgent.indexOf("Firefox")>0){   
	                var top = document.documentElement.scrollTop;
	                var height = document.documentElement.clientHeight;
	                document.getElementById('duilian02').style.top = height + top-300 + "px";
                }
                else
                {
                    var top = parseInt(document.getElementById("duilian02").style.top.replace("px","")) +percent1;
                     document.getElementById("duilian02").style.top = (top +"px"); //GOOGLE
                }		    
			}				
			if (has2ndScraper1) document.duilian01.top += percent1;
		}
		
		lastScrollY1 = lastScrollY1 + percent1;
	}		
	
	if(diffX1 != lastScrollX1)
	{
		percent1 = .1 * (diffX1 - lastScrollX1);

		if(percent1 > 0) 
			percent1 = Math.ceil(percent1);
		else 
			percent1 = Math.floor(percent1);

		if(IE)
		{
			if (isArrayRightBanner1)
			{
				if (document.all.skyflash != null) {
					document.all.skyflash.style.pixelLeft += percent1;
				}
				document.all.duilian02[0].style.pixelLeft += percent1;
				document.all.duilian02[1].style.pixelLeft += percent1;
			}
			else
			{
				if (document.all.skyflash != null) {
					document.all.skyflash.style.pixelLeft += percent1;
				}
				document.all.duilian02.style.pixelLeft += percent1;
				
			}
			if (has2ndScraper1) document.all.duilian01.style.pixelLeft += percent1;
		}
		else if(NS1)
		{
			if (isArrayRightBanner1)
			{
				document.skyflasy.top += percent1;
				document.duilian02[0].top += percent1;
				document.duilian02[1].top += percent1;
			}
			else
			{
				document.skyflash.top += percent1;
				document.duilian02.top += percent1;
			}
			if (has2ndScraper1) document.duilian01.top += percent1;
		}
		lastScrollY1 = lastScrollY1 + percent1;
    }
    if (navigator.appName == "Microsoft Internet Explorer" && navigator.appVersion.split(";")[1].replace(/[ ]/g, "") == "MSIE6.0") {
        if (document.getElementById("fromcity")) {
            var topf = document.getElementById("fromcity").style.top;
            var topd = document.getElementById('duilian02').style.top;
            if (topd < topf)
                document.getElementById("fromcity").disabled = true;
            else
                document.getElementById("fromcity").disabled = false;
        } 
    }
} 
if(NS1 || IE1) action = window.setInterval("makewing1()",1);