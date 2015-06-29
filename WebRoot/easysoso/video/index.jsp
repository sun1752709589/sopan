<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE html>
<html>
	<head>
		<base href="<%=basePath%>">
		<title>asysoso 让搜索更简单</title>
		<link rel="shortcut icon" type="image/ico" href="img/logo.png" />
		<meta http-equiv="keywords" content="easysoso|百度网盘搜索|网盘搜索|360网盘搜索|微盘网盘搜索">
		<meta http-equiv="description" content="网盘搜索引擎,是百度网盘论坛旗下的一个各大网盘搜索引擎,另外通过网盘搜索引擎可以搜索金山快盘,百度网盘,华为网盘,115网盘,360网盘,迅雷快传,旋风分享等一切网盘资源,主要包括热门软件,最新电影,电子书,精品软件,纪录片,高清图片,MP3&MP4,手机软件等一切所有网盘资源.">
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	</head>

	<frameset rows="18%,82%" bordercolor="green">
		<frame src="easysoso/video/top.jsp"/>
		
		<frameset cols="47%,53%" bordercolor="green" id="panel">
			<frame name="baidu" id="baidu" src="baidu.html"/>
			<frame name="google" id="google" src="google.html"/>
		</frameset>
	</frameset>
	
</html>
