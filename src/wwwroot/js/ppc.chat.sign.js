$(document).ready(function() {
    var hmsr = getRequest("hmsr");
	if(hmsr==null || hmsr==""){  
		$("#Tel").attr("href",function(i,origValue){ return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=BaiduBridge&utm_content=Tel"; });
		$("#Safe").attr("href",function(i,origValue){ return origValue + "?utm_source=PageLink&utm_medium=Organic&utm_campaign=BaiduBridge&utm_content=Safe"; }); 		
	} else {  
		$("#Tel").attr("href",function(i,origValue){ return origValue + "?utm_source=Baidu&utm_medium=PPC&utm_campaign=BaiduFeed&utm_content=Tel"; });
		$("#Safe").attr("href",function(i,origValue){ return origValue + "?utm_source=Baidu&utm_medium=PPC&utm_campaign=BaiduFeed&utm_content=Safe"; }); 
		$("#Homepage").attr("href",function(i,origValue){ return origValue + "?utm_source=Baidu&utm_medium=PPC&utm_campaign=BaiduFeed&utm_content=Homepage"; }); 
	}
});