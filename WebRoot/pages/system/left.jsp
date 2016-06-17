<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<% 
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<html>
<head>
<base href="<%=basePath%>" />
<title>请选择功能</title>
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
					    	leftMenu +="<li><cite></cite><a href=<%=basePath%>"+childMenu[cm].furl+" >"+childMenu[cm].fname+"</a><i></i></li>";
					    }
					    leftMenu +="</ul>";    
					    leftMenu +="</dd>";
						DomMenu.append($(leftMenu));
					}
				} 
				//导航切换
	$(".menuson li").bind("click",function(event){
		event.preventDefault();
		$(".menuson li.active").removeClass("active");
		$(this).addClass("active");
// 		var rightFrame = window.parent.frames["rightFrame"];
// 		rightFrame.openSelect($(this).find("a").attr('href'),$(this).find("a").html());		
		var url = getRootPath() + "to_terms.shtm";
	var data = "{/"name/":/"hunter/"}";
	$.ajax({
		url : url,
		type : "POST",
		contentType : "application/json; charset=utf-8",
		datatype : "json",
		data : json2str(data),
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				alert(result.data);
				var rightFrame = window.parent.frames["rightFrame"];
				rightFrame.openSelect(getRootPath()+result.data);	
			} else {
				openLayer({type:0,msg:"您输入的用户名与密码不匹配，请重新输入...",btns:1,btn:['确定'],title:'系统温馨提示',area:['300','220'],icon:8});
			}
		}
	});
		return false;
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
