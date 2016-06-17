package micromall.manager.servcie;

import java.util.List;

import micromall.manager.vo.Menu;
/**
 * 
 * @ClassName:     IMenuService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:08
 */
public interface IMenuService {

	List<Menu> getMenuByModelId(int id);

	List<Menu> getPerMenuByModelId(int id, List<String> pmenus);

}
