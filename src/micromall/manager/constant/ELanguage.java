
package micromall.manager.constant;

/**
 * 
 * @ClassName:     ELanguage.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:57:29
 */
public enum ELanguage {

	/**
	 * 简体Simplified(1), 繁体Traditional(2), 英文EN(3);
	 */
	JT(1), FT(2), EN(3);

	private int value;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private ELanguage(int value) {
		this.value = value;
	}

}
