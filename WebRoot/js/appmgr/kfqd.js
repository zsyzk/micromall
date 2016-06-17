var id = "";
var Ymsg = "";
var Nmsg = "";
var currnum = 1;
function setCurrnum(curr){
	currnum = curr;
}
function init() {
	
	 
	var kfqd_form = "<form id = kfqdForm class=formbody style='overflow-y: auto;width:800px;height: 400px'>"+
	"<input name=kfqdId type=hidden />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>系统编码&nbsp;&nbsp;<font color=red>*</font></label><input id=xtbm name=xtbm type=text class=dfinput maxlength=50 /><br></li>"+
	"<li><label>系统编码描述</label><textarea id=xtbmms class=textinput name=xtbmms maxlength=200 ></textarea><br></li>"+
	"<li><label>客户编码</label><input id=kfbm name=kfbm type=text class=dfinput maxlength=50 /><br></li>"+
	"<li><label>客户编码描述</label><textarea id=kfbmms class=textinput name=kfbmms maxlength=200 ></textarea><br></li>"+
	"<li><div style='width: 700px' align='center'><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></div></li>"+
	"</ul></form>";
	
	$(".click_refresh").click(function(e) {
		
		pageFunction(5,1);
	});

	$(".click_add").on("click", function() {
		var layerWin=openLayer({type:1,html:kfqd_form,area:[800,'auto'],title:'系统编码管理'});
		$("#kfqdForm #yes").on("click",function(){
			submit_addzbsstype();
		});
		$("#kfqdForm #no").on("click",function(){
			layer.close(layerWin);
		});
	});
	
	$(".click_delete").on("click",function(){
		id =  $("#kfqd .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			deletezbsstype(id);
		}
	});
	
	$(".click_update").on("click",function(){
		/*clearform($("kfqdForm"));*/
		id =  $("#kfqd .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "kfqd_getById.shtm",
				type : "POST",
				data : '{"kfqdId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						var layerWin= openLayer({type:1,html:kfqd_form,area:[800,'auto'],title:'系统编码管理'});
						json2Form(config,"#kfqdForm");
						$("#kfqdForm #yes").on("click",function(){
							submit_addzbsstype();
						});
						$("#kfqdForm #no").on("click",function(){
							layer.close(layerWin);
						});
					}
				}
			});
			
		}
	});
	
	/*$("#kfqd .tablelist .tablelink").on("click",function(){
		id = $(this).attr("fid");
		var tag = $(this).text();
		if(tag == "查看"){
			if(null==id || ""==id){
				layer.alert("请选择一项!",8);
				return;
			}else{
				$.ajax({
					url:getRootPath() + "kfqd_getById.shtm",
					type : "POST",
					data : '{"kfqdId":'+id+'}',
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					success : function(result) {
						if (null==result || ""==result) {
							layer.alert("查询失败",8);
							return;
						}else {
							var config = eval('('+result+')');
							openLayer({type:1,html:kfqd_form,area:[800,'auto'],title:'系统编码管理'});
							json2Form(config,"#kfqdForm");
							$("#kfqdForm .scbtn").attr("type","hidden");
						}
					}
				});
			}
		}else if(tag == "删除"){
			deletezbsstype(id);
		}
			
	});*/
	
	
	$(".click_view").on("click",function(){	
		id =  $("#kfqd .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "kfqd_getById.shtm",
				type : "POST",
				data : '{"kfqdId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						openLayer({type:1,html:kfqd_form,area:[800,'auto'],title:'系统编码管理'});
						json2Form(config,"#kfqdForm");
						$("#kfqdForm .scbtn").attr("type","hidden");
					}
				}
			});
		}
	});
	
	/**
	*复选框只能选一个
	*/
	$('#kfqd .tablelist input[type="checkbox"]').on("click",function(){
		var select = $('#kfqd .tablelist input[type="checkbox"]:checked');
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

//删除
function deletezbsstype(id){
	openLayer({
		type : 0,
		msg : "确认删除吗？",
		btns : 2,
		btn : [ '确定','取消' ],
		yes:function yes(){
			$.ajax({
				url:getRootPath() + "kfqd_delete.shtm",
				type : "POST",
				data : '{"kfqdId":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						function yes(){
							pageFunction(5,currnum);
						};
						openLayer({
							type : 0,
							msg : "删除成功！",
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
		},
		title : '系统温馨提示',
		area : [ '300', '220' ],
		icon : 4
	});
}

//更新
function refresh(){
	//先不采用AJAX刷新表格，后续做分页时一起开发，采用重新加载页面 r
	$.ajax({
		url : getRootPath() + "dispatcher.shtm?mark=5",
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
function submit_addzbsstype() {
	
	if(0 == $('#xtbm').val().length){
		layer.alert("系统编码不能为空 ！",3);
		return;
	}
	var url = getRootPath() + "kfqd_save.shtm";
	if(id=="" || id == null){
		Ymsg = "您好！新增系统编码管理成功。";
		Nmsg = "您好！新增系统编码管理失败。";
	}else{
		Ymsg = "您好！修改系统编码管理成功。";
		Nmsg = "您好！修改系统编码管理失败。";
	}
		
	var data = serializeJson($('#kfqdForm'));
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
					pageFunction(5,currnum);
				}
				openLayer({
					type : 0,
					msg : Ymsg,
					btns : 1,
					btn : [ '确定' ],
					yes: yes,
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

// 刷新数据
function getTerms() {
	var url = getRootPath() + "kfqd_get.shtm";

	$.ajax({
		url : url,
		type : "POST",
		contentType : "application/json; charset=utf-8",
		datatype : "json",
		// data : json2str(data),
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				alert(result.data);
				// 更新Table
				var data_table = $("#data_table");
				var data = '${termss}';
				if (null != data && "" != data) {
					var evalData = eval('('+data+')');
					for ( var d in evalData) {
						var tb_tr ="";
						leftMenu +="<dd>";
					}
				}
			} else {
				openLayer({
					type : 0,
					msg : "您好~ 数据刷新失败~",
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
