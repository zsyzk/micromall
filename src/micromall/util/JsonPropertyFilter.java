package micromall.util;

import org.hibernate.collection.spi.PersistentCollection;
import org.hibernate.proxy.HibernateProxy;
import org.hibernate.proxy.LazyInitializer;

import com.alibaba.fastjson.serializer.PropertyFilter;
/**
 * 
 * @ClassName:     JsonPropertyFilter.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:17:46
 */
public class JsonPropertyFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {

		if (value instanceof HibernateProxy) {// hibernate代理对象
			LazyInitializer initializer = ((HibernateProxy) value)
					.getHibernateLazyInitializer();
			if (initializer.isUninitialized()) {
				return false;
			}
		} else if (value instanceof PersistentCollection) {// 实体关联集合一对多等
			PersistentCollection collection = (PersistentCollection) value;
			if (!collection.wasInitialized()) {
				return false;
			}
			Object val = collection.getValue();
			if (val == null) {
				return false;
			}
		}
		return true;
	}

}
