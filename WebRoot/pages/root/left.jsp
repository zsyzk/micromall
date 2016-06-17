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

<title>My JSP 'left.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script src="<%=basePath%>js/util/uContext.js" type="text/javascript"></script>
<script src="<%=basePath%>js/jquery.js" type="text/javascript"></script>
<link href="<%=basePath%>css/main/style.css" rel="stylesheet" type="text/css" />

<script type="text/javascript">
$(function(){	

		var data = '${menu}';
	if(null!=data && ""!=data){
					var evalMenu = eval('('+data+')');
					var DomMenu = $("#lmenu");
					for(var m in evalMenu){
						var leftMenu ="";
						leftMenu +="<dd>";
					    leftMenu +="<div class=title>";
					    leftMenu +="<span><img src="+evalMenu[m].furl+"></span>"+evalMenu[m].fname;
					    leftMenu +="</div>";
					    leftMenu +="<ul class=menuson>";
					    var childMenu = evalMenu[m].fmenuChild;
					    for(var cm in childMenu){
					    	leftMenu +="<li mark="+childMenu[cm].mark+" mcode="+childMenu[cm].perCode+" ><cite></cite><a href='javascript:void(0)'>"+childMenu[cm].fname+"</a><i></i></li>";
							// leftMenu +="<li id="+childMenu[cm].mark+" ><cite></cite><a target='rightFrame' href=<%=basePath%>"+childMenu[cm].furl+" >"+childMenu[cm].fname+"</a><i></i></li>";
					    }
					    leftMenu +="</ul>";    
					    leftMenu +="</dd>";
						DomMenu.append($(leftMenu));
					}
				} 

	//导航切换
	$(".menuson li").click(function(e){
	
		$(".menuson li.active").removeClass("active");
		
		$(this).addClass("active");	
			
		var mark = $(".menuson li.active").attr('mark');
		var mcode = $(".menuson li.active").attr('mcode');
		
		var url = getRootPath() + "dispatcher.shtm?mark="+mark+"&page=1&mcode="+mcode;
		$.ajax({
		url : url,
		type : "POST",
		contentType : "application/json; charset=utf-8",
// 		datatype : "string",
// 		data:data,
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				var doit = function(){
					window.parent.frames["rightFrame"].location.href=getRootPath()+result.data.url;
				};
				setTimeout(doit, 100);
			} else {
				openLayer({type:0,msg:"您输入的用户名与密码不匹配，请重新输入...",btns:1,btn:['确定'],title:'系统温馨提示',area:['300','220'],icon:8});
			}
		}
	});
	});
	
	$('.title').click(function(){
		var $ul = $(this).next('ul');
		$('dd').find('ul').slideUp();
		if($ul.is(':visible')){
			$(this).next('ul').slideUp();
		}else{
			$(this).next('ul').slideDown();
		}
	});
});
</script>

</head>

<body style="background:#f0f9fd;">
	<div class="lefttop"><span></span>请选择功能</div>
    
    <dl id="lmenu" class="leftmenu">
    
    </dl>
</body>
</html>
