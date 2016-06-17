/**
 * 
 */
package micromall.manager.vo;

import java.io.Serializable;

/**
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
 * RCSfile: 数据库配置数据载体
 * 
 * Revision: 1.0
 * 
 * Date: 2014年10月15日
 * 
 * Author: dang.yin(Seven)
 * 
 * Log:
 * 
 * 
 */
public class DatabaseConfig implements Serializable {
	/**
	 * 
	 */
	private static final long serialVersionUID = -5491316330837244475L;
	
	
	private String sqlServerDriver;
	private String sqlServerUrl;
	private String sqlServerUser;
	private String sqlServerPassword;

	// private String mySqlDriver;
	// private String mySqlUrl;
	// private String mySqlUser;
	// private String mySqlPassword;

	public String getSqlServerDriver() {
		return sqlServerDriver;
	}

	public void setSqlServerDriver(String sqlServerDriver) {
		this.sqlServerDriver = sqlServerDriver;
	}

	public String getSqlServerUrl() {
		return sqlServerUrl;
	}

	public void setSqlServerUrl(String sqlServerUrl) {
		this.sqlServerUrl = sqlServerUrl;
	}

	public String getSqlServerUser() {
		return sqlServerUser;
	}

	public void setSqlServerUser(String sqlServerUser) {
		this.sqlServerUser = sqlServerUser;
	}

	public String getSqlServerPassword() {
		return sqlServerPassword;
	}

	public void setSqlServerPassword(String sqlServerPassword) {
		this.sqlServerPassword = sqlServerPassword;
	}

	// public String getMySqlDriver() {
	// return mySqlDriver;
	// }
	//
	// public void setMySqlDriver(String mySqlDriver) {
	// this.mySqlDriver = mySqlDriver;
	// }
	//
	// public String getMySqlUrl() {
	// return mySqlUrl;
	// }
	//
	// public void setMySqlUrl(String mySqlUrl) {
	// this.mySqlUrl = mySqlUrl;
	// }
	//
	// public String getMySqlUser() {
	// return mySqlUser;
	// }
	//
	// public void setMySqlUser(String mySqlUser) {
	// this.mySqlUser = mySqlUser;
	// }
	//
	// public String getMySqlPassword() {
	// return mySqlPassword;
	// }
	//
	// public void setMySqlPassword(String mySqlPassword) {
	// this.mySqlPassword = mySqlPassword;
	// }

}
