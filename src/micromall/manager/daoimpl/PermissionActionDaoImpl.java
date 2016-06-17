/**
 * 
 */
package micromall.manager.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;

import micromall.manager.dao.IPermissionActionDao;
import micromall.util.AssertUtil;
import micromall.manager.vo.Model;
import micromall.manager.vo.PermissionAction;
/**
 * 
 * @ClassName:     PermissionActionDaoImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:50
 */
@SuppressWarnings(value = {  "unchecked", "unused" })
public class PermissionActionDaoImpl extends BaseDaoByHibernate<PermissionAction> implements
		IPermissionActionDao {
	@Override
	public void removeByPerId(int perId) {
		// TODO Auto-generated method stub
		try {
			StringBuilder hql = new StringBuilder(
					" DELETE PermissionAction WHERE perId = " + perId);
			if (getSession().createQuery(hql.toString()).executeUpdate() > 0) {
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<PermissionAction> getByPerId(int id) {
		StringBuilder hql = new StringBuilder(" SELECT T FROM PermissionAction T WHERE  T.perId = "+id);
		return getSession().createQuery(hql.toString()).list();
	}

	@Override
	public List<String> getPerActionCodeByPerIdAndMenuCode(int perId,
			String menuCode) {
		StringBuilder hql = new StringBuilder(" SELECT P.perActionCode FROM PermissionAction P WHERE P.perId = "+perId+" AND P.perMenuCode = '"+menuCode+"'");
		
		List<String> per = getSession().createQuery(hql.toString()).list();
		if(AssertUtil.isNotNull(per)){
			return per;
		}
		return null;
	}
}
