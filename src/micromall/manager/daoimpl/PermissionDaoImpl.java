/**
 * 
 */
package micromall.manager.daoimpl;

import java.util.List;

import micromall.manager.constant.EDBDataStatus;
import micromall.manager.dao.IPermissionDao;
import micromall.util.AssertUtil;
import micromall.manager.vo.PageVO;
import micromall.manager.vo.Permission;
/**
 * 
 * @ClassName:     PermissionDaoImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:55
 */
@SuppressWarnings(value = {  "unused" })
public class PermissionDaoImpl extends BaseDaoByHibernate<Permission> implements
		IPermissionDao {

	@Override
	public Permission getPermissionByUserTypeId(int id) {
		StringBuilder hql = new StringBuilder(" SELECT P FROM Permission P WHERE P.userTypeId = "+id);
		
		Permission per = (Permission)getSession().createQuery(hql.toString()).uniqueResult();
		if(AssertUtil.isNotNull(per)){
			return per;
		}
		return null;
	}

}
