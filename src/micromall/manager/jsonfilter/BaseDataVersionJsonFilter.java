/**
 * 
 */
package micromall.manager.jsonfilter;

import com.alibaba.fastjson.serializer.PropertyFilter;
/**
 * 
 * @ClassName:     BaseDataVersionJsonFilter.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:09:40
 */
public class BaseDataVersionJsonFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {

		if (name.equals("baseversionId")) {
			return false;
		}
		return true;
	}

}
