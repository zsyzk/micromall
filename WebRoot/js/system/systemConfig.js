var id = "";
var Ymsg = "";
var Nmsg = "";

function init() {
	
	 
	var systemConfig_form = "<form id = systemConfigForm class=formbody style='overflow-y: auto;width:800px;height: 400px'>"+
	"<input name=scid type=hidden />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>参数名称</label><input id=key name=key type=text class=dfinput readonly=readonly/><br></li>"+
	"<li><label>参数值</label><input id=value name=value type=text class=dfinput /><br></li>"+
	"<li><label>&nbsp;</label><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></li>"+
	"</ul></form>";
	
	$(".click_refresh").click(function(e) {
		
		refresh();
	});
	
	$(".click_default").on("click",function(){
		id =  $("#systemconfig .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "systemconfig_default.shtm",
				type : "POST",
				data : '{"scid":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("还原失败",8);
						return;
					}else {
						function yes(){
							refresh();
						};
						openLayer({
							type : 0,
							msg : "还原成功！",
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
			
		}
});

	$(".click_update").on("click",function(){
		id =  $("#systemconfig .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "systemconfig_get_by_id.shtm",
				type : "POST",
				data : '{"id":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						var layerWin = openLayer({type:1,html:systemConfig_form,area:[800,'auto'],title:'参数配置'});
						json2Form(config,"#systemConfigForm");
						$("#systemConfigForm #yes").on("click",function(){
							
							submit_addSystemConfig();
						});
						$("#systemConfigForm #no").on("click",function(){
							layer.close(layerWin);
						});
					}
				}
			});
			
		}
	});
	
	$(".click_view").on("click",function(){
		id =  $("#systemconfig .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "systemconfig_get_by_id.shtm",
				type : "POST",
				data : '{"id":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						openLayer({type:1,html:systemConfig_form,area:[800,'auto'],title:'参数配置'});
						json2Form(config,"#systemConfigForm");
						$("#systemConfigForm .scbtn").attr("type","hidden");
					}
				}
			});
		}
	});
	
	/**
	*复选框只能选一个
	*/
	$('#systemconfig .tablelist input[type="checkbox"]').on("click",function(){
		var select = $('#systemconfig .tablelist input[type="checkbox"]:checked');
		select.prop({checked:false});
		if(select.length==0){
			$(this).prop({checked:false});
		}else if(select.length==1){
			$(this).prop({checked:true});
		}else if(select.length==2){
			$(this).prop({checked:true});
		}
	});

}


//更新
function refresh(){
	//先不采用AJAX刷新表格，后续做分页时一起开发，采用重新加载页面 r
	$.ajax({
		url : getRootPath() + "dispatcher.shtm?mark=32",
		type : "POST",
		contentType : "application/json; charset=utf-8",
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				window.parent.frames["rightFrame"].location.href=getRootPath()+result.data.url;
				//修改为操作DOM table
			} else {
				openLayer({type:0,msg:"刷新失败",btns:1,btn:['确定'],title:'系统温馨提示',area:['300','220'],icon:8});
			}
		}
	});
}

//添加
function submit_addSystemConfig() {
	var url = getRootPath() + "systemconfig_update.shtm";
	if(id=="" || id == null){
		Ymsg = "您好！新增参数配置成功。";
		Nmsg = "您好！新增参数配置失败。";
	}else{
		Ymsg = "您好！修改参数配置成功。";
		Nmsg = "您好！修改参数配置失败。";
	}
	$("#systemConfigForm #yes").on("click",function(){
		var data = serializeJson($('#systemConfigForm'));
		$.ajax({
			url : url,
			type : "POST",
			contentType : "application/json; charset=utf-8",
			datatype : "json",
			data : json2str(data),
			success : function(data, stats) {
				var result = $.parseJSON(data);
				if (1 == result.code) {
					function yes(){
						refresh();
					};
					openLayer({
						type : 0,
						msg : Ymsg,
						btns : 1,
						btn : [ '确定' ],
						yes:yes,
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
	});
}

