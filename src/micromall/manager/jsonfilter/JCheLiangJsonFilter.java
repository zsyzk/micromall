package micromall.manager.jsonfilter;

import com.alibaba.fastjson.serializer.PropertyFilter;
/**
 * 
 * @ClassName:     JCheLiangJsonFilter.java
 * @Description:   车辆JSON属性过滤器
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:11:24
 */
public class JCheLiangJsonFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {
		return true;
	}

}
