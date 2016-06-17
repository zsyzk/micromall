package micromall.manager.serviceimpl;

import javax.annotation.Resource;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import micromall.manager.constant.CClass;
import micromall.manager.constant.EResult;
import micromall.manager.constant.ESystemConfig;
import micromall.manager.dao.ISystemConfigDao;
import micromall.manager.servcie.ISystemConfigService;
import micromall.util.AssertUtil;
import micromall.util.JsonPropertyFilter;
import micromall.util.JsonUtil;
import micromall.util.ReturnUtil;
import micromall.util.ValidateUtil;
import micromall.manager.vo.ReturnResult;
import micromall.manager.vo.SystemConfig;
/**
 * 
 * @ClassName:     SystemConfigServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:04
 */
public class SystemConfigServiceImpl extends BaseServiceImpl<SystemConfig>
		implements ISystemConfigService {
	@Resource(name = CClass.SystemConfigDaoImpl)
	private ISystemConfigDao systemConfigDao;

	public ISystemConfigDao getSystemConfigDao() {
		return systemConfigDao;
	}

	@Override
	public String saveOrUpdateSystemConfig(String par) {
		try {

			ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

			if (vPar.getCode() != EResult.SUCCESS.getValue()) {
				return vPar.toJsonString();
			}

			ReturnResult vException = ValidateUtil
					.validateException(getSystemConfigDao());

			if (vException.getCode() != EResult.SUCCESS.getValue()) {
				return vException.toJsonString();
			}

			JSONObject json = JsonUtil.getInstance().toJsonObj(par);
			SystemConfig type = null;
			if (AssertUtil.isNotNull(json.getString("scid"))) {
				int id = json.getIntValue("scid");
				type = getSystemConfigDao().selDetailedByID(id);
			}
			type.setValue(json.getString("value"));

			
			return getSystemConfigDao().save(type) ? ReturnUtil
					.getReturnSuccess(null) : ReturnUtil.getReturnFail(null);
		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}

	}

	@Override
	public String getSystemConfigById(String par) {

		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			return vPar.toJsonString();
		}

		ReturnResult vException = ValidateUtil
				.validateException(getSystemConfigDao());

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			return vException.toJsonString();
		}

		JSONObject json = JsonUtil.getInstance().toJsonObj(par);
		SystemConfig type;
		if (AssertUtil.isNotNull(json.getString("id"))) {
			int id = json.getIntValue("id");
			type = getSystemConfigDao().selDetailedByID(id);
		} else {
			type = null;
		}
		return JSON.toJSONString(type, new JsonPropertyFilter());
	}

	@Override
	public String saveSystemConfigDefault(String par) {
		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			return vPar.toJsonString();
		}

		ReturnResult vException = ValidateUtil
				.validateException(getSystemConfigDao());

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			return vException.toJsonString();
		}

		JSONObject json = JsonUtil.getInstance().toJsonObj(par);
		SystemConfig type = null;
		if (AssertUtil.isNotNull(json.getString("scid"))) {
			int id = json.getIntValue("scid");
			type = getSystemConfigDao().selDetailedByID(id);
		}
		try {
			type.setValue(type.getDefaultValue());

		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}

		try {
			return getSystemConfigDao().save(type) ? ReturnUtil
					.getReturnSuccess(null) : ReturnUtil.getReturnFail(null);
		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}

	}

	@Override
	public String getSystemConfigByFlag(String flag) {
		try {
			return getSystemConfigDao().getSystemConfigByFlag(flag);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
