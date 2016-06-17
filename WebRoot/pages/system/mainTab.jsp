<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!doctype html>
<html lang="en">
	<head>
<base href="<%=basePath%>" />
<title>菜单</title>
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/easyui.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/icon.css">
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/demo.css"> 
	<link rel="stylesheet" type="text/css" href="<%=basePath%>css/main/style.css">
 	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/color.css"> 
	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/layer/skin/layer.css">
<%-- 	<link rel="stylesheet" type="text/css" href="<%=basePath%>js/jquery/uploadify.css">
<link rel="stylesheet" type="text/css" href="<%=basePath%>editor/skins/editor.css"> --%>
	<script src="<%=basePath%>js/jquery.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/util/uContext.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/util/ztLayer.js" type="text/javascript"></script>
	<%-- <script src="<%=basePath%>js/util/ztPageIn.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/util/ztUpload.js" type="text/javascript"></script>--%>
	<script src="<%=basePath%>js/jquery.easyui.min.js" type="text/javascript"></script> 
	<script src="<%=basePath%>js/util/ztTabs.js" type="text/javascript"></script>
	<%-- <script src="<%=basePath%>js/jquery/jquery.uploadify.min.js" type="text/javascript"></script> --%>
	<script src="<%=basePath%>js/layer/layer.min.js" type="text/javascript"></script>
<%-- <script type="text/javascript" src="<%=basePath%>ckeditor/ckeditor.js"></script> --%>

	
		<script>
		var ztTab;
		$(function() {
			ztTab = new ztTabs();
			var action = '${action}';if(''!=action){initAction(".tools",action);}init();
			
			/* var leftFrame = $(window.parent.frames["leftFrame"].document);
			leftFrame.find("#lmenu li").bind("click",function(event){
				event.preventDefault();
				ztTab.selectTab(getRootPath()+$(this).find("a").attr('href'),$(this).find("a").html());
				return false;
			});   */
			
		});
		
		function openSelect(href,title){
			ztTab.selectTab(href,title);
		}
		
		function refreshTab(href){
			ztTab.refreshTab(href);
		}
		
</script>
	</head>
	<body>
		<div id="tabs">
		</div>
		<div id="tabTool" style="padding-top: 10px">
			<a href="javascript:void(0)" class="icon-add" onclick="openSelect();" >&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</a>
		</div>
	</body>
</html>

