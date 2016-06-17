package micromall.manager.jsonfilter;

import com.alibaba.fastjson.serializer.PropertyFilter;

/**
 * 
 * @ClassName:     HolidayJsonFilter.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:10:53
 */

public class HolidayJsonFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {

		if (name.equalsIgnoreCase("holiday_id")) {
			return false;
		}

		return true;
	}

}
