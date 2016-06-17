package micromall.manager.constant;
/**
 * 
 * @ClassName:     EConfigFile.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:01:01
 */
public enum EConfigFile {

	SYSTEM_DATA("sd.properties"), HQL("HQL.properties"), SQL("SQL.properties"),CHINESE(
			"Chinese.properties");

	private String value;

	public String getValue() {
		return value;
	}

	public void setValue(String value) {
		this.value = value;
	}

	private EConfigFile(String value) {
		this.value = value;
	}

}
