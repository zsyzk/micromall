<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%
String path = request.getContextPath();
String basePath = request.getScheme()+"://"+request.getServerName()+":"+request.getServerPort()+path+"/";
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
	<link href="css/main/style.css" rel="stylesheet" type="text/css" />
	<script src="js/util/ztLayer.js" type="text/javascript"></script>
	<script src="js/layer/layer.min.js" type="text/javascript"></script>
	<script src="js/util/uContext.js" type="text/javascript"></script>
	<script src="<%=basePath%>js/appmgr/kfqd.js" type="text/javascript"></script>
	<script type="text/javascript" src="<%=basePath%>js/laypage/laypage.js"></script>
	<link href="<%=basePath%>js/laypage/skin/laypage.css" rel="stylesheet" type="text/css" />
	<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
	<script type="text/javascript">
	$(function() {
		var action = '${action}';if(''!=action){initAction(".tools",action);}init();
	});
</script>

 </head>

<body>
	<div id="kfqd">
	<div class="place">
		<span>位置：</span>
		<ul class="placeul">
			<li><a href="javascript:void(0)">基本资料</a></li>
			<li><a href="javascript:void(0)">基本信息</a></li>
			<li><a href="javascript:void(0)">系统编码管理</a></li>
		</ul>
	</div>

	<div class="rightinfo">

		<div class="tools">

			<!-- <ul class="toolbar">
				<li class="click_refresh"><span><img src="images/t04.png" /></span>重新加载</li>
				<li class="click_add"><span><img src="images/t01.png" /></span>新建</li>
				<li class="click_update"><span><img src="images/t02.png" /></span>编辑</li>
				<li class="click_delete"><span><img src="images/t03.png" /></span>删除</li>
				<li class="click_view"><span><img src="images/view.png" /></span>查阅详情</li>
			</ul> -->


			<!-- ul class="toolbar1">
				<li><span><img src="images/t05.png" /></span>设置</li>
			</ul -->

		</div>


	<table class="tablelist">
		<thead>
			<tr>
				<th></th>
				<th>系统编码</th>
				<th>系统编码描述</th>
				<th>客户编码</th>
				<th>客户编码描述</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="kfqd" items="${data}">
	        <tr>
	        <td><input type="checkbox" fid='${kfqd.kfqdId }' /></td>
	        <td>${kfqd.xtbm}</td>
	        <td>${kfqd.xtbmms}</td>
	        <td>${kfqd.kfbm}</td>
	        <td>${kfqd.kfbmms}</td>
	        </tr>    
	        </c:forEach>
		</tbody>
	</table>
	<div id="pagecont"
			style="text-align:center; background-color: #ead1dc; padding-top:5px;"></div>
		<script type="text/javascript">
			 laypage({
				cont : $('#pagecont'), //容器。值支持id名、原生dom对象，jquery对象,
				pages: ('${pageVo}' == '' || '${pageVo.sumPage }'=='' )?0:parseInt('${pageVo.sumPage }'), //总页数
				skip : true, //是否开启跳页
				skin : '#AF0000',
				groups : ('${pageVo}'=='' || '${pageVo.dispayNum }'=='')?1:parseInt('${pageVo.dispayNum }'), //连续显示分页数
				curr : ('${pageVo}'=='' || '${pageVo.page }'=='')?1:parseInt('${pageVo.page }'), //当前页
				jump : function(e) { //触发分页后的回调
					if(''!='${pageVo }' && '${pageVo.page }'!=e.curr){
						pageFunction(5,e.curr);
					}
					
				}
			});
			 setCurrnum(('${pageVo}'=='' || '${pageVo.page }'=='')?1:parseInt('${pageVo.page }'));
			
		</script>
	</div>
	</div>
</body>
</html>
