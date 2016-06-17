<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<script type="text/javascript">
</script>
<style type="text/css">
	.list{
		outline-style: none;
	}
	.list li{
		margin-left: 10px;
		float: left; 
		width: 140px;
		height: 120px; 
		background-color: red;
	}
</style>
	<div class="place">
    <span>位置：</span>
    <ul class="placeul">
    <li><a href="#">首页</a></li>
    </ul>
    </div>
    
    <div class="mainbox">
    
        <div class="mainleft" >
    
    
    <div class="leftinfo" style="height: 200px">
    <div class="listtitle">列表</div>
      <ul class="list">
        	<li></li><li></li><li></li><li></li><li></li>
        </ul>
    </div>
     <div class="leftinfo" style="height: 380px">
    <div class="listtitle">内容</div>    
    <table class="tablelist">
    	<thead>
    	<tr>
        <th>标题</th>
        <th>时间</th>
        </tr>
        </thead>
        <tbody>
        <tr>
        <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
        <td>2013-09-01 10:26</td>
        </tr>    
        <tr>
        <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
        <td>2013-09-01 10:26</td>
        </tr>  
        <tr>
        <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
        <td>2013-09-01 10:26</td>
        </tr>  
        <tr>
        <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
        <td>2013-09-01 10:26</td>
        </tr>  
        <tr>
        <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
        <td>2013-09-01 10:26</td>
        </tr>  
        <tr>
        <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
        <td>2013-09-01 10:26</td>
        </tr>  <tr>
        <td>山东章丘公车进饭店景点将自动向监控系统报警</td>
        <td>2013-09-01 10:26</td>
        </tr>  
          
        </tbody>
    </table>
     <div class="pagin">
    	<div class="message">共<i class="blue">1256</i>条记录，当前显示第&nbsp;<i class="blue">2&nbsp;</i>页</div>
        <ul class="paginList">
        <li class="paginItem"><a href="javascript:;"><span class="pagepre"></span></a></li>
        <li class="paginItem"><a href="javascript:;">1</a></li>
        <li class="paginItem current"><a href="javascript:;">2</a></li>
        <li class="paginItem"><a href="javascript:;">3</a></li>
        <li class="paginItem"><a href="javascript:;">4</a></li>
        <li class="paginItem"><a href="javascript:;">5</a></li>
        <li class="paginItem more"><a href="javascript:;">...</a></li>
        <li class="paginItem"><a href="javascript:;">10</a></li>
        <li class="paginItem"><a href="javascript:;"><span class="pagenxt"></span></a></li>
        </ul>
    </div>
    </div>
   
    
    
    </div>
    
    <div class="mainright" style="padding-left:298px;">
    
    
    <div class="dflist" style="height: 200px">
    <div class="listtitle">个人信息</div>
    <div style="text-align: center;">
    <span><img style="width: 40px;height: 40px;" src="<%=basePath%>images/img01.png" /></span>
    <h2><a href="#">姓名：小明</a></h2>
    <h2><a href="#">部门：开发部</a></h2>
    </div>
    </div>
    <!--leftinfo end-->
        <div class="dflist" style="height: 380px">
    <div class="listtitle">服务</div>
        <span><img style="width: 40px;height: 40px;" src="<%=basePath %><%=basePath%>images/main/001.jpg" />编辑资料</span>
    </div>
    
    </div>
    <!--mainleft end-->
    
    

    </div>
