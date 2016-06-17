
var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 2;

function init() {

	var users_form = "<form id = usersForm class=formbody style='overflow-y: auto;width:600px;height: 270px'>"+
	"<input name=userId type=hidden />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>用户类别</label><select id=userTypeId name=userTypeId ></select><br></li>"+
	"<li><label>用户名称&nbsp;&nbsp;<font color=red>*</font></label><input id=username name=username type=text class=dfinput maxlength=50 /><br></li>"+
	"<li><div class=formsubmit><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></div></li>"+
	"</ul></form>";
	
	$(".click_refresh").click(function(e) {
		setPage(mark, condition,true);		
	});

	$(".click_add").on("click", function() {
		//如果添加则设置id为null;
		id = null;	
		openWindow();
	});
	
	
	function openWindow(userId){
		layerWin = openLayer({type:1,html:users_form,area:[600,'auto'],title:'用户信息',success:suc});
		function suc(){
			 $("#password").on("blur",function(){
				 if($(this).val()== ""){
					 openLayer({
							type : 0,
							msg : "您还没有输入密码，请输入...",
							btns : 1,
							btn : [ '确定' ],
							title : '系统温馨提示',
							area : [ '300', '220' ],
							icon : 8
					 });
				 }
				 var reg = /^(\w){6,20}$/;
				 if(reg.test($(this).val())==false){
					 openLayer({
						type : 0,
						msg : "您的输入有误，只能输入6-20个字母、数字、下划线 ！",
						btns : 1,
						btn : [ '确定' ],
						title : '系统温馨提示',
						area : [ '300', '220' ],
						icon : 8
					});
				 }
			 });
		 }
		
		//获取用户类别
		$.ajax({
			url:getRootPath() + "userType_list_get.shtm",
			type : "POST",
			contentType : "application/json; charset=utf-8",
			datatype : "json",
			success : function(result) {
				if (null==result || ""==result) {
					var userTypeSelect = $("#usersForm #userTypeId").eq(0);
					var option = "<option>无数据</option>";
					userTypeSelect.append(option);
				}else {
					var userTypeSelect = $("#usersForm #userTypeId").eq(0);
					var userTypeObj = eval('('+result+')');
					var resultJson = userTypeObj.data;
					for(var json in resultJson){
						var option = "<option value="+resultJson[json].userTypeId+">"+resultJson[json].typeName+"</option>";
						userTypeSelect.append(option);
					}
					if(userTypeSelect.find("option").length == 0 ){
						var option = "<option>无数据</option>";
						userTypeSelect.append(option);
					}
				}
			}
		});

		if(userId){
			$.ajax({
				url:getRootPath() + "user_getById.shtm",
				type : "POST",
				data : '{"userId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						json2Form(config,"#usersForm");
					}
				}
			});
		}
		
		$("#usersForm #yes").on("click",function(){
			submit_addUser();
		});
		$("#usersForm #no").on("click",function(){
			layer.close(layerWin);
		});
}
	
	
	$(".click_delete").on("click",function(){
		id =  $("#users .tablelist input[type='checkbox']:checked").attr("id");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			deleteUser(id);
		}
	});
	
	$(".click_find").on("click",function(){
		var pnArray = [];
		$(".tablelist th").each(function(){
			var pnObj = {};
			var value = $(this).attr("pn");
			if(value){
				var name = $(this).text();
				pnObj.value = value;
				pnObj.name = name;
				pnArray.push(pnObj);
			}
		});
		
		ztSearch({data:pnArray,confirm:confirmAction,condition:conditionBefore});
		
		function confirmAction(beforeKey,key){
			conditionBefore = beforeKey;
			condition = key;
			setPage(mark, condition,false);
		}
		
	});
	
	$(".click_view").on("click",function(){
		id =  $("#users .tablelist input[type='checkbox']:checked").attr("id");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			openWindow(id);
			$("#usersForm .scbtn").attr("type","hidden");
		}
	});
	
	$(".click_update").on("click",function(){
		//clearform($("users_form"));
		id =  $("#users .tablelist input[type='checkbox']:checked").attr("id");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			openWindow(id);
		}
	});
	
	/**
	 * 初始化分布分页
	 */
	setPage(2, null, true);
}

//删除
function deleteUser(id){
	openLayer({
		type : 0,
		msg : "确认删除吗？",
		btns : 2,
		btn : [ '确定','取消' ],
		yes:function yes(){
			$.ajax({
				url:getRootPath() + "user_delete.shtm",
				type : "POST",
				data : '{"userId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var ol = openLayer({
							type : 0,
							msg : "用户删除成功！",
							btns : 1,
							btn : [ '确定' ],
							yes:function yes(){
								setPage(mark, condition,false);
								layer.close(ol);
							},
							title : '系统温馨提示',
							area : [ '300', '220' ],
							icon : 1
						});
					}
				}
			});
		},
		title : '系统温馨提示',
		area : [ '300', '220' ],
		icon : 4
	});
}

//添加
function submit_addUser() {
	var url = getRootPath() + "user_save.shtm";
	if(id=="" || id == null){
		Ymsg = "您好！新增用户成功。";
		Nmsg = "您好！新增用户失败。";
	}else{
		Ymsg = "您好！修改用户成功。";
		Nmsg = "您好！修改用户失败。";
	}
	var data = serializeJson($('#usersForm'));
	if(0 == $('#username').val().length){
		layer.alert("用户名称不能为空 ！",3);
		return;
	};

	$.ajax({
		url : url,
		type : "POST",
		contentType : "application/json; charset=utf-8",
		datatype : "json",
		data : json2str(data),
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				var temp = openLayer({
					type : 0,
					msg : Ymsg,
					btns : 1,
					btn : [ '确定' ],
					yes:function yes(){
						if(id=="" || id == null){							
							setPage(mark, condition,true);
						}else
						{
							setPage(mark, condition,false);
						}
						
						layer.close(temp);
						layer.close(layerWin);
					},
					title : '系统温馨提示',
					area : [ '300', '220' ],
					icon : 1
				});
			} else {
				openLayer({
					type : 0,
					msg : Nmsg,
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