package micromall.manager.daoimpl;

import java.util.List;

import micromall.manager.dao.IModelDAO;
import micromall.manager.vo.Model;
/**
 * 
 * @ClassName:     ModelDAOImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:45
 */
@SuppressWarnings("unchecked")
public class ModelDAOImpl extends BaseDaoByHibernate<Model> implements
		IModelDAO {

	@Override
	public List<Model> getAll() {
		StringBuilder hql = new StringBuilder(" SELECT T FROM Model T ");
		return getSession().createQuery(hql.toString()).list();
	}

	@Override
	public List<Model> getPerAll(List<String> codes) {
		StringBuilder hql = new StringBuilder(" SELECT T FROM Model T WHERE T.perCode IN (:codes) ");
		
		return getSession().createQuery(hql.toString()).setParameterList("codes", codes).list();
	}

}
