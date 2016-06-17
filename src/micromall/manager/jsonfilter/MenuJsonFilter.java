/**
 * 
 */
package micromall.manager.jsonfilter;

import java.util.HashSet;

import org.hibernate.collection.spi.PersistentCollection;
import org.hibernate.proxy.HibernateProxy;
import org.hibernate.proxy.LazyInitializer;

import com.alibaba.fastjson.serializer.PropertyFilter;
/**
 * 
 * @ClassName:     MenuJsonFilter.java
 * @Description:  模块JSON过滤器
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:11:37
 */
public class MenuJsonFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {

		if (name.equals("fmodel")) {
			return false;
		}

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
