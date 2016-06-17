/**
 * 
 */
package micromall.manager.servcie;

import java.util.List;

import micromall.manager.vo.PermissionModel;
/**
 * 
 * @ClassName:     IPermissionModelService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:33
 */
public interface IPermissionModelService extends IBaseService<PermissionModel> {

	List<PermissionModel> getPerModelByPerId(int perId);

	List<String> getPerModelCodeByPerId(int perId);
	
}
