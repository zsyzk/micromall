package micromall.manager.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import micromall.manager.constant.CClass;
import micromall.manager.dao.IPermissionActionDao;
import micromall.manager.servcie.IPermissionActionService;
import micromall.manager.vo.PermissionAction;
/**
 * 
 * @ClassName:     PermissionActionServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:35
 */
public class PermissionActionServiceImpl extends BaseServiceImpl<PermissionAction> implements IPermissionActionService {

	@Resource(name = CClass.PermissionActionDaoImpl)
	private IPermissionActionDao permissionActionDaoImpl;

	public IPermissionActionDao getPermissionActionDaoImpl() {
		return permissionActionDaoImpl;
	}

	public void setPermissionActionDaoImpl(IPermissionActionDao permissionActionDaoImpl) {
		this.permissionActionDaoImpl = permissionActionDaoImpl;
	}

	@Override
	public List<String> getPerActionCodeByPerIdAndMenuCode(int perId,
			String menuCode) {
		// TODO Auto-generated method stub
		return permissionActionDaoImpl.getPerActionCodeByPerIdAndMenuCode(perId,menuCode);
	}
}
