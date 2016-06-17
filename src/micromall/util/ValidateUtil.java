/**
 * 
 */
package micromall.util;

import java.util.Map;

import micromall.manager.constant.EParType;
import micromall.manager.constant.EResult;
import micromall.manager.vo.ReturnResult;
/**
 * 
 * @ClassName:     ValidateUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:19:11
 */
public class ValidateUtil {

	private static ValidateUtil validateUtil;

	public static ValidateUtil getInstance() {
		if (AssertUtil.isNull(validateUtil)) {
			validateUtil = new ValidateUtil();
		}
		return validateUtil;
	}

	public ReturnResult valiPar(Map<EParType, Object> pars) {
		if (AssertUtil.isNull(pars)) {
			return null;
		}
		ReturnResult returnResult = new ReturnResult();
		for (EParType type : pars.keySet()) {
			if (type == EParType.STRING) {
				if (AssertUtil.isNull(pars.get(type).toString())) {
					returnResult.setCode(EResult.FAIL_PAR_NULL.getValue());
				}
			} else if (type == EParType.INTEGER) {
				if (0 > Integer.parseInt(pars.get(type).toString())) {
					returnResult.setCode(EResult.FAIL_PAR_NULL.getValue());
				}
			} else if (type == EParType.JSON) {
				if (AssertUtil.isNull(pars.get(type).toString())) {
					returnResult.setCode(EResult.FAIL_PAR_NULL.getValue());
				}
				if (!JsonUtil.getInstance().validate(pars.get(type).toString())) {
					returnResult.setCode(EResult.FAIL_PAR_FORMAT_EXCEPTION
							.getValue());
				}
			} else if (type == EParType.CLASS_INSTANCE) {
				if (AssertUtil.isNull(pars.get(type).toString())) {
					returnResult.setCode(EResult.FAIL_PAR_NULL.getValue());
				}
			}
		}

		returnResult.setCode(EResult.SUCCESS.getValue());
		return returnResult;
	}

	public static ReturnResult validateParamentsJson(String par) {
		ReturnResult result = new ReturnResult();
		if (AssertUtil.isNull(par)) {
			result.parse(ReturnUtil.getReturnFailParNull(null));
			return result;
		}

		if (!new JsonUtil().validate(par)) {
			result.parse(ReturnUtil.getReturnFailJsonFormat(par));
			return result;
		}
		result.setCode(EResult.SUCCESS.getValue());
		return result;
	}

	public static ReturnResult validateParaments(Object par) {
		ReturnResult result = new ReturnResult();
		if (AssertUtil.isNull(par)) {
			result.parse(ReturnUtil.getReturnFailParNull(null));
			return result;
		}
		if (par instanceof Integer && (Integer.parseInt(par.toString())) < 0) {
			result.parse(ReturnUtil.getReturnFailParNull(null));
			return result;
		}
		result.setCode(EResult.SUCCESS.getValue());
		return result;
	}

	public static ReturnResult validateException(Object obj) {
		ReturnResult result = new ReturnResult();
		if (AssertUtil.isNull(obj)) {
			result.parse(ReturnUtil.getReturnFail(null));
			return result;
		}
		result.setCode(EResult.SUCCESS.getValue());
		return result;
	}

	public static void main(String[] args) {
		String jsonString = "{\"name\":12}";
		ReturnResult validate = ValidateUtil.validateParamentsJson(jsonString);
		if (validate.getCode() != EResult.SUCCESS.getValue()) {
			System.out.println(validate.toJsonString());
		} else {
			System.out.println("Success!");
		}
	}

}
