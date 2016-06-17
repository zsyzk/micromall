package micromall.manager.dao;

import java.util.List;

import micromall.manager.vo.Menu;
/**
 * 
 * @ClassName:     IMenuDAO.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:06:20
 */
public interface IMenuDAO extends IBaseDao<Menu> {

	List<Menu> getMenuByModelId(int id) throws Exception;

	List<Menu> getPerMenuByModelId(int id, List<String> pmenus);

}
