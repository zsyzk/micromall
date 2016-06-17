/**
 * 
 */
package micromall.manager.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;

import micromall.manager.dao.IPermissionModelDao;
import micromall.util.AssertUtil;
import micromall.manager.vo.Permission;
import micromall.manager.vo.PermissionModel;
/**
 * 
 * @ClassName:     PermissionModelDaoImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:08:02
 */
@SuppressWarnings(value = {"unchecked", "unused" })
public class PermissionModelDaoImpl extends BaseDaoByHibernate<PermissionModel> implements
		IPermissionModelDao {

	@Override
	public void removeByPerId(int perId) {
		// TODO Auto-generated method stub
		try {
			StringBuilder hql = new StringBuilder(
					" DELETE PermissionModel WHERE perId = " + perId);
			if (getSession().createQuery(hql.toString()).executeUpdate() > 0) {
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
	}

	@Override
	public List<PermissionModel> getPerModelByPerId(int perId) {
		StringBuilder hql = new StringBuilder(" SELECT P FROM PermissionModel P WHERE P.perId = "+perId);
		
		List<PermissionModel> per = (List<PermissionModel>)getSession().createQuery(hql.toString()).list();
		if(AssertUtil.isNotNull(per)){
			return per;
		}
		return null;
	}
	
	@Override
	public List<String> getPerModelCodeByPerId(int perId) {
		StringBuilder hql = new StringBuilder(" SELECT P.perModelCode FROM PermissionModel P WHERE P.perId = "+perId);
		
		List<String> per = getSession().createQuery(hql.toString()).list();
		if(AssertUtil.isNotNull(per)){
			return per;
		}
		return null;
	}

}
