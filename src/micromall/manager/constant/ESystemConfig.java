package micromall.manager.constant;
/**
 * 
 * @ClassName:     ESystemConfig.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:59:28
 */
public enum ESystemConfig {

	PAGE_NUMBER("101"), PAY_OUT_TIME("102"), SERVER_PATH_CHINA_HK_I("103"), SERVER_PATH_CHINA_I(
			"104"), DEFAULT_PWD("105"), BC_SYNC_VALUE("106"),SERVER_PATH_CHINA_HK_M("107"), SERVER_PATH_CHINA_M(
					"108");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private ESystemConfig(String value) {
		this.value = value;
	}

}
