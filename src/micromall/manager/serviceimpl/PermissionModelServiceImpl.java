package micromall.manager.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import micromall.manager.constant.CClass;
import micromall.manager.dao.IPermissionModelDao;
import micromall.manager.servcie.IPermissionModelService;
import micromall.manager.vo.PermissionModel;
/**
 * 
 * @ClassName:     PermissionModelServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:43
 */
public class PermissionModelServiceImpl extends BaseServiceImpl<PermissionModel> implements IPermissionModelService {

	@Resource(name = CClass.PermissionModelDaoImpl)
	private IPermissionModelDao permissionModelDaoImpl;

	public IPermissionModelDao getPermissionModelDaoImpl() {
		return permissionModelDaoImpl;
	}

	public void setPermissionModelDaoImpl(IPermissionModelDao permissionModelDaoImpl) {
		this.permissionModelDaoImpl = permissionModelDaoImpl;
	}
	
	@Override
	public List<PermissionModel> getPerModelByPerId(int perId){
		return permissionModelDaoImpl.getPerModelByPerId(perId);
	}

	@Override
	public List<String> getPerModelCodeByPerId(int perId) {
		return permissionModelDaoImpl.getPerModelCodeByPerId(perId);
	}
}
