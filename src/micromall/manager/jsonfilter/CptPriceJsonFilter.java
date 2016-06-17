/**
 * 
 */
package micromall.manager.jsonfilter;

import com.alibaba.fastjson.serializer.PropertyFilter;
/**
 * 
 * @ClassName:     CptPriceJsonFilter.java
 * @Description:   RCSfile: 模块JSON过滤器 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:10:18
 */


public class CptPriceJsonFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {

		if (name.equals("flag")) {
			return false;
		}
		return true;
	}

}
