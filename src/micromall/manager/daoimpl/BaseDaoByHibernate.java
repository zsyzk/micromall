package micromall.manager.daoimpl;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.ParameterizedType;
import java.net.URLDecoder;
import java.util.List;

import org.apache.log4j.Logger;
import org.hibernate.Session;
import org.hibernate.SessionFactory;

import micromall.manager.constant.EDBDataStatus;
import micromall.manager.dao.IBaseDao;
import micromall.util.AssertUtil;
import micromall.util.ForPage;
import micromall.util.ForPageUtil;
import micromall.util.PageResult;
import micromall.manager.vo.PageVO;
/**
 * 
 * @ClassName:     BaseDaoByHibernate.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:07:30
 */
@SuppressWarnings(value = { "unchecked", "rawtypes" })
public class BaseDaoByHibernate<VO> implements IBaseDao<VO> {

	private Logger LOGGER = Logger.getLogger(BaseDaoByHibernate.class);

	private SessionFactory sessionFactory;

	public SessionFactory getSessionFactory() {
		return sessionFactory;
	}

	public void setSessionFactory(SessionFactory sessionFactory) {
		this.sessionFactory = sessionFactory;
	}

	public Session getSession() {
		// 事务必须是开启的(Required)，否则获取不到
		// 当方法不需要事务支持的时候，使用 Session session =
		// sessionFactory.openSession()来获得Session对象
		return sessionFactory.getCurrentSession();
	}

	private String getEntityClass() {
		Object objTemp = getClass().getGenericSuperclass();
		if (null == objTemp) {
			return null;
		}
		if (objTemp instanceof ParameterizedType) {
			ParameterizedType parameterizedType = (ParameterizedType) objTemp;

			Object[] objs = parameterizedType.getActualTypeArguments();
			if (null == objs || objs.length < 1) {
				return null;
			}
			String tempName = objs[0].toString();
			return tempName.substring(tempName.lastIndexOf(".") + 1,
					tempName.length());
		}
		return null;
	}

	protected boolean sessionEmpty() {
		if (null == getSession()) {
			LOGGER.error("Error: Session of Hibernate4 is null!!!");
			return false;
		}
		return true;
	}

	@Override
	public String saveBackId(VO vo) {
		try {
			if (!sessionEmpty()) {
				return "";
			}
			String saveId = getSession().save(vo).toString();
			return saveId;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return "";
	}

	@Override
	public boolean save(VO vo) {
		try {
			if (!sessionEmpty()) {
				return false;
			}
			String saveId = getSession().save(vo).toString();
			return AssertUtil.isNotNull(saveId);
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}

	@Override
	public String saveTwo(VO vo) {
		try {
			if (!sessionEmpty()) {
				return null;
			}
			return getSession().save(vo).toString();
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	@Override
	public boolean saveOrUpdate(VO vo) {
		if (!sessionEmpty()) {
			return false;
		}
		getSession().saveOrUpdate(vo);
		return true;
	}

	@Override
	public void deleteObject(VO vo) {
		if (!sessionEmpty()) {
			return;
		}

		getSession().delete(vo);
	}

	@Override
	public boolean delete(String id) {
		boolean flag = false;
		if (!sessionEmpty()) {
			return flag;
		}
		String hql = "DELETE " + getEntityClass() + " WHERE id='" + id + "'";
		int temp = getSession().createQuery(hql).executeUpdate();
		if (temp > 0) {
			flag = true;
		}
		return flag;
	}

	@Override
	public void update(VO vo) {
		if (!sessionEmpty()) {
			return;
		}
		getSession().update(vo);
	}

	@Override
	public void merge(VO vo) {
		if (!sessionEmpty()) {
			return;
		}
		getSession().merge(vo);
	}

	@Override
	public int count(int state, String c) {
		if (!sessionEmpty()) {
			return -1;
		}

		StringBuilder hql = new StringBuilder("SELECT COUNT(T) FROM " + c
				+ " T ");

		if (state != -1) {
			hql.append(" WHERE T.status = " + state);
		}
		return Integer.parseInt(getSession().createQuery(hql.toString())
				.uniqueResult() + "");
	}

	@Override
	public VO select(String id) {
		if (!sessionEmpty()) {
			return null;
		}
		String hql = " FROM  " + getEntityClass() + " T WHERE T.id='" + id
				+ "'";
		Object result = getSession().createQuery(hql).uniqueResult();

		return (AssertUtil.isNull(result) ? null : (VO) result);
	}

	@Override
	public List<VO> selectAll() {
		if (!sessionEmpty()) {
			return null;
		}
		System.out.println(getClass());
		String hql = "FROM " + getEntityClass();
		return getSession().createQuery(hql).list();
	}

	/*
	 * @Override public PageResult selectForPage(int pageNum, int pageSize) { if
	 * (!sessionEmpty()) { return null; } return null; }
	 */

	@Override
	public PageResult selectForPageHQL(int pageNum, int pageSize,
			String condition) {
		if (!sessionEmpty()) {
			return null;
		}
		String selectSql = "FROM " + getEntityClass();
		String countSql = "SELECT COUNT(*) FROM " + getEntityClass();
		ForPage page = ForPageUtil.getForPage(null, pageNum, pageSize,
				selectSql, countSql, condition, getSession());
		return ForPageUtil.hqlForPage(page);
	}

	@Override
	public PageResult selectForPageSQL(int pageNum, int pageSize,
			String selectSql, String countSql, String condition, Class fromClass) {
		if (!sessionEmpty()) {
			return null;
		}
		ForPage page = ForPageUtil.getForPage(fromClass, pageNum, pageSize,
				selectSql, countSql, condition, getSession());
		return ForPageUtil.sqlForPage(page);
	}

	@Override
	public boolean isExist(String id) {
		if (!sessionEmpty()) {
			return false;
		}

		VO result = select(id);
		return AssertUtil.isNull(result) ? false : true;
	}

	@Override
	public List<VO> getAllByPage(String c, PageVO vo, String where,
			String sortField, int status) throws Exception {

		StringBuilder hql = new StringBuilder("FROM " + c + " WHERE 1=1 ");

		if (AssertUtil.isNotNull(where)) {
			hql.append(" AND " + where);
		}

		if (status != -1) {
			hql.append(" AND status" + status);
		}

		if (AssertUtil.isNotNull(sortField)) {
			hql.append(" ORDER BY " + sortField + " DESC ");
		}
		return getSession().createQuery(hql.toString())
				.setFirstResult((vo.getPage() - 1) * vo.getPageSize())
				.setMaxResults(vo.getPageSize()).list();
	}

	@Override
	public List<VO> selectAllByClassName(String c, String where, int status) {
		if (!sessionEmpty()) {
			return null;
		}
		StringBuilder hql = new StringBuilder(" SELECT T FROM " + c
				+ " T WHERE 1=1 ");

		if (AssertUtil.isNotNull(where)) {
			hql.append(where);
		}
		if (status != -1) {
			hql.append(" AND T.status" + status);
		}
		return getSession().createQuery(hql.toString()).list();
	}

	@Override
	public int count(int status, Class c) {
		if (!sessionEmpty()) {
			return -1;
		}

		StringBuilder hql = new StringBuilder("SELECT COUNT(*) FROM "
				+ c.getSimpleName() + " WHERE 1=1 ");

		if (status != -1) {
			hql.append(" AND status = " + status);
		}
		return Integer.parseInt(getSession().createQuery(hql.toString())
				.uniqueResult() + "");
	}

	@Override
	public int count(int state, Class c, String condition) {
		if (!sessionEmpty()) {
			return -1;
		}

		StringBuilder hql = new StringBuilder("SELECT COUNT(*) FROM "
				+ c.getSimpleName() + " WHERE 1=1 ");

		if (AssertUtil.isNotNull(condition)) {
			try {
				condition = URLDecoder.decode(condition, "utf-8");
				hql.append(" AND " + condition);
			} catch (UnsupportedEncodingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}

		if (state != -1) {
			hql.append(" AND status = " + state);
		}
		return Integer.parseInt(getSession().createQuery(hql.toString())
				.uniqueResult() + "");
	}

	@Override
	public List<VO> getAll(Class clas, PageVO vo, String sortField,
			EDBDataStatus status, String condition) throws Exception {

		StringBuilder hql = new StringBuilder(" FROM " + clas.getSimpleName()
				+ "  WHERE 1=1 ");

		if (AssertUtil.isNotNull(condition)) {
			condition = URLDecoder.decode(condition, "utf-8");
			hql.append(" AND " + condition);
		}

		if (status.getValue() != EDBDataStatus.NO.getValue()) {
			hql.append(" AND status = " + status.getValue());
		}

		if (AssertUtil.isNotNull(sortField)) {
			hql.append(" ORDER BY " + sortField + " DESC ");
		}

		return getSession().createQuery(hql.toString())
				.setFirstResult((vo.getPage() - 1) * vo.getPageSize())
				.setMaxResults(vo.getPageSize()).list();
	}

	@Override
	public int count(int state, String entityName, String condition)
			throws Exception {
		if (!sessionEmpty()) {
			return -1;
		}

		StringBuilder hql = new StringBuilder("SELECT COUNT(*) FROM "
				+ entityName);

		hql.append(" WHERE 1=1 ");

		if (AssertUtil.isNotNull(condition)) {
			hql.append(" AND " + condition);
		}

		if (AssertUtil.isNotNull(state)) {
			if (state == EDBDataStatus.OTHER.getValue()) {
				hql.append(" AND status != " + EDBDataStatus.DELETE.getValue());
			}else if(state == EDBDataStatus.DISPLAY_ALL.getValue()) {
				hql.append(" AND status != " + EDBDataStatus.DISPLAY_ALL.getValue());
			}else {
				hql.append(" AND status = " + state);
			}
		}

		return Integer.parseInt(getSession().createQuery(hql.toString())
				.uniqueResult() + "");

	}

	@Override
	public PageVO selPageData(PageVO pageVO) throws Exception {

		if (!sessionEmpty() || AssertUtil.isNull(pageVO)
				|| AssertUtil.isNull(pageVO.getEntityName())) {
			return pageVO;
		}

		StringBuilder hql = new StringBuilder(" FROM " + pageVO.getEntityName());

		hql.append(" WHERE 1=1 ");

		if (AssertUtil.isNotNull(pageVO.getCondition())) {
			hql.append(" AND " + pageVO.getCondition());
		}

		if (AssertUtil.isNotNull(pageVO.getStatus())) {
			if (pageVO.getStatus() == EDBDataStatus.OTHER.getValue()) {
				hql.append(" AND status != " + EDBDataStatus.DELETE.getValue());
			}else if(pageVO.getStatus() == EDBDataStatus.DISPLAY_ALL.getValue()) {
				hql.append(" AND status != " + EDBDataStatus.DISPLAY_ALL.getValue());
			}else {
				hql.append(" AND status = " + pageVO.getStatus());
			}
		}

		if (AssertUtil.isNotNull(pageVO.getSortField())) {
			hql.append(" ORDER BY " + pageVO.getSortField() + " DESC ");
		}

		// 设置查询结果到数据载体
		pageVO.setPageData(getSession().createQuery(hql.toString())
				.setFirstResult((pageVO.getPage() - 1) * pageVO.getPageSize())
				.setMaxResults(pageVO.getPageSize()).list());

		return pageVO;
	}

}
