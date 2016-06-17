/**
 * 
 */
package micromall.manager.servcie;

import java.util.List;

import micromall.manager.constant.EDBDataStatus;
import micromall.manager.vo.PageVO;
/**
 * 
 * @ClassName:     IBaseService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:03
 */
@SuppressWarnings("rawtypes")
public interface IBaseService<VO> {

	List<VO> getAllByPage(String c, PageVO vo, String where, String sortField,
			int status);

	List<VO> getAll(Class clas, PageVO vo, String sortField,EDBDataStatus status,String condition);
	
	PageVO selPageData(PageVO pageVO);

	int getCount(EDBDataStatus status, String c);

	int getCount(EDBDataStatus status, Class c);
	
	int getCount(EDBDataStatus status, Class c,String condition);
	
	int count(int state, String entityName, String condition);

	List<VO> getAll(String c, String where, int status);
}
