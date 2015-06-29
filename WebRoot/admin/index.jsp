<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    <title>网站信息统计</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta http-equiv="keywords" content="easysoso,搜百度云,搜网盘,搜资料">
	<meta http-equiv="description" content="This is my page">
<script type="text/javascript">
/*
var passwd="<%=request.getParameter("passwd") %>"
if(passwd!="123"){
	var secret=prompt("请输入密码:");
	if(secret!="123"){
		window.location.href="<%=basePath%>";
	}
}
*/
</script>
  </head>
  <body>
  	<br/><br/><br/><br/>
  	<h3 align="center">
    	今日查询：${applicationScope.daysearch}<br/><br/>
    	今日访问：${applicationScope.dayvisit}<br/><br/>
    	<hr/><br/><br/><br/>
    	总查询数：${applicationScope.allsearch}<br/><br/>
    	总访问量：${applicationScope.allvisit}<br/>
    </h3>
  </body>
</html>
