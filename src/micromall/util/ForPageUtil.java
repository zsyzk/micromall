package micromall.util;

import java.math.BigInteger;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.transform.Transformers;

import com.alibaba.fastjson.JSONObject;
/**
 * 
 * @ClassName:     ForPageUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:17:33
 */
@SuppressWarnings(value = { "unchecked", "rawtypes" })
public class ForPageUtil {
	// hql查询
	public static PageResult hqlForPage(ForPage forPage) {
		// 得到结果集
		List<Object> data = getHqlData(forPage);
		// 得到结果数量
		int count = getHqlDataCount(forPage);
		PageResult pageResult = new PageResult();
		pageResult.setData(data);
		pageResult.setCount(count);
		return pageResult;
	}

	/**
	 * 获取数据
	 * 
	 * 
	 * @param forPage
	 * @return
	 */
	private static List<Object> getHqlData(ForPage forPage) {
		Query query = forPage.getCurrentSession().createQuery(
				forPage.getSelectSql());
		if (AssertUtil.isNotNull(forPage.getPageNo())
				&& AssertUtil.isNotNull(forPage.getPageSize())) {
			query.setFirstResult((forPage.getPageNo() - 1)
					* forPage.getPageSize());
			query.setMaxResults(forPage.getPageSize());
		}

		List<Object> data = query.list();
		return data;
	}

	private static int getHqlDataCount(ForPage forPage) {
		long count = (Long) forPage.getCurrentSession()
				.createQuery(forPage.getCountSql()).uniqueResult();
		return (int) count;
	}

	// sql查询
	public static PageResult sqlForPage(ForPage forPage) {
		// 得到结果集
		List<Object> data = getSqlData(forPage);
		// 得到结果数量
		int count = getSqlDataCount(forPage);
		PageResult pageResult = new PageResult();
		pageResult.setData(data);
		pageResult.setCount(count);
		return pageResult;
	}

	/**
	 * 获取数据
	 * 
	 * 
	 * @param forPage
	 * @return
	 */
	private static List<Object> getSqlData(ForPage forPage) {
		SQLQuery query = forPage.getCurrentSession().createSQLQuery(
				forPage.getSelectSql());
		query.setResultTransformer(Transformers.ALIAS_TO_ENTITY_MAP);
		if (AssertUtil.isNotNull(forPage.getPageNo())
				&& AssertUtil.isNotNull(forPage.getPageSize())) {
			query.setFirstResult((forPage.getPageNo() - 1)
					* forPage.getPageSize());
			query.setMaxResults(forPage.getPageSize());
		}
		if (AssertUtil.isNotNull(forPage.getFromClass())) {
			query.addEntity(forPage.getFromClass());
		}
		List<Object> data = query.list();
		return data;
	}

	private static int getSqlDataCount(ForPage forPage) {
		BigInteger count = (BigInteger) forPage.getCurrentSession()
				.createSQLQuery(forPage.getCountSql()).uniqueResult();
		return count.intValue();
	}

	/**
	 * 拼凑sql的搜索查询
	 */
	public static String productSearchString(JSONObject json) {
		StringBuffer sql = new StringBuffer("");
		sql.append(" where 1=1");
		for (String key : json.keySet()) {
			if (AssertUtil.isNotNull(json.getString(key))) {
				sql.append(" and " + key + " = '" + json.getString(key) + "'");
			}
		}
		return sql.toString();
	}

	public static ForPage getForPage(Class fromClass, int pageNo, int pageSize,
			String selectSql, String countSql, String condition,
			Session currentSession) {
		ForPage page = new ForPage();
		if (AssertUtil.isNotNull(fromClass)) {
			page.setFromClass(fromClass);
		}
		if (AssertUtil.isNotNull(pageNo) && AssertUtil.isNotNull(pageSize)) {
			page.setPageNo(pageNo);
			page.setPageSize(pageSize);
		}
		page.setSelectSql(selectSql + condition);
		page.setCountSql(countSql + condition);
		page.setCurrentSession(currentSession);
		return page;
	}
}
