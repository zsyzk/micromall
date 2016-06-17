/**
 * 
 */
package micromall.util;

import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;

import micromall.manager.constant.CSystem;
import micromall.manager.constant.EConfigFile;
import micromall.manager.constant.EResultJson;
/**
 * 
 * @ClassName:     PropertiesUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:18:30
 */
public class PropertiesUtil {

	/**
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public static void main(String[] args) {
		String result = new PropertiesUtil().getValue(
				EConfigFile.SYSTEM_DATA.getValue(), CSystem.DEFAULT_PWD);
		System.out.println(result);
	}

	private static PropertiesUtil propertiesUtil;

	public static PropertiesUtil getInstance() {
		if (AssertUtil.isNull(propertiesUtil)) {
			propertiesUtil = new PropertiesUtil();
		}
		return propertiesUtil;
	}

	public String getValue(String configName, String key) {

		Properties props = new Properties();

		InputStream inputStream = null;
		try {
			inputStream = this
					.getClass()
					.getClassLoader()
					.getResourceAsStream(
							AssertUtil.isNotNull(configName) ? configName
									: EConfigFile.SYSTEM_DATA.getValue());

			if (AssertUtil.isNull(inputStream)) {
				return EResultJson.PARA_IS_NULL.getValue();
			}

			props.load(inputStream);

		} catch (IOException e) {
			e.printStackTrace();
		}

		if (props.isEmpty()) {
			return EResultJson.PARA_IS_NULL.getValue();
		}

		String returnValue = null;
		if (props.containsKey(key)) {
			returnValue = props.getProperty(key);
		}

		try {
			inputStream.close();
		} catch (IOException e) {
			e.printStackTrace();
		}

		return returnValue;

	}

	public boolean setValue(String configName, String key, String value) {
		try {
			if (AssertUtil.isNull(configName)) {
				return false;
			}

			Properties props = new Properties();

			InputStream inputStream = this.getClass().getClassLoader()
					.getResourceAsStream(configName);

			if (AssertUtil.isNull(inputStream)) {
				return false;
			}

			props.load(inputStream);

			FileOutputStream out = new FileOutputStream(configName);

			Object keyObj = props.put(key, value);

			props.store(out, (String) keyObj);

			inputStream.close();

			out.close();

			return true;
		} catch (IOException e) {
			e.printStackTrace();
			return false;
		}

	}
}
