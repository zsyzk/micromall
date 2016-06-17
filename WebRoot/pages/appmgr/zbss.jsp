
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
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
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
<script src="js/jquery.idTabs.min.js" type="text/javascript"></script>
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/uContext.js" type="text/javascript"></script>
<script src="<%=basePath%>js/appmgr/zbss.js" type="text/javascript"></script>
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
	<div id="zbss">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="javascript:void(0)">基本资料</a></li>
				<li><a href="javascript:void(0)">基本信息</a></li>
				<li><a href="javascript:void(0)">周边设施</a></li>
			</ul>
		</div>

		<div class="rightinfo">

			<div class="tools">

			</div>
			<div  style="width: 100%;overflow: auto;" >
			<div style="width: 1270px">
			<table class="tablelist"   >
				<thead>
					<tr>
						<th></th>
						<th width="60" pn="zbssid">编号</th>
						<th width="80">图片</th>
						<th width="120" pn="zdmc">所属站点</th>
						<th width="100" pn="zbsstypeMc">分类</th>
						<th width="125" pn="zbssmcS">设施名称(简)</th>
						<th width="125" pn="zbssmcT">设施名称(繁)</th>
						<th width="100" pn="zbssdzS">地址(简)</th>
						<th width="100" pn="zbssdzT">地址(繁)</th>
						<th width="100" pn="zbssdh">联系电话</th>
						<th width="180" pn="zbssmsS">描述(简)</th>
						<th width="180" pn="zbssmsT">描述(繁)</th>
					</tr>
				</thead>
				<tbody/>
			</table>
			</div>
			</div>
			
			<div id="pagecont" />
		</div>
	</div>
</body>
</html>
