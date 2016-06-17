/*var currnum = 1;
var condition = null;var conditionBefore = null;*/
var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 12;
function init() {
	var zhandian_form = "<form id = 'zhandianForm' class=formbody style='width:100%;height: 100%'>"+
	"<input name=zdid type=hidden />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>站点类型&nbsp;&nbsp;<font color=red>*</font></label><select name=type class=dfinput><option value=1>上车点</option><option value=2>下车点</option></select><br></li>"+
	"<li><label>套票购买&nbsp;&nbsp;<font color=red>*</font></label><select name=xztp class=dfinput><option value=1>是</option><option value=2>否</option></select><br></li>"+
	"<li><label>乘车时间&nbsp;&nbsp;<font color=red>*</font></label><input name=ccsj type=text class=dfinput /><br></li>"+
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
						url:getRootPath() + "zhandian_getById.shtm",
						type : "POST",
						data : '{"zdid":'+id+'}',
						contentType : "application/json; charset=utf-8",
						datatype : "json",
						success : function(result) {
							if (null==result || ""==result) {
								layer.alert("查询失败",8);
								return;
							}else {
								var config = eval('('+result+')');
								json2Form(config,"#zhandianForm");
							}
						}
					});
				}
				
				layero.find("#yes").on("click", function() {
					var data = serializeJson($('#zhandianForm'));
					$.ajax({
						url:getRootPath() + "zhandian_update.shtm",
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
			
			var layerWin = openLayer({type:1,html:zhandian_form,area:[600,'auto'],title:'用户信息',success:suc});

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
	setPage(12, null, true);
}
