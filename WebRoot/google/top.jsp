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
function sogoogle(){
	var url="<%=basePath%>google?pass=<%=session.getAttribute("pass")%>";
	var key2=$("input[name='keytext']").val();
	if(key2==null || key2.length==0){
		return;
	}
	$.post(url,{key:key2},function(data){
		alert(data);
		parent.document.getElementById('google').src=data;
	});
}

function keydown(event){
	var event = event || window.event;
	if(event.keyCode == 13){
		sogoogle();
	}
}
</script>
	</head>
	<body>
	
		<!--温馨提示:google有点延迟，请您稍等...  -->
	<center>
		<div id="top">
			<input name="keytext" id="keyword" style="width: 300px;height: 20px;" type="text" onkeydown="keydown(event)" value=""/>
			<input type="button" value="手气不错" style="height: 28px;cursor: pointer;" onclick="sogoogle()"/>
			<font style="font-family:Georgia;font-size: 14px; color: green;">&nbsp;通道<%=session.getAttribute("pass") %></font>
		</div>
		<img src="img/google.gif" alt="Google 首页" style="width: 148px;height: 63px;margin-left: -70px;"/>
		
	</center>
	</body>
</html>
