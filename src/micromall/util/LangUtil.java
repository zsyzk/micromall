/**
 * 
 */
package micromall.util;
/**
 * 
 * @ClassName:     LangUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:17:58
 */
public class LangUtil {

	private static LangUtil langUtil;

	public LangUtil getInstance() {
		return AssertUtil.isNull(langUtil) ? langUtil = new LangUtil() : null;
	}

	public String ToTraditional() {
		String traditional = null;
		return traditional;
	}

	public String ToSimplified() {
		String simplified = null;
		return simplified;
	}

}
