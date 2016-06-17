package micromall.manager.constant;
/**
 * 
 * @ClassName:     EYesNo.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:59:34
 */
public enum EYesNo {

	YES(1), NO(2);

	private int value;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private EYesNo(int value) {
		this.value = value;
	}

}
