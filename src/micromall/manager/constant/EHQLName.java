package micromall.manager.constant;
/**
 * 
 * @ClassName:     EHQLName.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:59:56
 */
public enum EHQLName {

	SELECT_CHEPIAO_ZT("selChePiaoZT"), SELECT_USER_BY_SBID("selUserBySbid"), SELECT_USER_BY_USERNAME(
			"selUserByUserName"), SELECT_DIQU_BY_ID("selDiQu"), SELECT_CYXL_BY_USERID(
			"selChangYongXianLuByUserId");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private EHQLName(String value) {
		this.value = value;
	}

}
