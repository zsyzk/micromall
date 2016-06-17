package micromall.manager.constant;
/**
 * 
 * @ClassName:     EDBDataStatus.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:00:46
 */
public enum EDBDataStatus {

	NO(-1), ACTIVITY(1), DELETE(2), DISABLE(3), DISPLAY_ALL(4), DFK(101), DCC(
			102), GQ(103), YCC(104), HISTORY(105), OTHER(700), CHECK_CHEPIAO_ALL(
			701), CHECK_CHEPIAO_MOBILE(702), CHECK_CHEPIAO_WEB(703), CHECK_CHEPIAO_COMPUTER(
			704);

	private int value;

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;
	}

	private EDBDataStatus(int value) {
		this.value = value;
	}

}
