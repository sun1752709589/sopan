<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>easysoso</title>

		<meta http-equiv="keywords" content="easysoso|百度网盘搜索|网盘搜索|360网盘搜索|微盘网盘搜索">
		<meta http-equiv="description" content="网盘搜索引擎,是百度网盘论坛旗下的一个各大网盘搜索引擎,另外通过网盘搜索引擎可以搜索金山快盘,百度网盘,华为网盘,115网盘,360网盘,迅雷快传,旋风分享等一切网盘资源,主要包括热门软件,最新电影,电子书,精品软件,纪录片,高清图片,MP3&MP4,手机软件等一切所有网盘资源.">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
		<script type="text/javascript" src="js/gohome.js"></script>
		<script type="text/javascript" src="js/jquery.min.js"></script>
		
<style>
a{TEXT-DECORATION:none}
a:hover{TEXT-DECORATION:none}
#seltype {
border:2px solid green;

width:100px;
float:none;
margin: -2px;
padding: 0px;
}	
img{
width:15px;
height: 15px;
}	
		
</style>
<script type="text/javascript">
var enginer="all";
function soall(){
	enginer="all";
	var site=getVByName();
	var url="<%=basePath%>so?engine=two&sotype=weibo";
	url=url+"&site="+site;
	var key2=$("input[name='keytext']").val();
	if(key2=="" || key2.length==0){
		return;
	}
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
	var site=getVByName();
	var url="<%=basePath%>so?engine=google&sotype=weibo";
	url=url+"&site="+site;
	var key2=$("input[name='keytext']").val();
	if(key2=="" || key2.length==0){
		return;
	}
	//url=url+"&key="+key;
	$.post(url,{key:key2},function(data){
		//alert(data);
		//parent.document.getElementById('baidu').src=url[0];
		parent.document.getElementById('google').src=data;
	});
	parent.document.getElementById('panel').cols="0%,100%";
}
function sobaidu(){
	enginer="baidu";
	var site=getVByName();
	var url="<%=basePath%>so?engine=baidu&sotype=weibo";
	url=url+"&site="+site;
	var key2=$("input[name='keytext']").val();
	if(key2=="" || key2.length==0){
		return;
	}
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
	enginer="google";
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
		if(enginer=="all"){
			soall();
		}else if(enginer=="baidu"){
			sobaidu();
		}else{
			sogoogle();
		}
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

</script>
	</head>
	<body>
	
		<!--温馨提示:google有点延迟，请您稍等...  -->
	<center>
	
		<%
		String keyword=(String)session.getAttribute("key");
		if(keyword!=null){
		%>
		<input name="keytext" id="keyword" value="<%=keyword %>" style="width: 300px;height: 20px;" type="text" onkeydown="keydown(event)"/>
		<% }else{%>
		<input name="keytext" id="keyword" style="width: 300px;height: 20px;" type="text" onkeydown="keydown(event)" value=""/>
		<%} %>
		<input type="button" value="双引擎搜索" style="height: 28px;cursor: pointer;" onclick="soall()"/>
		<input type="button" value="谷歌搜索" style="height: 28px;cursor: pointer;" onclick="sogoogle()"/>
		<input type="button" value="百度搜索" style="height: 28px;cursor: pointer;" onclick="sobaidu()"/>
		<input type="button" value="隐藏百度搜索" style="height: 28px;cursor: pointer;" onclick="hideleft()" id="hidebtn"/>
		<a href="javascript:void(0)" onclick="gohome()"><img alt="home" src="img/home.png" style="width:25px;height: 25px;vertical-align: middle;margin-bottom: 3px;"></a>
		<br/>
		<br/>
		<input type="radio" name="sun" value="sina" checked="checked" onchange="onintchange(this.value)"/><img alt="新浪微博" title="新浪微博" src="img/weibo/sina.jpg"/>&nbsp;新浪微博
		<input type="radio" name="sun" value="tengxun" onchange="onintchange(this.value)"/><img alt="腾讯微博" title="腾讯微博" src="img/weibo/tengxun.jpg"/>&nbsp;腾讯微博
		<input type="radio" name="sun" value="sohu" onchange="onintchange(this.value)"/><img alt="搜狐微博" title="搜狐微博" src="img/weibo/sohu.jpg"/>&nbsp;搜狐微博
		<input type="radio" name="sun" value="163" onchange="onintchange(this.value)"/><img alt="网易微博" title="网易微博" src="img/weibo/163.jpg"/>&nbsp;网易微博
		<input type="radio" name="sun" value="renren" onchange="onintchange(this.value)"/><img alt="人人网" title="人人网" src="img/weibo/renren.jpg"/>&nbsp;人人网
		<input type="radio" name="sun" value="pengyou" onchange="onintchange(this.value)"/><img alt="朋友网" title="朋友网" src="img/weibo/pengyou.jpg"/>&nbsp;朋友网
		
		
		
		
		
		
		
		
	</center>
		
		
	</body>
	
	<script type="text/javascript">
	var first="<%=session.getAttribute("first")%>";
	if(first=="true"){
		
		<% session.setAttribute("first", "false"); 
		%>
		var key2="<%=session.getAttribute("key")%>";
		if(key2.length>0){
			
			var url="<%=basePath%>so?engine=two";
			url=url+"&sotype=weibo&site=baidu";
			$.post(url,{key:key2},function(data){
		    	//alert(data);
				var url =data.split("~");
				//alert(url[0]);
				//alert(url[1]);
				parent.document.getElementById('baidu').src=url[0];
				parent.document.getElementById('google').src=url[1];
				<%session.removeAttribute("key"); %>
				//$("#baidu", window.parent.document).attr("src",url[0]);
				//$("#panel", window.parent.document).attr("src",url[1]);
			});
		}
		
	}
	</script>
	
</html>
