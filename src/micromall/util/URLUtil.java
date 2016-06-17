/**
 * 
 */
package micromall.util;

import javax.servlet.http.HttpServletRequest;
/**
 * 
 * @ClassName:     URLUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:19:02
 */
public class URLUtil {
	private static URLUtil urlUtil;

	public static URLUtil getInstance() {

		return AssertUtil.isNotNull(urlUtil) ? urlUtil
				: (urlUtil = new URLUtil());
	}

	public String getWebServerRootPath(HttpServletRequest request) {
		String rootPath = request.getSession().getServletContext()
				.getRealPath("/");
		return rootPath.substring(0, rootPath.indexOf("webapps") - 1);
	}
}
