	function init() {
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
				url:getRootPath() + "zb_getListWithIdAndName.shtm",
				type : "POST",
				data : '',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						return;
					}else {
							var zhandianData = eval('('+result+')');
							var zhandianSelect = $("#zhandians");
							var mapZhandianSelect = $("#mapZhandians");
							
							zhandianSelect.append("<option value=''>请选择站点</option>");
							mapZhandianSelect.append("<option value=''>请选择站点</option>");
							for(var zd in zhandianData){
								var option = "<option value='"+zhandianData[zd].zdbaseid+"'>"+zhandianData[zd].zdmc+"</option>";
								zhandianSelect.append(option);
								mapZhandianSelect.append(option);
							}
							//地图位置 select change
							mapZhandianSelect.on("change",function(){
								if($(this).val()){
									//更新地图中心点 
									var location = $(this).find("option:selected").text();
									 //搜索
						            var local = new BMap.LocalSearch(map, {
						                renderOptions: {
						                    map: map
						                    //panel: "results_info"
						                }
						            });
						          //  map.panBy(point);
						            local.search(location);
						           // local.getResults();
									
									
									//更新站点
									$.ajax({
										url:getRootPath() + "zbss_getByZdId.shtm",
										type : "POST",
										data :  '{"zdid":'+$(this).val()+'}',
										contentType : "application/json; charset=utf-8",
										datatype : "json",
										success : function(result) {
											if (null==result || ""==result) {
												layer.alert("查询失败",8);
												return;
											}else {
												var zbssData = eval('('+result+')');
												var sourceDiv = $("#mapSourceDetail");
												sourceDiv.html("");
												var zbssDataList =  zbssData.data;
												for(var sz in zbssDataList){
													var mapX = "";
													var mapY = "";
													var position = zbssDataList[sz].position;
													if(position){
														var mapPos = position.split(",");
														mapX = mapPos[0];
														mapY = mapPos[1];
													}
													var sDiv = "<div objId='"+zbssDataList[sz].zbssid+"'  mapX='"+mapX+"' mapY='"+mapY+"'  style='border-bottom:1px solid #ccc;' class='over' >"+zbssDataList[sz].zbssmc+"</div>"
													sourceDiv.append(sDiv);
												}
												bindMapSourceClick();
											}
										}
									});
								}
								
							});
							
							zhandianSelect.on("change",function(){
								if($(this).val()){
									$.ajax({
										url:getRootPath() + "zbss_getByZdId.shtm",
										type : "POST",
										data :  '{"zdid":'+$(this).val()+'}',
										contentType : "application/json; charset=utf-8",
										datatype : "json",
										success : function(result) {
											if (null==result || ""==result) {
												layer.alert("查询失败",8);
												return;
											}else {
												var zbssData = eval('('+result+')');
												var sourceDiv = $("#sourceDetail");
												var targetDiv = $("#target");
												sourceDiv.html("");
												targetDiv.html("");
												var targetDiv = $("#target");
												var zbssDataList =  zbssData.data;
												for(var sz in zbssDataList){
													var zbStatus =  zbssDataList[sz].status;
													if(zbStatus == "1"){
														var dragDiv = $("<div objId='"+zbssDataList[sz].zbssid+"' style='text-align:center;width:100px;height:25px;background:#fafafa;border:1px solid #ccc;'>"+zbssDataList[sz].zbssmc+"	</div>");
														targetDiv.append(dragDiv);
														dragDiv.draggable({
															onDrag:onDrag
														});
														var zbLeft = zbssDataList[sz].x;
														var zbTop = zbssDataList[sz].y;
														dragDiv.css({position: "absolute",'left':zbLeft,'top':zbTop});
														
														var sDiv = "<div objId='"+zbssDataList[sz].zbssid+"' style='border-bottom:1px solid #ccc;' class='over' >"+zbssDataList[sz].zbssmc+"</div>"
														sourceDiv.append(sDiv);
														
													}else{
														var sDiv = "<div objId='"+zbssDataList[sz].zbssid+"' style='border-bottom:1px solid #ccc;' >"+zbssDataList[sz].zbssmc+"</div>"
														sourceDiv.append(sDiv);
													}
												}
												bindSourceClick();
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
		function bindMapSourceClick(){
			$("#mapSourceDetail div").on("click",function(){
				if($(this) != $("#mapSourceDetail div.over").eq(0)){
					$("#mapSourceDetail div.over").removeClass("over");
					$(this).addClass('over');
					$("#zoom").val("");
					$("#mapX").val("");
					$("#mapY").val("");
					if($(this).attr("mapX") && $(this).attr("mapX")!="undefined"){
						$("#mapX").val($(this).attr("mapX"));
					}
					if($(this).attr("mapY")&& $(this).attr("mapY")!="undefined"){
						$("#mapY").val($(this).attr("mapY"));
					}
					if($(this).attr("zoom")&& $(this).attr("zoom")!="undefined"){
						$("#zoom").val($(this).attr("zoom"));
					}
					
				}
			});
		}
		
		$("#saveMapPoint").on("click",function(){
			var selectMapDiv = $("#mapSourceDetail div.over").eq(0);
			if(selectMapDiv.length>0){
				var data = {};
				var zbssid = selectMapDiv.attr("objId");
				data.zdid = zbssid;
				var mapX = $("#mapX").val();
				var mapY = $("#mapY").val();
				data.position = mapX+","+mapY;
				$.ajax({
					url:getRootPath() + "zbss_save.shtm",
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
							layer.alert('周边设施地图位置保存成功！',1);
						}
					}
				});
			}else{
				layer.alert("请选择一个周边设施",8);
			}
			
		});
		
		function bindSourceClick(){
			$("#sourceDetail div").on("click",function(){
					var id = $(this).attr("objId");
					if(id){
						if($(this).hasClass("over")){
							$("#target").find("div[objId='"+id+"']").remove();
							$(this).removeClass("over");
						}else{
							var dragDiv = $("<div objId='"+id+"' style='text-align:center;width:100px;height:25px;background:#fafafa;border:1px solid #ccc;'>"+$(this).text()+"	</div>");
							$("#target").append(dragDiv);
							dragDiv.draggable({
								onDrag:onDrag
							});
							$(this).addClass('over');
						}
					}
			});
		}
		
		
		$(".click_refresh").click(function(e) {
			refresh();
		});
		
		
		$(".click_save").on("click",function(){
			var data = [];
			$("#sourceDetail div").each(function(index,value){
				var zbssid = $(this).attr("objId");
				var top = -1;
				var left = -1;
				var exsit = 0;
				if($(this).hasClass("over")){
					var rightDiv = $("#target").find("div[objId='"+zbssid+"']").eq(0);
					top = rightDiv.position().top;
					left = rightDiv.position().left;
					exsit = 1;
				}
				var zbssObj = {};
				zbssObj.zbssid = zbssid;
				zbssObj.exsit = exsit;
				zbssObj.top = top;
				zbssObj.left = left;
				data[index] = zbssObj;
			});
			
			$.ajax({
				url:getRootPath() + "zbss_save.shtm",
				type : "POST",
				data :  '{"data":'+object2JsonStr(data)+'}',
				contentType : "application/json; charset=utf-8",
				datatype : "json",
				success : function(result) {
					if (null==result || ""==result) {
						layer.alert("失败",8);
						return;
					}else {
						layer.alert('周边设施位置保存成功！',1);
					}
				}
			});
			
		});
	function refresh(){
		//先不采用AJAX刷新表格，后续做分页时一起开发，采用重新加载页面
		$.ajax({
		url : getRootPath() + "dispatcher.shtm?mark=6",
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


