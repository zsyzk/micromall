package micromall.manager.constant;
/**
 * 
 * @ClassName:     EResult.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:58:55
 */
public enum EResult {

	SUCCESS(1), FAIL_EXCEPTION(2),FAIL_PAR_NULL(3),FAIL_PAR_FORMAT_EXCEPTION(4),;

	private int value;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private EResult(int value) {
		this.value = value;
	}

}
