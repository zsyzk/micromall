package micromall.manager.constant;
/**
 * 
 * @ClassName:     EResultString.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:59:08
 */
public enum EResultString {

	SUCCESS("系统操作成功"), FAIL("系统操作失败："), PARNULL("参数为空"), JSONFORMAT(
			"参数JSON格式错误"), EXCEPTION("系统操作异常");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private EResultString(String value) {
		this.value = value;
	}

}
