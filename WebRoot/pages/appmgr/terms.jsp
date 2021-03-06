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

<link href="page/css/bootstrap.css" rel="stylesheet" type="text/css" />
<script src="js/jquery.js" type="text/javascript"></script>
<script src="page/js/bootstrap.js" type="text/javascript"></script>
<script src="page/js/jquery.twbsPagination.js" type="text/javascript"></script>
<script src="page/js/zzsc.js" type="text/javascript"></script>

<link href="css/main/style.css" rel="stylesheet" type="text/css" />

<script src="<%=basePath%>js/util/uContext.js" type="text/javascript"></script>
<script src="<%=basePath%>js/appmgr/terms.js" type="text/javascript"></script>


<script type="text/javascript" src="js/jquery.idTabs.min.js"></script>
<script type="text/javascript" src="editor/kindeditor-min.js"></script>
<link rel="stylesheet" type="text/css" href="editor/skins/default.css">


<link rel="stylesheet" type="text/css" href="js/layer/skin/layer.css">
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/ztLayer.js" type="text/javascript"></script>
<script src="js/util/ztSearch.js" type="text/javascript"></script>
<script type="text/javascript" src="<%=basePath%>js/laypage/laypage.js"></script>
<script src="<%=basePath%>js/util/pageUtil.js" type="text/javascript"></script>
<link href="<%=basePath%>js/laypage/skin/laypage.css" rel="stylesheet"
	type="text/css" />

<script type="text/javascript">
	$(function() {
		var action = '${action}';if(''!=action){initAction(".tools",action);}init();
	});
</script>

<script type="text/javascript">
	KE.show({
		id : 'content7',
		cssPath : './index.css'
	});
	KE.show({
		id : 'content8',
		cssPath : './index.css'
	});
</script>

</head>

<div id="zbss">
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:void(0)">基本资料</a></li>
			<li><a href="javascript:void(0)">基本信息</a></li>
			<li><a href="javascript:void(0)">App使用条款</a></li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">
			<%-- <ul class="toolbar">
				<li class="click_refresh"><span><img
						src="<%=basePath%>images/t04.png" /></span>重新加载</li>
				<li class="click_add"><span><img
						src="<%=basePath%>images/t01.png" /></span>新建</li>
				<li class="click_update"><span><img
						src="<%=basePath%>images/t02.png" /></span>编辑</li>
				<li class="click_del"><span><img
						src="<%=basePath%>images/t03.png" /></span>删除</li>
				<li class="click_public"><span><img
						src="<%=basePath%>images/t04.png" /></span>发布</li>
				<li class="click_view"><span><img src="images/view.png" /></span>查阅详情</li>

			</ul>

			<ul class="toolbar1">
				<li class="click_find"><span><img
						src="images/search_2.png" /></span>智能搜索</li>
			</ul> --%>

		</div>
		<table id="data_table" class="tablelist">
			<thead>
				<tr>
					<th width="50"></th>
					<th width="70" pn="sytkid">编号</th>
					<th width="300" pn="textTraditional">条款繁体正文</th>
					<th width="300" pn="textSimplified">条款简体正文</th>
					<th width="70" pn="status">状态</th>
					<th width="150" pn="lastDate">发布时间</th>
				</tr>
			</thead>
			<tbody>
			</tbody>
		</table>
		<div id="pagecont"/>
	</div>
</div>


<script type="text/javascript">
	$("#usual1 ul").idTabs();
</script>

<script type="text/javascript">
	$('.tablelist tbody tr:odd').addClass('odd');
</script>

<script type="text/javascript">
	$(function() {
		var ie6 = document.all;
		var dv = $('#daohang'), st;
		/* dv.attr('otop', dv.offset().top); //存储原来的距离顶部的距离 */
		dv.attr('otop', dv.offsetTop); //存储原来的距离顶部的距离
		$(window).scroll(
				function() {
					st = Math.max(document.body.scrollTop
							|| document.documentElement.scrollTop);
					if (st > parseInt(dv.attr('otop'))) {
						if (ie6) {//IE6不支持fixed属性，所以只能靠设置position为absolute和top实现此效果
							dv.css({
								position : 'absolute',
								top : st
							});
						} else if (dv.css('position') != 'fixed')
							dv.css({
								'position' : 'fixed',
								top : 0
							});
					} else if (dv.css('position') != 'static')
						dv.css({
							'position' : 'static'
						});
				});
		var ie62 = document.all;
		var dv2 = $('#data_table thead'), st;
		var daoahang = $('#daohang').height();
		/* dv2.attr('otop', dv2.offset().top + daoahang); //存储原来的距离顶部的距离 */
		dv2.attr('otop', dv2.offsetTop + daoahang);
		$(window).scroll(
				function() {
					st = Math.max(document.body.scrollTop
							|| document.documentElement.scrollTop);
					if (st > parseInt(dv2.attr('otop'))) {
						if (ie62) {//IE6不支持fixed属性，所以只能靠设置position为absolute和top实现此效果
							dv2.css({
								position : 'absolute',
								top : st
							});
						} else if (dv2.css('position') != 'fixed')
							dv2.css({
								'position' : 'fixed',
								top : daoahang
							});
					} else if (dv2.css('position') != 'static')
						dv2.css({
							'position' : 'static'
						});
				});
	});
</script>

</body>
</html>
