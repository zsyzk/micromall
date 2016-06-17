package micromall.manager.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import micromall.manager.constant.CClass;
import micromall.manager.dao.IPermissionMenuDao;
import micromall.manager.servcie.IPermissionMenuService;
import micromall.manager.vo.PermissionMenu;
/**
 * 
 * @ClassName:     PermissionMenuServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:39
 */
public class PermissionMenuServiceImpl extends BaseServiceImpl<PermissionMenu> implements IPermissionMenuService {
	@Resource(name = CClass.PermissionMenuDaoImpl)
	private IPermissionMenuDao permissionMenuDaoImpl;

	public IPermissionMenuDao getPermissionMenuDaoImpl() {
		return permissionMenuDaoImpl;
	}

	public void setPermissionMenuDaoImpl(IPermissionMenuDao permissionMenuDaoImpl) {
		this.permissionMenuDaoImpl = permissionMenuDaoImpl;
	}

	@Override
	public List<String> getPerMenuCodeByPerIdAndModelCode(int perId,
			String modelCode) {
		// TODO Auto-generated method stub
		return permissionMenuDaoImpl.getPerMenuCodeByPerIdAndModelCode(perId, modelCode);
	}
}
