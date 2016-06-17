var currnum = 1;
var layerWin  = null;

function init() {
	// 初始化使用条款新增、编辑页面。
	var sytkWindow = "<div><form id='sytk_add_form' class='formbody'  style='overflow-y: auto;width:800px;height: 490px'> "
			+ " <div class='formbody'><div class='usual'>"
			+ " <div class='itab'><ul id='target'><li><a href='#traditional' id='traditional_a'  >繁体版本</a></li><li><a href='#simplified' id='simplified_a' class='selected'>简体版本</a></li></ul></div> "
			+ " <div id='traditional' class='tabson' >"
			+ "<ul class='forminfo'> <li><label>版本内容(繁体)</label> <textarea id='contentTraditional' style='width:700px;height:300px;border:solid 1px gray; border-radius:3px;'></textarea></li>"
			+ " </ul></div> "
			+ "<div id='simplified' class='tabson' >"
			+ "<ul class='forminfo'>  <li><label>版本内容(简体)</label> <textarea id='contentSimplified' style='width:700px;height:300px;border:solid 1px gray; border-radius:3px;'></textarea></li>"
			+ "</ul></div> "
			+ "<span style='align:right;'> <input id=save type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=closeWindow type=button class=scbtn value='关闭'/> </span> "
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
			pageFunction(currnum);
			
	});

	/*
	 * $(".click_update").click(function(e) { $(".itab
	 * .selected").removeClass("selected"); $("#tab2").hide(); $(".itab
	 * #xj").addClass("selected"); $("#tab1").show(); });
	 */

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
						openLayer({
							type : 0,
							msg : "发布成功！",
							btns : 1,
							btn : [ '确定' ],
							yes : function yes() {
								pageFunction(currnum);
							},
							title : '系统温馨提示',
							area : [ '300', '220' ],
							icon : 1
						});
					}
				}
			});

		}

	});

	$(".click_del").on("click", function() {
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

	$(".select1").uedSelect({
		width : 345
	});
	$(".select2").uedSelect({
		width : 167
	});
	$(".select3").uedSelect({
		width : 100
	});

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
	 * 复选框只能选一个
	 */
	$('.tablelist input[type="checkbox"]').on("click", function() {
		var select = $('.tablelist input[type="checkbox"]:checked');
		select.prop({
			checked : false
		});
		if (select.length == 0) {
			$(this).prop({
				checked : false
			});
		} else if (select.length == 1) {
			$(this).prop({
				checked : true
			});
		} else if (select.length == 2) {
			$(this).prop({
				checked : true
			});
		}
	});

}

// 删除
function deletesytk(id) {
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
					openLayer({
						type : 0,
						msg : "删除成功！",
						btns : 1,
						btn : [ '确定' ],
						yes : function(){
							pageFunction(currnum);
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

function submit_terms() {
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
	data.status = 2;
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
				
				openLayer({
					type : 0,
					msg : "尊敬的系统用户：使用条款新建成功！",
					btns : 1,
					btn : [ '确定' ],
					yes: function(){
						pageFunction(1);
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
				openLayer({
					type : 0,
					msg : "尊敬的系统用户：使用条款编辑成功！",
					btns : 1,
					btn : [ '确定' ],
					yes: function(){
						layer.close(layerWin);
						pageFunction(currnum);
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

function refresh() {
	// 先不采用AJAX刷新表格，后续做分页时一起开发，采用重新加载页面
		$.ajax({
				url : getRootPath() + "dispatcher.shtm?mark=1",
				type : "POST",
				contentType : "application/json; charset=utf-8",
				success : function(data, stats) {
					var result = $.parseJSON(data);
					if (1 == result.code) {
						window.parent.frames["rightFrame"].location.href = getRootPath()
								+ result.data.url;
					} else {
						openLayer({
							type : 0,
							msg : "刷新失败",
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
	var url = getRootPath() + "terms_get.shtm";

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
					var evalData = eval('(' + data + ')');
					for ( var d in evalData) {
						var tb_tr = "";
						leftMenu += "<dd>";
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


function pageFunction(curr)
{
	var loading = layer.load("load...");
	
	currnum = curr;
	var url = getRootPath() + "page_load.shtm?mark=1&page="+curr;		
	$.ajax({
	url : url,
	type : "POST",
	contentType : "application/json; charset=utf-8",
	success : function(data, stats) {
		var result = $.parseJSON(data);
		if (1 == result.code) {
			
			$(".tablelist tbody").empty();

			if(null == result.data.termss || "" == result.data.termss)
			{
				$(".tablelist tbody").append("<tr><td  width='100%' align='center' colspan='7'>暂无验票记录。</td> </tr>");
			}else
			{			
			var jsonTemp = eval(result.data.termss);
			
			for(var i=0; i<jsonTemp.length; i++)
			{
				var status  = null;
				if(jsonTemp[i].status == 1)
				{
					status = "是";
				}else if(jsonTemp[i].status == 2)
				{
					status = "否";
				}
				
				$(".tablelist tbody").append("<tr>" +
						"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].sytkid+" /></td>" +
						"<td width='70' align='center'>"+jsonTemp[i].sytkid+"</td>" +
						"<td width='600' align='center'>"+jsonTemp[i].textTraditional+"</td>" +
						"<td width='600' align='center'>"+jsonTemp[i].textSimplified+"</td>" +
						"<td width='70' align='center'>"+status+"</td>" +
						"<td width='150' align='center'>"+jsonTemp[i].lastDate+"</td>" +
						"</tr>");
			}
			}
		}
		
		layer.close(loading);

	}
});
}

