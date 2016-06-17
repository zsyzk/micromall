/*var currnum = 1;
var layerWin  = null;
var condition = null;var conditionBefore = null;*/
var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 1;

function init() {
	// 初始化使用条款新增、编辑页面。
	var sytkWindow = "<div><form id='sytk_add_form' class='formbody'  style='overflow-y: auto;width:800px;height: 430px'> "
			+ " <div class='formbody'><div class='usual'>"
			+ " <div class='itab'><ul id='target'><li><a href='#traditional' id='traditional_a'  >繁体版本</a></li><li><a href='#simplified' id='simplified_a' class='selected'>简体版本</a></li></ul></div> "
			+ " <div id='traditional' class='tabson' >"
			+ "<ul class='forminfo'> <li><label>版本内容(繁体)&nbsp;&nbsp;<font color=red>*</font></label> <textarea id='contentTraditional' style='width:700px;height:300px;border:solid 1px gray; border-radius:3px;'></textarea></li>"
			+ " </ul></div> "
			+ "<div id='simplified' class='tabson' >"
			+ "<ul class='forminfo'>  <li><label>版本内容(简体)&nbsp;&nbsp;<font color=red>*</font></label> <textarea id='contentSimplified' style='width:700px;height:300px;border:solid 1px gray; border-radius:3px;'></textarea></li>"
			+ "</ul></div> "
			+ "<div style='width: 700px' align='center'> <input id=save type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=closeWindow type=button class=scbtn value='关闭'/> </div> "
			+ "</div></div><input name='sytkid' type='hidden' id='sytkid' /><input name='status' type='hidden' id='status' /></form></div>";

	$(".click_add").on("click", function() {
		layerWin = openLayer({
			type : 1,
			html : sytkWindow,
			area : [ 800, 'auto' ],
			title : '新增使用条款'
		});
		
		$("#sytk_add_form #closeWindow").on("click", function() {
			layer.close(layerWin);
		});

		$("#sytk_add_form #save").on("click", function() {
			submit_terms();
		});

		$("#sytk_add_form #target").idTabs();

	});

	$("#xj").hide();


	$(".click_refresh").click(function(e) {
		setPage(mark, condition,true);	
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

	$(".click_update")
			.on("click",function() {
						id = $(".tablelist input[type='checkbox']:checked")
								.attr("fid");
						if (null == id || "" == id) {
							layer.alert("请选择一项!", 8);
							return;
						} else {
							$.ajax({url : getRootPath()+ "terms_getById.shtm",
									type : "POST",
									data : '{"sytkid":' + id + '}',
									contentType : "application/json; charset=utf-8",
									datatype : "json",
									success : function(result) {
										if (null == result || "" == result) {
											return;
										} else {
											layerWin = openLayer({
											type : 1,
											html : sytkWindow,
											area : [ 800, 'auto' ],
											title : '编辑使用条款'
											});

												$("#sytk_add_form #target").idTabs();

												var config = eval('(' + result+ ')');

												$("#sytk_add_form #sytkid").val(config.sytkid);
												$("#sytk_add_form #status").val(config.status);
												$("#sytk_add_form #contentTraditional").val(config.textTraditional);
												$("#sytk_add_form #contentSimplified").val(config.textSimplified);

												// submit_addsytk();
												$("#sytk_add_form #closeWindow")
														.on("click",function() {
															layer.close(layerWin);
												});

												$("#sytk_add_form #save")
														.on("click",function() {
																	// 保存更新使用条款
													submit_terms_update();
												});

											}
										}
									});

						}
					});

	$(".click_public").click(function(e) {
		id = $(".tablelist input[type='checkbox']:checked").attr("fid");
		if (null == id || "" == id) {
			layer.alert("请选择一项!", 8);
			return;
		} else {
			$.ajax({
				url : getRootPath() + "terms_public.shtm",
				type : "POST",
				data : '{"sytkid":' + id + ',publicStatu:10}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null == result || "" == result) {
						layer.alert("查询失败", 8);
						return;
					} else {
						var result = eval('(' + result + ')');
						if (2 == result.code) {
							layer.alert(result.msg, 8);
							return;
						}else{
							var ol = openLayer({
								type : 0,
								msg : "发布成功！",
								btns : 1,
								btn : [ '确定' ],
								yes : function yes() {
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

	$(".click_delete").on("click", function() {
		id = $(".tablelist input[type='checkbox']:checked").attr("fid");
		if (null == id || "" == id) {
			layer.alert("请选择一项!", 8);
			return;
		} else {
			deletesytk(id);
		}
	});

	$("#btn_submit").bind("click", function() {
		submit_terms();
	});

/*	$(".select1").uedSelect({
		width : 345
	});
	$(".select2").uedSelect({
		width : 167
	});
	$(".select3").uedSelect({
		width : 100
	});*/

	$(".click_view").on("click", function() {
		id = $(".tablelist input[type='checkbox']:checked").attr("fid");
		if (null == id || "" == id) {
			layer.alert("请选择一项!", 8);
			return;
		} else {
			$.ajax({url : getRootPath()+ "terms_getById.shtm",
					type : "POST",
					data : '{"sytkid":' + id + '}',
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					success : function(result) {
						if (null == result || "" == result) {
							return;
						} else {
							var layerWin = openLayer({
							type : 1,
							html : sytkWindow,
							area : [ 800, 'auto' ],
							title : '编辑使用条款'
							});

								$("#sytk_add_form #target").idTabs();

								var config = eval('(' + result+ ')');

								$("#sytk_add_form #sytkid").val(config.sytkid);
								$("#sytk_add_form #status").val(config.status);
								$("#sytk_add_form #contentTraditional").val(config.textTraditional);
								$("#sytk_add_form #contentSimplified").val(config.textSimplified);

								$("#sytk_add_form .scbtn").attr("type","hidden");

							}
						}
					});

		}
	
	});
	
	/**
	 * 初始化分布分页
	 */
	setPage(1, null, true);

}

// 删除
function deletesytk(id) {
	openLayer({
		type : 0,
		msg : "确认删除吗？",
		btns : 2,
		btn : [ '确定','取消' ],
		yes:function yes(){
			$.ajax({
				url : getRootPath() + "terms_delete.shtm",
				type : "POST",
				data : '{"sytkid":' + id + '}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null == result || "" == result) {
						layer.alert("查询失败", 8);
						return;
					} else {
						var result = eval('(' + result + ')')
						if (2 == result.code) {
							layer.alert(result.msg, 8);
							return;
						} else {
							var ol = openLayer({
								type : 0,
								msg : "删除成功！",
								btns : 1,
								btn : [ '确定' ],
								yes : function(){
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

function submit_terms() {
	// var text = KE.text("content7");
	var traditional = $("#sytk_add_form #contentTraditional").val();
	var simplified = $("#sytk_add_form #contentSimplified").val();
	
	if((null == traditional || "" == traditional) || (null == simplified|| "" == simplified))
	{
		openLayer({
			type : 0,
			msg : "尊敬的系统用户：使用条款不能为空！",
			btns : 1,
			btn : [ '确定' ],
			title : '系统温馨提示',
			area : [ '400', '200' ],
			icon : 8
		});
		return;
	}

	var url = getRootPath() + "terms_save.shtm";

	var data = new Object;
	data.textSimplified = simplified;
	data.textTraditional = traditional;
	data.status = 3;
	data.sytkid = $("#sytkidvalue").val();

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
					msg : "尊敬的系统用户：使用条款新建成功！",
					btns : 1,
					btn : [ '确定' ],
					yes: function(){
						setPage(mark, condition,true);
						layer.close(ol);
						layer.close(layerWin);
					},
					title : '系统温馨提示',
					area : [ '400', '200' ],
					icon : 1
				});
			} else {
				openLayer({
					type : 0,
					msg : "您好！使用条款更新失败。",
					btns : 1,
					btn : [ '确定' ],
					title : '系统温馨提示',
					area : [ '400', '200' ],
					icon : 8
				});
			}
		}
	});
}

function submit_terms_update() {
	// var text = KE.text("content7");
	var traditional = $("#sytk_add_form #contentTraditional").val();
	var simplified = $("#sytk_add_form #contentSimplified").val();
	
	if((null == traditional || "" == traditional) && (null == simplified|| "" == simplified))
	{
		openLayer({
			type : 0,
			msg : "尊敬的系统用户：使用条款不能为空！",
			btns : 1,
			btn : [ '确定' ],
			title : '系统温馨提示',
			area : [ '400', '200' ],
			icon : 8
		});
		return;
	}
	
	var url = getRootPath() + "terms_save.shtm";

	var data = new Object;
	data.textSimplified = simplified;
	data.textTraditional = traditional;
	
	data.sytkid = $("#sytkid").val();
	data.status = $("#status").val();
	
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
					msg : "尊敬的系统用户：使用条款编辑成功！",
					btns : 1,
					btn : [ '确定' ],
					yes: function(){
						layer.close(ol);
						layer.close(layerWin);
						setPage(mark, condition,false);
					},
					title : '系统温馨提示',
					area : [ '400', '200' ],
					icon : 1
				});

			} else {
				openLayer({
					type : 0,
					msg : "您好！使用条款更新失败！",
					btns : 1,
					btn : [ '确定' ],
					title : '系统温馨提示',
					area : [ '400', '200' ],
					icon : 8
				});
			}
		}
	});
}

