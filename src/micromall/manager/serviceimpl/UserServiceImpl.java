/**
 * 
 */
package micromall.manager.serviceimpl;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import micromall.manager.constant.CClass;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.EDBDataStatus;
import micromall.manager.constant.EParType;
import micromall.manager.constant.EResult;
import micromall.manager.constant.ESystemConfig;
import micromall.manager.dao.IUserDao;
import micromall.manager.dao.IUserTypeDao;
import micromall.manager.servcie.ISystemConfigService;
import micromall.manager.servcie.IUserService;
import micromall.util.AssertUtil;
import micromall.util.GlobalContext;
import micromall.util.JsonPropertyFilter;
import micromall.util.JsonUtil;
import micromall.util.LogUtil;
import micromall.util.MD5;
import micromall.util.ReturnUtil;
import micromall.util.ValidateUtil;
import micromall.manager.vo.Result;
import micromall.manager.vo.ReturnResult;
import micromall.manager.vo.User;
import micromall.manager.vo.UserType;
/**
 * 
 * @ClassName:     UserServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:57
 */
public class UserServiceImpl extends BaseServiceImpl<User> implements
		IUserService {

	@Resource(name = CClass.UserDaoImpl)
	private IUserDao userDao;

	@Resource(name = CClass.UserTypeDaoImpl)
	private IUserTypeDao userTypeDao;

	@Resource(name = CClass.SystemConfigServiceImpl)
	private ISystemConfigService systemConfigService;

	public ISystemConfigService getSystemConfigService() {
		return systemConfigService;
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public IUserTypeDao getUserTypeDao() {
		return userTypeDao;
	}

	@Override
	public String register(String par) {
		try {

			ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

			if (vPar.getCode() != EResult.SUCCESS.getValue()) {
				return vPar.toJsonString();
			}

			return ReturnUtil.getReturnSuccess(null);

		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}
		// ------------------------Executed------------------------------
	}

	@Override
	public String login(HttpServletRequest request, String par) {
		try {
			Map<EParType, Object> pars = new HashMap<EParType, Object>();
			pars.put(EParType.JSON, par);
			pars.put(EParType.CLASS_INSTANCE, getUserDao());

			ReturnResult result = ValidateUtil.getInstance().valiPar(pars);
			if (result.getCode() != EResult.SUCCESS.getValue()) {
				return result.toJsonString();
			}

			JSONObject temp = JsonUtil.getInstance().toJsonObj(par);

			// 验证
			User user = getUserDao().selUserByUserName(
					temp.getString(CSystem.USERNAME));

			if (AssertUtil.isNull(user)) {
				return ReturnUtil.getReturnFail(null);
			}
			if (MD5.getInstance()
					.getMD5ofStrTwo(temp.getString(CSystem.PASSWORD), 5)
					.equalsIgnoreCase(user.getPassword())) {
				/**
				 * 给全局类设置登录用户
				 */
				GlobalContext global = new GlobalContext();
				global.setUserId(user.getUserId());
				global.setUserName(user.getUsername());
				global.setUserTypeId(user.getUserTypeId());
				global.setPasswordMD5(user.getPassword());
				request.getSession().setAttribute(CSystem.SESSION_LOGINUSER,
						global);
				// GlobalContext.getInstance().setPermisstion(userTypeDao.selPermissionByID(user.getUserTypeId()));
				return ReturnUtil.getReturnSuccess(null);
			}
			return ReturnUtil.getReturnFail(null);

		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}
	}

	@Override
	public List<User> getUser(String par) {
		return getUserDao().geUserList();
	}

	@Override
	public String saveOrUpdateUser(String par) {
		// Validate begin
		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			return vPar.toJsonString();
		}

		ReturnResult vException = ValidateUtil.validateException(getUserDao());

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			return vException.toJsonString();
		}
		// Validate end

		// ------------------------parse json------------------------------
		JSONObject json = JsonUtil.getInstance().toJsonObj(par);
		User us = null;
		if (AssertUtil.isNotNull(json.getString("userId"))) {
			int id = json.getIntValue("userId");
			us = getUserDao().getById(id);
		} else {
			us = new User();
		}
		try {

			if (AssertUtil.isNotNull(json.getString("userTypeId"))) {
				int userTypeId = json.getIntValue("userTypeId");
				us.setUserTypeId(userTypeId);
				UserType userType = getUserTypeDao().select(userTypeId + "");
				us.setUserTypeName(userType.getTypeName());
			}
			us.setUsername(json.getString("username"));

			// 密码默认取系统参数的密码
			us.setPassword(MD5.getInstance().getMD5ofStrTwo(
					getSystemConfigService().getSystemConfigByFlag(
							ESystemConfig.DEFAULT_PWD.getValue()), 5));
			us.setStatus(EDBDataStatus.ACTIVITY.getValue());
		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}
		// ------------------------parse json------------------------------

		// ------------------------Executed------------------------------
		try {
			return getUserDao().save(us) ? ReturnUtil.getReturnSuccess(null)
					: ReturnUtil.getReturnFail(null);
		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}
		// ------------------------Executed------------------------------
	}

	@Override
	public String getUserById(String par) {
		// Validate begin
		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			return vPar.toJsonString();
		}

		ReturnResult vException = ValidateUtil.validateException(getUserDao());

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			return vException.toJsonString();
		}
		// Validate end

		// ------------------------parse json------------------------------
		JSONObject json = JsonUtil.getInstance().toJsonObj(par);
		User us;
		if (AssertUtil.isNotNull(json.getString("userId"))) {
			int id = json.getIntValue("userId");
			us = getUserDao().getById(id);
		} else {
			us = null;
		}
		return JSON.toJSONString(us, new JsonPropertyFilter());

		// ------------------------parse json------------------------------

		// ------------------------Executed------------------------------

		// ------------------------Executed------------------------------
	}

	@Override
	public String deleteUser(String par) {
		// Validate begin
		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			return vPar.toJsonString();
		}

		ReturnResult vException = ValidateUtil.validateException(getUserDao());

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			return vException.toJsonString();
		}
		// Validate end

		// ------------------------parse json------------------------------
		JSONObject json = JsonUtil.getInstance().toJsonObj(par);
		int id = 0;
		if (AssertUtil.isNotNull(json.getString("userId"))) {
			id = json.getIntValue("userId");
			User us = getUserDao().getById(id);
			if (us == null) {
				return ReturnUtil.getReturnFail(null);
			}
		}

		// ------------------------parse json------------------------------

		// ------------------------Executed------------------------------
		try {
			return getUserDao().deleteUser(id) ? ReturnUtil
					.getReturnSuccess(null) : ReturnUtil.getReturnFail(null);
		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}
		// ------------------------Executed------------------------------
	}

	@Override
	public String exitLogin(HttpServletRequest request) {
		request.getSession().removeAttribute(CSystem.SESSION_LOGINUSER);
		return ReturnUtil.getReturnSuccess(null);
	}

	/**
	 * 修改密码
	 */
	@Override
	public Result modifyPwd(int userId, String data) {
		JSONObject json = JsonUtil.getInstance().toJsonObj(data);
		if (json.containsKey("oldPassword") && json.containsKey("newPassword")
				&& json.containsKey("newPassword2")) {
			String oldPassword = json.getString("oldPassword");
			String newPassword = json.getString("newPassword");
			String newPassword2 = json.getString("newPassword2");
			if (newPassword.equals(newPassword2)) {
				User u = null;
				try {
					u = userDao.getById(userId);
					if (AssertUtil.isNotNull(u)) {
						if (MD5.getInstance().getMD5ofStrTwo(oldPassword, 5)
								.equalsIgnoreCase(u.getPassword())) {

							u.setPassword(MD5.getInstance().getMD5ofStrTwo(
									newPassword, 5));
						
								return new Result(
										ReturnUtil.getReturnSuccess(null),
										LogUtil.getInstance().getBusiness(
												u.getUserId() + "",
												u.getUsername()));
							
						} else {
							return new Result(
									ReturnUtil.getReturnFail("密码不正确!"));
						}
					} else {
						return new Result(ReturnUtil.getReturnFail("该用户不存在!"));
					}
				} catch (Exception e) {
					e.printStackTrace();
				}

			}
		}
		return new Result(ReturnUtil.getReturnFail("密码修改失败"));
	}

	@Override
	public String checkPwd(String pwd, GlobalContext context) {
		String userPwd = context.getPasswordMD5();
		if (MD5.getInstance().getMD5ofStrTwo(pwd, 5).equalsIgnoreCase(userPwd)) {
			return "y";
		} else {
			return "密码错误";
		}
	}
}
