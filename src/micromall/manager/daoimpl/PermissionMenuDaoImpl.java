/**
 * 
 */
package micromall.manager.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;

import micromall.manager.dao.IPermissionMenuDao;
import micromall.util.AssertUtil;
import micromall.manager.vo.PermissionMenu;
/**
 * 
 * @ClassName:     PermissionMenuDaoImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:08:17
 */
@SuppressWarnings(value = { "unchecked"})
public class PermissionMenuDaoImpl extends BaseDaoByHibernate<PermissionMenu> implements
		IPermissionMenuDao {
	@Override
	public void removeByPerId(int perId) {
		// TODO Auto-generated method stub
		try {
			StringBuilder hql = new StringBuilder(
					" DELETE PermissionMenu WHERE perId = " + perId);
			if (getSession().createQuery(hql.toString()).executeUpdate() > 0) {
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}
	
	@Override
	public List<String> getPerMenuCodeByPerIdAndModelCode(int perId,String perModelCode) {
		StringBuilder hql = new StringBuilder(" SELECT P.perMenuCode FROM PermissionMenu P WHERE P.perId = "+perId+" AND P.perModelCode = '"+perModelCode+"'");
		
		List<String> per = getSession().createQuery(hql.toString()).list();
		if(AssertUtil.isNotNull(per)){
			return per;
		}
		return null;
	}
}
