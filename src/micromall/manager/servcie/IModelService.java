package micromall.manager.servcie;

import java.util.List;

import micromall.manager.vo.Model;

/**
 * 
 * @ClassName:     IModelService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:14
 */
public interface IModelService{
	List<Model> getAll();
	
	List<Model> getPerAll(List<String> codes);
}
