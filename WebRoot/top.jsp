<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
%>
<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">
		<title>导航</title>

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
var enginer="all";
function soall(){
	enginer="all";
	var sotype=getVByName();
	var url="<%=basePath%>so?engine=two";
	url=url+"&site="+sotype;
	if(sotype.charAt(sotype.length-2)=="i" || sotype.charAt(sotype.length-1)=="t"){
		url=url+"&sotype=it";
		var seltype=document.getElementById("seltype").options[document.getElementById("seltype").selectedIndex].value;
		url=url+"&seltype="+seltype;
	}else{
		url=url+"&sotype=yun";
	}
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
	var sotype=getVByName();
	var url="<%=basePath%>so?engine=google";
	url=url+"&site="+sotype;
	if(sotype.charAt(sotype.length-2)=="i" || sotype.charAt(sotype.length-1)=="t"){
		url=url+"&sotype=it";
		var seltype=document.getElementById("seltype").options[document.getElementById("seltype").selectedIndex].value;
		url=url+"&seltype="+seltype;
	}else{
		url=url+"&sotype=yun";
	}
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
	var sotype=getVByName();
	var url="<%=basePath%>so?engine=baidu";
	url=url+"&site="+sotype;
	if(sotype.charAt(sotype.length-2)=="i" || sotype.charAt(sotype.length-1)=="t"){
		url=url+"&sotype=it";
		var seltype=document.getElementById("seltype").options[document.getElementById("seltype").selectedIndex].value;
		url=url+"&seltype="+seltype;
	}else{
		url=url+"&sotype=yun";
	}
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
		soall();
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
		
		<input name="keytext" id="keyword" style="width: 300px;height: 28px" type="text" onkeydown="keydown(event)" baiduSug="2"/>
		<input type="button" value="双引擎搜索" style="height: 28px;" onclick="soall()"/>
		<input type="button" value="谷歌搜索" style="height: 28px;" onclick="sogoogle()"/>
		<input type="button" value="百度搜索" style="height: 28px;" onclick="sobaidu()"/>
		<input type="button" value="隐藏百度搜索" style="height: 28px;" onclick="hideleft()" id="hidebtn"/>
		<br/>
		
		<input type="radio" name="sun" value="baiduyun" checked="checked" onchange="onintchange(this.value)"/><img alt="百度云盘" title="搜百度云，搜你想搜，应有尽有" src="img/baiduyun.jpg"/>&nbsp;百度云盘
		<input type="radio" name="sun" value="csdnyunyun" onchange="onintchange(this.value)"/><img alt="CSDN百度云" title="CSDN的百度云专页" src="img/baiduyun.jpg"/>&nbsp;CSDN百度云
		<input type="radio" name="sun" value="huaweiyun" onchange="onintchange(this.value)"/><img alt="华为网盘" title="你的贴身网络U盘" src="img/huaweiyun.jpg"/>&nbsp;华为网盘
		<input type="radio" name="sun" value="xuanfengyun" onchange="onintchange(this.value)"/><img alt="旋风分享" title="旋风分享" src="img/xuanfengyun.jpg"/>&nbsp;旋风分享
		<!--<input type="radio" name="sun" value="weiyunyun" />腾讯微云  -->
		<input type="radio" name="sun" value="jinshanyun" onchange="onintchange(this.value)"/><img alt="金山快盘" title="金山快盘" src="img/jinshanyun.jpg"/>&nbsp;金山快盘
		<input type="radio" name="sun" value="sinayun" onchange="onintchange(this.value)"/><img alt="新浪微盘" title="新浪微盘" src="img/sinayun.jpg"/>&nbsp;新浪微盘
		<!--<input type="radio" name="sun" value="360yun"/>360云盘  -->
		<input type="radio" name="sun" value="115yun" onchange="onintchange(this.value)"/><img alt="115网盘" title="115.com" src="img/115yun.jpg"/>&nbsp;115网盘
		<input type="radio" name="sun" value="xunleiyun" onchange="onintchange(this.value)"/><img alt="迅雷快传" title="迅雷快传" src="img/xunleiyun.jpg"/>&nbsp;迅雷快传
		<input type="radio" name="sun" value="7958yun" onchange="onintchange(this.value)"/><img alt="千军万马" title="7958，千军万马" src="img/7958yun.jpg"/>&nbsp;千军万马
		<input type="radio" name="sun" value="chengtongyun" onchange="onintchange(this.value)"/><img alt="城通网盘" title="城通网盘" src="img/chengtongyun.jpg"/>&nbsp;城通网盘
	<!--	<input type="radio" name="sun" value="liyuyun" onchange="onintchange(this.value)"/><img alt="鲤鱼资源" title="鲤鱼资源" src="img/liyuyun.jpg"/>&nbsp;鲤鱼资源
		<input type="radio" name="sun" value="muchongyun" onchange="onintchange(this.value)"/><img alt="木虫资源" title="木虫资源" src="img/muchongyun.jpg"/>&nbsp;木虫资源  -->
		<br/>
		<input type="radio" name="sun" value="dajiayun" onchange="onintchange(this.value)"/><img alt="大家论坛" title="大家论坛，共同讨论，一起嗨" src="img/dajiayun.jpg"/>&nbsp;大家论坛
		<input type="radio" name="sun" value="linuxpkyun" onchange="onintchange(this.value)"/><img alt="全球最大中文开源门户" title="全球最大中文开源门户" src="img/linuxpk.jpg"/>&nbsp;Linux宝库
		<input type="radio" name="sun" value="javachinayun" onchange="onintchange(this.value)"/><img alt="java中国站" title="java中国站" src="img/javachina.jpg"/>&nbsp;java中国站
		<input type="radio" name="sun" value="it168yun" onchange="onintchange(this.value)"/><img alt="IT168" title="IT168" src="img/it168.jpg"/>&nbsp;IT168
		<input type="radio" name="sun" value="cnblogsyun" onchange="onintchange(this.value)"/><img alt="博客园" title="博客园" src="img/cnblogs.jpg"/>&nbsp;博客园
		<input type="radio" name="sun" value="tianjiyun" onchange="onintchange(this.value)"/><img alt="天极网" title="天极网" src="img/tianji.jpg"/>&nbsp;天极网
		<input type="radio" name="sun" value="gameresyun" onchange="onintchange(this.value)"/><img alt="游资网" title="游资网" src="img/gameres.jpg"/>&nbsp;游资网
		<input type="radio" name="sun" value="xiaoshuoyun" onchange="onintchange(this.value)"/><img alt="小说资源" title="起点小说，应有尽有" src="img/xiaoshuoyun.jpg"/>&nbsp;小说资源
		<input type="radio" name="sun" value="yingshiyun" onchange="onintchange(this.value)"/><img alt="影视搜索" title="影视搜索" src="img/youkuyun.jpg"/>&nbsp;影视搜索
		<input type="radio" name="sun" value="wenxianyun" onchange="onintchange(this.value)"/><img alt="文献搜索" title="文献搜索" src="img/wenxianyun.jpg"/>&nbsp;文献搜索
		<br/>
		
		搜名站:
		<input type="radio" name="sun" value="csdnit" onchange="onintchange(this.value)"/><img alt="CSDN" title="中国最大的IT技术社区，为IT专业技术人员提供最全面的信息传播和服务平台" src="img/csdn.jpg"/>&nbsp;CSDN
		<input type="radio" name="sun" value="51ctoit" onchange="onintchange(this.value)"/><img alt="51CTO" title="技术成就梦想" src="img/51cto.jpg"/>&nbsp;51CTO
		<input type="radio" name="sun" value="itpubit" onchange="onintchange(this.value)"/><img alt="ITPUB" title="专业的数据库技术分享网站" src="img/itpub.jpg"/>&nbsp;ITPUB
		<input type="radio" name="sun" value="chinaunixit" onchange="onintchange(this.value)"/><img alt="ChinaUnix" title="unix系统技术分享" src="img/chinaunix.jpg"/>&nbsp;ChinaUnix
		<input type="radio" name="sun" value="iteyeit" onchange="onintchange(this.value)"/><img alt="ITEYE" title="IT界之窗" src="img/iteye.jpg"/>&nbsp;ITEYE
		
		&nbsp;&nbsp;&nbsp;站内分类:
		<select name="seltype" id="seltype" onchange="onselchange(this.value)">
			<option value="all">所有</option>	
			<option value="blog">博客</option>	
			<option value="bbs">论坛</option>	
			<option value="download">资料</option>	
			<option value="news">资讯</option>	
			<option value="ask">问答</option>	
		</select>
		
	</center>
		
		
	</body>
	<script charset="gbk" src="http://www.baidu.com/js/opensug.js"></script>
</html>
