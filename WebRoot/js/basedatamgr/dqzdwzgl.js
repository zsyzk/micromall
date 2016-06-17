var currnum = 1;
var condition = null;var conditionBefore = null;
var id="";
var Ymsg = "";
var Nmsg = "";

function init() {
	
	var dq_table = "<div style='overflow-y: auto;width:800px;height: 400px'><table id=dq_table class=tablelist style='overflow-y: auto;width:100%;height: 100%'>"+
				"<thead>"+
					"<tr>"+
						"<th width=70 pn=zdid >编号</th>"+
						"<th width=200 pn=zdbaseName>地区名称</th>"+
						"<th width=150 pn=ccsj>操作</th>"+
					"</tr>"+
				"</thead>"+
				"<tbody>"+
				"</tbody>"+
			"</table></div>";
	
	
	$(".click_refresh").on("click",function(e) {
		refresh();
		//pageFunction(currnum);
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
		
		function confirmAction(beforeKey,key){conditionBefore = beforeKey;
			condition = key;
			pageFunction(1,1);
		}
		
	});
	

		$("#div_dqzd .tablelist .tablelink").on("click", function() {
		id = $(this).attr("fid");
		var tag = $(this).text();
		if (null == id || "" == id) {
			layer.alert("请选择一项!", 8);
			return;
		} else {
			$.ajax({
				url : getRootPath() + "dq_list_get.shtm",
				type : "POST",
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null == result || "" == result) {
						layer.alert("查询失败", 8);
						return;
					} else {
						var config = eval('(' + result + ')');
						var pLayer = openLayer({
							type : 1,
							html : dq_table,
							area : [ 800, 'auto' ],
							title : '关联地区列表',
							zIndex:100,
							success:initData
						});
						function initData(){
							for(var i=0;i<config.length;i++){
								$("#dq_table tbody").append(
									"<tr>"+
										"<td width='70' align='center'>"+config[i].dqid+"</td>" +
										"<td width='200' align='center'>"+config[i].dqmc+"</td>" +
										"<td width='150' align='center'><a href='javascript:void(0);' fmc='"+config[i].dqmc+"' fid='"+config[i].dqid+"' class='tablelink'>确认关联</a></td>"+
									"</tr>");
							}
							
							$("#dq_table tbody a").on("click",function(){
								var dqid = $(this).attr("fid");
								var dqmc = $(this).attr("fmc");
								var data = {};
								data.zdid = id;
								data.dqid = dqid;
								data.dqmc = dqmc;
								$.ajax({
									url : getRootPath() + "zdwz_save.shtm",
									type : "POST",
									data :  '{"data":['+object2JsonStr(data)+']}',
									contentType : "application/json; charset=utf-8",
									datatype : "json",
									success : function(result){
										if (null == result || "" == result) {
											layer.alert("查询失败", 8);
											return;
										}else{
											layer.close(pLayer);
											openLayer({
												type : 0,
												msg : '关联成功！',
												btns : 1,
												btn : [ '确定' ],
												yes:yes,
												title : '系统温馨提示',
												area : [ '300', '220' ],
												icon : 1
											});
											function yes(){
												refresh();
											};
										}
									}
								});
							})
						}
						
					}
				}
			});
		}

	});
	
}

//更新
function refresh(){
	//先不采用AJAX刷新表格，后续做分页时一起开发，采用重新加载页面 
	var url = getRootPath() + "dispatcher.shtm?mark=33&page=1";
	$.ajax({
		url : url,
		type : "POST",
		contentType : "application/json; charset=utf-8",
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				window.parent.frames["rightFrame"].location.href=getRootPath()+result.data.url;
				//修改为操作DOM table
			} else {
				openLayer({type:0,msg:"重新加载失败",btns:1,btn:['确定'],title:'系统温馨提示',area:['300','220'],icon:8});
			}
		}
	});
}

function pageFunction(curr,conditionFlag)
{
	var loading = layer.load("load...");	
	
	currnum = curr;
	
	var url = getRootPath() + "page_load.shtm?mark=33&page="+curr;		
	
	if(null != conditionFlag)
	{
		url += 	"&condition="+condition;	
	}
	
	$.ajax({
	url : url,
	type : "POST",
	contentType : "application/json; charset=utf-8",
	success : function(data, stats) {
		var result = $.parseJSON(data);
		if (1 == result.code) {
			
			$("#div_dqzd .tablelist tbody").empty();
			if(null == result.data.zds || "" == result.data.zds)
			{
				$("#div_dqzd .tablelist tbody").append("<tr><td  width='100%' align='center' colspan='6'>暂无站点数据。</td> </tr>");
			}else
			{			
			var jsonTemp = eval(result.data.zds);
			for(var i=0; i<jsonTemp.length; i++)
			{
				$("#div_dqzd .tablelist tbody").append("<tr>" +
						"<td width='70' align='center'>"+jsonTemp[i].zdbaseid+"</td>" +
						"<td width='200' align='center'>"+jsonTemp[i].zdmc+"</td>" +
						"<td width='150' align='center'>"+jsonTemp[i].dqmc+"</td>" +
						"<td align='center'><a href='javascript:void(0);' fid='"+jsonTemp[i].zdbaseid+"' class='tablelink'>关联地区</a></td>"+
						"</tr>");
			}
			
			}
		}
		layer.close(loading);
	}
});
}