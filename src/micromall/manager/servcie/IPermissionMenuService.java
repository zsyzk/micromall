/**
 * 
 */
package micromall.manager.servcie;

import java.util.List;

import micromall.manager.vo.PermissionMenu;
/**
 * 
 * @ClassName:     IPermissionMenuService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:27
 */
public interface IPermissionMenuService extends IBaseService<PermissionMenu> {

	List<String> getPerMenuCodeByPerIdAndModelCode(int perId, String modelCode);
	
}
