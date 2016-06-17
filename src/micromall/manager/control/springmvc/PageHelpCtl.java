/**      
* CCharacter.java Create on 2016-6-13     
*      
* Copyright (c) 2016-6-13 by zsyzk      
*      
* @author zhangsy     
* @version 1.0 
*     
*/ 
package micromall.manager.control.springmvc;

import java.io.UnsupportedEncodingException;
import java.net.URLDecoder;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;

import micromall.manager.constant.CClass;
import micromall.manager.constant.CSpringURL;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.ECharacterEncoding;
import micromall.manager.constant.EContentType;
import micromall.manager.constant.EDBDataStatus;
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
import micromall.manager.vo.User;
import micromall.manager.vo.UserType;

/**
 * 
 * @ClassName:     PageHelpCtl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:05:14
 */
@Controller
public class PageHelpCtl {

	

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


	

	// private PageVO getPage(int page, int count) {
	//
	// if (-1 == count || -1 == page) {
	// return null;
	// }
	//
	// PageVO vo = new PageVO();
	// vo.setDispayNum(7);
	// vo.setPage(page);
	// vo.setPageSize(10);
	// vo.setSumPage(count % vo.getPageSize() == 0 ? count / vo.getPageSize()
	// : (count / vo.getPageSize()) + 1);
	// return vo;
	// }

}
