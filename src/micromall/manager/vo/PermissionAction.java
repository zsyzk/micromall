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
 * RCSfile: 权限模块菜单动作类
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
public class PermissionAction {
	/**
	 * 权限动作id
	 */
	private int perActionId;
	/**
	 * 权限菜单code
	 */
	private String perMenuCode;
	/**
	 * 权限id
	 */
	private int perId;
	/**
	 * 权限动作代码
	 */
	private String perActionCode;
	public int getPerActionId() {
		return perActionId;
	}
	public void setPerActionId(int perActionId) {
		this.perActionId = perActionId;
	}
	public int getPerId() {
		return perId;
	}
	public void setPerId(int perId) {
		this.perId = perId;
	}
	public String getPerActionCode() {
		return perActionCode;
	}
	public void setPerActionCode(String perActionCode) {
		this.perActionCode = perActionCode;
	}
	public String getPerMenuCode() {
		return perMenuCode;
	}
	public void setPerMenuCode(String perMenuCode) {
		this.perMenuCode = perMenuCode;
	}
	       
}
