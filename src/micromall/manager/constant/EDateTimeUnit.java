package micromall.manager.constant;
/**
 * 
 * @ClassName:     EDateTimeUnit.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:00:37
 */
public enum EDateTimeUnit {

	YEAR(1), MONTH(2), DAY(3), HOUR(4), MINUTE(5), SECOND(6);

	private int value;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private EDateTimeUnit(int value) {
		this.value = value;
	}

}
