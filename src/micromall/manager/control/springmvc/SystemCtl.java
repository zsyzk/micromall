package micromall.manager.control.springmvc;

import java.io.IOException;
import java.io.UnsupportedEncodingException;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import micromall.manager.constant.CClass;
import micromall.manager.constant.CSpringURL;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.ECharacterEncoding;
import micromall.manager.constant.EContentType;
import micromall.manager.constant.EResult;
import micromall.manager.servcie.IUserService;
import micromall.util.AssertUtil;
import micromall.util.GlobalContext;
import micromall.util.JsonUtil;
import micromall.util.ValidateUtil;
import micromall.manager.vo.Result;
import micromall.manager.vo.ReturnResult;
/**
 * 
 * @ClassName:     SystemCtl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:05:52
 */
@Controller
public class SystemCtl {

	@Resource(name = CClass.UserServiceImpl)
	private IUserService userService;

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

	
	@RequestMapping(value = CSpringURL.EXIT_LOGIN, method = RequestMethod.POST)
	@ResponseBody
	public void exitLogin(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			response.getOutputStream().write(
					getUserService().exitLogin(request).getBytes("utf-8"));
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}
	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark: 获取系统运营数据版本
	 * 
	 * Param:无
	 * 
	 * Return:系统运营数据最新的版本号
	 * 
	 */
	@RequestMapping(value = CSpringURL.USER_LOGIN, method = RequestMethod.POST)
	@ResponseBody
	public void getLogin(HttpServletRequest request,
			HttpServletResponse response, @RequestBody String data) {

		setEncoding(request, response);

		try {
			request.getSession().setAttribute(CSystem.USERNAME, JsonUtil.getInstance().toJsonObj(data).getString(CSystem.USERNAME));
			
			response.getOutputStream().write(
					getUserService().login(request,data).getBytes("utf-8"));
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		// return EncodingUtil.getInstance().ServerToWEB(
		// JSON.toJSONString(map));

		/*
		 * JSONObject jsonObj = JSON.parseObject(data);
		 * 
		 * String username = jsonObj.getString(CSystem.USERNAME);
		 * 
		 * String password = jsonObj.getString(CSystem.PASSWORD);
		 * 
		 * if (AssertUtil.isNull(username)) { return
		 * EncodingUtil.getInstance().ServerToWEB(
		 * ReturnUtil.getReturnFail(CCharacter.USER_NULL)); }
		 * 
		 * if (AssertUtil.isNull(password)) {
		 * System.out.println(EncodingUtil.getInstance().ServerToWEB(
		 * ReturnUtil.getReturnFail(CCharacter.PASSWORD_NULL))); return
		 * EncodingUtil.getInstance().ServerToWEB(
		 * ReturnUtil.getReturnFail(CCharacter.PASSWORD_NULL)); }
		 * 
		 * System.out.println(jsonObj);
		 * 
		 * String par = request.getParameter(CSystem.PAR);
		 * 
		 * if (!validate(response, par, getUserService())) { return ""; }
		 * 
		 * 
		 * try { response.getWriter().write(getUserService().login(par)); }
		 * catch (IOException e) { e.printStackTrace(); }
		 * 
		 * 
		 * return null;
		 */
	}

	@RequestMapping(value = CSpringURL.USER_LOGIN, method = RequestMethod.GET)
	public void Login(HttpServletRequest request, HttpServletResponse response,
			@RequestBody String data) {
		getLogin(request, response, data);
	}
	
	/**
	 * 修改密码
	 */
	@SuppressWarnings("unused")
	@RequestMapping(value = CSpringURL.MODIFY_PWD, method = RequestMethod.POST)
	private void userAction(HttpServletRequest request, HttpServletResponse resp) {
		try {

			String method = request.getParameter("method"), data = request
					.getParameter("data");

			Result result = null;

			boolean flag = true;

			GlobalContext context = (GlobalContext) request.getSession()
					.getAttribute(CSystem.SESSION_LOGINUSER);

			if (AssertUtil.isNotNull(method)) {
			   if ("modifyPwd".equals(method)) {
					result = getUserService().modifyPwd(context.getUserId(),
							data);
				}else if("checkPwd".equals(method)){
					String pwd = request.getParameter("param");
					result = new Result(getUserService().checkPwd(pwd,context));
					flag = false;
				} 
			}
				resp.getOutputStream().write(
						result.getReturnValue().getBytes(ECharacterEncoding.UTF8.getValue()));

		} catch (IOException e) {
			e.printStackTrace();
		}
	}
	
}
