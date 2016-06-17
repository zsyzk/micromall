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
<style type="text/css">
.drag {
	width: 100px;
	height: 25px;
	padding: 10px;
	margin: 5px;
	border: 1px solid #ccc;
	background: #AACCFF;
}

.dp {
	opacity: 0.5;
	filter: alpha(opacity = 50);
}

.over {
	background: #FBEC88;
}

#source div {
	cursor: pointer;
}
</style>
<link href="page/css/bootstrap.css" rel="stylesheet" type="text/css" />
<link href="css/main/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="editor/skins/default.css">
<link rel="stylesheet" type="text/css" href="js/layer/skin/layer.css">
<script src="js/jquery.js" type="text/javascript"></script>
<script src="page/js/bootstrap.js" type="text/javascript"></script>
<script src="page/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="<%=basePath%>js/util/uContext.js" type="text/javascript"></script>
<script src="<%=basePath%>js/appmgr/terms.js" type="text/javascript"></script>
<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/ztLayer.js" type="text/javascript"></script>
<script src="<%=basePath%>js/basedatamgr/dqwzgl.js"
	type="text/javascript"></script>
<script src="js/jquery.easyui.min.js" type="text/javascript"></script>
<script type="text/javascript"
	src="http://api.map.baidu.com/api?v=15&ak=gGPUrSt01TwIMfct4Iew0RNF"></script>
<script type="text/javascript">
	$(function() {
		var action = '${action}';
		if ('' != action) {
			//initAction(".tools",action);
			var as = action.split(",");
			for ( var a in as) {
				if (as[a] == "09") {
					initAction(".tools", as[a]);
				} else if (as[a] == "11") {
					$(
							'<li><label>&nbsp;</label><input id="saveMapPoint" name="" type="button" class="scbtn" value="保存"/></li>')
							.insertBefore("#s2");
				}
			}

		}
		init();
		$("#tabTarget").idTabs();
	});
</script>

</head>

<body>

	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:void(0)">基础数据</a></li>
			<li><a href="javascript:void(0)">位置设置</a></li>
			<li><a href="javascript:void(0)">地区位置管理</a></li>
		</ul>
	</div>

	<div class='itab'>
		<ul id='tabTarget'>
			<li><a href='#location' class='selected'>地区位置</a></li>
			<li><a href='#mapLocation'>地区地图位置</a></li>
		</ul>
	</div>

	<div id='location' class='tabson'>
		<div class="formbody">
			<div class="tools"></div>
			<div
				style="overflow:auto;width:900px;height: 400px;border:1px solid #ccc;">
				<div id="target" class="dqwzgl"></div>
			</div>
		</div>
	</div>

	<div id='mapLocation' class='tabson'>
		<ul class="seachform">

			<li id="s2"><label>&nbsp;&nbsp;经度:</label><input id="mapX"
				type="text" class="scinput" readonly="readonly" /></li>
			<li><label>纬度:</label><input id="mapY" type="text"
				class="scinput" readonly="readonly" /></li>
			<li><label>查询地点:</label><input id="findMapKey" type="text"
				class="scinput" /></li>
			<li><label>&nbsp;</label><input id="findMapBtn" name=""
				type="button" class="scbtn" value="查询" /></li>
		</ul>


		<div id="mapSource"
			style="border:1px solid #ccc;width:120px;height:400px;float:left;margin:5px;">
			<div id="mapSourceDetail" style="height: 380px;overflow: auto;"></div>
		</div>
		<div id="mapTarget"
			style="position:relative;overflow:hidden;border:1px solid #ccc;width:800px;height:400px;float:left;margin:5px;"></div>
	</div>
</body>
</html>

