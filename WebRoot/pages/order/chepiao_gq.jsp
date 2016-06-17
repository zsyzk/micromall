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
<script src="js/util/ztSearch.js" type="text/javascript"></script>
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/uContext.js" type="text/javascript"></script>
<script src="<%=basePath%>js/order/chepiao_gq.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/laypage/laypage.js"></script>
<link href="<%=basePath%>js/laypage/skin/laypage.css" rel="stylesheet"
	type="text/css" />
<script src="js/util/pageUtil.js" type="text/javascript"></script>
<script type="text/javascript">
	$(function() {
		var action = '${action}';if(''!=action){initAction(".tools",action);}init();
	});
</script>

</head>

<body>
	<div id="div_cp_gq">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="javascript:void(0)">车票订单</a></li>
				<li><a href="javascript:void(0)">车票管理</a></li>
				<li><a href="javascript:void(0)"> 改签车票</a></li>
			</ul>
		</div>

		<div class="rightinfo">

			<div class="tools">
				<!-- <ul class="toolbar">
					<li class="click_refresh"><span><img
							src="images/t04.png" /></span>重新加载</li>
				</ul>
				<ul class="toolbar1">
					<li class="click_find"><span><img
							src="images/search_2.png" /></span>智能搜索</li>
				</ul> -->
			</div>

			<table class="tablelist">
				<thead>
					<tr>
						<th width="70" pn="cpId">编号</th>
						<th width="130">二维码</th>
						<th width="190" pn="orderNum">订单号</th>
						<th width="100" pn="userId">用户</th>
						<th width="200" pn="xlMc">线路名称</th>
						<th width="120" pn="bcrq">班次日期</th>
						<th width="100" pn="bcsj">班次时间</th>
						<th width="100" pn="sczdMc">上车点</th>
						<th width="100" pn="xczdMc">下车点</th>
						<th width="100" pn="buyDate">购买时间</th>
						<th width="100" pn="moneyType">货币</th>
						<th width="70" pn="zwbh">座位</th>
						<th width="70" pn="istp">套票</th>
					</tr>
				</thead>
				<tbody />
			</table>
			<div id="pagecont"/>
	</div>
</body>
</html>
