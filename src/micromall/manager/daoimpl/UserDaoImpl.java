/**
 * 
 */
package micromall.manager.daoimpl;

import java.util.List;

import org.hibernate.HibernateException;

import micromall.manager.constant.EConfigFile;
import micromall.manager.constant.EHQLName;
import micromall.manager.constant.ESQLChar;
import micromall.manager.dao.IUserDao;
import micromall.util.AssertUtil;
import micromall.util.PropertiesUtil;
import micromall.manager.vo.User;
/**
 * 
 * @ClassName:     UserDaoImpl.java
 * @Description:   用户表数据操作
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:08:28
 */
@SuppressWarnings("unchecked")
public class UserDaoImpl extends BaseDaoByHibernate<User> implements IUserDao {

	@Override
	public User selUserBySbid(String sbid) throws Exception {
		StringBuilder hql = new StringBuilder(PropertiesUtil.getInstance()
				.getValue(EConfigFile.HQL.getValue(),
						EHQLName.SELECT_USER_BY_SBID.getValue()));
		List<User> result = getSession().createQuery(
				hql.toString().replace(ESQLChar.ONE.getValue(), sbid)).list();
		if (AssertUtil.isNull(result)) {
			return null;
		}

		return result.get(0);
	}

	@Override
	public int register(User user) throws Exception {
		String userId = getSession().save(user).toString();

		return AssertUtil.isNotNull(userId) ? Integer.parseInt(userId) : -1;
	}

	@Override
	public User selUserByUserName(String userName) throws Exception {
		StringBuilder hql = new StringBuilder(PropertiesUtil.getInstance()
				.getValue(EConfigFile.HQL.getValue(),
						EHQLName.SELECT_USER_BY_USERNAME.getValue()));
		List<User> result = getSession().createQuery(hql.toString().replace(ESQLChar.ONE.getValue(), userName))
				.list();
		if (AssertUtil.isNull(result)) {
			return null;
		}

		return result.get(0);
	}
	
	@Override
	public List<User> geUserList() {
		try {
			StringBuilder hql = null;
			hql = new StringBuilder(
					" SELECT U FROM User U");

			return getSession().createQuery(hql.toString()).list();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}
	
	
	@Override
	public User getById(int id){
		try {
			
			String hql = " SELECT U FROM User U WHERE U.userId = "+id;

			return (User) getSession().createQuery(hql.toString()).uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean deleteUser(int id) {
		try {
			
			String hql = " DELETE User WHERE userId = "+id;

			if(getSession().createQuery(hql.toString()).executeUpdate()>0){
				return true;
			}
		} catch (HibernateException e) {
			e.printStackTrace();
			return false;
		}
		return false;
	}

	@Override
	public User getByUserTypeId(int userTypeId) {
		try {
			
			String hql = " SELECT U FROM User U WHERE U.userTypeId = "+userTypeId;

			return (User) getSession().createQuery(hql.toString()).uniqueResult();
		} catch (HibernateException e) {
			e.printStackTrace();
			return null;
		}
	}

}
