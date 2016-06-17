/**
 * 
 */
package micromall.manager.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;

import micromall.manager.constant.EDBDataStatus;
import micromall.manager.dao.IUserTypeDao;
import micromall.util.AssertUtil;
import micromall.manager.vo.PageVO;
import micromall.manager.vo.UserType;
/**
 * 
 * @ClassName:     UserTypeDaoImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:08:35
 */
@SuppressWarnings("unchecked")
public class UserTypeDaoImpl extends BaseDaoByHibernate<UserType> implements
		IUserTypeDao {
	
	@Override
	public boolean exsitTypeName(String typeName,String id) {
		boolean flag = false;
		
		try {
			StringBuilder hql = null;
			if(AssertUtil.isNotNull(id)){
				int sid = Integer.parseInt(id);
				hql = new StringBuilder(
						" SELECT U FROM UserType U WHERE U.typeName='" + typeName+"' and U.userTypeId <>"+ sid);
			}else{
				hql = new StringBuilder(
						" SELECT U FROM UserType U WHERE U.typeName='" + typeName+"'");
			}
			List temp = getSession().createQuery(hql.toString()).list();
			if(AssertUtil.isNotNull(temp)){
				flag = true;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return flag;
	}

	@Override
	public List<UserType> getAllUserType(PageVO vo) throws Exception {
		return getSession().createQuery(
				" SELECT T FROM UserType T WHERE T.status = "
						+ EDBDataStatus.ACTIVITY.getValue()).list();
	}

	@Override
	public boolean updateUserTypeStatus(int userTypeId,EDBDataStatus status) throws Exception {
		return getSession().createQuery(
				" UPDATE UserType T SET T.status =  "
						+ EDBDataStatus.ACTIVITY.getValue()).executeUpdate() > 0 ? true
				: false;
	}

	@Override
	public UserType selDetailedByID(int userTypeId) {
		try {
			StringBuilder hql = new StringBuilder(
					" SELECT T FROM UserType T WHERE T.userTypeId=" + userTypeId);
			return (UserType) getSession().createQuery(hql.toString())
					.uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean deleteUserType(int userTypeId) {
		try {
			
			StringBuilder hql = new StringBuilder(
				" DELETE UserType WHERE userTypeId = "+userTypeId);

				if(getSession().createQuery(hql.toString()).executeUpdate()>0){
					return true;
				}
			} catch (HibernateException e) {
				e.printStackTrace();
				return false;
			}
			return false;
		}

/*	@Override
	public String selPermissionByID(int id) {
		try {
			StringBuilder hql = new StringBuilder(
					" SELECT T.permission FROM UserType T WHERE T.userTypeId=" + id);
			Object per = getSession().createQuery(hql.toString()).uniqueResult();
			if(AssertUtil.isNotNull(per)){
				return per.toString();
			}
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public boolean savePermissionByID(int id, String permission) {
		try {
			return getSession().createQuery(
					" UPDATE UserType T SET T.permission =  '"
							+ permission+"' WHERE T.userTypeId=" + id).executeUpdate() > 0 ? true
									: false;
		} catch (HibernateException e) {
			e.printStackTrace();
		}
		return false;
	}*/
}
