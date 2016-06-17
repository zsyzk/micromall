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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.alibaba.fastjson.JSONObject;

import micromall.manager.constant.CClass;
import micromall.manager.constant.CSpringURL;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.ECharacterEncoding;
import micromall.manager.constant.EContentType;
import micromall.manager.constant.EDBDataStatus;
import micromall.manager.constant.EMenuMark;
import micromall.manager.constant.EResult;
import micromall.manager.servcie.ISystemConfigService;
import micromall.manager.servcie.IUserService;
import micromall.manager.servcie.IUserTypeService;
import micromall.util.AssertUtil;
import micromall.util.PageHelp;
import micromall.util.PermissionUtil;
import micromall.util.ReturnUtil;
import micromall.util.ValidateUtil;
import micromall.manager.vo.PageVO;
import micromall.manager.vo.ReturnResult;
import micromall.manager.vo.SystemConfig;
import micromall.manager.vo.User;
/**
 * 
 * @ClassName:     DispatcherCtl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:05:25
 */

@Controller
public class DispatcherCtl {
	
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
	 * 
	 * 
	 * 
	 * Remark: 获取系统运营数据版本
	 * 
	 * Param:无
	 * 
	 * Return:系统运营数据最新的版本号
	 * 
	 */
	@RequestMapping(value = CSpringURL.DISPATCHER, method = RequestMethod.POST)
	public void dispatcherPost(HttpServletRequest request,
			HttpServletResponse response) {

		dispatMain(request, response);
	}

	private void dispatMain(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			// 设置编码
			setEncoding(request, response);
			JSONObject jsonObj = new JSONObject();
			int mark = -1, page = -1;
			String mcode = "";
			String condition = "";
			try {

				if (AssertUtil.isNull(request.getParameter(CSystem.MARK))
						|| AssertUtil
								.isNull(request.getParameter(CSystem.PAGE))) {

					jsonObj.put(CSystem.URL, CSpringURL.ERROR);
					return;
				}

				mark = Integer.parseInt(request.getParameter(CSystem.MARK));
				mcode = request.getParameter(CSystem.MCODE);
				page = Integer.parseInt(request.getParameter(CSystem.PAGE));

				condition = request.getParameter("condition");
			} catch (NumberFormatException e1) {
				// 设置处理页面
				jsonObj.put(CSystem.URL, CSpringURL.ERROR);
				ReturnUtil.getReturnSuccess(jsonObj.toJSONString());
			}

			/*if (EMenuMark.TERMS.getValue() == mark) {
				request.getSession().setAttribute(
						CSystem.PAGE_TERMS,
						PageHelp.getInstance().getPage(
								page,
								getShiYongTiaoKuanService()
										.getCount(EDBDataStatus.NO,
												ShiYongTiaoKuan.class)));
				jsonObj.put(CSystem.URL, CSpringURL.JSP_TERMS);

			}else if (EMenuMark.WEB_SPZL.getValue() == mark) {
				request.getSession().setAttribute(
						CSystem.PAGE_WEBSPZL,
						PageHelp.getInstance().getPage(
								page,
								getWebShouPiaoZiLiaoService()
										.getCount(EDBDataStatus.NO,
												WebShouPiaoZiLiao.class)));
				jsonObj.put(CSystem.URL, CSpringURL.JSP_WEB_SHOUPIAO);

			} else*/ 
			if (EMenuMark.USER.getValue() == mark) {

				request.getSession().setAttribute(
						CSystem.PAGE_USER,
						PageHelp.getInstance().getPage(
								page,
								getUserService().getCount(
										EDBDataStatus.ACTIVITY, User.class,
										condition)));
				jsonObj.put(CSystem.URL, CSpringURL.JSP_USER);
			}/* else if (EMenuMark.ZBSSTYPE.getValue() == mark) {

				request.getSession().setAttribute(
						CSystem.PAGE_ZBSS_TYPE,
						PageHelp.getInstance().getPage(
								page,
								getZhouBianSheShiTypeService().getCount(
										EDBDataStatus.NO,
										ZhouBianSheShiType.class)));

				jsonObj.put(CSystem.URL, CSpringURL.JSP_ZBSSTYPE);

			}*/
			else if (EMenuMark.SYSTEM_CONFIG.getValue() == mark) {
				jsonObj.put(CSystem.URL, CSpringURL.JSP_SYSTEM_CONFIG);
				request.getSession().setAttribute(
						CSystem.SYSTEM_CONFIG,
						getSystemConfigService().getAll(SystemConfig.class,
								PageHelp.getInstance().getDefaultPage(),
								CSystem.scid, EDBDataStatus.NO, null));
			} else if (EMenuMark.USER_TYPE.getValue() == mark) {
				jsonObj.put(CSystem.URL, CSpringURL.JSP_USER_TYPE);
			} 
			/**
			 * 设置动作权限
			 */
			String paction = PermissionUtil.getInstance().accessAction(request,
					mcode);
			if (AssertUtil.isNotNull(paction)) {
				request.getSession().setAttribute("action", paction);
			}

			response.getOutputStream().write(
					ReturnUtil.getReturnSuccess(jsonObj.toJSONString())
							.getBytes(ECharacterEncoding.UTF8.getValue()));

			// return URLEncoder.encode(
			// ReturnUtil.getReturnSuccess(jsonObj.toJSONString()),ECharacterEncoding.UTF8);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	@RequestMapping(value = CSpringURL.DISPATCHER, method = RequestMethod.GET)
	public void dispatcher(HttpServletRequest request,
			HttpServletResponse response) {
		dispatMain(request, response);
	}



}
