<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
	Object obj = session.getAttribute("loginuser");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<base href="<%=basePath%>" />
<!-- <link href="css/main/style.css" rel="stylesheet" type="text/css" /> -->
<link href="<%=basePath%>css/main/style.css" rel="stylesheet" type="text/css"/>
<script src="<%=basePath%>js/jquery.js" type="text/javascript"></script>
<script src="<%=basePath%>js/util/uContext.js" type="text/javascript"></script>
<script type="text/javascript">

function click_home_fun()
{
	window.parent.frames["rightFrame"].location.href=getRootPath()+"/pages/root/index.jsp";
}
function click_help_fun()
{
	window.parent.frames["rightFrame"].location.href=getRootPath()+"/pages/root/jsz.jsp";
}
function click_about_fun()
{
	window.parent.frames["rightFrame"].location.href=getRootPath()+"/pages/root/jsz.jsp";
}

var modifyPwdHtml = "<div><form id = 'modifyPwdForm' class='formbody' style='overflow-y: auto;width:800px;height: 400px'>"
	+"<div class='formtitle'><span>基本信息</span></div>"
	+"<ul class='forminfo'>"
	+"<li><label>原密码:</label><input id='old' name='oldPassword' type='password' class='dfinput' datatype='*6-16' nullmsg='请输入原密码！' errormsg='密码范围在6~16位之间！' /><span class='Validform_checktip'>请原输入密码</span><br></li>"
	+"<li><label>新密码:</label><input id='new1' name='newPassword' type='password' class='dfinput' datatype='*6-16' nullmsg='请输入新密码！' errormsg='密码范围在6~16位之间！'  /><span class='Validform_checktip'>请输入新密码</span><br></li>"
	+"<li><label>确认新密码:</label><input id='new2' name='newPassword2' type='password' class='dfinput' datatype='*' recheck='newPassword' nullmsg='请再输入一次新密码！' errormsg='您两次输入的账号密码不一致！' /><span class='Validform_checktip'>请再输入一次新密码</span><br></li>"
	+"<li><label>&nbsp;</label>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id='yes' type='button' class='scbtn' value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id='no' type='button' class='scbtn' value='关闭'/></li>"
	+"</ul>"
	+"</form></div>";
	function click_modifyPwd_fun(){
		var rightFrame = window.parent.frames["rightFrame"];
		var urlDispatcher = getRootPath() + "pages/root/modify_pwd.html";
		rightFrame.location.href = urlDispatcher;
	}
function click_exit_fun()
{
	window.parent.frames["rightFrame"].openLayer({
		type : 0,
		msg : '您确定要退出吗？',
		btns : 2,
		btn : [ '确定','取消' ],
		yes:yes,
		title : '系统温馨提示',
		area : [ '300', '220' ],
		icon : 1,
	}); 
	function yes(){
		 var url = getRootPath() + "exitLogin.shtm";
		$.ajax({
			url : url,
			type : "POST",
			contentType : "application/json; charset=utf-8",
			datatype : "json",
			success : function(data, stats) {
				parent.location.href = getRootPath() + "pages/root/login.jsp";
			}
		}); 
	}
		
}
$(function(){
		var models = '${models}';
		if(''!=models){
			var DomModels = $(".nav");
			var evalModels = eval('('+models+')');
			for(var m in evalModels){
				/* var topModel;
				if(0 == m){
					topModel = "<li><a href=javascript:void(0) mid="+evalModels[m].id+" onload=changeMenu(this) ><img src="+evalModels[m].furl+" title="+evalModels[m].fname+" /><h2>"+evalModels[m].fname+"</h2></a></li>";
				}else{
					topModel = "<li><a href=javascript:void(0) mid="+evalModels[m].id+" onclick=changeMenu(this) ><img src="+evalModels[m].furl+" title="+evalModels[m].fname+" /><h2>"+evalModels[m].fname+"</h2></a></li>";
				} */
				var topModel = "<li><a href=javascript:void(0) mid="+evalModels[m].id+" mcode ="+evalModels[m].perCode+" onclick=changeMenu(this) ><img src="+evalModels[m].furl+" title="+evalModels[m].fname+" /><h2>"+evalModels[m].fname+"</h2></a></li>";
				DomModels.append($(topModel));
			}
			
			//默认选中一个模块
			loadDefaultModel();
		}
		//顶部导航切换
		$(".nav li a").click(function(){
			$(".nav li a.selected").removeClass("selected");
			$(this).addClass("selected");
		});	
});

function loadDefaultModel(){
	var leftFrame = window.parent.frames["leftFrame"];
	var firstA = $(".nav li a").eq(0);
	var modelId = firstA.attr("mid");
	var modelCode = firstA.attr("mcode");
	leftFrame.location.href = "<%=basePath%>home/preloadLeft.shtm?modelId="+ modelId+"&modelCode="+modelCode;
	firstA.addClass("selected");
}


function changeMenu(obj){
	var modelId = $(obj).attr("mid");
	var modelCode = $(obj).attr("mcode");
	var leftFrame = window.parent.frames["leftFrame"];
	leftFrame.location.href = "<%=basePath%>home/preloadLeft.shtm?modelId="+ modelId+"&modelCode="+modelCode;
}
</script>


</head>

<body
	style="background:url(<%=basePath%>images/topbg.gif) repeat-x;">

	<div class="topleft">
		<img src="<%=basePath%>images/logo.png"  alt="ad"/>
	</div>

	<ul class="nav">
		<!-- <li><a href="default.html" target="rightFrame" class="selected"><img src="/com.zengto.coqs/images/main/icon01.png" title="工作台" /><h2>工作台</h2></a></li>
    <li><a href="imgtable.html" target="rightFrame"><img src="/com.zengto.coqs/images/main/icon02.png" title="模型管理" /><h2>模型管理</h2></a></li>
    <li><a href="imglist.html"  target="rightFrame"><img src="/com.zengto.coqs/images/main/icon03.png" title="模块设计" /><h2>模块设计</h2></a></li>
    <li><a href="tools.html"  target="rightFrame"><img src="/com.zengto.coqs/images/main/icon04.png" title="常用工具" /><h2>常用工具</h2></a></li>
    <li><a href="computer.html" target="rightFrame"><img src="/com.zengto.coqs/images/main/icon05.png" title="文件管理" /><h2>文件管理</h2></a></li>
    <li><a href="tab.html"  target="rightFrame"><img src="/com.zengto.coqs/images/main/icon06.png" title="系统设置" /><h2>系统设置</h2></a></li>
     -->
	</ul>

	<div class="topright">
		<ul>
			<li><span><img
					src="<%=basePath%>images/gohome.png" title="忘记密码"
					class="helpimg" /></span><a onclick="click_modifyPwd_fun()" href="javascript:void(0)">修改密码</a></li>
			<li><span><img
					src="<%=basePath%>images/gohome.png" title="首页"
					class="helpimg" /></span><a onclick="click_home_fun()" href="javascript:void(0)">首页</a></li>
			<li><span><img
					src="<%=basePath%>images/help.png" title="帮助"
					class="helpimg" /></span><a onclick="click_help_fun()" href="javascript:void(0)">帮助</a></li>
			<li><span><img
					src="<%=basePath%>images/about.png" title="关于"
					class="helpimg" /></span><a onclick="click_about_fun()" href="javascript:void(0)">关于</a></li>
			<li><span><img
					src="<%=basePath%>images/exit.png" title="关于"
					class="helpimg" /></span><a onclick="click_exit_fun()" href="javascript:void(0)">退出</a></li>
		</ul>

		<div class="user">
			<span>当前登录用户【<%=session.getAttribute("username") %>】</span> 
<!-- 			<i>系统消息</i> <b>0</b> -->
		</div>

	</div>

</body>
</html>
