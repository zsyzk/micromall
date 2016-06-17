/*var currnum = 1;
var condition = null;var conditionBefore = null;*/
var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 11;
function init() {
	
	var zhandianBase_form = "<form id = 'zhandianBaseform' class=formbody style='width:100%;height: 100%'>"+
	"<input name=zdbaseid type=hidden />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>站点名称&nbsp;&nbsp;<font color=red>*</font></label><input name=zdmc type=text class=dfinput /><br></li>"+
	"<li><label>站点简称&nbsp;&nbsp;<font color=red>*</font></label><input name=zdmcjc type=text class=dfinput /><br></li>"+
	"<li><label>站点地址&nbsp;&nbsp;<font color=red>*</font></label><input name=dz type=text class=dfinput /><br></li>"+
	"<li><div align='center'><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></div></li>"+
	"</ul></form>";
	
	
	$(".click_update").on("click",function(){
		id =  $(".tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			function suc(layero){
				
				if(id){
					$.ajax({
						url:getRootPath() + "zhandianbase_getById.shtm",
						type : "POST",
						data : '{"zdbaseid":'+id+'}',
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						success : function(result) {
							if (null==result || ""==result) {
								layer.alert("查询失败",8);
								return;
							}else {
								var config = eval('('+result+')');
								json2Form(config,"#zhandianBaseform");
							}
						}
					});
				}
				
				layero.find("#yes").on("click", function() {
					var data = serializeJson($('#zhandianBaseform'));
					$.ajax({
						url:getRootPath() + "zhandianbase_update.shtm",
						type : "POST",
						data : json2str(data),
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						success : function(result) {
							var result = $.parseJSON(result);
							if (1 == result.code) {
								var ol = openLayer({
									type : 0,
									msg : "编辑站点成功",
									btns : 1,
									btn : [ '确定' ],
									yes:function yes(){
										setPage(mark, condition,false);
										layer.close(ol);
										layer.close(layerWin);
									},
									title : '系统温馨提示',
									area : [ '300', '220' ],
									icon : 1
								});
							} else {
								openLayer({
									type : 0,
									msg : "编辑站点失败",
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

				layero.find("#no").on("click", function() {
					layer.close(layerWin);
				});
			}
			
			var layerWin = openLayer({type:1,html:zhandianBase_form,area:[600,'auto'],title:'用户信息',success:suc});

		}
		
	});
	
	
	
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
	
	/**
	 * 初始化分布分页
	 */
	setPage(11, null, true);
}

function pageFunction(curr,conditionFlag)
{
	var loading = layer.load("load...");
	
	currnum = curr;
	
	var url = getRootPath() + "page_load.shtm?mark=11&page="+curr;		
	
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
			
			$("#div_zd_base .tablelist tbody").empty();

			if(null == result.data.zdbases || "" == result.data.zdbases)
			{
				$("#div_zd_base .tablelist tbody").append("<tr><td  width='100%' align='center' colspan='7'>暂无站点基础信息数据。</td> </tr>");
			}else
			{			
			var jsonTemp = eval(result.data.zdbases);
			for(var i=0; i<jsonTemp.length; i++)
			{
				$("#div_zd_base .tablelist tbody").append("<tr>" +
						"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].zdbaseid+" /></td>" +
						"<td width='70' align='center'>"+jsonTemp[i].zdbaseid+"</td>" +
						"<td width='200' align='center'>"+jsonTemp[i].zdmc+"</td>" +
						"<td width='120' align='center'>"+jsonTemp[i].zdmcjc+"</td>" +
						"<td width='300' align='center'>"+jsonTemp[i].dz+"</td>" +
						"<td width='200' align='center'>"+jsonTemp[i].position+"</td>" +
						"<td width='50' align='center'>"+jsonTemp[i].x+"</td>" +
						"<td width='50' align='center'>"+jsonTemp[i].y+"</td>" +
						"</tr>");
			}
			
			}
		}
		layer.close(loading);
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
});
}