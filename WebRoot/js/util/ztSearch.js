;!function(){
	
	function ztSearch(options){
		new Search(options);
	}
	
	function Search(options){
		var that = this, conf = that.conf= options || {};
		that.render();
	};
	Search.prototype.view = function(){
		var that = this, conf = that.config;
		var viewTmp = '<div><div style="border:2px solid #ccc;width:180px;height:400px;float:left;margin:5px;overflow: auto;"><select style="height:100%;width:100%" size="15" id="dataSourse"></select></div>'
					+'<div style="border:1px solid #ccc;width:570px;height:400px;float:left;margin:5px;">'
					+'<div style="border:1px solid #ccc;width:570px;height:10%;line-height:20px; ">'
					+'&nbsp;&nbsp;<label>属性名</label>&nbsp;&nbsp;:&nbsp;&nbsp;<input id="pnName" type="text" class="dfinput" style="width:125px" readonly=readonly />&nbsp;&nbsp;&nbsp;&nbsp;<select id="actKey" class="dfinput" style="width:95px;margin-top:5px"><option>等于</option><option>不等于</option><option>大于</option><option>小于</option></select>&nbsp;&nbsp;&nbsp;&nbsp;<input type="text" id="key" class="dfinput" style="width:180px" />&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" id="addKey" value="添加" class="scbtn" style="width:50px" /></div>'
					+'<div style="border:1px solid #ccc;width:570px;height:10%;">&nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="(" class="funBtn" /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value=")" class="funBtn" /> &nbsp;&nbsp;&nbsp;&nbsp;<input type="button" value="并且" class="funBtn" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="或者" class="funBtn" />&nbsp;&nbsp;&nbsp;&nbsp; <input type="button" value="清空" class="funBtn" /></div>'
					+'<div style="border:1px solid #ccc;width:570px;height:70%;"><textArea id="searchKey" style="width:100%;height:100%" class="textinput"></textArea></div>'
					+'<div style="border:1px solid #ccc;width:570px;height:10%;text-align:center;"><input id="searchBtn" type="button" value="查询" class="scbtn" /></div>'
					+'</div></div>';
		return 	viewTmp;	
	}
	
	
	Search.prototype.render = function(){
		var that = this,conf = that.conf;
		var view = that.view();
		
		conf.confirm = 'confirm' in conf ?conf.confirm :function(){};
		conf.condition = conf.condition ? conf.condition:"";
		var layerWin = openLayer({type:1,html:view,area:["780","450"],title:'查询',success:searchAction,close:conf.closeAction});
		
		function insertAtCursor(myField, myValue) {
			//IE support
			if (document.selection) {
				myField.focus();
				sel = document.selection.createRange();
				sel.text = myValue;
				sel.select();
			}
			//MOZILLA/NETSCAPE support 
			else if (myField.selectionStart || myField.selectionStart == '0') {
				var startPos = myField.selectionStart;
				var endPos = myField.selectionEnd;
				// save scrollTop before insert www.keleyi.com
				var restoreTop = myField.scrollTop;
				myField.value = myField.value.substring(0, startPos) + myValue + myField.value.substring(endPos, myField.value.length);
				if (restoreTop > 0) {
				myField.scrollTop = restoreTop;
				}
				myField.focus();
				myField.selectionStart = startPos + myValue.length;
				myField.selectionEnd = startPos + myValue.length;
			} else {
				myField.value += myValue;
				myField.focus();
			}
		} 

		
		
		function searchAction(){
			$("#searchKey").val(conf.condition);
			
			$(".funBtn").on("click",function(){
				if($(this).val() == "清空"){
					$("#searchKey").val("");
					return;
				}
				var area = $("#searchKey")[0];
				insertAtCursor(area," "+$(this).val()+" ");
			});
			if('data' in conf){
				var data = conf.data;
				if(data){
					var select = $("#dataSourse").eq(0);
					for(var pn in data){
						var option = "<option value='"+data[pn].value+"'>"+data[pn].name+"</option>";
						select.append(option);
					}
					
					select.on("change",function(){
						var pnNameTmp = select.find("option:selected").text();
						$("#pnName").val(pnNameTmp);
					});
				}
			}
			$("#addKey").on("click",function(){
				var keyName = $("#pnName").val();
				if(keyName!=""){
					var actKey =  $("#actKey").find("option:selected").text();
					var key = $("#key").val();
					if(key == ""){
						key = "\"\"";
					}
					var addKeyTmp = " "+keyName+" "+actKey+" '"+key+"' ";
					var area = $("#searchKey")[0];
					insertAtCursor(area,addKeyTmp);
				}else{
					layer.alert("请先于左侧列表选择一项属性",8);
				}
			});
			$("#searchBtn").on("click",function(){
				var searchKeyTemp = $("#searchKey").val();
				var beforeSearchKey = searchKeyTemp;
				searchKeyTemp = searchKeyTemp.replace(/南行/g,'1').replace(/北行/g,'2');
				//去掉换行和多个空格
				searchKeyTemp = searchKeyTemp.replace(/[\n]/g," ")
											.replace(/不等于/g, " != ")
											.replace(/等于/g, " = ")											
											.replace(/大于/g, " > ")
											.replace(/小于/g, " < ")
											.replace(/并且/g, " and ")
											.replace(/或者/g, " or ")
											.replace(/[ ]+/g, " ");
				if('data' in conf){
					var data = conf.data;
					if(data){
						for(var pn in data){
							var pnName =data[pn].name;
							pnName = pnName.replace(/[(]/g,"\\(").replace(/[)]/g,"\\)");
							var faceName = eval("/" + pnName + "/g");
							searchKeyTemp = searchKeyTemp.replace(faceName,data[pn].value);
						}
					}
				}
				layer.close(layerWin);
				searchKeyTemp = encodeURI(encodeURI(searchKeyTemp,"utf-8"),"utf-8");
				conf.confirm(beforeSearchKey,searchKeyTemp);
			});
			
			
			
			
		}
		
		
	};
	
	
	//for 页面模块加载、Node.js运用、页面普通应用
	"function" === typeof define ? define(function() {
	    return ztSearch;
	}) : "undefined" != typeof exports ? module.exports = ztSearch : window.ztSearch = ztSearch;

	
} ();