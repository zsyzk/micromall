/**
 * 
 */
package micromall.manager.dao;

import java.util.List;

import micromall.manager.vo.PermissionMenu;
/**
 * 
 * @ClassName:     IPermissionMenuDao.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:06:53
 */
public interface IPermissionMenuDao extends IBaseDao<PermissionMenu> {

	void removeByPerId(int perId);

	List<String> getPerMenuCodeByPerIdAndModelCode(int perId,
			String perModelCode);

}
