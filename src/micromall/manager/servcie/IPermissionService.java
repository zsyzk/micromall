
package micromall.manager.servcie;

import micromall.manager.vo.Permission;

/**
 * 
 * @ClassName:     IPermissionService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:37
 */
public interface IPermissionService extends IBaseService<Permission> {

	Permission getPermissionByUserTypeId(int id);
	
}
