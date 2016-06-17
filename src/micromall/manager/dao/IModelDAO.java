package micromall.manager.dao;

import java.util.List;

import micromall.manager.vo.Model;
/**
 * 
 * @ClassName:     IModelDAO.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:06:25
 */
public interface IModelDAO extends IBaseDao<Model> {
	List<Model> getAll();
	List<Model> getPerAll(List<String> codes);
}
