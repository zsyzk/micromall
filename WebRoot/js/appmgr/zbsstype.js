/*var layerWin  = null;
var id = "";
var Ymsg = "";
var Nmsg = "";
var conditionBefore = null;
*/
var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 4;
function init() {

	var zbsstype_form =  
		"<div>" +
			"<form id='zbsstypeForm' class='formbody'  style='overflow-y: auto;width:800px;height: 430px'> "
			+ " <div class='formbody'>" +
					"<div class='usual'>"
					+ " <div class='itab'>" +
							"<ul id='target'>" +
								"<li><a href='#simplified' id='simplified_a' class='selected'>简体版本</a></li>" +
								"<li><a href='#traditional' id='traditional_a'>繁体版本</a></li>" +
							"</ul>" +
						"</div> "
					+ " <div id='traditional' class='tabson' >"
						+ "<ul class='forminfo'> " +
								"<li><label>名称(繁)&nbsp;&nbsp;<font color=red>*</font></label><input id=mcT name=mcT type=text class=dfinput maxlength=50 /><br></li>"+
								"<li><label>描述(繁)</label><textarea id=msT class=textinput name=msT maxlength=200 ></textarea><br></li>"
						+ " </ul>" +
						"</div> "
					+ "<div id='simplified' class='tabson' >"
						+ "<ul class='forminfo'> " +
							"<li><label>名称(简)&nbsp;&nbsp;<font color=red>*</font></label><input id=mcS name=mcS type=text class=dfinput maxlength=50 /><br></li>"+
							"<li><label>描述(简)</label><textarea id=msS class=textinput name=msS maxlength=200 ></textarea><br></li>"
						+ "</ul>" +
					  "</div> "
					+ " </div>" +
			   		"</div><input name=zbsstypeid type=hidden /><br/>" +
			   		"<div style='width: 700px' align='center'><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></div>"+
		   	 "</form>" +
		  "</div>";
	
	$(".click_refresh").click(function(e) {
		setPage(mark, condition,true);		
	});

	$(".click_add").on("click", function() {
		
		layerWin=openLayer({type:1,html:zbsstype_form,area:[800,'auto'],title:'新增周边设施类别'});
		
		$("#zbsstypeForm #target").idTabs();
		
		$("#zbsstypeForm #yes").on("click",function(){
			submit_addzbsstype(1);
		});
		$("#zbsstypeForm #no").on("click",function(){
			layer.close(layerWin);
		});
	});
	
	$(".click_delete").on("click",function(){
		id =  $("#zbsstype .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			deletezbsstype(id);
		}
	});
	
	$(".click_update").on("click",function(){
		id =  $("#zbsstype .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			$.ajax({
				url:getRootPath() + "zbsstype_getById.shtm",
				type : "POST",
				data : '{"zbsstypeid":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						layerWin= openLayer({type:1,html:zbsstype_form,area:[800,'auto'],title:'编辑周边设施类别'});
						json2Form(config,"#zbsstypeForm");
						$("#zbsstypeForm #target").idTabs();
						$("#zbsstypeForm #yes").on("click",function(){
							submit_addzbsstype(2);
						});
						$("#zbsstypeForm #no").on("click",function(){
							layer.close(layerWin);
						});
					}
				}
			});
			
		}
	});
	
	$(".click_view").on("click",function(){
		id =  $("#zbsstype .tablelist input[type='checkbox']:checked").attr("fid");
		var tag = $(this).text();
			if(null==id || ""==id){
				layer.alert("请选择一项!",8);
				return;
			}else{
				$.ajax({
					url:getRootPath() + "zbsstype_getById.shtm",
					type : "POST",
					data : '{"zbsstypeid":'+id+'}',
					contentType : "application/json; charset=utf-8",
					datatype : "json",
					success : function(result) {
						if (null==result || ""==result) {
							layer.alert("查询失败",8);
							return;
						}else {
							var config = eval('('+result+')');
							openLayer({type:1,html:zbsstype_form,area:[800,'auto'],title:'周边设施类别'});
							json2Form(config,"#zbsstypeForm");
							$("#zbsstypeForm #target").idTabs();
							$("#zbsstypeForm .scbtn").attr("type","hidden");
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
	setPage(4, null, true);
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
				url:getRootPath() + "zbsstype_delete.shtm",
				type : "POST",
				data : '{"zbsstypeid":'+id+'}',
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
								yes:function yes(){
									layer.close(ol);
									setPage(mark, condition,false);
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
//action  1:增加    2:修改
function submit_addzbsstype(action) {
	var url = getRootPath() + "zbsstype_save.shtm";
	if(id=="" || id == null){
		Ymsg = "您好！新增周边设施类别成功。";
		Nmsg = "您好！新增周边设施类别失败。";
	}else{
		Ymsg = "您好！修改周边设施类别成功。";
		Nmsg = "您好！修改周边设施类别失败。";
	}
	if(0 == $('#mcT').val().length && 0 == $('#mcS').val().length){
		layer.alert("周边设施类别名称（简体）和周边设施类别名称（繁体）不能都为空，",3);
		return;
	};
	
	var data = serializeJson($('#zbsstypeForm'));
	
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
						if(action==1){
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

function pageFunction(curr,conditionFlag)
{
	var loading = layer.load("load...");
	
	currnum = curr;
	
	var url = getRootPath() + "page_load.shtm?mark=4&page="+curr;
	
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
			
			$(".tablelist tbody").empty();

			if(null == result.data.zbsstype || "" == result.data.zbsstype)
			{
				$(".tablelist tbody").append("<tr><td width='100%' align='center' colspan='6'>暂无周边设施类别数据。</td> </tr>");
			}else
			{			
			var jsonTemp = eval(result.data.zbsstype);
			
			for(var i=0; i<jsonTemp.length; i++)
			{
				$(".tablelist tbody").append("<tr>" +
						"<td width='50' align='center'><input name='selChk'  type='checkbox'  fid="+jsonTemp[i].zbsstypeid+" /></td>" +
						"<td width='70' align='center'>"+jsonTemp[i].zbsstypeid+"</td>" +
						"<td width='100' align='center'>"+jsonTemp[i].mcS+"</td>" +
						"<td width='100' align='center'>"+jsonTemp[i].mcT+"</td>" +
						"<td width='200' align='center'>"+jsonTemp[i].msS+"</td>" +
						"<td width='200' align='center'>"+jsonTemp[i].msT+"</td>" +
						"</tr>");
			}
			
			/**
			*复选框只能选一个
			*/
			$('#zbsstype .tablelist input[type="checkbox"]').on("click",function(){
				var select = $('#zbsstype .tablelist input[type="checkbox"]:checked');
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
		}
		
		layer.close(loading);

	}
});
}
