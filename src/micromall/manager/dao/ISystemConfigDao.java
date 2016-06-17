/**
 * 
 */
package micromall.manager.dao;

import micromall.manager.vo.SystemConfig;
/**
 * 
 * @ClassName:     ISystemConfigDao.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:05
 */
public interface ISystemConfigDao extends IBaseDao<SystemConfig> {

	SystemConfig selDetailedByID(int id);

	String getSystemConfigByFlag(String flag) throws Exception;
}
