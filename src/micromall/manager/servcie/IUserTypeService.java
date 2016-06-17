/**
 * 
 */
package micromall.manager.servcie;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

import micromall.manager.vo.PageVO;
import micromall.manager.vo.UserType;
/**
 * 
 * @ClassName:     IUserTypeService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:56
 */
public interface IUserTypeService extends IBaseService<UserType>{

	String saveUserType(String par);
	
	String saveOrUpdateUserType(String par);

	String editUserType(String par);

	String delUserType(String par);
	
	String getUserTypeById(String par);

	List<UserType> getAllUserType(PageVO vo);

	String getPermissionById(JSONObject jsonObject);

	String savePermissionById(JSONObject jsonObject);

	String userTypeInitPerTree();
}
