<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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
<link href="css/main/style.css" rel="stylesheet" type="text/css" />
<script src="js/util/ztLayer.js" type="text/javascript"></script>
<script src="js/util/ztSearch.js" type="text/javascript"></script>
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/uContext.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/laypage/laypage.js"></script>
<script type="text/javascript"
	src="<%=basePath%>js/chepiao/ticket_transfer.js"></script>
<link href="<%=basePath%>js/laypage/skin/laypage.css" rel="stylesheet"
	type="text/css" />
<script type="text/javascript" src="<%=basePath%>js/laypage/laypage.js"></script>
<link href="<%=basePath%>js/laypage/skin/laypage.css" rel="stylesheet"
	type="text/css" />
<script src="js/util/pageUtil.js" type="text/javascript"></script>
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
	<div id="div_ticket_transfer">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="javascript:void(0)">车票管理</a></li>
				<li><a href="javascript:void(0)">车票转让</a></li>
				<li><a href="javascript:void(0)">转让记录</a></li>
			</ul>
		</div>

		<div class="rightinfo">

			<div class="tools"></div>

			<table class="tablelist">
				<thead>
					<tr>
						<th width="70" pn="ticketTransferId">编号</th>
						<th width="120" pn="eticketId">车票编号</th>
						<th width="120" pn="fromMemberId">转让人</th>
						<th width="120" pn="toMemberId">接收人</th>
						<th width="120" pn="transferDate">转让时间</th>
					</tr>
				</thead>
				<tbody />
			</table>
			<div id="pagecont" />
		</div>
	</div>
</body>
</html>