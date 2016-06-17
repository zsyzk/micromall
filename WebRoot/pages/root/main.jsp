<%@page import="micromall.manager.util.GlobalContext"%>
<%@page import="micromall.manager.util.AssertUtil"%>
<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";

	Object temp = session.getAttribute("loginUser");

	GlobalContext context = null != temp
			? temp instanceof GlobalContext
					? (GlobalContext) temp
					: null : null;

	if (null == context || AssertUtil.isNull(context.getUserId())) {
		response.sendRedirect(basePath + "pages/root/login.jsp");
	}
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html>
<head>
<base href="<%=basePath%>" />

<title>电子票后台管理平台</title>

<meta http-equiv="pragma" content="no-cache" />
<meta http-equiv="cache-control" content="no-cache" />
<meta http-equiv="expires" content="0" />
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3" />
<meta http-equiv="description" content="This is my page" />
<script language="JavaScript">
	if (window != top)
		top.location.href = location.href;
</script>

</head>

<frameset rows="88,*" cols="*" frameborder="no" border="0"
	framespacing="0"> <frame
	src="<%=basePath%>/home/preloadTop.shtm" name="topFrame" scrolling="No"
	noresize="noresize" id="topFrame" title="topFrame" /> <frameset
	cols="187,*" frameborder="no" border="0" framespacing="0"> <frame
	src="<%=basePath%>home/preloadLeft.shtm" name="leftFrame"
	scrolling="No" noresize="noresize" id="leftFrame" title="leftFrame" />
<frame src="<%=basePath%>pages/root/index.jsp" name="rightFrame"
	id="rightFrame" title="rightFrame" /> </frameset> </frameset>
<noframes>
	<body>
	</body>
</noframes>
</html>
