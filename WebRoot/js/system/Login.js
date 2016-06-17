/**
 * 登录初始化
 */
function loginInit() {

	$("#username").keypress(function(e) {
		var key = e.which;
		if (key == 13) {
			$("#password").attr("value", "").focus();
		}
	});

	$("#password").keypress(function(e) {
		var key = e.which;
		if (key == 13) {
			submit();
		}
	});

	$("#btn_submit").bind("click", function() {
		submit();
	});
}

/**
 * 提交
 */
function submit() {
	// $.post(getRootPath() + "login.shtm", {
	// data : json2str(serializeJson($(".login_form")))
	// }, function(result) {
	// alert(result);
	// });

	var data = serializeJson($(".login_form"));
	var url = getRootPath() + "login.shtm";

	$.ajax({
		url : url,
		type : "POST",
		contentType : "application/json; charset=utf-8",
		datatype : "json",
		data : json2str(data),
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				window.location.href = getRootPath() + "pages/system/main.jsp";
			} else {
				openLayer({type:0,msg:"您输入的用户名与密码不匹配，请重新输入...",btns:1,btn:['确定'],title:'系统温馨提示',area:['300','220'],icon:8});
			}
			// var thing = '[{ "plugin": "jquery-json", "version": 2.4 }]';
			//
			// var sss = $.parseJSON(thing);
			//
			// alert(sss[0].plugin);
			// alert(data);
			// var result = $.parseJSON(decodeURI(data, "utf-8"));
			// alert(result[0].mc);
		}
	});
}
