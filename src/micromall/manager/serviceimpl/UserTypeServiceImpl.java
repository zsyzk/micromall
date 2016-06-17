package micromall.manager.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import org.dom4j.Document;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONObject;

import micromall.manager.constant.CClass;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.EDBDataStatus;
import micromall.manager.constant.EResult;
import micromall.manager.dao.IPermissionActionDao;
import micromall.manager.dao.IPermissionDao;
import micromall.manager.dao.IPermissionMenuDao;
import micromall.manager.dao.IPermissionModelDao;
import micromall.manager.dao.IUserDao;
import micromall.manager.dao.IUserTypeDao;
import micromall.manager.servcie.IUserTypeService;
import micromall.util.AssertUtil;
import micromall.util.JsonPropertyFilter;
import micromall.util.JsonUtil;
import micromall.util.PermissionUtil;
import micromall.util.ReturnUtil;
import micromall.util.ValidateUtil;
import micromall.util.XmlUtil;
import micromall.manager.vo.PageVO;
import micromall.manager.vo.Permission;
import micromall.manager.vo.PermissionAction;
import micromall.manager.vo.PermissionMenu;
import micromall.manager.vo.PermissionModel;
import micromall.manager.vo.ReturnResult;
import micromall.manager.vo.User;
import micromall.manager.vo.UserType;
/**
 * 
 * @ClassName:     UserTypeServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:15:05
 */
public class UserTypeServiceImpl extends BaseServiceImpl<UserType> implements IUserTypeService {

	@Resource(name = CClass.UserTypeDaoImpl)
	private IUserTypeDao userTypeDao;
	@Resource(name = CClass.UserDaoImpl)
	private IUserDao userDao;
	@Resource(name = CClass.PermissionDaoImpl)
	private IPermissionDao permissionDao;
	@Resource(name = CClass.PermissionModelDaoImpl)
	private IPermissionModelDao permissionModelDao;
	@Resource(name = CClass.PermissionMenuDaoImpl)
	private IPermissionMenuDao permissionMenuDao;
	@Resource(name = CClass.PermissionActionDaoImpl)
	private IPermissionActionDao permissionActionDao;
	
	public IPermissionDao getPermissionDao() {
		return permissionDao;
	}

	public void setPermissionDao(IPermissionDao permissionDao) {
		this.permissionDao = permissionDao;
	}

	public IUserDao getUserDao() {
		return userDao;
	}

	public IUserTypeDao getUserTypeDao() {
		return userTypeDao;
	}

	@Override
	public String saveUserType(String par) {
		try {
			JSONObject jsonObj = JsonUtil.getInstance().toJsonObj(par);
			// 系统参数
			int lang = jsonObj.getIntValue(CSystem.LANG), userid = jsonObj
					.getIntValue(CSystem.USERID);
			String kfbm = jsonObj.getString(CSystem.KFBM), clientMark = jsonObj
					.getString(CSystem.CLIENT_MARK), typeName = jsonObj
					.getString(CSystem.TYPENAME), typeMs = jsonObj
					.getString(CSystem.TYPEMS);
			
			UserType userType = new UserType();
			userType.setStatus(EDBDataStatus.ACTIVITY.getValue());
			userType.setTypeName(typeName);
			userType.setTypeMs(typeMs);

			return getUserTypeDao().save(userType) ? ReturnUtil
					.getReturnSuccess(null, clientMark) : ReturnUtil
					.getReturnFail(null);
		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}
	}

	@Override
	public String editUserType(String par) {
		try {
			JSONObject jsonObj = JsonUtil.getInstance().toJsonObj(par);
			// 系统参数
			int lang = jsonObj.getIntValue(CSystem.LANG), userid = jsonObj
					.getIntValue(CSystem.USERID), userTypeId = jsonObj
					.getIntValue(CSystem.USERTYPEID), status = jsonObj
					.getIntValue(CSystem.STATUS);
			String kfbm = jsonObj.getString(CSystem.KFBM), clientMark = jsonObj
					.getString(CSystem.CLIENT_MARK), typeName = jsonObj
					.getString(CSystem.TYPENAME), typeMs = jsonObj
					.getString(CSystem.TYPEMS);
			
			UserType userType = new UserType();
			userType.setStatus(EDBDataStatus.ACTIVITY.getValue());
			userType.setTypeName(typeName);
			userType.setTypeMs(typeMs);
			userType.setUserTypeId(userTypeId);
			userType.setStatus(status);

			getUserTypeDao().update(userType);

			return ReturnUtil.getReturnSuccess(null, clientMark);
		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}
	}

	@Override
	public String delUserType(String par) {
		// Validate begin
		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			return vPar.toJsonString();
		}

		ReturnResult vException = ValidateUtil
				.validateException(getUserTypeDao());

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			return vException.toJsonString();
		}
		// Validate end

		// ------------------------parse json------------------------------
		JSONObject json = JsonUtil.getInstance().toJsonObj(par);
		int id = 0;
		if (AssertUtil.isNotNull(json.getString("userTypeId"))) {
			id = json.getIntValue("userTypeId");

			User user = getUserDao()
					.getByUserTypeId(id);
			if (user != null) {
				return ReturnUtil.getReturnFail("当前类别关联的有数据，无法删除");
			}

			UserType type = getUserTypeDao()
					.selDetailedByID(id);
			if (type == null) {
				return ReturnUtil.getReturnFail(null);
			}
		}

		// ------------------------parse json------------------------------

		// ------------------------Executed------------------------------
		try {
			boolean result = getUserTypeDao()
					.deleteUserType(id);
			return result ? ReturnUtil.getReturnSuccess(null) : ReturnUtil
					.getReturnFail(null);

		} catch (Exception e) {
			e.printStackTrace();
			return ReturnUtil.getReturnFail(null);
		}
		// ------------------------Executed------------------------------
	}

	@Override
	public List<UserType> getAllUserType(PageVO vo) {
		try {
			return getUserTypeDao().getAllUserType(vo);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public String saveOrUpdateUserType(String par) {
		// Validate begin
		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);
		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			return vPar.toJsonString();
		}
		ReturnResult vException = ValidateUtil
				.validateException(getUserTypeDao());

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			return vException.toJsonString();
		}
		// Validate end

		// ------------------------parse json------------------------------
		
		JSONObject json = JsonUtil.getInstance().toJsonObj(par);
		UserType type = null;
		if (AssertUtil.isNotNull(json.getString("userTypeId"))) {
			int id = json.getIntValue("userTypeId");
			type = getUserTypeDao().selDetailedByID(id);
		} else {
			type = new UserType();
			type.setStatus(EDBDataStatus.ACTIVITY.getValue());
		}
		try {
			if(getUserTypeDao().exsitTypeName(json.getString("typeName"),json.getString("userTypeId"))){
				return ReturnUtil.getReturnFail("当前类别已存在，请重新编辑名称...");
			}else{
				type.setTypeMs(json.getString("typeMs"));
				type.setTypeName(json.getString("typeName"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		// ------------------------parse json------------------------------

		// ------------------------Executed------------------------------
		try {

			boolean result = getUserTypeDao().saveOrUpdate(type);
			return result ? ReturnUtil.getReturnSuccess(null) : ReturnUtil
					.getReturnFail(null);
		} catch (Exception e) {
			e.printStackTrace();
			if (AssertUtil.isNotNull(json.getString("userTypeId"))) {
				return ReturnUtil.getReturnFail("您好！修改用户类型失败。");
			}else{
				return ReturnUtil.getReturnFail("您好！新增用户类型失败。");
			}
		}
		// ------------------------Executed------------------------------
	}

	@Override
	public String getUserTypeById(String par) {

		// Validate begin
		ReturnResult vPar = ValidateUtil.validateParamentsJson(par);

		if (vPar.getCode() != EResult.SUCCESS.getValue()) {
			return vPar.toJsonString();
		}

		ReturnResult vException = ValidateUtil
				.validateException(getUserTypeDao());

		if (vException.getCode() != EResult.SUCCESS.getValue()) {
			return vException.toJsonString();
		}
		// Validate end

		// ------------------------parse json------------------------------
		JSONObject json = JsonUtil.getInstance().toJsonObj(par);
		UserType type;
		if (AssertUtil.isNotNull(json.getString("userTypeId"))) {
			int id = json.getIntValue("userTypeId");
			type = getUserTypeDao().selDetailedByID(id);
		}else{
			type = null;
		}
		return JSON.toJSONString(type, new JsonPropertyFilter());
			
		// ------------------------parse json------------------------------
	}

	@Override
	public String getPermissionById(JSONObject jsonObject) {
		String returnValue = "";
		int id = jsonObject.getIntValue("id");
		Permission per = permissionDao.getPermissionByUserTypeId(id);
		if(AssertUtil.isNotNull(per)){
			List<PermissionAction> actions = permissionActionDao.getByPerId(per.getPerId());
			StringBuffer acts = new StringBuffer("");
			for(PermissionAction p : actions){
				AssertUtil.append(acts, p.getPerActionCode());
			}
			returnValue = acts.toString();
		}
		return returnValue;
		
		
		
		/*String permission = userTypeDao.selPermissionByID(id);
		if(AssertUtil.isNotNull(permission)){
			return permission;
		}
		return "";*/
	}

	@Override
	public String savePermissionById(JSONObject jsonObject) {
		int id = jsonObject.getIntValue("id");
		String permission = jsonObject.getString("permission");
		//获取权限id
		Permission per = permissionDao.getPermissionByUserTypeId(id);
		int perId = -1;
		//不存在权限
		if(AssertUtil.isNull(per)){
			per = new Permission();
			per.setUserTypeId(id);
			//保存权限
			perId = Integer.parseInt(permissionDao.saveBackId(per));
		}else{//存在
			perId = per.getPerId();
			
			//删除model，menu，action权限
			permissionModelDao.removeByPerId(perId);
			permissionMenuDao.removeByPerId(perId);
			permissionActionDao.removeByPerId(perId);
		}
		
		//保存新的model，menu，action权限
		List<String> models = PermissionUtil.getInstance().getModelPermission(permission);
		for(String m : models){
			//遍历model的code
			PermissionModel pm = new PermissionModel();
			pm.setPerModelCode(m);
			pm.setPerId(perId);
			permissionModelDao.save(pm);
			//保存menu
			List<String> menus = PermissionUtil.getInstance().getMenuPermission(m,permission);
			
			for(String me : menus){
				PermissionMenu pme = new PermissionMenu();
				pme.setPerId(perId);
				pme.setPerModelCode(m);
				pme.setPerMenuCode(me);
				permissionMenuDao.save(pme);
				if(me.length() == 6){
					List<String> actions = PermissionUtil.getInstance().getActionPermission(me,permission);
					
					for(String act : actions){
						PermissionAction pa = new PermissionAction();
						pa.setPerActionCode(act);
						pa.setPerId(perId);
						pa.setPerMenuCode(me);
						permissionActionDao.save(pa);
						
					}
				}
			}
			
		}
		
		
		return ReturnUtil.getReturnSuccess(null);
	}

	@Override
	public String userTypeInitPerTree() {
		String ret = "";
		Document doc = XmlUtil.getInstance().getDocument(CSystem.PER_TREE_PATH);
		if(AssertUtil.isNotNull(doc)){
			ret = doc.asXML();
		}
		
 		return ret;
		
	}

}
