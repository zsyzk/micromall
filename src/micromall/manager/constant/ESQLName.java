package micromall.manager.constant;
/**
 * 
 * @ClassName:     ESQLName.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:59:22
 */
public enum ESQLName {

	SELECT_CHEPIAO_ZT("selChePiaoZT");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private ESQLName(String value) {
		this.value = value;
	}

}
