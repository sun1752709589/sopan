<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>网盘搜索,easysoso</title>

		<meta name="keywords" content="搜网盘,网盘搜索,百度网盘搜索,网盘,云盘搜索,网盘下载,网盘资源" />
		<meta name="Description" content="easysoso-国内优秀网盘资源搜索引擎,支持百度网盘搜索,360云盘搜索,迅雷快传,城通网盘,华为DBank等网盘,提供快速搜索电影,视频,文档,游戏等资源网盘下载服务" />
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
	var url="<%=basePath%>so?engine=two&sotype=yun";
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
	var url="<%=basePath%>so?engine=google&sotype=yun";
	url=url+"&site="+site;
	var key2=$("input[name='keytext']").val();
	if(key2=="" || key2.length==0){
		return;
	}
	//url=url+"&key="+key;
	$.post(url,{key:key2},function(data){
		//parent.document.getElementById('baidu').src=url[0];
		parent.document.getElementById('google').src=data;
	});
	parent.document.getElementById('panel').cols="0%,100%";
}
function sobaidu(){
	enginer="baidu";
	var site=getVByName();
	var url="<%=basePath%>so?engine=baidu&sotype=yun";
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
		<input name="keytext" id="keyword" style="width:300px;height: 20px;" type="text" onkeydown="keydown(event)" value=""/>
		<%} %>
		<input type="button" value="双引擎搜索" style="height: 28px;cursor: pointer;" onclick="soall()"/>
		<input type="button" value="谷歌搜索" style="height: 28px;cursor: pointer;" onclick="sogoogle()"/>
		<input type="button" value="百度搜索" style="height: 28px;cursor: pointer;" onclick="sobaidu()"/>
		<input type="button" value="隐藏百度搜索" style="height: 28px;cursor: pointer;" onclick="hideleft()" id="hidebtn"/>
		<a href="javascript:void(0)" onclick="gohome()"><img alt="home" src="img/home.png" style="width:25px;height: 25px;vertical-align: middle;margin-bottom: 3px;"></a>
		<br/>
		<br/>
		<input type="radio" name="sun" value="baidu" checked="checked" onchange="onintchange(this.value)"/><img alt="百度云盘" title="搜百度云，搜你想搜，应有尽有" src="img/baiduyun.jpg"/>&nbsp;百度云盘
		<input type="radio" name="sun" value="csdnyun" onchange="onintchange(this.value)"/><img alt="CSDN百度云" title="CSDN的百度云专页" src="img/baiduyun.jpg"/>&nbsp;CSDN百度云
		<input type="radio" name="sun" value="huawei" onchange="onintchange(this.value)"/><img alt="华为网盘" title="你的贴身网络U盘" src="img/huaweiyun.jpg"/>&nbsp;华为网盘
		<input type="radio" name="sun" value="sina" onchange="onintchange(this.value)"/><img alt="新浪微盘" title="新浪微盘" src="img/sinayun.jpg"/>&nbsp;新浪微盘
		
		<input type="radio" name="sun" value="dajia" onchange="onintchange(this.value)"/><img alt="大家论坛" title="大家论坛" src="img/dajiayun.jpg"/>&nbsp;大家论坛
		<!--  <input type="radio" name="sun" value="jinshan" onchange="onintchange(this.value)"/><img alt="金山快盘" title="金山快盘" src="img/jinshanyun.jpg"/>&nbsp;金山快盘-->
		
		<input type="radio" name="sun" value="qiannao" onchange="onintchange(this.value)"/><img alt="千脑网盘" title="千脑网盘" src="img/qiannao.jpg"/>&nbsp;千脑网盘  
		<input type="radio" name="sun" value="360" onchange="onintchange(this.value)"/><img alt="360云盘" title="360云盘" src="img/360.jpg"/>&nbsp;360云盘  
		<input type="radio" name="sun" value="115" onchange="onintchange(this.value)"/><img alt="115网盘" title="115.com" src="img/115yun.jpg"/>&nbsp;115网盘
		<input type="radio" name="sun" value="xunlei" onchange="onintchange(this.value)"/><img alt="迅雷快传" title="迅雷快传" src="img/xunleiyun.jpg"/>&nbsp;迅雷快传
		<input type="radio" name="sun" value="7958" onchange="onintchange(this.value)"/><img alt="千军万马" title="7958，千军万马" src="img/7958yun.jpg"/>&nbsp;千军万马
		<input type="radio" name="sun" value="xuanfeng" onchange="onintchange(this.value)"/><img alt="旋风分享" title="旋风分享" src="img/xuanfengyun.jpg"/>&nbsp;旋风分享
		<!--<input type="radio" name="sun" value="chengtong" onchange="onintchange(this.value)"/><img alt="城通网盘" title="城通网盘" src="img/chengtongyun.jpg"/>&nbsp;城通网盘-->
		<!--<input type="radio" name="sun" value="box" onchange="onintchange(this.value)"/><img alt="box网盘" title="box网盘" src="img/box.jpg"/>&nbsp;box网盘-->
		<!--<input type="radio" name="sun" value="microsoft" onchange="onintchange(this.value)"/><img alt="微软网盘" title="微软网盘" src="img/microsoft.jpg"/>&nbsp;微软网盘-->
		<!--<input type="radio" name="sun" value="lenovo" onchange="onintchange(this.value)"/><img alt="联想网盘" title="联想网盘" src="img/lenovo.jpg"/>&nbsp;联想网盘
		<input type="radio" name="sun" value="163" onchange="onintchange(this.value)"/><img alt="网易网盘" title="网易网盘" src="img/163.jpg"/>&nbsp;网易网盘
		<input type="radio" name="sun" value="goukuai" onchange="onintchange(this.value)"/><img alt="够快网盘" title="够快网盘" src="img/goukuai.jpg"/>&nbsp;够快网盘
		<input type="radio" name="sun" value="xunleiyun" onchange="onintchange(this.value)"/><img alt="迅雷网盘" title="迅雷网盘" src="img/xunleiyun.jpg"/>&nbsp;迅雷网盘
		<input type="radio" name="sun" value="gugu" onchange="onintchange(this.value)"/><img alt="咕咕网盘" title="咕咕网盘" src="img/gugu.jpg"/>&nbsp;咕咕网盘
		<input type="radio" name="sun" value="qiming" onchange="onintchange(this.value)"/><img alt="启明网盘" title="启明网盘" src="img/qiming.jpg"/>&nbsp;启明网盘
		<input type="radio" name="sun" value="99" onchange="onintchange(this.value)"/><img alt="99网盘" title="99网盘" src="img/99.jpg"/>&nbsp;99网盘
		<br/>
		<input type="radio" name="sun" value="yipan" onchange="onintchange(this.value)"/><img alt="一盘" title="一盘" src="img/yipan.jpg"/>&nbsp;一盘
		<input type="radio" name="sun" value="liyu" onchange="onintchange(this.value)"/><img alt="鲤鱼资源" title="鲤鱼资源" src="img/liyuyun.jpg"/>&nbsp;鲤鱼资源
		<input type="radio" name="sun" value="muchong" onchange="onintchange(this.value)"/><img alt="木虫资源" title="木虫资源" src="img/muchongyun.jpg"/>&nbsp;木虫资源 -->
		<br/>
		Google引擎有点慢，但是资源多，请您稍等...
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
			url=url+"&sotype=yun&site=baidu";
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
