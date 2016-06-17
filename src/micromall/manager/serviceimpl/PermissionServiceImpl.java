package micromall.manager.serviceimpl;

import javax.annotation.Resource;

import micromall.manager.constant.CClass;
import micromall.manager.dao.IPermissionDao;
import micromall.manager.servcie.IPermissionService;
import micromall.manager.vo.Permission;
/**
 * 
 * @ClassName:     PermissionServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:48
 */
public class PermissionServiceImpl extends BaseServiceImpl<Permission> implements IPermissionService {

	@Resource(name = CClass.PermissionDaoImpl)
	private IPermissionDao permissionDaoImpl;

	public IPermissionDao getPermissionDaoImpl() {
		return permissionDaoImpl;
	}

	public void setPermissionDaoImpl(IPermissionDao permissionDaoImpl) {
		this.permissionDaoImpl = permissionDaoImpl;
	}
	@Override
	public Permission getPermissionByUserTypeId(int id){
		return permissionDaoImpl.getPermissionByUserTypeId(id);
	}
}
