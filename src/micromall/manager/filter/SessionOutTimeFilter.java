/**
 * 
 */
package micromall.manager.filter;

import java.io.IOException;

import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import micromall.manager.constant.CSpringURL;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.ECharacterEncoding;
/**
 * 
 * @ClassName:     SessionOutTimeFilter.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:09:24
 */
public class SessionOutTimeFilter extends HttpServlet implements Filter {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2306629789792932049L;

	public void init(FilterConfig config) {
	}

	public void doFilter(ServletRequest servletRequest,
			ServletResponse servletResponse, FilterChain filterChain)
			throws ServletException, IOException {
		
		System.out.println("session check");

		HttpServletRequest req = (HttpServletRequest) servletRequest;

		servletRequest.setCharacterEncoding(ECharacterEncoding.UTF8.getValue());

		HttpServletResponse res = (HttpServletResponse) servletResponse;

		String url = req.getRequestURI();

		Object user = req.getSession().getAttribute(CSystem.SESSION_LOGINUSER);

		if (null == user) {
			if (url.endsWith("/micromall.manager/")
					|| url.endsWith("/micromall.manager/css/main/style.css")
					|| url.endsWith("/micromall.manager/js/cloud.js")
					|| url.endsWith("/micromall.manager/js/root/login.js")
					|| url.endsWith("/micromall.manager/js/util/ztLayer.js")
					|| url.endsWith("/micromall.manager/js/util/uContext.js")
					|| url.endsWith("/micromall.manager/js/layer/skin/pages/root/login.jsp")
					|| url.endsWith("/micromall.manager/js/pages/root/login.jsp")
					|| url.endsWith("/micromall.manager/images/light.png")
					|| url.endsWith("/micromall.manager/images/main/cloud.png")
					|| url.endsWith("/micromall.manager/images/main/loginbg1.png")
					|| url.endsWith("/micromall.manager/images/main/loginsj.png")
					|| url.endsWith("/micromall.manager/images/main/loginbg3.png")
					|| url.endsWith("/micromall.manager/images/main/loginlogo.png")
					|| url.endsWith("/micromall.manager/images/main/logininfo.png")
					|| url.endsWith("/micromall.manager/images/main/loginbg2.png")
					|| url.endsWith("/micromall.manager/images/main/loginpassword.png")
					|| url.endsWith("/micromall.manager/images/main/loginpassword.png")
					|| url.endsWith("/micromall.manager/images/main/loginuser.png")
					|| url.endsWith("/micromall.manager/images/main/buttonbg.png")
					|| url.endsWith("/micromall.manager/login.shtm")
					|| url.endsWith("/micromall.manager/js/layer/layer.min.js")) {

				filterChain.doFilter(servletRequest, servletResponse);
			} else {
				res.sendRedirect(CSpringURL.JSP_LOGIN);
			}
		} else {

			filterChain.doFilter(servletRequest, servletResponse);

		}
	}
}
