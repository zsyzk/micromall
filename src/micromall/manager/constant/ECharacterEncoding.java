package micromall.manager.constant;
/**
 * 
 * @ClassName:     ECharacterEncoding.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:02:04
 */
public enum ECharacterEncoding {

	UTF8("UTF-8"), GBK("GBK");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private ECharacterEncoding(String value) {
		this.value = value;
	}

}
