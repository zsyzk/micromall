$(function(){
	 var vform = $(".formbody").Validform({
		 tiptype:3,
		 beforeSubmit:function(curform){
			 return false;
		 }
	 });
	 var url = getRootPath()+'modify_pwd.shtm';	
	 var action = 'UserAction';
	 
	 $("#yes").on('click',function(){
			if(!vform.check(false)){
				 return;
			 }
				var data = serializeJson($("#modifyPwdForm").eq(0));
				var loading = layer.load('执行中，请稍后....');
				$.post(url,{action:action,method:'modifyPwd',data:json2str(data)},function(result){
					layer.close(loading);
			        if (null==result || ""==result) {
			        	ztFailAlert("操作错误！请稍后重试或联系管理员!");
			        	return;
					} else {
						var returnObj = eval('('+result+')');
						if(returnObj.code == 1){
							ztSucAlert("修改用户密码成功!",function(){
								var url = getRootPath()+'/exitLogin.shtm';
								var action = 'exitLogin';
								$.post(url,{action:action,method:'exitLogin'},function(result){
									parent.location.href = getRootPath() + "pages/root/login.jsp";
								});
							});
							return;
						}else{
							ztFailAlert(returnObj.msg);
							return;
						}
					}
			    }); 
	});
	$("#no").on('click',function(){
		$("#old").val("");
		$("#new1").val("");
		$("#new2").val("");
	});
	 
});