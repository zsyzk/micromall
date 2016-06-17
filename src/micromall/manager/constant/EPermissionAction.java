package micromall.manager.constant;
/**
 * 
 * @ClassName:     EPermissionAction.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:58:45
 */
public enum EPermissionAction {

	REFRASH("01","重新加载"), // 重新加载
	NEW("02","新建"), // 新增
	UPDATE("03","编辑"), // 编辑
	DELETE("04","删除"), // 删除
	INFO("05","查阅详情"), // 查阅详情
	SEARCH("06","智能搜索"), // 智能搜索
	PUBLIC("07","发布"), // 发布
	ASSOCIATE("08","关联权限"), // 关联权限
	SAVE("09","位置保存"), // 位置保存
	DEFAULT("10","默认值"), // 默认值
	LAL("11","经纬度保存");// 经纬度保存

	private String value;
	
	private String actionName;

	public String getActionName() {
		return actionName;
	}

	public void setActionName(String actionName) {
		this.actionName = actionName;
	}

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private EPermissionAction(String value) {
		this.value = value;
	}
	private EPermissionAction(String value,String actionName) {
		this.value = value;
		this.actionName = actionName;
	}

}
