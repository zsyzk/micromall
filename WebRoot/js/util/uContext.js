/**
 * 	js 对象转 json字符串
 * @param obj
 * @returns {String}
 */
    function object2JsonStr(obj) {  
            switch (obj.constructor) {  
            case Object:  
                var str = "{";  
                for ( var o in obj) {  
                    str += o + ":" + object2JsonStr(obj[o]) + ",";  
                }  
                if (str.substr(str.length - 1) == ",")  
                    str = str.substr(0, str.length - 1);  
                return str + "}";  
                break;  
            case Array:  
                var str = "[";  
                for ( var o in obj) {  
                    str += object2JsonStr(obj[o]) + ",";  
                }  
                if (str.substr(str.length - 1) == ",")  
                    str = str.substr(0, str.length - 1);  
                return str + "]";  
                break;  
            case Boolean:  
                return "\"" + obj.toString() + "\"";  
                break;  
            case Date:  
                return "\"" + obj.toString() + "\"";  
                break;  
            case Function:  
                break;  
            case Number:  
                return "\"" + obj.toString() + "\"";  
                break;  
            case String:  
                return "\"" + obj.toString() + "\"";  
                break;  
            }  
        }  




var CHARS = '0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZabcdefghijklmnopqrstuvwxyz'.split('');
 
  Math.uuid = function (len, radix) {
    var chars = CHARS, uuid = [], i;
    radix = radix || chars.length;
 
    if (len) {
      // Compact form
      for (i = 0; i < len; i++) uuid[i] = chars[0 | Math.random()*radix];
    } else {
      // rfc4122, version 4 form
      var r;
 
      // rfc4122 requires these characters
      uuid[8] = uuid[13] = uuid[18] = uuid[23] = '-';
      uuid[14] = '4';
 
      // Fill in random data.  At i==19 set the high bits of clock sequence as
      // per rfc4122, sec. 4.1.5
      for (i = 0; i < 36; i++) {
        if (!uuid[i]) {
          r = 0 | Math.random()*16;
          uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
        }
      }
    }
 
    return uuid.join('');
  };
 
  // A more performant, but slightly bulkier, RFC4122v4 solution.  We boost performance
  // by minimizing calls to random()
  Math.uuidFast = function() {
    var chars = CHARS, uuid = new Array(36), rnd=0, r;
    for (var i = 0; i < 36; i++) {
      if (i==8 || i==13 ||  i==18 || i==23) {
        uuid[i] = '-';
      } else if (i==14) {
        uuid[i] = '4';
      } else {
        if (rnd <= 0x02) rnd = 0x2000000 + (Math.random()*0x1000000)|0;
        r = rnd & 0xf;
        rnd = rnd >> 4;
        uuid[i] = chars[(i == 19) ? (r & 0x3) | 0x8 : r];
      }
    }
    return uuid.join('');
  };

  
  Math.uuidCompact = function() {
	    return 'xxxxxxxx-xxxx-4xxx-yxxx-xxxxxxxxxxxx'.replace(/[xy]/g, function(c) {
	      var r = Math.random()*16|0, v = c == 'x' ? r : (r&0x3|0x8);
	      return v.toString(16);
	    });
	  };

function isNull(obj){
	if(!obj){
		return true;
	}
    switch (obj.constructor) {  
    case Object:  
       if(null == obj){
    	   return true;
       }
        break;  
    case Array:  
        if(obj.length == 0){
        	return true;
        } 
        break;  
    case String:  
        if(""==trim(obj) || "null"==trim(obj) ){
        	return true;
        }
        break;  
    }  
    return false;
}

function isNotNull(obj){
	return !isNull(obj);
}

function trim(str){ //删除左右两端的空格
    return str.replace(/(^\s*)|(\s*$)/g, "");
}
function ltrim(str){ //删除左边的空格
    return str.replace(/(^\s*)/g,"");
}
function rtrim(str){ //删除右边的空格
    return str.replace(/(\s*$)/g,"");
}


function getRootPath(){
    var curPath=window.document.location.href;
    var pathName=window.document.location.pathname;
    var pos=curPath.indexOf(pathName);
    var localhostPaht=curPath.substring(0,pos);
    var projectName=pathName.substring(0,pathName.substr(1).indexOf('/')+1);
    return(localhostPaht+projectName+"/");
}

function CheckImgExists(imgurl) {  
    var ImgObj = new Image(); //判断图片是否存在  
    ImgObj.src = imgurl;  
    //没有图片，则返回-1  
    if (ImgObj.fileSize > 0 || (ImgObj.width > 0 && ImgObj.height > 0)) {  
        return true;  
    } else {  
        return false;
    }  
}

function unvalidJsonString(conDes){
	var resultJsonStr = "";
	conDes = conDes.replace(/\\/g,"\\");
	conDes = conDes.replace(/\"/g,"\"");
	conDes = conDes.replace(/\“/g,"\"");
	conDes = conDes.replace(/\”/g,"\"");
	resultJsonStr = conDes;
	return resultJsonStr;
}

function avalidJsonString(str){
	var resultJsonStr = "";
	str = str.replace(/\\/g,"\\\\");
	str = str.replace(/\"/g,"\\\"");
	str = str.replace(/\“/g,"\\\"");
	str = str.replace(/\”/g,"\\\"");
	resultJsonStr = str;
	return resultJsonStr;
}



function json2str(obj)
{
  var S = [];
  for(var i in obj){
  obj[i] = typeof obj[i] == 'string'?'"'+obj[i]+'"':(typeof obj[i] == 'object'?json2str(obj[i]):obj[i]);
  S.push(i+':'+obj[i]); 
  }
    return '{'+S.join(',')+'}';
}

function json2Form(json,formTarget){
	var formEles = $(formTarget);
	var input = formEles.find("input");
	input.each(function(){
		for(var j in json){
			if($(this).attr("name") == j){
				$(this).val(json[j]);
				if($(this).attr("name") == "furl" || $(this).attr("name") == "fheadPath" || $(this).attr("name") == "zbsslogo"){
					var photoView = formEles.find("#uploader_view");
					var urls = json[j];
					if(null!=urls && ""!=urls){
						var us = urls.split(",");
						for(var u in us){
							photoView.append('<img height=60 src='+getRootPath()+'upload/zbss/'+us[u]+' />');
						}
					}
				}
				return true;
			}
			if($(this).attr("obj")==j){
				for(var jj in json[j]){
					if($(this).attr("objName") == jj){
						$(this).val(json[j][jj]);
						return true;
					}
				}
			}
		}
	});
	
	var select = formEles.find("select");
	select.each(function(){
		for(var j in json){
			if($(this).attr("name") == j){
				$(this).val(json[j]);
				return true;
			}
			if($(this).attr("obj")==j){
				for(var jj in json[j]){
					if($(this).attr("objName") == jj){
						$(this).val(json[j][jj]);
						return true;
					}
				}
			}
		}
	});
	
	var area = formEles.find("textarea");
	area.each(function(){
		for(var j in json){
			if($(this).attr("name") == j){
				$(this).val(json[j]);
				break;
			}
		
		}
	});
	
}

function serializeJson(target){  
	var serializeObj={};  
    var array=target.serializeArray();  
    $(array).each(function(){  
        if(serializeObj[this.name]){  
           if($.isArray(serializeObj[this.name])){  
                serializeObj[this.name].push(this.value);  
           }else{  
                serializeObj[this.name]=[serializeObj[this.name],this.value];  
           }  
        }else{  
            serializeObj[this.name]=this.value;   
        }  
    });  
    return serializeObj;  
};

function formClear(target,hidden){
	target.find('input[type="text"]').each(function(){
		$(this).val("");
	});
	if(hidden){
		target.find('input[type="hidden"]').each(function(){
			$(this).val("");
		});
	}
	target.find('textArea').each(function(){
		$(this).val("");
	});
	
}
function getDocumentDataGrid(title){
	if(title == "用户管理"){
		if(isNotNull(userDataGrid)){
			return userDataGrid;
		}
	}
	return null;
}



function openTabIgnoreTiTle(title,href,dataJson){
	href = href+"?data="+dataJson;
	openTabIgnoreTiTleMain(href,title);
}


function openTabByHref(title,href,dataJson){
	href = href+"?data="+dataJson;
	openTabByHrefMain(href,title);
}

function refreshPageIn(layout,url,page,rows,condition){
	if(layout=="client"){
		window.location.href = url+"?page="+page+"&rows="+rows+"&"+condition;
	}else{
		var $layout = $("#"+layout);
		if(null!=$layout && $layout.length>0){
			$layout.panel({href:url+"?page="+page+"&rows="+rows+"&"+condition});  
		}else {
			refreshTab(url+"?page="+page+"&rows="+rows+"&"+condition);
		}
	}
}
function arrayRemove(array,dx){
	if(isNaN(dx)||dx>array.length){
		return false;
	}
	for(var i=0,n=0;i<array.length;i++)
	{
		if(array[i]!=array[dx])
		{
			array[n++]=array[i];
		}
	}
	array.length-=1;
}

function pageFunction(mark,curr)
{
	if(!mark || !curr){
		return;
	}
	var loading = layer.load("load...");
	currnum = curr;
	var url = getRootPath() + "dispatcher.shtm?mark="+mark+"&page="+curr;		
	$.ajax({
		url : url,
		type : "POST",
		contentType : "application/json; charset=utf-8",
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				window.parent.frames["rightFrame"].location.href=getRootPath()+result.data.url;
			}
			layer.close(loading);
		}
	});
}

function initAction(target,action){
	var target = $(target);
	var as = action.split(",");
	var toolbar = '<ul class="toolbar">';
	var toolbar1 = '<ul class="toolbar1">';
	for(var a in as){
		if(as[a] == '01'){
			toolbar+='<li class="click_refresh"><span><img src="images/t04.png" /></span>重新加载</li>';
		}else if(as[a] == '02'){
			toolbar+='<li class="click_add"><span><img src="images/t01.png" /></span>新建</li>';
		}else if(as[a] == '03'){
			toolbar+='<li class="click_update"><span><img	src="images/t02.png" /></span>编辑</li>';
		}else if(as[a] == '04'){
			toolbar+='<li class="click_delete"><span><img	src="images/t03.png" /></span>删除</li>';
		}else if(as[a] == '05'){
			toolbar+='<li class="click_view"><span><img src="images/view.png" /></span>查阅详情</li>';
		}else if(as[a] == '06'){
			toolbar1+='<li class="click_find"><span><img src="images/search_2.png" /></span>智能搜索</li>';
		}else if(as[a] == '07'){
			toolbar+='<li class="click_public"><span><img src="images/t04.png" /></span>发布</li>';
		}else if(as[a] == '08'){
			toolbar+='<li class="click_permission"><span><img src="images/t04.png" /></span>关联权限</li>';
		}else if(as[a] == '09'){
			toolbar+='<li class="click_save"><span><img src="images/t04.png" /></span>保存</li>';
		}else if(as[a] == '10'){
			toolbar+='<li class="click_default"><span><img src="images/t02.png" /></span>还原默认值</li>';
		}else if(as[a] == '11'){
			toolbar+='<li class="click_up_app"><span><img src="images/reset.png" /></span>更新版本</li>';
		}/*else if(as[a] == '11'){
			toolbar+='<li class="click_lal"><span><img src="images/t04.png" /></span>保存经纬度</li>';
		}*/
	}
	toolbar+="</ul>"
	toolbar1+="</ul>"
	
	target.append(toolbar);
	target.append(toolbar1);
}
