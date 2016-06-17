/**
 * 
 */
package micromall.manager.servcie;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import micromall.util.GlobalContext;
import micromall.manager.vo.Result;
import micromall.manager.vo.User;
/**
 * 
 * @ClassName:     IUserService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:50
 */
public interface IUserService extends IBaseService<User>{

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:用户注册
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	String register(String par);

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:用户登录
	 * 
	 * Param:
	 * 
	 * Return:
	 * @param request 
	 * 
	 */
	String login(HttpServletRequest request, String par);
	/**
	 * 获取用户集合
	 * 
	 * @param par
	 * 
	 * @return
	 */
	public List<User> getUser(String par);
	/**
	 * 新增Or修改用户信息
	 */
	public String saveOrUpdateUser(String par);
	/**
	 * 根据Id查询用户信息
	 * @param par
	 * @return
	 */
	public String getUserById(String par);
	/**
	 * 
	 * 删除
	 * @param par
	 * @return
	 */
	String deleteUser(String par);
	/**
	 * 退出登录
	 * @param request
	 * @return
	 */
	String exitLogin(HttpServletRequest request);
	/**
	 * 修改密码
	 */
	Result modifyPwd(int userId ,String data);
	String checkPwd(String pwd, GlobalContext context);
}
