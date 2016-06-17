package micromall.manager.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import micromall.manager.constant.CClass;
import micromall.manager.dao.IMenuDAO;
import micromall.manager.servcie.IMenuService;
import micromall.manager.vo.Menu;
/**
 * 
 * @ClassName:     MenuServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:26
 */
public class MenuServiceImpl implements IMenuService {

	@Resource(name = CClass.MenuDAOImpl)
	private IMenuDAO menuDAO;

	public IMenuDAO getMenuDAO() {
		return menuDAO;
	}

	@Override
	public List<Menu> getMenuByModelId(int id) {

		try {
			return getMenuDAO().getMenuByModelId(id);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public List<Menu> getPerMenuByModelId(int id, List<String> pmenus) {
		try {
			return getMenuDAO().getPerMenuByModelId(id,pmenus);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
