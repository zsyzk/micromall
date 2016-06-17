package micromall.util;

import org.hibernate.Session;
/**
 * 
 * @ClassName:     ForPage.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:17:27
 */
@SuppressWarnings(value = { "rawtypes" })
public class ForPage {
	private int pageNo;
	private int pageSize;
	private String selectSql;
	private String countSql;
	private Class fromClass;
	private Session currentSession;

	public String getSelectSql() {
		return selectSql;
	}

	public void setSelectSql(String selectSql) {
		this.selectSql = selectSql;
	}

	public String getCountSql() {
		return countSql;
	}

	public void setCountSql(String countSql) {
		this.countSql = countSql;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public Class getFromClass() {
		return fromClass;
	}

	public void setFromClass(Class fromClass) {
		this.fromClass = fromClass;
	}

	public Session getCurrentSession() {
		return currentSession;
	}

	public void setCurrentSession(Session currentSession) {
		this.currentSession = currentSession;
	}

}
