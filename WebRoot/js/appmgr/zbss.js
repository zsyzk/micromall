/*var id = "";
var Ymsg = "";
var Nmsg = "";
var currnum = 1;
var layerWin  = null;
var condition = null;var conditionBefore = null;
var mark = 3;*/
var id=null,Ymsg=null,Nmsg=null,layerWin=null,condition=null,conditionBefore=null,mark = 3;

function init() {	 
	var zbss_form = "<form id = zbssForm class=formbody style='overflow-y: auto;width:800px;height: 400px'>"+
	"<input name=zbssid type=hidden />"+
	"<input id='zbsslogo' name='zbsslogo' type='hidden' />"+
	"<div class=formtitle><span>基本信息</span></div>"+
	"<ul class=forminfo>"+
	"<li><label>所属站点</label><select id='sszb' name=zdbaseid ></select><br></li>"+
	"<li><label>所属类别</label><select id='sslb' name=zbsstypeId ></select><br></li>"+
	"<li><label>周边设施名称(简)&nbsp;&nbsp;<font color=red>*</font></label><input id=zbssmcS name=zbssmcS type=text class=dfinput maxlength=50 /><br></li>"+
	"<li><label>周边设施名称(繁)&nbsp;&nbsp;<font color=red>*</font></label><input id=zbssmcT name=zbssmcT type=text class=dfinput /><br></li>"+
	"<li><label>周边设施地址(简)</label><input name=zbssdzS type=text class=dfinput maxlength=100 /><br></li>"+
	"<li><label>周边设施地址(繁)</label><input name=zbssdzT type=text class=dfinput maxlength=100 /><br></li>"+
	"<li><label>周边设施电话</label><input id=zbssdh name=zbssdh type=text class=dfinput maxlength=13 /><br></li>"+
	"<li><label>周边设施图片</label><label><input type='file' id='logo' /></label><br><div id='uploader_view'></div></li>"+
	"<li><label>周边设施描述(简)</label><textarea id=zbssmsS class=textinput name=zbssmsS maxlength=200 ></textarea></li>" +
	"<li><label>周边设施描述(繁)</label><textarea id=zbssmsT class=textinput name=zbssmsT maxlength=200 ></textarea></li>" +
	"<li><div style='width: 700px' align='center'><input id=yes type=button class=scbtn value='提交'/>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<input id=no type=button class=scbtn value='关闭'/></div></li>"+
	"</ul></form>";
	
	
	$(".click_refresh").click(function(e) {
		setPage(mark, condition,true);		
	});

	$(".click_add").on("click", function() {
		openWindow();
	});
	
	function openWindow(zbid){
		 layerWin = openLayer({type:1,html:zbss_form,area:[800,'auto'],title:'周边设置信息',success:suc});
		 
		 function suc(){
			 $("#zbssdh").on("keyup",function(){
				 
				 var reg = /[^\d]/g;
				 if(reg.test($(this).val())){
					 openLayer({
						type : 0,
						msg : "您的输入有误，只能输入数字！",
						btns : 1,
						btn : [ '确定' ],
						title : '系统温馨提示',
						area : [ '300', '220' ],
						icon : 8
					});
				 }
			 });
		 }
		 
		//获取相关站点
			$.ajax({
				url:getRootPath() + "zb_getListWithIdAndName.shtm",
				type : "POST",
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						var sszbSelect = $("#zbssForm #sszb").eq(0);
						var option = "<option>无数据</option>";
						sszbSelect.append(option);
					}else {
						var sszbSelect = $("#zbssForm #sszb").eq(0);
						var resultJson = eval('('+result+')');
						for(var json in resultJson){
							var option = "<option value="+resultJson[json].zdbaseid+">"+resultJson[json].zdmc+"</option>";
							sszbSelect.append(option);
						}
						if(sszbSelect.find("option").length == 0 ){
							var option = "<option>无数据</option>";
							sszbSelect.append(option);
						}
					}
				}
			});
		
			//获取相关类别
			$.ajax({
				url:getRootPath() + "zbsstype_list_get.shtm",
				type : "POST",
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						
					}else {
						var sslbSelect = $("#zbssForm #sslb").eq(0);
						var resultJson = eval('('+result+')');
						var resultJsonData =resultJson.data;
						for(var json in resultJsonData){
							var option = "<option value="+resultJsonData[json].zbsstypeid+">"+resultJsonData[json].mcS+"</option>";
							sslbSelect.append(option);
						}
					}
				}
			});
		
			
		if(zbid){
			$.ajax({
				url:getRootPath() + "zbss_getById.shtm",
				type : "POST",
				data : '{"zbssid":'+zbid+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var config = eval('('+result+')');
						json2Form(config,"#zbssForm");
					}
				}
			});
		}
		
		//$("#zbssForm #target").idTabs();
		
		$("#zbssForm #yes").on("click",function(){
			submit_addzbss();
		});
		$("#zbssForm #no").on("click",function(){
			layer.close(layerWin);
		});
		$("#zbssForm #logo").uploadify({
		    'auto' : true,
		    'method' : "get",
		    'formData' : {'folder' : 'file'},
		       'height' : 30,
		       'swf' : getRootPath()+'js/uploadify.swf', // flash
		       'uploader' : getRootPath()+'uploadify', // 数据处理url
		       'width' : 120,
		       'fileTypeDesc' : '图片文件',
		       'fileTypeExts' : '*.gif;*.png;*.jpg',
		       'buttonText' : '选择文件',
		       'uploadLimit' : 5,
		       'successTimeout' : 5,
		       'requeueErrors' : false,
		       'removeTimeout' : 10,
		       'removeCompleted' : false,
		       'queueSizeLimit' :10,
		       'queueID'  : 'uploader_queue',
		       'progressData' : 'speed',
		       'onInit' : function (){},
		    // 单个文件上传成功时的处理函数
			 'onUploadSuccess' : function(file, data, response){
				data = trim(data);
			    var path =decodeURI(decodeURI(data));
			  	$("#zbssForm #uploader_view").append('<img height="60" alt="" src="'+getRootPath()+'upload/zbss/'+path+'"/>');
			  	$("#zbssForm #zbsslogo").val(path);
			 }      
		 });
	}
	
	$(".click_update").on("click",function(){
		/*clearform($("zbssForm"));*/
		id =  $("#zbss .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			 openWindow(id);
		}
	});
	
	
	$(".click_delete").on("click",function(){
		id =  $("#zbss .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			deletezbss(id);
		}
	});
	
	$(".click_view").on("click",function(){	
		id =  $("#zbss .tablelist input[type='checkbox']:checked").attr("fid");
		if(null==id || ""==id){
			layer.alert("请选择一项!",8);
			return;
		}else{
			openWindow(id);
			$("#zbssForm .scbtn").attr("type","hidden");
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
	setPage(3, null, true);
}

//删除
function deletezbss(id){
	openLayer({
		type : 0,
		msg : "确认删除吗？",
		btns : 2,
		btn : [ '确定','取消' ],
		yes:function yes(){
			$.ajax({
				url:getRootPath() + "zbss_delete.shtm",
				type : "POST",
				data : '{"zbssid":'+id+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("查询失败",8);
						return;
					}else {
						var ol = openLayer({
							type : 0,
							msg : "用户删除成功！",
							btns : 1,
							yes:function yes(){
								setPage(mark, condition,false);
								layer.close(ol);
							},
							btn : [ '确定' ],
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

//添加
function submit_addzbss() {
	var url = getRootPath() + "zbss_save.shtm";
	if(id=="" || id == null){
		Ymsg = "您好！新增周边设施成功。";
		Nmsg = "您好！新增周边设施失败。";
	}else{
		Ymsg = "您好！修改周边设施成功。";
		Nmsg = "您好！修改周边设施失败。";
	}
	if(0 == $('#zbssmcS').val().length){
		layer.alert("周边设施名称（简体）不能为空 ！",3);
		return;
	};
	if(0 == $('#zbssmcT').val().length){
		layer.alert("周边设施名称（繁体）不能为空 ！",3);
		return;
	};
	if(0 == $('#zbssmcT').val().length && 0 == $('#zbssmcS').val().length){
		layer.alert("周边设施名称（简体）和周边设施类别（繁体）不能都为空，",3);
		return;
	};
	var data = serializeJson($('#zbssForm'));
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
					yes:function yes(){
						if(id=="" || id == null){
							setPage(mark, condition,true);
						}else{
							setPage(mark, condition,false);
						}
						layer.close(ol);
						layer.close(layerWin);
					},
					btn : [ '确定' ],
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
