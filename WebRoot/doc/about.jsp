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
    <meta name="content-type" content="text/html; charset=UTF-8">
    <link rel="shortcut icon" type="image/ico" href="img/logo.png" />
<style type="text/css">
#about{
font-family:  "Microsoft YaHei";
font-size: 16pt;
}

</style>
  </head>
  
  <body>
  	<center><a href=""><img alt="easysoso" src="img/easysoso.jpg" style="margin-top: 150px;"></a></center>
  	<br/>
  	
    <div id="about" style="position:absolute;  top:50%;  height:250px;  margin:0 auto; margin-top:-40px; width:800px; left:50%; margin-left:-350px;">
    	温馨提示：
    	<ul>
    		<li>EasySOSO,让网盘搜索更简单！</li>
    		<li>EasySOSO,最全网盘搜索引擎！</li>
    		<li>由于百度屏蔽网盘搜索，请您在<strong>搜网盘时优先使用Google搜网盘</strong>。</li>
    		<li>由于<strong>Google服务器位于美国，搜索稍微有些延迟</strong>，请您耐心等待。</li>
    		<li>EasySOSO包含网盘、IT、博客、小说、影视、游戏等搜索内容，祝您搜索愉快。</li>
    		<li><strong>亲，由于我们处于发展初期，知道我们的人还很少，如果您用过之后感觉不错，就把我们的网站分享给别人，让我们服务更多的人。
			您的支持是我们对网站持续改进的最大动力，真心感谢！^_^</strong></li>
    	</ul>
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
