<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<script src="js/jquery.js" type="text/javascript"></script>
<!-- <link href="css/main/style.css" rel="stylesheet" type="text/css" /> -->
<link href="css/main/style.css" rel="stylesheet" type="text/css"/>
<title>欢迎使用COQS质量成本控制系统</title>
<script type="text/javascript">
$(function(){	
	//顶部导航切换
	$(".nav li a").click(function(){
		$(".nav li a.selected").removeClass("selected");
		$(this).addClass("selected");
	});	
		 var models = '${models}';
		var DomModels = $(".nav");
		var evalModels = eval('('+models+')');
		for(var m in evalModels){
			var topModel = "<li><a href=javascript:void(0) mid="+evalModels[m].id+" onclick=changeMenu(this) ><img src="+evalModels[m].furl+" title="+evalModels[m].fname+" /><h2>"+evalModels[m].fname+"</h2></a></li>";
			DomModels.append($(topModel));
		}
		
});	


	function changeMenu(obj){
		var mid = $(obj).attr("mid");
		var leftFrame = window.parent.frames["leftFrame"];
		leftFrame.location.href = "<%=basePath%>home/preloadLeft.shtm?modelId="
			+ mid;
	}
	function IsSure(){
		var mes=confirm("您确定要退出吗？");
		if(mes==true){ 
			window.location.href="<%=basePath%>login.html";
		}
	 }

</script>


</head>

<body
	style="background:url(<%=basePath%>images/topbg.gif) repeat-x;">

	<div class="topleft">
		<a href="main.html" target="_parent"><img
			src="<%=basePath%>images/logo.png" title="系统首页" /></a>
	</div>

	<ul class="nav">
		<!-- <li><a href="default.html" target="rightFrame" class="selected"><img src="/com.zengto.coqs/images/main/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a href="imgtable.html" target="rightFrame"><img src="/com.zengto.coqs/images/main/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
    <li><a href="imglist.html"  target="rightFrame"><img src="/com.zengto.coqs/images/main/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a href="tools.html"  target="rightFrame"><img src="/com.zengto.coqs/images/main/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a href="computer.html" target="rightFrame"><img src="/com.zengto.coqs/images/main/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a href="tab.html"  target="rightFrame"><img src="/com.zengto.coqs/images/main/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
     -->
	</ul>

	<div class="topright">
		<ul>
			<li><span><img
					src="<%=basePath%>images/help.png" title="帮助"
					class="helpimg" /></span><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
			<li><a target="_parent" onclick="IsSure()">退出</a></li>
		</ul>

		<div class="user">
			<span>admin</span> <i>消息</i> <b>5</b>
		</div>

	</div>

</body>
</html>
