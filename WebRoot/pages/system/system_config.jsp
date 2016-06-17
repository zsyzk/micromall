<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'user.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

<script type="text/javascript" src="js/jquery.js"></script>
<script type="text/javascript" src="js/jquery.uploadify.min.js"></script>
<link href="js/uploadify.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/layer/skin/layer.css">
<link href="css/page/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/main/style.css" rel="stylesheet" type="text/css" />
<script src="js/util/ztLayer.js" type="text/javascript"></script>
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/uContext.js" type="text/javascript"></script>
<script type="text/javascript"
	src="<%=basePath%>js/system/system_config.js"></script>

<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript">
	$(function() {
		var action = '${action}';if(''!=action){initAction(".tools",action);}init();
	});
</script>

</head>

<body>
	<div id="systemconfig">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="javascript:void(0)">系统管控</a></li>
				<li><a href="javascript:void(0)">系统参数管理</a></li>
				<li><a href="javascript:void(0)">参数配置</a></li>
			</ul>
		</div>

		<div class="rightinfo">

			<div class="tools">

				 <ul class="toolbar">
					<li class="click_refresh"><span><img
							src="images/t04.png" /></span>重新加载</li>
					<li class="click_update"><span><img
							src="images/t02.png" /></span>编辑</li>
					<li class="click_default"><span><img
							src="images/t02.png" /></span>还原默认值</li>
					<li class="click_view"><span><img src="images/view.png" /></span>查阅详情</li>
				</ul> 

			</div>


			<table class="tablelist">
				<thead>
					<tr>
						<th width="50"></th>
						<th width="100">编号<i class="sort"></i></th>
						<th width="200">参数名称</th>
						<th width="300">参数值</th>
						<th width="300">参数描述</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="systempara" items="${system_confs}">
						<tr>
							<td width="50"><input type="checkbox"
								fid='${systempara.scid}' /></td>
							<td width="100" align="center">${systempara.scid}</td>
							<td width="200" align="center">${systempara.key}</td>
							<td width="300" align="center">${systempara.value}</td>
							<td width="300" align="left">${systempara.des}</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
			<div id="pagecont" />
		</div>
	</div>
</body>
</html>
