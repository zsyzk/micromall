var currnum = 1, pageContent = null,condition = null;
var mark=null;
function initPageContent() {
	// 初始化分页数据
	pageContent = {
		cont : $('#pagecont'),
		pages : 0,
		skip : true,
		skin : '#AF0000',
		groups : 0,
		curr : 0,
		jump : function(e) {
			currnum = e.curr;
			//alert(":::: = "+mark);
			pageFunction(mark, condition);
		}
	};
};

function changPageContent(pages, curr, groups) {
	if (null != curr) {
		pageContent.curr = curr;
	}
	if (null != pages) {
		pageContent.pages = pages;
	}
	if (null != groups) {
		pageContent.groups = groups;
	}

	laypage(pageContent);
}

/**
 * 修改分页控件
 * @param mark
 * @param condition
 * @param init
 */
function pageHelpFun(mark, condition, init) {
	// 是否为第一次调用。
	if (init == true) {
		initPageContent();
	}

	var url = getRootPath() + "load_page_help.shtm?mark=" + mark + "&page="
			+ currnum;

	if (null != condition) {
		url += "&condition=" + condition;
	}

	$.ajax({
		url : url,
		type : "POST",
		contentType : "application/json; charset=utf-8",
		success : function(data, stats) {
			var result = $.parseJSON(data);
			if (1 == result.code) {
				// 更新页面
				if (null != result.data.page && "" != result.data.page) {
					var pageValueTemp = eval(result.data.page);

					changPageContent(pageValueTemp.sumPage, pageValueTemp.page,
							pageValueTemp.dispayNum);
				}
			}
		}
	});
}

/**
 * 加载分页的内容
 * @param mark
 * @param condition
 */
function pageFunction(markValue, condition) {
	var url = getRootPath() + "load_page_data.shtm?mark=" + markValue + "&page="
			+ currnum;
	if (null != condition) {
		url += "&condition=" + condition;
	}
	var loading = layer.load('加载中，请稍后....');
	$.ajax({
				url : url,
				type : "POST",
				contentType : "application/json; charset=utf-8",
				success : function(data, stats) {
					layer.close(loading);
					var result = $.parseJSON(data);
					if (1 == result.code) {
						mark = markValue;
						$(".tablelist tbody").empty();
						if (null == result.data.page.pageData || "" == result.data.page.pageData) {
							var clos = -1;
							if(mark == 1 || mark == 4 || mark == 9 || mark == 24 || mark == 36){
								clos = 6;
							}else if (mark == 2) {
								clos = 5;
							}else if(mark == 3){
								clos = 12;
							}else if(mark == 7){
								clos = 5;
							}else if(mark == 8 || mark == 12 || mark == 17 || mark == 18){
								clos = 7;
							}else if(mark == 11 || mark == 15){
								clos = 8;
							}else if(mark == 10){
								clos = 10;
							}else if(mark == 13 || mark == 31){
								clos = 4;
							}else if(mark == 14){
								clos = 3;
							}else if(mark == 16){
								clos = 14;
							}else if(mark == 19){
								clos = 12;
							}else if(mark == 20 || mark == 21 || mark == 22 || mark == 23){
								clos = 13;
							}else if(mark == 27){
								clos = 7;
							}else if(mark == 28 || mark == 30 || mark == 29){
								clos = 6;
							}else if(mark == 35){
								clos = 5;
							}
							$(".tablelist tbody").append("<tr><td  width='100%' align='center' colspan='"+ clos + "'>暂无数据。</td> </tr>");
						} else {
							var jsonTemp = eval(result.data.page.pageData);
							
							if(mark == 1){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var status  = null;
									if(jsonTemp[i].status == 1)
									{
										status = "是";
									}else
									{
										status = "否";
									}
									$(".tablelist tbody").append("<tr>" +
											"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].sytkid+" /></td>" +
											"<td width='70' align='center'>"+jsonTemp[i].sytkid+"</td>" +
											"<td width='300' align='center'>"+jsonTemp[i].textTraditional+"</td>" +
											"<td width='300' align='center'>"+jsonTemp[i].textSimplified+"</td>" +
											"<td width='70' align='center'>"+status+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].lastDate+"</td>" +
											"</tr>");
									
								}
								
								$(".tablelist tbody tr td").each(function(){
									var text = $(this).text();
									if(text.length > 50){
										var textB = text.substring(0,100);
										$(this).html(textB+".........");
									}
								})
								
							}else if (mark == 2) {
								for (var i = 0; i < jsonTemp.length; i++) {
									$(".tablelist tbody")
											.append(
													"<tr>"
															+ "<td width = '50'><input type='checkbox'  id="
															+ jsonTemp[i].userId
															+ " /></td>"
															+ "<td width = '100'>"
															+ jsonTemp[i].userId
															+ "</td>"
															+ "<td width = '200'>"
															+ jsonTemp[i].username
															+ "</td>"
															+ "<td width = '200'>"
															+ jsonTemp[i].userTypeName
															+ "</td>" + "</tr>");
								}
							}else if(mark == 3){
								var path = getRootPath() +"upload/zbss/";
								for(var i=0; i<jsonTemp.length; i++)
								{
									$(".tablelist tbody").append("<tr>" +
											"<td width='30' align='center'><input  type='checkbox'  fid="+jsonTemp[i].zbssid+" /></td>" +
											"<td width='80' align='center'>"+jsonTemp[i].zbssid+"</td>" +
											"<td width='120' align='center'> <img align='middle' width='70' height='70' alt='"+jsonTemp[i].zdmc+"' src='"+path+jsonTemp[i].zbsslogo+"'/> </td>" +
											"<td width='120' align='center'>"+jsonTemp[i].zdmc+"</td>" +
											"<td width='100' align='center'>"+jsonTemp[i].zbsstypeMc+"</td>" +
											"<td width='105' align='center'>"+jsonTemp[i].zbssmcS+"</td>" +
											"<td width='105' align='center'>"+jsonTemp[i].zbssmcT+"</td>" +
											"<td width='100' align='center'>"+jsonTemp[i].zbssdzS+"</td>" +
											"<td width='100' align='center'>"+jsonTemp[i].zbssdzT+"</td>" +
											"<td width='100' align='center'>"+jsonTemp[i].zbssdh+"</td>" +
											"<td width='200' align='center'>"+jsonTemp[i].zbssmsS+"</td>" +
											"<td width='200' align='center'>"+jsonTemp[i].zbssmsT+"</td>" +
											"</tr>");
								}
							}
							else  if(mark == 4){
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
							}else if(mark == 7){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var ctype = jsonTemp[i].clientType == 8 ? "Android":(jsonTemp[i].clientType == 18?"IOS":"未知");
									$(".tablelist tbody").append("<tr>" +
											"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].versionId+" pn="+jsonTemp[i].clientType+" /></td>" +
											"<td width='70' align='center'>"+jsonTemp[i].versionId+"</td>" +
											"<td width='100' align='center'>"+jsonTemp[i].version+".0"+"</td>" +
											"<td width='100' align='center'>"+ctype+"</td>" +
											"<td width='120' align='center'>"+jsonTemp[i].updateDate+"</td>" +
//											"<td width='200' align='center'>"+jsonTemp[i].url+"</td>" +
//											"<td width='200' align='center'>"+jsonTemp[i].content+"</td>" +
											"</tr>");
								}
							}else if(mark == 8){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var display = jsonTemp[i].display == 1 ? "显示":"不显示";
									
									$(".tablelist tbody").append("<tr>" +
											"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].dqid+" /></td>" +
											"<td width='70' align='center'>"+jsonTemp[i].dqid+"</td>" +
											"<td width='300' align='center'>"+jsonTemp[i].dqmc+"</td>" +
											"<td width='200' align='center'>"+jsonTemp[i].position+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].x+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].y+"</td>" +
											"<td width='150' align='center'>"+display+"</td>" +
											"</tr>");
								}
							}else if (mark == 9){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var fx = jsonTemp[i].xlfx == 1 ? "南行":(jsonTemp[i].xlfx == 2 ? "北行":"未知");
									
									$(".tablelist tbody").append("<tr>" +
											"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].xlid+" /></td>" +
											"<td width='70' align='center'>"+jsonTemp[i].xlid+"</td>" +
											"<td width='120' align='center'>"+jsonTemp[i].xlmc+"</td>" +
											"<td width='400' align='center'>"+fx+"</td>" +
											"<td width='400' align='center'>"+jsonTemp[i].qsdqmc+"</td>" +
											"<td width='400' align='center'>"+jsonTemp[i].zddqmc+"</td>" +
											"</tr>");
								}		
							}else if (mark == 10){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var xzzw = jsonTemp[i].xzzw == 1 ? "是":(jsonTemp[i].xzzw == 2 ? "否":"未知");
									var istp = jsonTemp[i].istp == 1 ? "是":(jsonTemp[i].istp == 2 ? "否":"未知");
									
									$("#div_banci .tablelist tbody").append("<tr>" +
											"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].bcid+" /></td>" +
											"<td width='70' align='center'>"+jsonTemp[i].bcid+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].xlmc+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].bcrq+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].bcsj+"</td>" +
											"<td width='70' align='center'>"+jsonTemp[i].zws+"</td>" +
											"<td width='120' align='center'>"+xzzw+"</td>" +
											"<td width='120' align='center'>"+istp+"</td>" +
											"<td width='120' align='center'>"+jsonTemp[i].jbpjCNY+"</td>" +
											"<td width='120' align='center'>"+jsonTemp[i].jbpjHKD+"</td>" +
											"</tr>");
								}			
							}
							else if (mark == 11){
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
							}else if (mark == 12){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var type = jsonTemp[i].type == 1 ? "上车点":(jsonTemp[i].type == 2 ? "下车点":"未知");
									var xztp = jsonTemp[i].xztp == 1 ? "是":(jsonTemp[i].xztp == 2 ? "否":"未知");
									var ccsj = jsonTemp[i].ccsj != null ? jsonTemp[i].ccsj : "";
									
									$("#div_zd .tablelist tbody").append("<tr>" +
											"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].zdid+" /></td>" +
											"<td width='70' align='center'>"+jsonTemp[i].zdid+"</td>" +
											"<td width='200' align='center'>"+jsonTemp[i].zdbaseName+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].bcrq+"</td>" +
											"<td width='150' align='center'>"+ccsj+"</td>" +
											"<td width='120' align='center'>"+type+"</td>" +
											"<td width='120' align='center'>"+xztp+"</td>" +
											"</tr>");
								}
							}else if(mark == 13){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var mark = jsonTemp[i].mark == 1 ? "是":(jsonTemp[i].mark == 2 ? "否":"未知");
									
									$("#div_jjr .tablelist tbody").append("<tr>" +
											"<td width='70' align='center'>"+jsonTemp[i].holidayid+"</td>" +
											"<td width='200' align='center'>"+jsonTemp[i].msg+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].date+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].year+"</td>" +
											"</tr>");
								}		
							}else if(mark == 14){
								for(var i=0; i<jsonTemp.length; i++)
								{
									$("#div_zwt .tablelist tbody").append("<tr>" +
											"<td width='70' align='center'>"+jsonTemp[i].zwtid+"</td>" +
											"<td width='100' align='center'>"+jsonTemp[i].zws+"</td>" +
											"<td width='500' align='center'>"+jsonTemp[i].zwt+"</td>" +
											"</tr>");
								}	
							}
							else if(mark == 24){
								for(var i=0; i<jsonTemp.length; i++)
								{
									$(".tablelist tbody").append("<tr>" +
											"<td width='70' align='center'>"+jsonTemp[i].cyxlid+"</td>" +
											"<td width='120' align='center'>"+jsonTemp[i].userid+"</td>" +
											"<td width='120' align='center'>"+jsonTemp[i].savedata+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].xlmc+"</td>" +
											"<td width='120' align='center'>"+jsonTemp[i].sczdmc+"</td>" +
											"<td width='120' align='center'>"+jsonTemp[i].xczdmc+"</td>" +
											"</tr>");
								}
							}
							else if(mark == 31){
								for(var i=0; i<jsonTemp.length; i++)
								{
									$(".tablelist tbody").append("<tr>" +
											"<td width = '50'><input type='checkbox'  fid="+jsonTemp[i].userTypeId+" /></td>" +
											"<td width = '70'>"+jsonTemp[i].userTypeId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].typeName+"</td>" +
											"<td width = '400'>"+jsonTemp[i].typeMs+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 15){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var moneyType = jsonTemp[i].moneyType == 1 ? "人民币"
											: (jsonTemp[i].moneyType == 2 ? "港币"
													: "未知");
									
									var status  = null;
									if(jsonTemp[i].status == 1)
									{
										status = "活动";
									}else if(jsonTemp[i].status == 105)
									{
										status = "历史";
									}else
									{
										status = "其它";
									}
									$(".tablelist tbody").append("<tr>" +
											"<td width = '70'>"+jsonTemp[i].cpOrderId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].orderNum+"</td>" +
											"<td width = '120'>"+jsonTemp[i].userId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].buyDate+"</td>" +
											"<td width = '120'>"+moneyType+"</td>" +
											"<td width = '120'>"+status+"</td>" +
											"<td width = '120'>"+jsonTemp[i].cpSum+"</td>" +
											"<td width = '120'>"+jsonTemp[i].price+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 16){
								
								var path = getRootPath() +"chepiao/";
								
								for(var i=0; i<jsonTemp.length; i++)
								{
									var moneyType = jsonTemp[i].moneyType == 1 ? "人民币"
											: (jsonTemp[i].moneyType == 2 ? "港币"
													: "未知");	
									
									var istp = jsonTemp[i].istp == 1 ? "是"
											: (jsonTemp[i].istp == 2 ? "否" : "未知");
									
									var status = null;
									if (jsonTemp[i].status == 101) {
										status = "待付款";
									} else if (jsonTemp[i].status == 102) {
										status = "待乘车";
									} else if (jsonTemp[i].status == 103) {
										status = "改签待乘车";
									} else if (jsonTemp[i].status == 104) {
										status = "已乘车";
									} else if (jsonTemp[i].status == 105) {
										status = "历史";
									}
																	
									$(".tablelist tbody").append("<tr>" +
											"<td width = '70'>"+jsonTemp[i].cpId+"</td>" +
											"<td width='130' align='center'> <img align='middle' width='60' height='60' alt='"+jsonTemp[i].code+"' src='"+path+jsonTemp[i].code+"'/> </td>" +
											"<td width = '190'>"+jsonTemp[i].orderNum+"</td>" +
											"<td width = '100'>"+jsonTemp[i].userId+"</td>" +
											"<td width = '200'>"+jsonTemp[i].xlMc+"</td>" +
											"<td width = '120'>"+jsonTemp[i].bcrq+"</td>" +
											"<td width = '100'>"+jsonTemp[i].bcsj+"</td>" +
											"<td width = '100'>"+jsonTemp[i].sczdMc+"</td>" +
											"<td width = '100'>"+jsonTemp[i].xczdMc+"</td>" +
											"<td width = '100'>"+jsonTemp[i].buyDate+"</td>" +
											"<td width = '120'>"+moneyType+"</td>" +
											"<td width = '70'>"+jsonTemp[i].zwbh+"</td>" +
											"<td width = '100'>"+status+"</td>" +
											"<td width = '70'>"+istp+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 17 || mark == 18){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var moneyType  = null;
									if(jsonTemp[i].moneyType == 1)
									{
										moneyType = "人民币";
									}else if(jsonTemp[i].status == 2)
									{
										moneyType = "港币";
									}else
									{
										moneyType = "其它";
									}									
									
									$(".tablelist tbody").append("<tr>" +
											"<td width = '70'>"+jsonTemp[i].cpOrderId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].orderNum+"</td>" +
											"<td width = '120'>"+jsonTemp[i].userId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].buyDate+"</td>" +
											"<td width = '120'>"+moneyType+"</td>" +
											"<td width = '120'>"+jsonTemp[i].cpSum+"</td>" +
											"<td width = '120'>"+jsonTemp[i].price+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 19){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var moneyType = jsonTemp[i].moneyType == 1 ? "人民币"
											: (jsonTemp[i].moneyType == 2 ? "港币"
													: "未知");	
									
									var istp = jsonTemp[i].istp == 1 ? "是"
											: (jsonTemp[i].istp == 2 ? "否" : "未知");
																	
									$(".tablelist tbody").append("<tr>" +
											"<td width = '70'>"+jsonTemp[i].cpId+"</td>" +
											"<td width = '190'>"+jsonTemp[i].orderNum+"</td>" +
											"<td width = '100'>"+jsonTemp[i].userId+"</td>" +
											"<td width = '200'>"+jsonTemp[i].xlMc+"</td>" +
											"<td width = '120'>"+jsonTemp[i].bcrq+"</td>" +
											"<td width = '100'>"+jsonTemp[i].bcsj+"</td>" +
											"<td width = '100'>"+jsonTemp[i].sczdMc+"</td>" +
											"<td width = '100'>"+jsonTemp[i].xczdMc+"</td>" +
											"<td width = '100'>"+jsonTemp[i].buyDate+"</td>" +
											"<td width = '100'>"+moneyType+"</td>" +
											"<td width = '70'>"+jsonTemp[i].zwbh+"</td>" +
											"<td width = '70'>"+istp+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 20 || mark == 21 || mark == 22 || mark == 23){
								
								var path = getRootPath() +"chepiao/";
								
								for(var i=0; i<jsonTemp.length; i++)
								{
									var moneyType = jsonTemp[i].moneyType == 1 ? "人民币"
											: (jsonTemp[i].moneyType == 2 ? "港币"
													: "未知");	
									
									var istp = jsonTemp[i].istp == 1 ? "是"
											: (jsonTemp[i].istp == 2 ? "否" : "未知");
									
									$(".tablelist tbody").append("<tr>" +
											"<td width = '70'>"+jsonTemp[i].cpId+"</td>" +
											"<td width='130' align='center'> <img align='middle' width='60' height='60' alt='"+jsonTemp[i].code+"' src='"+path+jsonTemp[i].code+"'/> </td>" +
											"<td width = '190'>"+jsonTemp[i].orderNum+"</td>" +
											"<td width = '100'>"+jsonTemp[i].userId+"</td>" +
											"<td width = '200'>"+jsonTemp[i].xlMc+"</td>" +
											"<td width = '120'>"+jsonTemp[i].bcrq+"</td>" +
											"<td width = '100'>"+jsonTemp[i].bcsj+"</td>" +
											"<td width = '100'>"+jsonTemp[i].sczdMc+"</td>" +
											"<td width = '100'>"+jsonTemp[i].xczdMc+"</td>" +
											"<td width = '100'>"+jsonTemp[i].buyDate+"</td>" +
											"<td width = '100'>"+moneyType+"</td>" +
											"<td width = '70'>"+jsonTemp[i].zwbh+"</td>" +
											"<td width = '70'>"+istp+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 27){
								
								for(var i=0; i<jsonTemp.length; i++)
								{
									var cpSource = null;
									if(jsonTemp[i].cpSource == 1)
									{
										cpSource = "售票厅";
									}else if(jsonTemp[i].cpSource == 2)
									{
										cpSource = "APP";
									} else if(jsonTemp[i].cpSource == 3)
									{
										cpSource = "网站";
									} else
									{
										cpSource = "未知";
									}
													
									var result = null;
									if(jsonTemp[i].result == 1)
									{
										result = "验票通过";
									}else if(jsonTemp[i].result == 2)
									{
										result = "验证异常-已使用";
									} else if(jsonTemp[i].result == 3)
									{
										result = "验证异常-无效车票";
									} else if(jsonTemp[i].result == 4)
									{
										result = "验证异常-系统错误";
									}
									
									$(".tablelist tbody").append("<tr>" +
											"<td width = '70'>"+jsonTemp[i].cccId+"</td>" +
											"<td width = '130'>"+jsonTemp[i].cpNumber+"</td>" +
											"<td width = '190'>"+cpSource+"</td>" +
											"<td width = '100'>"+result+"</td>" +
											"<td width = '120'>"+jsonTemp[i].userId+"</td>" +
											"<td width = '200'>"+jsonTemp[i].chkDate+"</td>" +
											"<td width = '100'>"+jsonTemp[i].sbId+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 28 || mark == 30 || mark == 29){								
								for(var i=0; i<jsonTemp.length; i++)
								{
									var result = null;
									if(jsonTemp[i].result == 1)
									{
										result = "验票通过";
									}else if(jsonTemp[i].result == 2)
									{
										result = "验证异常-已使用";
									} else if(jsonTemp[i].result == 3)
									{
										result = "验证异常-无效车票";
									} else if(jsonTemp[i].result == 4)
									{
										result = "验证异常-系统错误";
									}
									
									$(".tablelist tbody").append("<tr>" +
											"<td width = '70'>"+jsonTemp[i].cccId+"</td>" +
											"<td width = '130'>"+jsonTemp[i].cpNumber+"</td>" +
											"<td width = '100'>"+result+"</td>" +
											"<td width = '120'>"+jsonTemp[i].userId+"</td>" +
											"<td width = '200'>"+jsonTemp[i].chkDate+"</td>" +
											"<td width = '100'>"+jsonTemp[i].sbId+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 35){								
								for(var i=0; i<jsonTemp.length; i++)
								{
																
									$(".tablelist tbody").append("<tr>" +
											"<td width = '70'>"+jsonTemp[i].ticketTransferId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].eticketId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].fromMemberId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].toMemberId+"</td>" +
											"<td width = '120'>"+jsonTemp[i].transferDate+"</td>" +
									"</tr>");
								}
							}
							else if(mark == 36){
								for(var i=0; i<jsonTemp.length; i++)
								{
									var busState  = null;
									if(jsonTemp[i].busState == 1)
									{
										busState = "是";
									}else
									{
										busState = "否";
									}
									$(".tablelist tbody").append("<tr>" +
											"<td width='50' align='center'><input  type='checkbox'  fid="+jsonTemp[i].spzlId+" /></td>" +
											"<td width='70' align='center'>"+jsonTemp[i].spzlId+"</td>" +
											"<td width='300' align='center'>"+jsonTemp[i].textTraditional+"</td>" +
											"<td width='300' align='center'>"+jsonTemp[i].textSimplified+"</td>" +
											"<td width='70' align='center'>"+busState+"</td>" +
											"<td width='150' align='center'>"+jsonTemp[i].releaseDate+"</td>" +
											"</tr>");
									
								}
								
								$(".tablelist tbody tr td").each(function(){
									var text = $(this).text();
									if(text.length > 50){
										var textB = text.substring(0,50);
										$(this).html(textB+".........");
									}
									if(text == "undefined" || text == null){
										$(this).html("");
									}
								})
								
							}
						

							/**
							 * 复选框只能选一个
							 */
							$('.tablelist input[type="checkbox"]')
									.on(
											"click",
											function() {
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

							$('.tablelist tbody tr:odd').addClass('odd');

						}
					}
				}
			});
}

/**
 * 初始化分页控件，加载默认的控件内容，单独采用一个方法初始化，因初始化会默认调用回调函数
 * @param markValue
 */
function initPage(markValue) {
	
	//如果是重新加载，则将页数设置为第一页，条件为null
	mark = markValue;

	pageHelpFun(mark, condition, true);

}

function setPage(markValue, con, init) {
	
	//如果是重新加载，则将页数设置为第一页，条件为null
	if (init == true) {
		mark = markValue;
		currnum = 1;
		condition = null;
		//初始化默认的分页数据
		initPageContent();
		pageHelpFun(mark, condition, true);
	}else
	{
		mark = markValue;
		pageFunction(mark, con);
		pageHelpFun(mark, con, true);
	}	
}
