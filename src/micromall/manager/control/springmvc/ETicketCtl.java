/**
 * 
 */
package micromall.manager.control.springmvc;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;

import micromall.manager.constant.CClass;
import micromall.manager.constant.CSpringURL;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.ECharacterEncoding;
import micromall.manager.constant.EContentType;
import micromall.manager.constant.EResult;
import micromall.manager.servcie.ISystemConfigService;
import micromall.manager.servcie.IUserService;
import micromall.manager.servcie.IUserTypeService;
import micromall.util.AssertUtil;
import micromall.util.JsonUtil;
import micromall.util.ReturnUtil;
import micromall.util.ValidateUtil;
import micromall.manager.vo.PageVO;
import micromall.manager.vo.ReturnResult;
import micromall.manager.vo.User;
import micromall.manager.vo.UserType;
/**
 * 
 * @ClassName:     ETicketCtl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:05:33
 */
@Controller
public class ETicketCtl {

	@Resource(name = CClass.UserServiceImpl)
	private IUserService userService;

	
	

	@Resource(name = CClass.UserTypeServiceImpl)
	private IUserTypeService userTypeService;

	

	@Resource(name = CClass.SystemConfigServiceImpl)
	private ISystemConfigService systemConfigService;

	
	public ISystemConfigService getSystemConfigService() {
		return systemConfigService;
	}

	public IUserTypeService getUserTypeService() {
		return userTypeService;
	}


	
	public IUserService getUserService() {
		return userService;
	}

	
	@SuppressWarnings("unused")
	private boolean validate(HttpServletResponse response, String par,
			Object serviceImpl) {

		// Validate begin
		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			try {
				response.getWriter().write(vPar.toJsonString());
				return false;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}

		ReturnResult vException = ValidateUtil.validateException(serviceImpl);

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			try {
				response.getWriter().write(vException.toJsonString());
				return false;
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return true;
		// Validate end
	}

	private void setEncoding(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding(ECharacterEncoding.UTF8.getValue());
			response.setCharacterEncoding(ECharacterEncoding.UTF8.getValue());
			response.setContentType(EContentType.TEXT_HTML.getValue());
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	}
	

	
	
	
	

	


	/**
	 * 获取用户集合
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_GET, method = RequestMethod.POST)
	@ResponseBody
	public void usersGet(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);

		try {
			List<User> users = getUserService().getUser(null);

			request.getSession().setAttribute(CSystem.USERS, users);

			response.getOutputStream().write(
					ReturnUtil.getReturnSuccessTwo(
							JSON.parseArray(JSON.toJSONString(users)))
							.getBytes(ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
			try {
				response.getOutputStream().write(
						ReturnUtil.getReturnFail(null).getBytes(
								ECharacterEncoding.UTF8.getValue()));
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

	@RequestMapping(value = CSpringURL.USER_GET, method = RequestMethod.GET)
	public void usersGetGet(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {
		usersGet(request, response, data);
	}

	/**
	 * 新增
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_SAVE, method = RequestMethod.POST)
	@ResponseBody
	public void userSave(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);

		try {
			response.getOutputStream().write(
					getUserService().saveOrUpdateUser(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据根据Id查询用户
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_getById, method = RequestMethod.POST)
	@ResponseBody
	public void userGetById(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getUserService().getUserById(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据根据Id查询用户
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_DELETE, method = RequestMethod.POST)
	@ResponseBody
	public void userDelete(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getUserService().deleteUser(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 用户类别保存
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_TYPE_SAVE, method = RequestMethod.POST)
	@ResponseBody
	public void userTypeSave(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getUserTypeService().saveOrUpdateUserType(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据Id查看用户类型
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_TYPE_getById, method = RequestMethod.POST)
	@ResponseBody
	public void userTypeGetById(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {
		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getUserTypeService().getUserTypeById(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据Id查看权限
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_TYPE_INITPERTREE, method = RequestMethod.POST)
	@ResponseBody
	public void userTypeInitPerTree(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {
		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getUserTypeService().userTypeInitPerTree().getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据Id查看权限
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_TYPE_GETPERMISSION, method = RequestMethod.POST)
	@ResponseBody
	public void userTypeGetPermission(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {
		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getUserTypeService().getPermissionById(
							JsonUtil.getInstance().toJsonObj(data)).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据Id保存权限
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_TYPE_SAVEPERMISSION, method = RequestMethod.POST)
	@ResponseBody
	public void userTypeSavePermission(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {
		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getUserTypeService().savePermissionById(
							JsonUtil.getInstance().toJsonObj(data)).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 用户类别删除
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_TYPE_DELETE, method = RequestMethod.POST)
	@ResponseBody
	public void userTypeDelete(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getUserTypeService().delUserType(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	
	/**
	 * 获取用户类别集合
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.USER_TYPE_List_Get, method = RequestMethod.POST)
	@ResponseBody
	public void userTypelistGet(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);

		try {
			List<UserType> type = getUserTypeService().getAllUserType(
					new PageVO(0, 0));

			request.getSession().setAttribute(CSystem.USERTYPE, type);

			response.getOutputStream().write(
					ReturnUtil.getReturnSuccessTwo(
							JSON.parseArray(JSON.toJSONString(type))).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
			try {
				response.getOutputStream().write(
						ReturnUtil.getReturnFail(null).getBytes(
								ECharacterEncoding.UTF8.getValue()));
			} catch (Exception e1) {
				e1.printStackTrace();
			}
		}
	}

	
	@RequestMapping(value = CSpringURL.SYSTEMCONFIG_UPDATE, method = RequestMethod.POST)
	@ResponseBody
	public void systemConfigSaveOrUpdate(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);

		try {
			response.getOutputStream().write(
					getSystemConfigService().saveOrUpdateSystemConfig(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据Id查看系统参数信息
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.SYSTEMCONFIG_GET_BY_ID, method = RequestMethod.POST)
	@ResponseBody
	public void systemConfigGetById(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {
		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getSystemConfigService().getSystemConfigById(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

	/**
	 * 根据Id查看系统参数信息
	 * 
	 * @param request
	 * @param response
	 * @param data
	 */
	@RequestMapping(value = CSpringURL.SYSTEMCONFIG_DEFAULT, method = RequestMethod.POST)
	@ResponseBody
	public void systemConfigDefault(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {
		setEncoding(request, response);
		try {
			response.getOutputStream().write(
					getSystemConfigService().saveSystemConfigDefault(
							JsonUtil.getInstance().toJsonObj(data)
									.toJSONString()).getBytes(
							ECharacterEncoding.UTF8.getValue()));
		} catch (IOException e) {
			e.printStackTrace();
		}
	}

}
