/*var id = "";
var Ymsg = "";
var Nmsg = "";
var currnum = 1;
var layerWin  = null;
var condition = null;var conditionBefore = null;*/
var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 7;
function init() {
	var appversion_from = "<form id = appversionForm class=formbody style='overflow-y: auto;width:800px;height: 400px'>"+
	"<input name=versionId type=hidden />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>版本号&nbsp;&nbsp;<font color=red>*</font></label><input id=version name=version type=text class=dfinput maxlength=50/><br></li>"+
	"<li><label>客户端类型</label><select id=appType name=appType class=dfinput><option value=2>苹果IOS</option><option value=1>谷歌ANDROID</option> </select><br><br></li>"+
	"<li><label>下载地址</label><input id=url name=url type=text class=dfinput maxlength=100 /><br></li>"+
	"<li><label>描述</label><textarea id=content class=textinput name=content maxlength=500 ></textarea><br></li>"+
	"<li><div style='width: 700px' align='center'><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></div></li>"+
	"</ul></form>";
	
	$(".click_refresh").click(function(e) {
		setPage(mark, condition,true);		
	});
	
	/**
	 * 更新版本
	 */
	$(".click_up_app").on("click",function(){
		id =  $("#appversion .tablelist input[type='checkbox']:checked").attr("fid");
		var key = $("#appversion .tablelist input[type='checkbox']:checked").attr("pn");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "appversion_update.shtm",
				type : "POST",
				data : "{'versionId':'"+id+"','keys':'"+key+"'}",
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("版本更新失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						if(2 == result.code){
							layer.alert("版本更新失败！",8);
							return;
						}else{
							var ol = openLayer({
								type : 0,
								msg : "版本更新成功！",
								btns : 1,
								btn : [ '确定' ],
								yes:function(){
									setPage(mark, condition,false);
									layer.close(ol);
								},
								title : '系统温馨提示',
								area : [ '300', '220' ],
								icon : 1
							});
						}
						
					}
				}
			});
			
		}
	});
	
	

	$(".click_add").on("click", function() {
		layerWin=openLayer({type:1,html:appversion_from,area:[800,'auto'],title:'新增APP版本'});
		
		$("#appversionForm #no").on("click",function(){
			layer.close(layerWin);
		});
		
		$("#appversionForm #yes").on("click",function(){
			submit_addzbsstype();
		});
	});
	
	
	$(".click_delete").on("click",function(){
		id =  $("#appversion .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			deletezbsstype(id);
		}
	});
	
	$(".click_update").on("click",function(){
		id =  $("#appversion .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "appversion_getById.shtm",
				type : "POST",
				data : '{"versionId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						layerWin= openLayer({type:1,html:appversion_from,area:[800,'auto'],title:'App版本信息'});
						json2Form(config,"#appversionForm");
						if(config.clientType == 1){
							$("#appType option[value='1']").attr('selected', 'true'); 
						}else{
							$("#appType option[value='2']").attr('selected', 'true'); 
						}
						$("#appversionForm #yes").on("click",function(){
							submit_addzbsstype();
						});
						$("#appversionForm #no").on("click",function(){
							layer.close(layerWin);
						});
					}
				}
			});
			
		}
	});
	
	$(".click_view").on("click",function(){
		id =  $("#appversion .tablelist input[type='checkbox']:checked").attr("fid");
			if(null==id || ""==id){
				layer.alert("请选择一项!",8);
				return;
			}else{
				$.ajax({
					url:getRootPath() + "appversion_getById.shtm",
					type : "POST",
					data : '{"versionId":'+id+'}',
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					success : function(result) {
						if (null==result || ""==result) {
							layer.alert("查询失败",8);
							return;
						}else {
							var config = eval('('+result+')');
							openLayer({type:1,html:appversion_from,area:[800,'auto'],title:'App版本信息'});
							json2Form(config,"#appversionForm");
							if(config.clientType == 1){
								$("#appType option[value='1']").attr('selected', 'true'); 
							}else{
								$("#appType option[value='2']").attr('selected', 'true'); 
							}
							$("#appversionForm .scbtn").attr("type","hidden");
						}
					}
				});
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
	
	/**
	 * 初始化分布分页
	 */
	setPage(7, null, true);

}

//删除
function deletezbsstype(id){
	openLayer({
		type : 0,
		msg : "确认删除吗？",
		btns : 2,
		btn : [ '确定','取消' ],
		yes:function yes(){
			$.ajax({
				url:getRootPath() + "appversion_delete.shtm",
				type : "POST",
				data : '{"versionId":'+id+'}',
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
							var ol = openLayer({
								type : 0,
								msg : "删除成功！",
								btns : 1,
								btn : [ '确定' ],
								yes:function(){
									setPage(mark, condition,false);
									layer.close(ol);
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
function submit_addzbsstype() {
	var url = getRootPath() + "appversion_save.shtm";
	if(id=="" || id == null){
		Ymsg = "您好！新增aap版本成功。";
		Nmsg = "您好！新增aap版本失败。";
	}else{
		Ymsg = "您好！修改aap版本成功。";
		Nmsg = "您好！修改aap版本失败。";
	}
	var data = serializeJson($('#appversionForm'));
	if(0 == $('#version').val().length){
		layer.alert("App版本号不能为空 ！",3);
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
				var ol = openLayer({
					type : 0,
					msg : Ymsg,
					btns : 1,
					btn : [ '确定' ],
					yes: function yes(){
						if(id=="" || id == null){
							setPage(mark, condition,true);
						}else{
							setPage(mark, condition,false);
						}
						layer.close(ol);
						layer.close(layerWin);
					},
					title : '系统温馨提示',
					area : [ '300', '220' ],
					icon : 1
				});
			} else {
				if(result!=null){
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
