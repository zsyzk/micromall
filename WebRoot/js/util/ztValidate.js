/**
 * 表单验证
 */
function form_validate(){
	var liArr = $(".forminfo").children("li");
	alert(json2str(liArr));
	
	if(0 == $('#mc').val().length){
		layer.alert("周边设施类别名称不能为空 ！",3);
		return false;
	};
}