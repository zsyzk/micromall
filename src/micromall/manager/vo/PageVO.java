/**
 * 
 */
package micromall.manager.vo;

import java.util.List;

/**
 * 
 * 
 * 
 * 深圳市正德聚力科技有限公司软件版权申明
 * 
 * 
 * 
 * 深圳市正德聚力科技有限公司版权所有 2014
 * 
 * 未经深圳市正德聚力科技有限公司许可，任何个人和组织不得以任何形式非法复制或传播本程序的
 * 
 * 任何部分。违者将追究其法律责任。
 * 
 * 
 * 
 * RCSfile: 说明
 * 
 * Revision: 1.0
 * 
 * Date: 2014年12月15日
 * 
 * Author: dang.yin(Seven)
 * 
 * Log:
 * 
 * 
 */
@SuppressWarnings("rawtypes")
public class PageVO {

	public PageVO() {

	}

	public PageVO(int pageSize, int page) {
		super();
		this.pageSize = pageSize;
		this.page = page;
	}

	/**
	 * 每页数量
	 */
	private int pageSize;
	/**
	 * 当前页
	 */
	private int page;

	/**
	 * 总页数
	 */
	private int sumPage;

	/**
	 * 控件显示多少页（针对分页控件）
	 */
	private int dispayNum;

	/**
	 * 查询条件
	 */
	private String condition;

	/**
	 * 分页数据值
	 */
	private List pageData;

	/**
	 * 实体名称
	 */
	private String entityName;

	/**
	 * 状态码
	 */
	private int status;

	/**
	 * 排序字段
	 */
	private String sortField;

	public String getSortField() {
		return sortField;
	}

	public void setSortField(String sortField) {
		this.sortField = sortField;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getEntityName() {
		return entityName;
	}

	public void setEntityName(String entityName) {
		this.entityName = entityName;
	}

	public String getCondition() {
		return condition;
	}

	public void setCondition(String condition) {
		this.condition = condition;
	}

	public List getPageData() {
		return pageData;
	}

	public void setPageData(List pageData) {
		this.pageData = pageData;
	}

	public int getDispayNum() {
		return dispayNum;
	}

	public void setDispayNum(int dispayNum) {
		this.dispayNum = dispayNum;
	}

	public int getSumPage() {
		return sumPage;
	}

	public void setSumPage(int sumPage) {
		this.sumPage = sumPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getPage() {
		return page;
	}

	public void setPage(int page) {
		this.page = page;
	}
}
