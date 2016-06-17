package micromall.manager.dao;

import java.util.List;

import micromall.manager.constant.EDBDataStatus;
import micromall.util.PageResult;
import micromall.manager.vo.PageVO;
/**
 * 
 * @ClassName:     IBaseDao.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:06:10
 */
@SuppressWarnings("rawtypes")
public interface IBaseDao<VO> {

	// About save template methods---------------------------------------
	boolean save(VO vo);

	String saveTwo(VO vo);

	boolean saveOrUpdate(VO vo);

	// About delete template methods--------------------------------------
	void deleteObject(VO vo);

	boolean delete(String id);

	// About update template methods--------------------------------------
	void update(VO vo);

	void merge(VO vo);

	// About select template methods--------------------------------------
	int count(int state, String c);

	int count(int state, Class c);

	int count(int state, Class c, String condition);

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark: 不取泛型值，采用传入实体名
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	int count(int state, String entityName, String condition) throws Exception;

	VO select(String id);

	List<VO> selectAll();

	/* PageResult selectForPage(int pageNum, int pageSize); */

	boolean isExist(String id);

	PageResult selectForPageHQL(int pageNum, int pageSize, String condition);

	PageResult selectForPageSQL(int pageNum, int pageSize, String selectSql,
			String countSql, String condition, Class fromClass);

	List<VO> getAllByPage(String c, PageVO vo, String where, String sortField,
			int status) throws Exception;

	List<VO> selectAllByClassName(String c, String where, int status);

	List<VO> getAll(Class clas, PageVO vo, String sortField,
			EDBDataStatus status, String condition) throws Exception;

	String saveBackId(VO vo);
	
	PageVO selPageData(PageVO pageVO) throws Exception;

}
