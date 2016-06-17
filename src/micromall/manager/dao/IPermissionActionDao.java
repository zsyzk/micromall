/**
 * 
 */
package micromall.manager.dao;

import java.util.List;

import micromall.manager.vo.PermissionAction;
/**
 * 
 * @ClassName:     IPermissionActionDao.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:06:40
 */
public interface IPermissionActionDao extends IBaseDao<PermissionAction> {

	void removeByPerId(int perId);

	List<PermissionAction> getByPerId(int id);

	List<String> getPerActionCodeByPerIdAndMenuCode(int perId, String menuCode);

}
