/**
 * 
 */
package micromall.util;

import micromall.manager.constant.CText;
import micromall.manager.constant.EConfigFile;
import micromall.manager.vo.BusinessVO;
/**
 * 
 * @ClassName:     LogUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:18:03
 */
public class LogUtil {

	private static LogUtil logUtil;

	public static LogUtil getInstance() {
		return AssertUtil.isNull(logUtil) ? logUtil = new LogUtil() : logUtil;
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark: 构建业务日志数据
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public BusinessVO getBusiness(String objId, String objName) {
		BusinessVO businessVO = new BusinessVO();

		businessVO.setObjId(AssertUtil.isNotNull(objId) ? Integer
				.parseInt(objId) : -1);

		businessVO.setObjName(AssertUtil.isNotNull(objName) ? objName
				: PropertiesUtil.getInstance().getValue(
						EConfigFile.CHINESE.getValue(), CText.NO));
		
		return businessVO;
	}
	
}
