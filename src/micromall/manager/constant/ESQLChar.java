package micromall.manager.constant;
/**
 * 
 * @ClassName:     ESQLChar.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:59:14
 */
public enum ESQLChar {

	ONE("?"),TWO("$");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private ESQLChar(String value) {
		this.value = value;
	}

}
