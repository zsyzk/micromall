/**
 * 
 */
package micromall.util;

import java.io.UnsupportedEncodingException;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import micromall.manager.constant.ECharacterEncoding;
import micromall.manager.constant.EContentType;
/**
 * 
 * @ClassName:     EncodingUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:17:15
 */
public class EncodingUtil {

	private static EncodingUtil encodingUtil;

	public static EncodingUtil getInstance() {
		if (AssertUtil.isNull(encodingUtil)) {
			encodingUtil = new EncodingUtil();
		}

		return encodingUtil;
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark: 服务端 建立编码，JSP前台采用：decodeURI(data, "utf-8")解码 <%@ page
	 * language="java" import="java.util.*,java.net.URLEncoder"
	 * contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public String ServerToWEB(String par) {
		if (AssertUtil.isNull(par)) {
			return par;
		}
		try {
			return URLEncoder.encode(par, ECharacterEncoding.UTF8.getValue());
		} catch (UnsupportedEncodingException e) {
			e.printStackTrace();
			return null;
		}
	}
	

	public void setEncoding(HttpServletRequest request,
			HttpServletResponse response) {
		try {
			request.setCharacterEncoding(ECharacterEncoding.UTF8.getValue());
			response.setCharacterEncoding(ECharacterEncoding.UTF8.getValue());
			response.setContentType(EContentType.TEXT_HTML.getValue());
		} catch (UnsupportedEncodingException e1) {
			e1.printStackTrace();
		}
	}

}
