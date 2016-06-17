/**
 * 
 */
package micromall.util;

import com.alibaba.fastjson.JSONArray;

import micromall.manager.constant.EResult;
import micromall.manager.constant.EResultString;
import micromall.manager.vo.ReturnResult;
import micromall.manager.vo.ReturnResultTwo;
/**
 * 
 * @ClassName:     ReturnUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:18:38
 */
public class ReturnUtil {

	public static String getReturnSuccessTwo(JSONArray data) {
		ReturnResultTwo returnResult = new ReturnResultTwo();
		returnResult.setCode(EResult.SUCCESS.getValue());
		if (AssertUtil.isNotNull(data)) {
			returnResult.setMsg(EResultString.SUCCESS.getValue());
		}
		returnResult.setData(data);

		return returnResult.toJsonString();
	}

	public static String getReturnSuccessTwo(JSONArray data, String clientMark) {
		ReturnResultTwo returnResult = new ReturnResultTwo();
		returnResult.setCode(EResult.SUCCESS.getValue());
		returnResult.setClient_mark(clientMark);
		if (AssertUtil.isNotNull(data)) {
			returnResult.setMsg(EResultString.SUCCESS.getValue());
		}
		returnResult.setData(data);

		return returnResult.toJsonString();
	}

	public static String getReturnSuccess(String data) {
		ReturnResult returnResult = new ReturnResult();
		returnResult.setCode(EResult.SUCCESS.getValue());
		returnResult.setMsg(EResultString.SUCCESS.getValue());
		if (AssertUtil.isNotNull(data)) {
			returnResult.setData(JsonUtil.getInstance().toJsonObj(data));
		}
		return returnResult.toJsonString();
	}

	public static String getReturnSuccess(String data, String clientMark) {
		ReturnResult returnResult = new ReturnResult();
		returnResult.setCode(EResult.SUCCESS.getValue());
		returnResult.setMsg(EResultString.SUCCESS.getValue());
		returnResult.setClient_mark(clientMark);
		if (AssertUtil.isNotNull(data)) {
			returnResult.setData(JsonUtil.getInstance().toJsonObj(data));
		}
		return returnResult.toJsonString();
	}

	public static String getReturnFail(String value) {
		ReturnResult returnResult = new ReturnResult();
		returnResult.setCode(EResult.FAIL_EXCEPTION.getValue());
		returnResult.setMsg(AssertUtil.isNull(value) ? EResultString.EXCEPTION
				.getValue() : value);
		return returnResult.toJsonString();
	}

	public static String getReturnFailParNull(String par) {
		ReturnResult returnResult = new ReturnResult();
		returnResult.setCode(EResult.FAIL_PAR_NULL.getValue());
		returnResult.setMsg(EResultString.PARNULL.getValue());
		if (AssertUtil.isNotNull(par)) {
			returnResult.setData(JsonUtil.getInstance().toJsonObj(par));
		}
		return returnResult.toJsonString();
	}

	public static String getReturnFailJsonFormat(String par) {

		ReturnResult returnResult = new ReturnResult();
		returnResult.setCode(EResult.FAIL_PAR_FORMAT_EXCEPTION.getValue());
		returnResult.setMsg(EResultString.JSONFORMAT.getValue());
		if (AssertUtil.isNotNull(par)) {
			returnResult.setData(JsonUtil.getInstance().toJsonObj(par));
		}
		return returnResult.toJsonString();
	}

}
