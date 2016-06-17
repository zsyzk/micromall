/**
 * 
 */
package micromall.manager.dao;

import micromall.manager.vo.Permission;
/**
 * 
 * @ClassName:     IPermissionDao.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:06:48
 */
public interface IPermissionDao extends IBaseDao<Permission> {

	Permission getPermissionByUserTypeId(int id);

}
