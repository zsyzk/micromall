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

function submit() {
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
				window.location.href = getRootPath() + "pages/root/main.jsp";
			} else {
				openLayer({
					type : 0,
					msg : "您输入的用户名与密码不匹配，请重新输入...",
					btns : 1,
					btn : [ '确定' ],
					title : '系统温馨提示',
					area : [ '300', '220' ],
					icon : 8
				});
			}
		}
	});
}
