package micromall.manager.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import micromall.manager.constant.CClass;
import micromall.manager.dao.IModelDAO;
import micromall.manager.servcie.IModelService;
import micromall.util.AssertUtil;
import micromall.manager.vo.Model;

/**
 * 
 * @ClassName:     ModelServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:31
 */
public class ModelServiceImpl implements IModelService {

	@Resource(name = CClass.ModelDAOImpl)
	private IModelDAO modelDAO;

	public IModelDAO getModelDAO() {
		return modelDAO;
	}

	@Override
	public List<Model> getAll() {
		return getModelDAO().getAll();
	}

	@Override
	public List<Model> getPerAll(List<String> ids) {
		// TODO Auto-generated method stub
		if(AssertUtil.isNull(ids)){
			return null;
		}
		return getModelDAO().getPerAll(ids);
	}
}
