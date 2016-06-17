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
<script src="<%=basePath%>js/basedatamgr/dqzdwzgl.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/laypage/laypage.js"></script>
<link href="<%=basePath%>js/laypage/skin/laypage.css" rel="stylesheet" type="text/css" />
<script type="text/javascript">
	$(function() {
		var action = '${action}';if(''!=action){initAction(".tools",action);}init();
	});
</script>

</head>

<body>
	<div id="div_dqzd">
		<div class="place">
			<span>位置：</span>
			<ul class="placeul">
				<li><a href="javascript:void(0)">基础数据管理</a></li>
				<li><a href="javascript:void(0)">站点数据</a></li>
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
						<th width="70" pn="zdbaseid" >编号</th>
						<th width="200" pn="zdmc">站点名称</th>
						<th width="150" pn="dqmc" >关联地区名称</th>
						<th width="150" pn="ccsj" >操作</th>
					</tr>
				</thead>
				<tbody>
				<c:forEach var="zdbase" items="${page_zhandian}">
					<tr>
						<td width="70" align="center">${zdbase.zdbaseid}</td>
						<td width="200" align="center">${zdbase.zdmc }</td>
						<td width="150" align="center">${zdbase.dqmc }</td>
						<td align="center"><a href="javascript:void(0);" fid=${zdbase.zdbaseid } class="tablelink">关联地区</a></td>
					</tr>
				</c:forEach>
				</tbody>
			</table>
			<!-- <div id="pagecont"></div>
			<script type="text/javascript">
				laypage({
					cont : $('#pagecont'), //容器。值支持id名、原生dom对象，jquery对象,
					pages : ('${page_diqu}' == '' || '${page_diqu.sumPage }' == '') ? 0
							: parseInt('${page_diqu.sumPage }'), //总页数
					skip : true, //是否开启跳页
					skin : '#AF0000',
					groups : ('${page_diqu}' == '' || '${page_diqu.dispayNum }' == '') ? 1
							: parseInt('${page_diqu.dispayNum }'), //连续显示分页数
					curr : ('${page_diqu}' == '' || '${page_diqu.page }' == '') ? 1
							: parseInt('${page_diqu.page }'), //当前页
					jump : function(e) { //触发分页后的回调
						pageFunction(e.curr);
					}
				});
			</script> -->
		</div>
	</div>
</body>
</html>
