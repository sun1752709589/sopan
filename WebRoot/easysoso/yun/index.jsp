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
		<link rel="shortcut icon" type="image/ico" href="img/logo.png" />
		<meta name="keywords" content="搜网盘,网盘搜索,百度网盘搜索,网盘,云盘搜索,网盘下载,网盘资源" />
		<meta name="Description" content="easysoso-国内优秀网盘资源搜索引擎,支持百度网盘搜索,360云盘搜索,迅雷快传,城通网盘,华为DBank等网盘,提供快速搜索电影,视频,文档,游戏等资源网盘下载服务" />
		<meta http-equiv="content-type" content="text/html; charset=UTF-8">
	</head>

	<frameset rows="18%,82%" bordercolor="green">
		<frame src="easysoso/yun/top.jsp"/>
		
		<frameset cols="47%,53%" bordercolor="green" id="panel">
			<frame name="baidu" id="baidu" src="baidu.html"/>
			<frame name="google" id="google" src="google.html"/>
		</frameset>
	</frameset>
	
</html>
