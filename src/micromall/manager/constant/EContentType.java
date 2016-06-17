/**
 * 
 */
package micromall.manager.constant;
/**
 * 
 * @ClassName:     EContentType.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:00:55
 */
public enum EContentType {

	TEXT_HTML("text/html;charset=UTF-8"), TEXT_XML("text/xml;charset=UTF-8");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private EContentType(String value) {
		this.value = value;
	}

}
