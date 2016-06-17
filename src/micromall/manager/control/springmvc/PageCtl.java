/**
 * 
 */
package micromall.manager.control.springmvc;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

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
import micromall.manager.constant.EMenuMark;
import micromall.manager.servcie.IBaseHelpService;
import micromall.manager.servcie.IUserService;
import micromall.manager.servcie.IUserTypeService;
import micromall.util.AssertUtil;
import micromall.util.EncodingUtil;
import micromall.util.JsonUtil;
import micromall.util.PageHelp;
import micromall.util.ReturnUtil;
import micromall.manager.vo.PageVO;

/**
 * 
 * @ClassName:     PageCtl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:05:43
 */
@Controller
public class PageCtl {

	@Resource(name = CClass.UserServiceImpl)
	private IUserService userService;

	@Resource(name = CClass.UserTypeServiceImpl)
	private IUserTypeService userTypeService;
	
	@Resource(name = CClass.BaseHelpServiceImpl)
	private IBaseHelpService baseHelpService;

	public IBaseHelpService getBaseHelpService() {
		return baseHelpService;
	}


	public IUserTypeService getUserTypeService() {
		return userTypeService;
	}

	public IUserService getUserService() {
		return userService;
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
	 * User: dang.yin(Seven)
	 * 
	 * Remark: 获取系统运营数据版本
	 * 
	 * Param:无
	 * 
	 * Return:系统运营数据最新的版本号
	 * 
	 */
	@RequestMapping(value = CSpringURL.PAGE_LOAD, method = RequestMethod.POST)
	public void pagePost(HttpServletRequest request,
			HttpServletResponse response) {
		pageMain(request, response);
	}


	@RequestMapping(value = CSpringURL.PAGE_LOAD, method = RequestMethod.GET)
	public void pageByGet(HttpServletRequest request,
			HttpServletResponse response) {
		pageMain(request, response);
	}
	
	private void pageMain(HttpServletRequest request,
			HttpServletResponse response) {
		try {

			EncodingUtil.getInstance().setEncoding(request, response);

			if (AssertUtil.isNull(request.getParameter(CSystem.MARK))
					|| AssertUtil.isNull(request.getParameter(CSystem.PAGE))) {
				response.getOutputStream().write(
						ReturnUtil.getReturnFail(null).getBytes(
								ECharacterEncoding.UTF8.getValue()));
			}

			int mark = Integer.parseInt(request.getParameter(CSystem.MARK)), page = Integer
					.parseInt(request.getParameter(CSystem.PAGE));

			String condition = request.getParameter(CSystem.CONDITION);

			if (AssertUtil.isNotNull(condition)) {
				condition = URLDecoder.decode(
						URLDecoder.decode(condition,
								ECharacterEncoding.UTF8.getValue()),
						ECharacterEncoding.UTF8.getValue());
			}

			PageVO vo = PageHelp.getInstance().getPage(
					page,
					getBaseHelpService().count(
							EMenuMark.getStautsByValue(mark),
							EMenuMark.getClassNameByValue(mark), condition));

			vo.setStatus(EMenuMark.getStautsByValue(mark));

			if (AssertUtil.isNotNull(vo)) {
				vo.setEntityName(EMenuMark.getClassNameByValue(mark));
				vo.setSortField(EMenuMark.getSortNameByValue(mark));
				vo.setCondition(condition);
				JSONObject jsonObj = new JSONObject();
				jsonObj.put(CSystem.PAGE, getBaseHelpService().selPageData(vo));
				response.getOutputStream().write(
						ReturnUtil.getReturnSuccess(
								JsonUtil.getInstance().toJsonString(jsonObj))
								.getBytes(ECharacterEncoding.UTF8.getValue()));
			}

		} catch (Exception e) {

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
	@RequestMapping(value = CSpringURL.PAGE_LOAD_HELP, method = RequestMethod.POST)
	public void pageHelpPost(HttpServletRequest request,
			HttpServletResponse response) {
		pageHelpMain(request, response);
	}
	
	@RequestMapping(value = CSpringURL.PAGE_LOAD_HELP, method = RequestMethod.GET)
	public void pageHelpByGet(HttpServletRequest request,
			HttpServletResponse response) {
		pageHelpMain(request, response);
	}
	

	private void pageHelpMain(HttpServletRequest request,
			HttpServletResponse response) {
		try {

			EncodingUtil.getInstance().setEncoding(request, response);

			if (AssertUtil.isNull(request.getParameter(CSystem.MARK))
					|| AssertUtil.isNull(request.getParameter(CSystem.PAGE))) {
				response.getOutputStream().write(
						ReturnUtil.getReturnFail(null).getBytes(
								ECharacterEncoding.UTF8.getValue()));
			}

			int mark = Integer.parseInt(request.getParameter(CSystem.MARK)), page = Integer
					.parseInt(request.getParameter(CSystem.PAGE));

			String condition = request.getParameter(CSystem.CONDITION);

			if (AssertUtil.isNotNull(condition)) {
				condition = URLDecoder.decode(
						URLDecoder.decode(condition,
								ECharacterEncoding.UTF8.getValue()),
						ECharacterEncoding.UTF8.getValue());
			}

			PageVO vo = PageHelp.getInstance().getPage(
					page,
					getBaseHelpService().count(
							EMenuMark.getStautsByValue(mark),
							EMenuMark.getClassNameByValue(mark), condition));

			vo.setStatus(EMenuMark.getStautsByValue(mark));

			if (AssertUtil.isNotNull(vo)) {
				vo.setEntityName(EMenuMark.getClassNameByValue(mark));
				vo.setSortField(EMenuMark.getSortNameByValue(mark));
				vo.setCondition(condition);
				JSONObject jsonObj = new JSONObject();
				jsonObj.put(CSystem.PAGE, vo);
				response.getOutputStream().write(
						ReturnUtil.getReturnSuccess(
								JsonUtil.getInstance().toJsonString(jsonObj))
								.getBytes(ECharacterEncoding.UTF8.getValue()));
			}

		} catch (Exception e) {

			e.printStackTrace();
		}

	}

}
