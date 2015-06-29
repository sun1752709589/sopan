	var enginer="all";
	function soall(){
		enginer="all";
		var sotype=getVByName();
		var url="<%=basePath%>so?engine=two";
		url=url+"&site="+sotype;
		if(sotype.charAt(sotype.length-2)=="i" || sotype.charAt(sotype.length-1)=="t"){
			url=url+"&sotype=it";
			var seltype=document.getElementById("seltype").options[document.getElementById("seltype").selectedIndex].value;
			url=url+"&seltype="+seltype;
		}else{
			url=url+"&sotype=yun";
		}
		var key2=$("input[name='keytext']").val();
		//alert(key2);
		//url=url+"&key="+key;
    	$.post(url,{key:key2},function(data){
        	//alert(data);
    		var url =data.split("~");
    		//alert(url[0]);
    		//alert(url[1]);
    		parent.document.getElementById('baidu').src=url[0];
    		parent.document.getElementById('google').src=url[1];
    		//$("#baidu", window.parent.document).attr("src",url[0]);
    		//$("#panel", window.parent.document).attr("src",url[1]);
    	});
    	parent.document.getElementById('panel').cols="47%,53%";
    	//$("#panel", window.parent.document).attr("cols","47%,53%");
	}
	function sogoogle(){
		enginer="google";
		var sotype=getVByName();
		var url="<%=basePath%>so?engine=google";
		url=url+"&site="+sotype;
		if(sotype.charAt(sotype.length-2)=="i" || sotype.charAt(sotype.length-1)=="t"){
			url=url+"&sotype=it";
			var seltype=document.getElementById("seltype").options[document.getElementById("seltype").selectedIndex].value;
			url=url+"&seltype="+seltype;
		}else{
			url=url+"&sotype=yun";
		}
		var key2=$("input[name='keytext']").val();
		//url=url+"&key="+key;
    	$.post(url,{key:key2},function(data){
    		//parent.document.getElementById('baidu').src=url[0];
    		parent.document.getElementById('google').src=data;
    	});
    	parent.document.getElementById('panel').cols="0%,100%";
	}
	function sobaidu(){
		enginer="baidu";
		var sotype=getVByName();
		var url="<%=basePath%>so?engine=baidu";
		url=url+"&site="+sotype;
		if(sotype.charAt(sotype.length-2)=="i" || sotype.charAt(sotype.length-1)=="t"){
			url=url+"&sotype=it";
			var seltype=document.getElementById("seltype").options[document.getElementById("seltype").selectedIndex].value;
			url=url+"&seltype="+seltype;
		}else{
			url=url+"&sotype=yun";
		}
		var key=$("input[name='keytext']").val();
		//url=url+"&key="+key;
    	$.post(url,{key:key2},function(data){
    		//var url =data.split("~");
    		parent.document.getElementById('baidu').src=data;
    		//parent.document.getElementById('google').src=url[1];
    	});
    	parent.document.getElementById('panel').cols="100%,0%";
	}

	function getVByName(){
        var tt = document.getElementsByName('sun');
        for (var iIndex = 0; iIndex < tt.length ; iIndex++ )
        {
            if(tt[iIndex].checked)
            {
                return tt[iIndex].value;
            }
        }
    };
    var left=true;
    function hideleft(){
    	if(left){
    		parent.document.getElementById('panel').cols="0%,100%";
        	document.getElementById('hidebtn').value="打开百度搜索";
        	left=false;
    	}else{
    		parent.document.getElementById('panel').cols="47%,53%";
        	document.getElementById('hidebtn').value="隐藏百度搜索";
        	left=true;
    	}
    }
    function keydown(event){
    	var event = event || window.event;
    	if(event.keyCode == 13){
    		soall();
    	}
    }
    function onintchange(value){
    	var sotype=value;
    	if(enginer=="all"){
			soall();
		}else if(enginer=="baidu"){
			sobaidu();
		}else{
			sogoogle();
		}
    }
    function onselchange(value){
    	var sotype=getVByName();
    	if(sotype.charAt(sotype.length-2)=="i" || sotype.charAt(sotype.length-1)=="t"){
    		if(enginer=="all"){
    			soall();
    		}else if(enginer=="baidu"){
    			sobaidu();
    		}else{
    			sogoogle();
    		}
		}
    }
