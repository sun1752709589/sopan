<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>网站信息统计ip</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="easysoso,搜百度云,搜网盘,搜资料">
	<meta http-equiv="description" content="This is my page">

  </head>
  <body>
  	<br/><br/><br/><br/>
  	<h3 align="center">
    	今日新访客数：${requestScope.newipcount}<br/><br/>
    	今日旧访客数：${requestScope.oldipcount}<br/><br/>
    	<hr/><br/><br/><br/>
    	今日新访客：${requestScope.newaddip}<br/><br/>
    	今日旧访客：${requestScope.oldvisitip}<br/>
    </h3>
  </body>
</html>
