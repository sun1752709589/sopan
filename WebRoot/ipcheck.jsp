<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
  <head>
    <base href="<%=basePath%>">
    
    <title>网盘搜索,easysoso</title>
    
	<meta http-equiv="pragma" content="no-cache">
	<meta http-equiv="cache-control" content="no-cache">
	<meta http-equiv="expires" content="0">    
	<meta name="keywords" content="搜网盘,网盘搜索,百度网盘搜索,网盘,云盘搜索,网盘下载,网盘资源" />
	<meta name="Description" content="easysoso-国内优秀网盘资源搜索引擎,支持百度网盘搜索,360云盘搜索,迅雷快传,城通网盘,华为DBank等网盘,提供快速搜索电影,视频,文档,游戏等资源网盘下载服务" />
	<link rel="shortcut icon" type="image/ico" href="img/logo.png" />
	<script type="text/javascript" src="js/jquery.min.js"></script>
<style type="text/css">
#main{
font-family:  "Microsoft YaHei";
font-size: 16pt;
}

</style>
<script type="text/javascript">
function ipcheck(){
	var other=$("input[name='other']").val(); 
	if(f_check_IP(other)){
		var url="<%=basePath%>ipcheck?other="+other;
		window.location.href=url;
	}else{
		alert('请输入合法IP地址！');
	}
}
function f_check_IP(ip)      
{    
   var re=/^(\d+)\.(\d+)\.(\d+)\.(\d+)$/;//正则表达式     
   if(re.test(ip))     
   {     
       if( RegExp.$1<256 && RegExp.$2<256 && RegExp.$3<256 && RegExp.$4<256)   
       return true;     
   }         
   return false;      
}  
</script>
  </head>
  
  <body>
  		
  		<center><a href=""><img alt="easysoso" src="img/easysoso.jpg" style="margin-top: 120px;"></a></center>
  		<br/>
    	<div id="main" style="position:absolute;  top:50%;  height:400px;  margin:0 auto; margin-top:-90px; width:800px; left:50%; margin-left:-200px;">
    		<%if(request.getAttribute("self")!=null){ %>
    		本  机  I P：${requestScope.self }
    		<%} %>
    		<br/><br/>
    		请输入IP：
    		<%if(request.getAttribute("checkedip")!=null){ %>
    		<input type="text" id="other" name="other" style="width: 200px;height: 28px" value="${requestScope.checkedip }"/>
    		<%}else{ %>
    		<input type="text" id="other" name="other" style="width: 200px;height: 28px" value=""/>
    		<%} %>
    		<input type="button" value="查询" onclick="ipcheck()" style="height: 30px"/>
    		<br/>
    		<br/>
    		<%if(request.getAttribute("other")!=null && request.getAttribute("other").equals("error")){ %>
    		<div id="result">查询结果：请输入合法IP地址！</div>
    		<%}else if(request.getAttribute("other")!=null && request.getAttribute("other").equals("null")){ %>
    		<%}else if(request.getAttribute("other")!=null){ %>
    		<div id="result">查询结果：${requestScope.other }</div>
    		<%} %>
    	</div>
<!-- Baidu Button BEGIN -->
<script type="text/javascript" id="bdshare_js" data="type=slide&amp;img=0&amp;pos=right&amp;uid=446283" ></script>
<script type="text/javascript" id="bdshell_js"></script>
<script type="text/javascript">
document.getElementById("bdshell_js").src = "http://bdimg.share.baidu.com/static/js/shell_v2.js?cdnversion=" + Math.ceil(new Date()/3600000);
</script>
<!-- Baidu Button END -->
  </body>
</html>
