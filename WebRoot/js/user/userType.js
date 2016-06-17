//var id = "";
//var Ymsg = "";
//var Nmsg = "";
//var currnum = 1;
//var layerWin  = null;
//var condition = null;var conditionBefore = null;


var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 31;

function init() {
	
	 
	var userType_form = "<form id = usersTypeForm class=formbody style='overflow-y: auto;width:800px;height: 400px'>"+
	"<input name=userTypeId type=hidden />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>用户类型名称&nbsp;&nbsp;<font color=red>*</font></label><input id=typeName name=typeName type=text class=dfinput maxlength=50 /><br></li>"+
	"<li><label>描述</label><textarea id=typeMs class=textinput name=typeMs maxlength=100 ></textarea><br></li>"+
	"<li><div style='width: 700px' align='center'><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></div></li>"+
	"</ul></form>";
	
	var tree = "<div style='width:600px;height: 400px;'><div id='treebox' style='width:600px;height: 355px;overflow:auto;'></div><center style='width:600px;height: 20px;'><input id=yes type=button class=scbtn value='保存'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></center></div>";
	
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
	
	$(".click_refresh").click(function(e) {
		setPage(mark, condition,true);		
	});

	$(".click_add").on("click", function() {
		
		layerWin = openLayer({type:1,html:userType_form,area:[800,'auto'],title:'用户类型信息'});
		
		$("#usersTypeForm #no").on("click",function(){
			layer.close(layerWin);
		});
		$("#usersTypeForm #yes").on("click",function(){
			submit_addUser();
		});
	});
	
	$(".click_delete").on("click",function(){
		id =  $("#userType .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			deleteUserType(id);
		}
	});
	
	$(".click_update").on("click",function(){
		id =  $("#userType .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "userType_getById.shtm",
				type : "POST",
				data : '{"userTypeId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						layerWin = openLayer({type:1,html:userType_form,area:[800,'auto'],title:'用户信息'});
						json2Form(config,"#usersTypeForm");
						$("#usersTypeForm #yes").on("click",function(){
							submit_addUser();
						});
						$("#usersTypeForm #no").on("click",function(){
							layer.close(layerWin);
						});
					}
				}
			});
			
		}
	});
	
	$(".click_permission").on("click",function(){
		
		var id =  $("#userType .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			var layerTree = openLayer({type:1,html:tree,title:'权限设置',success:initTree});
		}
		
		function initTree(layero){
			var initTreeUrl = getRootPath() + "userType_initPerTree.shtm";
			$.ajax({
				url : initTreeUrl,
				type : "POST",
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(data, stats) {
					var tree=new dhtmlXTreeObject("treebox","100%","90%",0);
					tree.setImagePath(getRootPath()+"js/tree/csh_bluebooks/");
					tree.enableCheckBoxes(1);
					tree.enableThreeStateCheckboxes(true);
					tree.loadXMLString(data);
					var geturl = getRootPath() + "userType_getPermission.shtm";
					$.ajax({
						url : geturl,
						type : "POST",
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						data : "{id:"+id+"}",
						success : function(data, stats) {
							setTimeout(initSelect, 200);
							function initSelect(){
								if(data){
									var ps = data.split(",");
									for(var p in ps){
										tree.setCheck(ps[p],true);
									}
								}/*else{
									layer.alert("查询权限失败",8);
									return;
								}*/
							}
						}
					});
					
					
					
					layero.find("#no").on("click",function(){
						layer.close(layerTree);
					});
					layero.find("#yes").on("click",function(){
						var permission = tree.getAllChecked();
						permission = ","+permission;
						//submit_addUser();
						var saveurl = getRootPath() + "userType_savePermission.shtm";
						$.ajax({
							url : saveurl,
							type : "POST",
							contentType : "application/json; charset=utf-8",
							datatype : "json",
							data : "{id:"+id+",permission:'"+permission+"'}",
							success : function(result, stats) {
								var result = eval('('+result+')')
								if(2 == result.code){
									layer.alert(result.msg,8);
									return;
								}else{
									function yes(){
										pageFunction(currnum);
									};
									openLayer({
										type : 0,
										msg : "保存权限成功，重新进入系统生效。",
										btns : 1,
										btn : [ '确定' ],
										yes:yes,
										title : '系统温馨提示',
										area : [ '300', '220' ],
										icon : 1
									});
								}
							}
						});
						layer.close(layerTree);
					});
				}
			});
			
		}
		
	});
	
	$(".click_view").on("click",function(){
		id =  $("#userType .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "userType_getById.shtm",
				type : "POST",
				data : '{"userTypeId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						openLayer({type:1,html:userType_form,area:[800,'auto'],title:'用户类型信息'});
						json2Form(config,"#usersTypeForm");
						$("#usersTypeForm .scbtn").attr("type","hidden");
					}
				}
			});
		}
	});
	
	/**
	 * 初始化分布分页
	 */
	setPage(31, null, true);
}

//删除
function deleteUserType(id){
	openLayer({
		type : 0,
		msg : "确认删除吗？",
		btns : 2,
		btn : [ '确定','取消' ],
		yes:function yes(){
			$.ajax({
				url:getRootPath() + "userType_delete.shtm",
				type : "POST",
				data : '{"userTypeId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var result = eval('('+result+')')
						if(2 == result.code){
							layer.alert(result.msg,8);
							return;
						}else{
							var temp = openLayer({
								type : 0,
								msg : "删除成功！",
								btns : 1,
								btn : [ '确定' ],
								yes:function yes(){
									setPage(mark, condition,false);
									layer.close(temp);
								},
								title : '系统温馨提示',
								area : [ '300', '220' ],
								icon : 1
							});
						}
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
	var url = getRootPath() + "userType_save.shtm";
	if(id=="" || id == null){
		Ymsg = "您好！新增用户类型成功。";
		Nmsg = "您好！新增用户类型失败。";
	}else{
		Ymsg = "您好！修改用户类型成功。";
		Nmsg = "您好！修改用户类型失败。";
	}
	if("" == $('#typeName').val()){
		layer.alert("用户类型名称不能为空 ！",3);
		return;
	};
	var data = serializeJson($('#usersTypeForm'));
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
				if(result.msg!=""){
					Nmsg=result.msg;
				}
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