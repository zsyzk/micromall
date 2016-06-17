/*var id = "";
var Ymsg = "";
var Nmsg = "";
var currnum = 1;
var condition = null;var conditionBefore = null;*/
var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 24;
/*function setCurrnum(curr){
	currnum = curr;
}*/
function init() {
	
	 
	var cyxl_form = "<form id = cyxlForm class=formbody style='overflow-y: auto;width:800px;height: 400px'>"+
	"<input name=kfqdId type=hidden />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>系统编码&nbsp;&nbsp;<font color=red>*</font></label><input id=xtbm name=xtbm type=text class=dfinput /><br></li>"+
	"<li><label>系统编码描述</label><textarea id=xtbmms class=textinput name=xtbmms ></textarea><br></li>"+
	"<li><label>客户编码&nbsp;&nbsp;<font color=red>*</font></label><input id=kfbm name=kfbm type=text class=dfinput /><br></li>"+
	"<li><label>客户编码描述</label><textarea id=kfbmms class=textinput name=kfbmms ></textarea><br></li>"+
	"<li><label>&nbsp;</label><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></li>"+
	"</ul></form>";
	


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

	$(".click_view").on("click",function(){
		id =  $("#cyxl .tablelist input[type='checkbox']:checked").attr("fid");
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
						openLayer({type:1,html:cyxl_form,area:[800,'auto'],title:'常用线路信息'});
						json2Form(config,"#cyxlForm");
						$("#cyxlForm .scbtn").attr("type","hidden");
					}
				}
			});
		}
	});
	
	/**
	 * 初始化分布分页
	 */
	setPage(24, null, true);
}

