package micromall.manager.jsonfilter;

import com.alibaba.fastjson.serializer.PropertyFilter;

public class XianLuJsonFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {

		if (name.equalsIgnoreCase("ad")) {
			return false;
		}

		// if (value instanceof HibernateProxy) {// hibernate代理对象
		// LazyInitializer initializer = ((HibernateProxy) value)
		// .getHibernateLazyInitializer();
		// if (initializer.isUninitialized()) {
		// return false;
		// }
		// } else if (value instanceof PersistentCollection) {// 实体关联集合一对多等
		// PersistentCollection collection = (PersistentCollection) value;
		// if (!collection.wasInitialized()) {
		// return false;
		// }
		// Object val = collection.getValue();
		// if (AssertUtil.isNull(val)) {
		// return false;
		// }
		// }
		return true;
	}

}
