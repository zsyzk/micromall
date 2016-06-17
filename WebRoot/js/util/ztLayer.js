
/**	<ul>
 * <li>layer弹出层控件操作
 * <li>@param style {type:--类型--0：信息框（提示框,询问框），1：页面层(弹出框)，2：iframe层(新页面)，3：加载层(提示加载中)，4：tips层(小提示文本)
 * <li>,area:--宽高--['auto','auto'],shade:--遮挡层--[0.5（透明度）,'#fff'(颜色)]
 * <li>,btn:--按钮文字--['确定','取消'],btns:--按钮数--2,yes:--第一个按钮的点击事件--function,no:--第二个按钮的点击事件--function
 * <li>,title:--标题--'标题文字',shift:--从什么方向弹出该层--左上('left-top'),上('top'), 右上('right-top'),右下('right-bottom'),下('bottom'),左下('left-bottom'),左('left')
 * <li>,page:--当前层指定的dom的id或者url或者html代码--dom:dom或url:url或html:html
 * <li>,follow:--tip的目标dom元素的选择器--'.class',msg:--tip内容--'tip消息提醒'
 * <li>,guide:--tip方向--'0上,1右,2下,3左',time:--tip显示时间--3(秒)}
 * <li>@returns  : 该控件
 * 
 * 一般弹出框：pageii = openLayer({type:1,html:selectHTML,title:'选择框',success:selectInit});
 * <li>icon(16个)--0:感叹号;1:勾;2:铅笔和尺子叉;3:不允许(圆圈中间一撇);4:问号;5:不允许（减号);6:大拇指...
 * 提示框：layer.alert("提示消息",type);	type值为1-15		
 */
function openLayer(style){
	var pageii;
	var diy = true;
	if(isNull(style)){
		diy = false;
	}
	
	var type = style.type;
	var area;var shade;var btn;var btns;
	var yes;var no;var title;var shift;var success;
	var page;var follow;var msg;var guide;var time;var zIndex;
	//层的类型。
	//type--"0：信息框（提示框,询问框），1：页面层(弹出框)，2：iframe层(新页面)，3：加载层(提示加载中)，4：tips层(小提示文本)。"
	//layer.alert("请选择一项!",8);
	//层内部图标类型  -1为不显示图标
	//type(16个)--0:感叹号;1:勾;2:铅笔和尺子叉;3:不允许(圆圈中间一撇);4:问号;5:不允许（减号);6:大拇指...
	if(type==0){
		if(diy && isNotNull(style.title)){
			title=style.title;
		}else{
			title= '信息';
		}
		if(diy && isNotNull(style.yes)){
			yes=style.yes;
		}else{
			yes= function(){layer.close(pageii);};
		}
		if(diy && isNotNull(style.no)){
			no=style.no;
		}else{
			no=function(){layer.close(pageii);};
		}

		if(diy && isNotNull(style.btns) && isNotNull(style.btn)){
			btns=style.btns;
			btn=style.btn;
		}else{
			btns= 2;
			btn= ['确定','取消'];
		}
		if(diy && isNotNull(style.area)){
			area=style.area;//宽高
		}else{
			 area=['auto','auto'];
		}
		if(diy && isNotNull(style.shade)){
			shade=[style.shade,'#fff'];
		}else{
			shade=[0];
		}
		pageii = $.layer({
			area:area,
			shade:shade,
			title:title,
			type: type,
		    dialog: {
		        msg: style.msg,
		        btns: btns,                    
		        btn: btn,
		        type:style.icon,
		        yes:yes,
		        no:no
	
		    }
		});
	}else if(type==1){
		if(diy && isNotNull(style.area)){
			area=style.area;//宽高
		}else{
			area=['600px', 'auto'];
		}
		if(diy && isNotNull(style.title)){
			title=style.title;//宽高
		}else{
			title="标题";
		}
		if(diy && isNotNull(style.zIndex)){
			zIndex=style.zIndex;//宽高
		}else{
			zIndex=999;
		}
		if(diy && isNotNull(style.success)){
			success=style.success;//宽高
		}else{
			success=function(){};
		}
		if(diy && isNotNull(style.shade)){
			shade=[style.shade,'#fff'];
		}else{
			shade=[0.5,'#fff'];
		}if(diy && isNotNull(style.shift)){
			shift=style.shift;
		}else{
			shift='';
		}
		if(diy && isNotNull(style.dom)){
			page = {dom:style.dom};
		}else if(diy && isNotNull(style.url)){
			page = {url:style.url};
		}else if(diy && isNotNull(style.html)){
			page = {html:style.html};
		}
		pageii = $.layer({
		    type: type,
		    offset:['60px',''],
		    title: title,
		    shift:shift,
			area:area,
		    border: [5,0.3,'#000'], 
		    shade: shade,
		    bgcolor:'#fff',//背景色
		    page: page,
		    success:success
		});
	}else if(type==2){
	
	}else if(type==3){
		
	}else if(type==4){
		if(diy && isNotNull(style.msg)){
			msg=style.msg;
		}else{
			msg="提示信息";
		}
		if(diy && isNotNull(style.follow)){
			follow=style.follow;
		}else{
			follow='';
		}
		if(diy && isNotNull(style.guide)){
			guide=style.guide;//宽高
		}else{
			guide=0;
		}
		if(diy && isNotNull(style.time)){
			time=style.time;//宽高
		}else{
			time=3;
		}
		pageii = layer.tips(msg, follow ,{
			time:time,
		    guide:guide,
		    style:['background-color:#FFF8ED; color:#000; border:1px solid #FF9900; ', '#FF9900']
		});
	}
	
	return pageii;
}

/**
 * 成功框
 * @param msg	成功信息
 * @param yes	确定事件
 */
function ztSucAlert(msg,yes){
	var tempLayer = null;
	var yesTemp = null;
	if(!yes){
		yesTemp = function(){
			layer.close(tempLayer);
		};
	}else{
		yesTemp = function(){
			yes();
			layer.close(tempLayer);
		};
	}
	tempLayer = openLayer({
		type : 0,
		msg : msg,
		btns : 1,
		btn : [ '确定' ],
		yes: yesTemp,
		title : '系统温馨提示',
		area : [ '300', '220' ],
		icon : 1
	});
}
/**
 * 失败框
 * @param msg	失败信息
 * @param yes	确定事件
 */
function ztFailAlert(msg,yes){
	var tempLayer = null;
	var yesTemp = null;
	if(!yes){
		yesTemp = function(){
			layer.close(tempLayer);
		};
	}else{
		yesTemp = function(){
			yes();
			layer.close(tempLayer);
		};
	}
	tempLayer = openLayer({
			type : 0,
			msg : msg,
			btns : 1,
			btn : [ '确定' ],
			yes	: yesTemp,
			title : '系统温馨提示',
			area : [ '300', '220' ],
			icon : 8
		});
}

/**
 * 提示框
 * @param msg	提示信息
 * @param yes	确定事件
 */
function ztInfoAlert(msg){
	 openLayer({
			type : 0,
			msg : msg,
			btns : 1,
			btn : [ '确定' ],
			title : '系统温馨提示',
			area : [ '300', '220' ],
			icon : 3
		});
}

/**
 * 确认框
 * @param msg	确认信息	
 * @param yes	确定事件
 */
function ztConfirm(msg,yes){
	var tempLayer = openLayer({
		type : 0,
		msg : msg,
		btns : 2,
		btn : [ '确定','取消' ],
		yes:function(){
			yes();
			layer.close(tempLayer);
		},
		title : '系统温馨提示',
		area : [ '300', '220' ],
		icon : 4
	});
}
