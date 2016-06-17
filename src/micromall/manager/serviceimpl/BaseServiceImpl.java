/**
 * 
 */
package micromall.manager.serviceimpl;

import java.util.List;

import javax.annotation.Resource;

import micromall.manager.constant.CClass;
import micromall.manager.constant.EDBDataStatus;
import micromall.manager.dao.IBaseDao;
import micromall.manager.servcie.IBaseService;
import micromall.manager.vo.PageVO;
/**
 * 
 * @ClassName:     BaseServiceImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:14:22
 */
@SuppressWarnings("rawtypes")
public class BaseServiceImpl<VO> implements IBaseService<VO> {

	@Resource(name = CClass.BaseDaoByHibernate)
	private IBaseDao<VO> baseDao;

	public IBaseDao<VO> getBaseDao() {
		return baseDao;
	}

	@Override
	public List<VO> getAllByPage(String c, PageVO vo, String where,
			String sortField, int status) {
		try {
			return getBaseDao().getAllByPage(c, vo, where, sortField, status);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int getCount(EDBDataStatus status, String c) {
		return getBaseDao().count(status.getValue(), c);
	}

	@Override
	public int getCount(EDBDataStatus status, Class c) {
		return getBaseDao().count(status.getValue(), c);
	}

	@Override
	public List<VO> getAll(String c, String where, int status) {
		return baseDao.selectAllByClassName(c, where, status);
	}

	@Override
	public int getCount(EDBDataStatus status, Class c, String condition) {
		return getBaseDao().count(status.getValue(), c, condition);
	}

	@Override
	public List<VO> getAll(Class clas, PageVO vo, String sortField,
			EDBDataStatus status, String condition) {
		try {
			return getBaseDao().getAll(clas, vo, sortField, status, condition);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public int count(int state, String entityName, String condition) {
		try {
			return getBaseDao().count(state, entityName, condition);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	@Override
	public PageVO selPageData(PageVO pageVO) {
		try {
			return getBaseDao().selPageData(pageVO);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

}
