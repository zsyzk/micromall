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

<title>My JSP 'index.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<link href="css/style.css" rel="stylesheet" type="text/css" />
<link rel="stylesheet" type="text/css" href="<%=basePath%>js/layer/skin/layer.css">
<script type="text/javascript" src="<%=basePath%>js/jquery.js"></script>
<script src="<%=basePath%>js/layer/layer.min.js" type="text/javascript"></script>
<script src="<%=basePath%>js/util/ztLayer.js" type="text/javascript"></script>
<script src="<%=basePath%>js/util/uContext.js" type="text/javascript"></script>
</head>

<body>

	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainindex">
    
    
    <div class="welinfo">
    <span><img src="<%=basePath%>images/sun.png" alt="天气" /></span>
    <b>亲爱的【<%=session.getAttribute("username") %>】您好，欢迎使用电子票后台管理平台</b>
    <a href="http://www.uhuibao.com" target="_blank">帐号设置</a>
    </div>
    
    <div class="welinfo">
    <span><img src="<%=basePath%>images/time.png" alt="时间" /></span>
    <i>您上次登录的时间：2013-10-09 15:22</i> （不是您登录的？<a href="http://www.uhuibao.com" target="_blank">请点这里</a>）
    </div>
    
    <div class="xline"></div>
    
    <ul class="iconlist">
    
    <li><img src="<%=basePath%>images/ico01.png" /><p><a href="#">快捷功能</a></p></li>
    <li><img src="<%=basePath%>images/ico02.png" /><p><a href="#">快捷功能</a></p></li>
    <li><img src="<%=basePath%>images/ico03.png" /><p><a href="#">快捷功能</a></p></li>
    <li><img src="<%=basePath%>images/ico04.png" /><p><a href="#">快捷功能</a></p></li>
    <li><img src="<%=basePath%>images/ico05.png" /><p><a href="#">快捷功能</a></p></li>
    <li><img src="<%=basePath%>images/ico06.png" /><p><a href="#">快捷功能</a></p></li> 
            
    </ul>
    
    <div class="ibox"><a class="ibtn"><img src="<%=basePath%>images/iadd.png" />添加新的快捷功能</a></div>
    
    <div class="xline"></div>
    <div class="box"></div>
    
    <div class="welinfo">
    <span><img src="<%=basePath%>images/dp.png" alt="提醒" /></span>
    <b>电子票后台管理平台使用指南</b>
    </div>
    
    <ul class="infolist">
    <li><span>您可以。。。。</span><a class="ibtn">点击我</a></li>
    <li><span>您可以。。。。</span><a class="ibtn">点击我</a></li>
    <li><span>您可以进行密码编辑、账户设置等操作</span><a class="ibtn">点击我</a></li>
    </ul>
    
    <div class="xline"></div>
    
    <div class="uimakerinfo"><b>查阅详情电子票后台管理平台使用指南</b>(<a href="http://www.uhuibao.com" target="_blank">www.uhuibao.com</a>)</div>
    
    <ul class="umlist">
    <li><a href="#">如何XXX</a></li>
    <li><a href="#">如何XXX</a></li>
    <li><a href="#">如何XXX</a></li>
    <li><a href="#">如何XXX</a></li>
    <li><a href="#">如何XXX</a></li>
    </ul>
    
    
    </div>
    
    

</body>
</html>
