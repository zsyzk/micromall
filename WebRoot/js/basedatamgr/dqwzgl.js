function init() {
		$.ajax({
			url:getRootPath() + "dispatcher.shtm?mark=25&page=1",
			type : "POST",
			data : '',
			contentType : "application/json; charset=utf-8",
			datatype : "json",
			success : function(result) {
				if (null==result || ""==result) {
					return;
				}else {
						var targetDiv = $("#target");
						targetDiv.html("");
						var diQuData = eval('('+result+')');
						var dqwzglDataList = diQuData.data.dqwzgl;
						for(var sz in dqwzglDataList){
							var dragDiv = $("<div objId='"+dqwzglDataList[sz].dqid+"' style='text-align:center;width:100px;height:25px;background:#fafafa;border:1px solid #ccc;'>"+dqwzglDataList[sz].dqmc+"	</div>");
							targetDiv.append(dragDiv);
							dragDiv.draggable({
								onDrag:onDrag
							});
							var zbLeft = dqwzglDataList[sz].x;
							var zbTop = dqwzglDataList[sz].y;
							dragDiv.css({position: "absolute",'left':zbLeft,'top':zbTop});
//							dragDiv.addClass('over');
						}
				}
			}
		});
		
		var map = new BMap.Map("mapTarget"); // 创建地图实例
		//var point = new BMap.Point(116.404, 39.915); // 创建点坐标
		//map.centerAndZoom(point, 15); // 初始化地图，设置中心点坐标和地图级别
		map.addControl(new BMap.NavigationControl()); //添加缩放控件
	    map.addControl(new BMap.ScaleControl()); //添加比例尺控件
	    map.addControl(new BMap.OverviewMapControl()); //添加缩略图控件
	    map.enableScrollWheelZoom(); // 启用滚轮放大缩小。
	    map.enableKeyboard(); // 启用键盘操作。
		map.addEventListener("click",function(e) {
			/*var marker = new BMap.Marker(e.point); // 创建标注
			map.addOverlay(marker);*/
	        $("#mapX").val(e.point.lng);
	        $("#mapY").val(e.point.lat);
	        $("#zoom").val(map.getZoom());
	    });
		
		$.ajax({

			url:getRootPath() + "dq_list_get.shtm",
			type : "POST",
			data : '',
			contentType : "application/json; charset=utf-8",
			datatype : "json",
			success : function(result) {
				if (null==result || ""==result) {
					return;
				}else {
						var qiquData = eval('('+result+')');
						var mapSourceDetail = $("#mapSourceDetail");
						
						for(var dq in qiquData){
							var sDiv = "<div objId='"+qiquData[dq].dqid+"'  mapX='"+mapX+"' mapY='"+mapY+"'  style='border-bottom:1px solid #ccc;'>"+qiquData[dq].dqmc+"</div>"
							mapSourceDetail.append(sDiv);
						}
						
						
						$("#mapSourceDetail div").on("click",function(){
							if($(this) != $("#mapSourceDetail div.over").eq(0)){
								$("#mapSourceDetail div.over").removeClass("over");
								$(this).addClass('over');
								
								//更新地图中心点 
								var location = $("#mapSourceDetail div.over").eq(0).text();
								 //搜索
					            var local = new BMap.LocalSearch(map, {
					                renderOptions: {
					                    map: map
					                }
					            });
					            local.search(location);
					            
					            $.ajax({
									url:getRootPath() + "dq_get_by_id.shtm",
									type : "POST",
									data :  '{"dqid":'+$(this).attr("objId")+'}',
									contentType : "application/json; charset=utf-8",
									datatype : "json",
									success : function(result) {
										if (null==result || ""==result) {
											layer.alert("查询失败",8);
											return;
										}else {
											var diQuData = eval('('+result+')');
											var sourceDiv = $("#mapSourceDetail");
											var mapX = "";
											var mapY = "";
											var position = diQuData.position;
											if(position){
												var mapPos = position.split(",");
												mapX = mapPos[0];
												mapY = mapPos[1];
											}
											
											$("#zoom").val("");
											$("#mapX").val("");
											$("#mapY").val("");
											if(mapX){
												$("#mapX").val(mapX);
											}
											if(mapY){
												$("#mapY").val(mapY);
											}
											
											
											/*if($(this).attr("mapX") && $(this).attr("mapX")!="undefined"){
												$("#mapX").val($(this).attr("mapX"));
											}
											if($(this).attr("mapY")&& $(this).attr("mapY")!="undefined"){
												$("#mapY").val($(this).attr("mapY"));
											}
											if($(this).attr("zoom")&& $(this).attr("zoom")!="undefined"){
												$("#zoom").val($(this).attr("zoom"));
											}*/
										}
									}
								
					            });
							}
						});
				}
			}
		
		});
		
	
	function onDrag(e){
		var d = e.data;
		if (d.left < 0){d.left = 0}
		if (d.top < 0){d.top = 0}
		if (d.left + $(d.target).outerWidth() > $(d.parent).width()){
			d.left = $(d.parent).width() - $(d.target).outerWidth();
		}
		if (d.top + $(d.target).outerHeight() > $(d.parent).height()){
			d.top = $(d.parent).height() - $(d.target).outerHeight();
		}
	}
	
	$(".click_refresh").click(function(e) {
		refresh();
	});
	
	
	$(".click_save").on("click",function(){
		var data = [];
		$("#target div").each(function(index){
			var dqid = $(this).attr("objId");
			var rightDiv = $("#target").find("div[objId='"+dqid+"']").eq(0);
			var top = rightDiv.position().top;
			var left = rightDiv.position().left;
			var zbssObj = {};
			zbssObj.dqid = dqid;
			zbssObj.top = top;
			zbssObj.left = left;
			data[index] = zbssObj;
		});
		
		$.ajax({
			url:getRootPath() + "dqwzgl_save.shtm",
			type : "POST",
			data :  '{"data":'+object2JsonStr(data)+'}',
			contentType : "application/json; charset=utf-8",
			datatype : "json",
			success : function(result) {
				if (null==result || ""==result) {
					layer.alert("失败",8);
					return;
				}else {
					var zbssData = eval('('+result+')');
					layer.alert('地区位置更新成功！',1);
				}
			}
		});
		
	});
	
	$("#findMapBtn").on("click",function(){
			
			var location =$("#findMapKey").val(); 
			 //搜索
	        var local = new BMap.LocalSearch(map, {
	            renderOptions: {
	                map: map
	                //panel: "results_info"
	            }
	        });
	      //  map.panBy(point);
	        local.search(location);
	 });
	
	$("#saveMapPoint").on("click",function(){
		var selectMapDiv = $("#mapSourceDetail div.over").eq(0);
		if(selectMapDiv.length>0){
			var data = {};
			var dqid = selectMapDiv.attr("objId");
			data.dqid = dqid;
			var mapX = $("#mapX").val();
			var mapY = $("#mapY").val();
			if(mapX == null || mapY == null || mapX == "" ||mapY == ""){
				layer.alert("请选择地区所在地图的位置 ！",8);
				return;
			}
			data.position = mapX+","+mapY;
			$.ajax({
				url:getRootPath() + "dqwzgl_save.shtm",
				type : "POST",
				data :  '{"data":['+object2JsonStr(data)+']}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("失败",8);
						return;
					}else {
						//页面保存
						selectMapDiv.attr("mapX",mapX);
						selectMapDiv.attr("mapY",mapY);
						selectMapDiv.attr("zoom",$("#zoom").val());
						layer.alert('地区地图位置保存成功！',1);
					}
				}
			});
		}else{
			layer.alert("请选择一个地区",8);
		}
		
	});
	

	function refresh(){
		$.ajax({
			url : getRootPath() + "dispatcher.shtm?mark=25&page=1",
			type : "POST",
			contentType : "application/json; charset=utf-8",
			success : function(data, stats) {
				var result = $.parseJSON(data);
				if (1 == result.code) {
					window.parent.frames["rightFrame"].location.href=getRootPath()+result.data.url;
				} else {
					openLayer({type:0,msg:"刷新失败",btns:1,btn:['确定'],title:'系统温馨提示',area:['300','220'],icon:8});
				}
			}
	    });
	}
}


