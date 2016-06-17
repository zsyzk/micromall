<%@ page language="java" import="java.util.*,java.net.URLEncoder" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">
<!-- <meta http-equiv="Content-Type" content="text/html; charset=utf-8" /> -->
<title>欢迎登录后台管理系统</title>
<link href="css/main/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="js/layer/skin/layer.css">
<script language="JavaScript" src="js/jquery.js"></script>
<script language="JavaScript" src="js/system/Login.js"></script>
<script src="js/cloud.js" type="text/javascript"></script>
<script src="js/layer/layer.min.js" type="text/javascript"></script>
<script src="js/util/ztLayer.js" type="text/javascript"></script>
<script type="text/javascript" src="js/util/uContext.js"></script>


<script language="javascript">
	$(function() {
		$('.loginbox').css({
			'position' : 'absolute',
			'left' : ($(window).width() - 692) / 2
		});
		$(window).resize(function() {
			$('.loginbox').css({
				'position' : 'absolute',
				'left' : ($(window).width() - 692) / 2
			});
		});

		loginvar action = '${action}';if(''!=action){initAction(".tools",action);}init();
	});
</script>


</head>

<body
	style="background-color:#1c77ac; background-image:url(images/light.png); background-repeat:no-repeat; background-position:center top; overflow:hidden;">
	<div id="mainBody">
		<div id="cloud1" class="cloud"></div>
		<div id="cloud2" class="cloud"></div>
	</div>

	<div class="logintop">
		<span>欢迎登录电子票后台管理平台</span>
		<ul>
			<li><a href="#">回首页</a></li>
			<li><a href="#">帮助</a></li>
			<li><a href="#">关于</a></li>
		</ul>
	</div>

	<div class="loginbody">
		<span class="systemlogo"></span>
		<div class="loginbox">
			<form class="login_form">
				<ul>
					<li><input id="username" name="username" type="text"
						class="loginuser" value="admin" onclick="JavaScript:this.value=''" /></li>
					<li><input id="password" name="password" type="password"
						class="loginpwd" value="admin" onclick="JavaScript:this.value=''" /></li>
					<li><input id="btn_submit" name="btn_submit" type="button"
						class="loginbtn" value="登录" /><label><input name=""
							type="checkbox" value="" checked="checked" />记住密码</label><label><a
							href="#">忘记密码？</a></label></li>
				</ul>
			</form>
		</div>
	</div>


	<div class="loginbm">技术支持：游惠宝(深圳)网络科技有限公司</div>
</body>
</html>
