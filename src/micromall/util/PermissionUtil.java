package micromall.util;

import java.util.ArrayList;
import java.util.List;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import javax.servlet.http.HttpServletRequest;

import micromall.manager.constant.CClass;
import micromall.manager.servcie.IPermissionActionService;
import micromall.manager.servcie.IPermissionMenuService;
import micromall.manager.servcie.IPermissionModelService;
import micromall.manager.servcie.IPermissionService;
import micromall.manager.vo.Permission;
/**
 * 
 * @ClassName:     PermissionUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:18:25
 */
public class PermissionUtil {
	
	private PermissionUtil(){
		
	}
	public static PermissionUtil permissionUtil;
	
	public static PermissionUtil getInstance(){
		if(AssertUtil.isNull(permissionUtil)){
			permissionUtil = new PermissionUtil();
		}
		return permissionUtil;
	}
	
	private IPermissionService permissionServiceImpl;
	
	private IPermissionMenuService permissionMenuServiceImpl;
	
	private IPermissionModelService permissionModelServiceImpl;
	
	private IPermissionActionService permissionActionServiceImpl;
	
	public IPermissionMenuService getPermissionMenuServiceImpl(){
		if (AssertUtil.isNull(permissionMenuServiceImpl)) {
			Object returnObj = SpringBeanMaker.getObject(CClass.PermissionMenuServiceImpl);
			if (returnObj instanceof IPermissionMenuService) {
				permissionMenuServiceImpl = (IPermissionMenuService) returnObj;
			}
		}
		return permissionMenuServiceImpl;
	}
	
	public IPermissionModelService getPermissionModelServiceImpl(){
		if (AssertUtil.isNull(permissionModelServiceImpl)) {
			Object returnObj = SpringBeanMaker.getObject(CClass.PermissionModelServiceImpl);
			if (returnObj instanceof IPermissionModelService) {
				permissionModelServiceImpl = (IPermissionModelService) returnObj;
			}
		}
		return permissionModelServiceImpl;
	}
	
	public IPermissionActionService getPermissionActionServiceImpl(){
		if (AssertUtil.isNull(permissionActionServiceImpl)) {
			Object returnObj = SpringBeanMaker.getObject(CClass.PermissionActionServiceImpl);
			if (returnObj instanceof IPermissionActionService) {
				permissionActionServiceImpl = (IPermissionActionService) returnObj;
			}
		}
		return permissionActionServiceImpl;
	}
	
	public IPermissionService getPermissionServiceImpl(){
		if (AssertUtil.isNull(permissionServiceImpl)) {
			Object returnObj = SpringBeanMaker.getObject(CClass.PermissionServiceImpl);
			if (returnObj instanceof IPermissionService) {
				permissionServiceImpl = (IPermissionService) returnObj;
			}
		}
		return permissionServiceImpl;
	}
	
	/**
	 * 获取有权限的model模块
	 * @return
	 */
	public List<String> getModelPermission(String permission){
		List<String> ids = new ArrayList<String>();
		if(AssertUtil.isNotNull(permission)){
			String regEx = ",([0-9]{2})";
			String s = permission;
			Pattern pat = Pattern.compile(regEx);
			Matcher mat = pat.matcher(s);
			StringBuffer models = new StringBuffer("");
			while(mat.find()){
				AssertUtil.append(models, mat.group(1));
			}
			if(AssertUtil.isNotNull(models.toString())){
				String[] ps = models.toString().split(",");
				for(String p : ps){
					ids.add(p);
				}
			}
		}
		return ids;
	}
//,1(模块)-1(父菜单)-1(子菜单)-1(动作)
	/**
	 * 获取有权限的menu菜单
	 * @return
	 */
	public List<String> getMenuPermission(String modelcode,String permission) {
		List<String> ids = new ArrayList<String>();
		if(AssertUtil.isNotNull(permission)){
			String regEx = ",("+modelcode+")([0-9]{2})([0-9]{2})";
			String s = permission;
			Pattern pat = Pattern.compile(regEx);
			Matcher mat = pat.matcher(s);
			StringBuffer models = new StringBuffer("");
			while(mat.find()){
				//父菜单
				AssertUtil.append(models, (mat.group(1)+mat.group(2)));
				//子菜单
				AssertUtil.append(models, (mat.group(1)+mat.group(2)+mat.group(3)));
			}
			if(AssertUtil.isNotNull(models.toString())){
				String[] ps = models.toString().split(",");
				for(String p : ps){
					ids.add(p);
				}
			}
		}
		return ids;
	}
	//,1(模块)-1(父菜单)-1(子菜单)-1(动作)
	/**
	 * 获取有权限的action动作
	 * @return
	 */
	public List<String> getActionPermission(String menuCode,String permission) {
		List<String> ids = new ArrayList<String>();
		if(AssertUtil.isNotNull(permission)){
			String regEx = ",("+menuCode+")([0-9]{2})";
			String s = permission;
			Pattern pat = Pattern.compile(regEx);
			Matcher mat = pat.matcher(s);
			StringBuffer actions = new StringBuffer("");
			while(mat.find()){
				//动作
				AssertUtil.append(actions, (mat.group(1)+mat.group(2)));
			}
			if(AssertUtil.isNotNull(actions.toString())){
				String[] ps = actions.toString().split(",");
				for(String p : ps){
					ids.add(p);
				}
			}
		}
		return ids;
	}
	
	public List<String> accessModel(HttpServletRequest request){
		List<String> ids = new ArrayList<String>();
		GlobalContext global = (GlobalContext)request.getSession().getAttribute("loginUser");
		if(AssertUtil.isNotNull(global)){
			int userTypeId = global.getUserTypeId();
			Permission per = getPermissionServiceImpl().getPermissionByUserTypeId(userTypeId);
			if(AssertUtil.isNotNull(per)){
				int perId = per.getPerId();
				ids= getPermissionModelServiceImpl().getPerModelCodeByPerId(perId);
			}
		}
		
		return ids;
	}
	
	public List<String> accessMenu(HttpServletRequest request,String modelCode){
		List<String> ids = new ArrayList<String>();
		GlobalContext global = (GlobalContext)request.getSession().getAttribute("loginUser");
		if(AssertUtil.isNotNull(global)){
			int userTypeId = global.getUserTypeId();
			if(checkPerModel(request,modelCode)){
				Permission per = getPermissionServiceImpl().getPermissionByUserTypeId(userTypeId);
				
				if(AssertUtil.isNotNull(per)){
					int perId = per.getPerId();
					ids= getPermissionMenuServiceImpl().getPerMenuCodeByPerIdAndModelCode(perId,modelCode);
				}
			}
		}
		
		return ids;
	}
	
	public String accessAction(HttpServletRequest request,String MenuCode){
		List<String> ids = new ArrayList<String>();
		GlobalContext global = (GlobalContext)request.getSession().getAttribute("loginUser");
		if(AssertUtil.isNotNull(global)){
			int userTypeId = global.getUserTypeId();
			Permission per = getPermissionServiceImpl().getPermissionByUserTypeId(userTypeId);
			
			if(AssertUtil.isNotNull(per)){
				int perId = per.getPerId();
				ids= getPermissionActionServiceImpl().getPerActionCodeByPerIdAndMenuCode(perId,MenuCode);
			}
			StringBuffer actions = new StringBuffer();
			if(AssertUtil.isNotNull(ids)){
				for(String id : ids){
					AssertUtil.append(actions, id.substring(id.length()-2, id.length()));
				}
				return actions.toString();
			}
		}
		
		return "";
	}
	
/*	private boolean checkPerMenu(String menuCode){
		boolean pass = false;
		List<String> codes =  accessMenu(modelCode);
		for(String c : codes){
			if(c.equals(modelCode)){
				pass = true;
			}
		}
		return pass;
	}
*/	
	private boolean checkPerModel(HttpServletRequest request,String modelCode){
		boolean pass = false;
		List<String> codes =  accessModel(request);
		for(String c : codes){
			if(c.equals(modelCode)){
				pass = true;
			}
		}
		return pass;
	}

}
