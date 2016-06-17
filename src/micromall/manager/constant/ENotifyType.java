package micromall.manager.constant;
/**
 * 
 * @ClassName:     ENotifyType.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:58:32
 */
public enum ENotifyType {

	/**
	 * SYSTEM 系统通知，EMAIL 邮件, SYSTEM_EMAIL系统消息+邮件;
	 */
	SYSTEM(1), EMAIL(2), SYSTEM_EMAIL(3);

	private int value;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private ENotifyType(int value) {
		this.value = value;
	}

}
