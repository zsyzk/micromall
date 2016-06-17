package micromall.manager.constant;
/**
 * 
 * @ClassName:     EResultJson.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:59:01
 */
public enum EResultJson {

	PARA_IS_NULL("{\"result\":\"1\"}"), DATABASE_IS_EXCEPTION(
			"{\"result\":\"2\"}"), JSONFORMAT("\"result\":\"3\"");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private EResultJson(String value) {
		this.value = value;
	}

}
