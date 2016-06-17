/**
 * 
 */
package micromall.manager.dao;

import java.util.List;

import micromall.manager.constant.EDBDataStatus;
import micromall.manager.vo.PageVO;
import micromall.manager.vo.UserType;
/**
 * 
 * @ClassName:     IUserTypeDao.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:21
 */
public interface IUserTypeDao extends IBaseDao<UserType> {
	
	boolean exsitTypeName(String typeName,String id);
	
	List<UserType> getAllUserType(PageVO vo) throws Exception;
	
	boolean updateUserTypeStatus(int userTypeId,EDBDataStatus status) throws Exception;
	
	/**
	 * 
	 * Remark: 根据ID查询详细信息
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	UserType selDetailedByID(int userTypeId);
	
	/**
	 * 根据Id删除详细信息
	 * @param id
	 * @return
	 */
	boolean deleteUserType(int userTypeId);

/*	*//**
	 * 根据Id获取权限
	 * @param id
	 * @return
	 *//*
	String selPermissionByID(int id);

	*//**
	 * 根据Id保存权限
	 * @param id
	 * @param permission
	 * @return
	 *//*
	boolean savePermissionByID(int id, String permission);*/
}
