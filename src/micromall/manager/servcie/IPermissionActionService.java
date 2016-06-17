/**
 * 
 */
package micromall.manager.servcie;

import java.util.List;

import micromall.manager.vo.PermissionAction;
/**
 * 
 * @ClassName:     IPermissionActionService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:21
 */
public interface IPermissionActionService extends IBaseService<PermissionAction> {

	List<String> getPerActionCodeByPerIdAndMenuCode(int perId, String menuCode);
	
}
