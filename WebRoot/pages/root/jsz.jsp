<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'jsz.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="js/util/uContext.js"></script>
<script type="text/javascript">
	function click_home_fun() {
		window.parent.frames["rightFrame"].location.href = getRootPath()
				+ "/pages/root/index.jsp";
	}
</script>

</head>

<body style="text-align: center;">
	<div>
	<br>
	<br>
		<img src="images/WangZhanJSZ.jpg" border="0" width="400" height="270"/>
	</div>
</body>
</html>
