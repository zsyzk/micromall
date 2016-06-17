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
 * RCSfile: 权限模块类
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
public class PermissionModel {
	/**
	 * id
	 */
	private int perModelId;
	/**
	 * 权限id
	 */
	private int perId;
	/**
	 * 权限模块code
	 */
	private String perModelCode;
	public int getPerModelId() {
		return perModelId;
	}
	public void setPerModelId(int perModelId) {
		this.perModelId = perModelId;
	}
	public int getPerId() {
		return perId;
	}
	public void setPerId(int perId) {
		this.perId = perId;
	}
	public String getPerModelCode() {
		return perModelCode;
	}
	public void setPerModelCode(String perModelCode) {
		this.perModelCode = perModelCode;
	}
	
}
