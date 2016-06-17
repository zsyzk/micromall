package micromall.manager.vo;

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
 * RCSfile: 权限类
 * 
 * Revision: 1.0
 * 
 * Date: 2014年12月24日
 * 
 * Author: dang.yin(Seven)
 * 
 * Log:
 * 
 * 
 */
public class Permission {
	private int perId ;
	private int userTypeId;
	
	public int getPerId() {
		return perId;
	}
	public void setPerId(int perId) {
		this.perId = perId;
	}
	public int getUserTypeId() {
		return userTypeId;
	}
	public void setUserTypeId(int userTypeId) {
		this.userTypeId = userTypeId;
	}
}
