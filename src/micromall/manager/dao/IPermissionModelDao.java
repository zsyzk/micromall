/**
 * 
 */
package micromall.manager.dao;

import java.util.List;

import micromall.manager.vo.PermissionModel;
/**
 * 
 * @ClassName:     IPermissionModelDao.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:00
 */
public interface IPermissionModelDao extends IBaseDao<PermissionModel> {

	void removeByPerId(int perId);

	List<PermissionModel> getPerModelByPerId(int perId);

	List<String> getPerModelCodeByPerId(int perId);

}
