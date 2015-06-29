<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<%
int dayvisit=(Integer)application.getAttribute("dayvisit");
//int allvisit=(Integer)application.getAttribute("allvisit");
dayvisit++;
//allvisit++;
application.setAttribute("dayvisit",dayvisit);
//application.setAttribute("allvisit",allvisit);
%>
<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<base href="<%=basePath%>">
		<meta name="keywords" content="搜网盘,网盘搜索,百度网盘搜索,网盘,云盘搜索,网盘下载,网盘资源" />
		<meta name="Description" content="easysoso-国内优秀网盘资源搜索引擎,支持百度网盘搜索,360云盘搜索,迅雷快传,城通网盘,华为DBank等网盘,提供快速搜索电影,视频,文档,游戏等资源网盘下载服务" />
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
		<title>网盘搜索,easysoso</title>
		<link rel="shortcut icon" type="image/ico" href="img/logo.png" />
		<script type="text/javascript" src="js/jquery.min.js"></script>
		<style type="text/css">

body,div,form,input {
	font-size: 14px;
	margin: 0;
	padding: 0
}


a {
	color: #0000cc;
	text-decoration:none;
}

a:active {
	color: #f90
}


#top_right {
	color: red;
	font-size: 12px;
	padding: 6px 10px;
	position: absolute;
	right: 0;
	top: 0
}

#top_right a {
	font-size: 12px;
	color: green;
}

/*头部结束*/
#main {
	margin: 0px auto 100px auto;
	padding: 0 35px;
	width: 530px
}

#main h1 {
	margin-bottom: 4px;
	text-align: center
}

#main h1 a img {
	border: none
}

#main ul {
	list-style-type: none;
	padding: 0 0 0 45px;
	width: 410px
}

#main ul li {
	float: left;
	margin-right: 18px
}
#main ul li a{
	text-decoration:none;
}
.nav{
margin-left:-20px;
}
.mr {
	color: #000;
	font-weight: bold;
	font-size: 18px;
}
#search_form {
	clear: both;
	margin-left: 15px;
	padding-top: 4px
}

#keyword { 
	background: url(img/repeat.png) no-repeat
		-304px 0px;
	border-color: #999 #ccc #ccc #999;
	border-style: solid;
	border-width: 1px;
	float: left;
	font-size: 18px;
	height: 30px;
	line-height: 30px;
	text-indent: 10px;
	width: 408px;
}

/* 上面这四个border属性，这样写感觉不是很好，不易阅读 */
#main .search_btn {
	cursor: pointer;
	float: left;
	font-size: 14px;
	height: 32px;
	margin-left: 6px;
	width: 95px;
}

#main .down_btn {
	
}

#main p {
	float: left;
	margin-top: 5px;
	margin-left:-40px;
	text-align: center;
	width: 520px;
}

#cl {
	clear: both
}

/*内容结束*/
#footer {
	margin: 95px auto;
	width: 600px
}

#footer p {
	font-size: 12px;
	margin-bottom: 15px;
	text-align: center;
	
}

#footer p.jr {
	margin-bottom: 5px
}

#footer p a {
	font-size: 12px
}

#footer p.bq {
	color: #77c
}

#footer p.bq a {
	color: #77c
}

</style>
<script type="text/javascript">
var sotype="yun";
$("input[name='sotype']").val(sotype);
function selectType(data,o){
	sotype=data;
	$("input[name='sotype']").val(data);
	removeAllClass();
	$(o).addClass("mr");
	return;
}
function removeAllClass(){
	for(i=0;i<$("a").length;i++){
		$("a:eq("+i+")").removeClass("mr");
	 }
	
}
function soso(){
	$("input[name='sotype']").val(sotype);
	$("#search_form").submit();
	
}
//收藏本站
function AddFavorite(title, url) {
    try {
        window.external.addFavorite(url, title);
    }
    catch (e) {
        try {
            window.sidebar.addPanel(title, url, "");
        }
        catch (e) {
            alert("抱歉，您所使用的浏览器无法完成此操作。\n\n加入收藏失败，请使用Ctrl+D进行添加");
        }
    }
}

</script>


	</head>
	<body>
		<div id="top_right">
			<!--翻墙上Google: 
			<a href="javascript:void(0)">通道一</a> |
			<a href="javascript:void(0)">通道二</a> -->
			<a href="<%=basePath%>ipcheck" target="_blank">IP查询</a> |
			<a href="doc/about.jsp" target="_blank">温馨提示</a>
		</div>
		<div id="main">
			<h1 title="easysoso">
				<a href="" class="logo"><img
						src="img/easysoso.jpg">
				</a>
			</h1>
			<ul class="nav">
				<li>
					<a href="javascript:void(0);" onclick="selectType('yun',this)" class="mr">云盘</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="selectType('it',this)">IT</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="selectType('blog',this)">博客</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="selectType('baike',this)">百科</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="selectType('video',this)">视频</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="selectType('article',this)">小说</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="selectType('software',this)">软件</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="selectType('music',this)">音乐</a>
				</li>
				<li>
					<a href="javascript:void(0);" onclick="selectType('game',this)">游戏</a>
				</li>
			</ul>
			<form action="<%=basePath%>first" method="post" id="search_form">
				<input type="hidden" value="true" name="first"/>
				<input type="hidden" value="yun" name="sotype" id="sotype"/>
				<input name="key" type="text" id="keyword">
				<input name="sosobtn" type="button" value="手气不错" class="search_btn" onclick="soso()"/>

			</form>
			<p>
				<a href="javascript:void(0);" onclick="selectType('news',this)">新闻</a> |
				<a href="javascript:void(0);" onclick="selectType('weibo',this)">微博</a> |
				<a href="javascript:void(0);" onclick="selectType('tieba',this)">贴吧</a> |
				<a href="javascript:void(0);" onclick="selectType('bbs',this)">论坛</a> |
				<a href="javascript:void(0);" onclick="selectType('download',this)">资料</a> |
				<a href="javascript:void(0);" onclick="selectType('wenxian',this)">文献</a> |
				<%--<a href="javascript:void(0);" onclick="selectType('image',this)">美图</a>|
				<a href="javascript:void(0);" onclick="selectType('military',this)">军事</a>
				--%>
				<a href="javascript:void(0);" onclick="selectType('apk',this)">APK</a> |
				<a href="javascript:void(0);" onclick="selectType('history',this)">历史</a>
				
			</p>
			<div id="cl"></div>
		</div>
		<br/>
		<br/>
		<br/>
		<div style="text-align: center;font-family:'Microsoft YaHei'; font-size: 14px;">
			亲，由于我们处于发展初期，知道我们的人还很少，如果您用过之后感觉不错，就把我们的网站分享给别人，让我们服务更多的人。<br/>
			您的支持是我们对网站持续改进的最大动力，真心感谢！^_^
		</div>
		<br/>
		<br/>
		<br/>
		<div id="footer">
			<p>
				<a href="javascript:void(0)" onclick="AddFavorite('easysoso',location.href)">把EasySOSO加入书签</a> |
				<a href="http://www.baidu.com/cache/sethelp/index.html" target="_blank">把EasySOSO设为主页</a>
			</p>
			<p class="jr">
				<a href="javascript:void(0)">加入EasySOSO</a> |
				<a href="javascript:void(0)">搜索风云榜</a> |
				<a href="doc/about.jsp">关于EasySOSO</a> |
				<a href="doc/about.jsp">About EasySOSO</a>
			</p>
			<p class="bq">
				2014 EasySOSO
				<a href="doc/about.jsp">使用前必读</a>
				<a href="javascript:void(0)">京ICP证030173号</a>&nbsp;&nbsp;
				<img src="img/gs.gif">
			</p>
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