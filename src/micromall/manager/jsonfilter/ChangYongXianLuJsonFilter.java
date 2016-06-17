package micromall.manager.jsonfilter;

import com.alibaba.fastjson.serializer.PropertyFilter;
/**
 * 
 * @ClassName:     ChangYongXianLuJsonFilter.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:09:49
 */
public class ChangYongXianLuJsonFilter implements PropertyFilter {

	public boolean apply(Object obj, String name, Object value) {
		if (name.equalsIgnoreCase("cyxkid")
				|| name.equalsIgnoreCase("savedata")
				|| name.equalsIgnoreCase("bcid")
				|| name.equalsIgnoreCase("xlid")
				|| name.equalsIgnoreCase("qsdqid")
				|| name.equalsIgnoreCase("zddqid")
				|| name.equalsIgnoreCase("sczdid")
				|| name.equalsIgnoreCase("xczdid")) {
			return true;
		}

		return false;
	}

}
