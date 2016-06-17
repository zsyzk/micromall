<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>"/>
<title>My JSP 'user.jsp' starting page</title>

<script type="text/javascript" src="js/jquery.js"></script>
<link rel="stylesheet" type="text/css" href="js/layer/skin/layer.css"/>
<link href="css/page/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="js/util/ztLayer.js" type="text/javascript"></script>
<script src="js/util/ztSearch.js" type="text/javascript"></script>
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/uContext.js" type="text/javascript"></script>
<link href="css/main/style.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>js/user/user.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/laypage/laypage.js"></script>
<link href="<%=basePath%>js/laypage/skin/laypage.css" rel="stylesheet"
	type="text/css" />
<script src="<%=basePath%>js/util/pageUtil.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		var action = '${action}';
		if ('' != action) {
			initAction(".tools", action);
		}
		init();
	});
</script>

</head>

<body>
	<div id="users">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="#">用户中心</a></li>
				<li><a href="#">基本资料</a></li>
				<li><a href="#">用户资料</a></li>
			</ul>
		</div>

		<div class="rightinfo">

			<div class="tools"></div>

			<table class="tablelist">
				<thead>
					<tr>
						<th width="50"></th>
						<th width="100" pn="userId">编号</th>
						<th width="200" pn="username">用户名</th>
						<th width="200" pn="userTypeName">用户类别</th>
					</tr>
				</thead>
				<tbody>
				</tbody>
			</table>
			<div id="pagecont" />
		</div>
	</div>
</body>
</html>
