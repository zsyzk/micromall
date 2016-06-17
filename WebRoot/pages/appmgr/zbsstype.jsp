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
<link rel="stylesheet" type="text/css" href="js/layer/skin/layer.css">
<link href="css/page/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="js/util/ztLayer.js" type="text/javascript"></script>
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/uContext.js" type="text/javascript"></script>
<script src="js/util/ztSearch.js" type="text/javascript"></script>
<script src="js/jquery.idTabs.min.js" type="text/javascript"></script>
<link href="css/main/style.css" rel="stylesheet" type="text/css" />
<script src="<%=basePath%>js/appmgr/zbsstype.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/laypage/laypage.js"></script>
<script src="<%=basePath%>js/util/pageUtil.js" type="text/javascript"></script>
<link href="<%=basePath%>js/laypage/skin/laypage.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript">
	$(function() {
		var action = '${action}';if(''!=action){initAction(".tools",action);}init();
	});
</script>
</head>

<body>
	<div id="zbsstype">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="javascript:void(0)">基本资料</a></li>
				<li><a href="javascript:void(0)">基本信息</a></li>
				<li><a href="javascript:void(0)">周边设施类别</a></li>
			</ul>
		</div>

		<div class="rightinfo">

			<div class="tools">

				<!-- <ul class="toolbar">
					<li class="click_refresh"><span><img
							src="images/t04.png" /></span>重新加载</li>
					<li class="click_add"><span><img src="images/t01.png" /></span>新建</li>
					<li class="click_update"><span><img
							src="images/t02.png" /></span>编辑</li>
					<li class="click_delete"><span><img
							src="images/t03.png" /></span>删除</li>
					<li class="click_view"><span><img src="images/view.png" /></span>查阅详情</li>
				</ul>

				<ul class="toolbar1">
					<li class="click_find"><span><img
							src="images/search_2.png" /></span>智能搜索</li>
				</ul> -->
			</div>


			<table id='tablelist' class="tablelist">
				<thead>
					<tr>
						<th width="50"></th>
						<th width='70' pn="zbsstypeid">编号</th>
						<th width='100' pn="mcS">类别名称(简)</th>
						<th width='100' pn="mcT">类别名称(繁)</th>
						<th width='200' pn="msS">描述(简)</th>
						<th width='200' pn="msT">描述(繁)</th>
					</tr>
				</thead>
				<tbody />
			</table>
			<div id="pagecont"/>
		</div>
	</div>
</body>
</html>
