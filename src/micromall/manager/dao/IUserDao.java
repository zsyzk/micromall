/**
 * 
 */
package micromall.manager.dao;

import java.util.List;

import micromall.manager.vo.User;
/**
 * 
 * @ClassName:     IUserDao.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:14
 */
public interface IUserDao extends IBaseDao<User> {

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:根据用户使用的设备ID查询，注册验证
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	User selUserBySbid(String sbid) throws Exception;

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark: 根据用户名查询，登录验证
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	User selUserByUserName(String userName) throws Exception;

	int register(User user) throws Exception;
	
	List<User> geUserList();
	
	boolean deleteUser(int id);
	
	User getById(int id);
	
	User getByUserTypeId(int userTypeId);
	

}
