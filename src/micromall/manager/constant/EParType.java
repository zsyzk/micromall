package micromall.manager.constant;
/**
 * 
 * @ClassName:     EParType.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:58:39
 */
public enum EParType {

	JSON(1), STRING(2), INTEGER(3), CLASS_INSTANCE(4);

	private int value;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private EParType(int value) {
		this.value = value;
	}

}
