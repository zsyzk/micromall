/**
 * 
 */
package micromall.manager.vo;

import java.io.Serializable;

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
 * RCSfile: 用户类型
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
public class UserType implements Serializable{
	
	private static final long serialVersionUID = 5438063187542446735L;
	private int userTypeId;
	private String typeName;
	private String typeMs;
	private int status;
	
	public int getUserTypeId() {
		return userTypeId;
	}

	public void setUserTypeId(int userTypeId) {
		this.userTypeId = userTypeId;
	}

	public String getTypeName() {
		return typeName;
	}

	public void setTypeName(String typeName) {
		this.typeName = typeName;
	}

	public String getTypeMs() {
		return typeMs;
	}

	public void setTypeMs(String typeMs) {
		this.typeMs = typeMs;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

}
