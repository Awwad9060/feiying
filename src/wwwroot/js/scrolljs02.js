	self.onError=null;
	currentX = currentY = 0;
	whichIt = null; 
	lastScrollX = 0; lastScrollY = 0;	
		
//	NS = (document.layers) ? 1 : 0;
//	IE = (document.all) ? 1: 0;

    IE = (window.ActiveXObject)?1:0;
    NS = (window.ActiveXObject)?0:1;
         
	var tmp1= tmp2= tmp3 =0;
	tmp1 = document.documentElement.clientHeight;

	var isArrayRightBanner = false;
	var has2ndScraper = false;
	
    try{    
	    if (typeof(duilianb02.length) == "number") isArrayRightBanner = true;
	    if (typeof(duilianb01) == "object") has2ndScraper = true;
    }
    catch(e){
        isArrayRightBanner = false;
        has2ndScraper = false;
    }
	function makewing()
	{	
		tmp2 = document.documentElement.clientHeight;
		if(tmp1 != tmp2){
			tmp3 =  tmp2 - tmp1; 
			tmp1 = tmp2;
			if(tmp3<0){}
		}
		
		if(IE)
		{
			diffY = document.documentElement.scrollTop; 
			diffX = 0;
		}
		else if(NS)
		{
			diffY = self.pageYOffset;
			diffX = self.pageXOffset; 
		}
		
		if(diffY != lastScrollY)
		{
			percent = .1 * (diffY - lastScrollY);            
			if(percent > 0)
				percent = Math.ceil(percent);
			else 
				percent = Math.floor(percent);
								
			if(IE) 
			{
				if (isArrayRightBanner)
				{
					if (document.all.skyflash != null) {
						document.all.skyflash.style.pixelTop += percent;						
					}
					document.all.duilianb02[0].style.pixelTop += percent;
					document.all.duilianb02[1].style.pixelTop += percent;
				}
				else
				{
					if (document.all.skyflash != null) {
						document.all.skyflash.style.pixelTop += percent;
					}
					document.all.duilianb02.style.pixelTop += percent;    
				}				
				
				if (has2ndScraper) document.all.duilianb01.style.pixelTop += percent;
			}
			else if(NS)
			{
				if (isArrayRightBanner)
				{
					document.skyflash.top += percent;
					document.duilianb02[0].top += percent;
					document.duilianb02[1].top += percent;
				}
				else
	            {
	            	//document.skyflash.top += percent;					
					//document.duilian02.top += percent;										
					try{		
					    document.getElementById("duilianb02").style.top = (self.pageYOffset + percent) + "px";	//firefox					    		
					}
				    catch(e){
				        document.getElementById("duilianb02").style.pixelTop += percent; //GOOGLE		
				    }				    
				}				
				if (has2ndScraper) document.duilianb01.top += percent;
			}
			
			lastScrollY = lastScrollY + percent;
		}		
		
		if(diffX != lastScrollX)
		{
			percent = .1 * (diffX - lastScrollX);

			if(percent > 0) 
				percent = Math.ceil(percent);
			else 
				percent = Math.floor(percent);

			if(IE)
			{
				if (isArrayRightBanner)
				{
					if (document.all.skyflash != null) {
						document.all.skyflash.style.pixelLeft += percent;
					}
					document.all.duilianb02[0].style.pixelLeft += percent;
					document.all.duilianb02[1].style.pixelLeft += percent;
				}
				else
				{
					if (document.all.skyflash != null) {
						document.all.skyflash.style.pixelLeft += percent;
					}
					document.all.duilianb02.style.pixelLeft += percent;
					
				}
				if (has2ndScraper) document.all.duilianb01.style.pixelLeft += percent;
			}
			else if(NS)
			{
				if (isArrayRightBanner)
				{
					document.skyflasy.top += percent;
					document.duilianb02[0].top += percent;
					document.duilianb02[1].top += percent;
				}
				else
				{
					document.skyflash.top += percent;
					document.duilianb02.top += percent;
				}
				if (has2ndScraper) document.duilianb01.top += percent;
			}
			lastScrollY = lastScrollY + percent;
		} 
		
		
	} 
	if(NS || IE) action = window.setInterval("makewing()",1);