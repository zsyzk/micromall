/**
 * 
 */
package micromall.util;

/**
 * 
 * @ClassName:     DaoUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:16:52
 */
public class DaoUtil {

	private static DaoUtil daoUtil;

	public static DaoUtil getInstance() {
		if (AssertUtil.isNull(daoUtil)) {
			daoUtil = new DaoUtil();
		}
		return daoUtil;
	}

	public static void main(String[] args) {
	}

}
