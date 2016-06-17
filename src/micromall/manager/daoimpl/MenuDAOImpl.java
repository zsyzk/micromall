package micromall.manager.daoimpl;

import java.util.List;

import micromall.manager.dao.IMenuDAO;
import micromall.manager.vo.Menu;
/**
 * 
 * @ClassName:     MenuDAOImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:40
 */
@SuppressWarnings("unchecked")
public class MenuDAOImpl extends BaseDaoByHibernate<Menu> implements IMenuDAO {

	@Override
	public List<Menu> getMenuByModelId(int id) throws Exception {
		StringBuilder hql = new StringBuilder(
				" SELECT T FROM  Menu T WHERE T.fmodel.id=" + id +" AND T.fparent is null ORDER BY T.sort");
		return getSession().createQuery(hql.toString()).list();
	}

	@Override
	public List<Menu> getPerMenuByModelId(int id, List<String> pmenus) {
		StringBuilder hql = new StringBuilder(
				" SELECT T FROM  Menu T WHERE T.fmodel.id=" + id +" AND T.fparent is null AND T.perCode IN (:pmenus) ORDER BY T.sort");
		return getSession().createQuery(hql.toString()).setParameterList("pmenus", pmenus).list();
	}

}
