/**
 * 
 */
package micromall.manager.jsonfilter;

import com.alibaba.fastjson.serializer.PropertyFilter;
/**
 * 
 * @ClassName:     ModelJsonFilter.java
 * @Description:   菜单JSON过滤器
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:11:50
 */
public class ModelJsonFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {

		if (name.equals("fmenu")) {
			return false;
		}
		return true;
	}

}
