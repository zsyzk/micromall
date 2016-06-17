/**
 * 
 */
package micromall.manager.vo;

import java.io.Serializable;

import com.alibaba.fastjson.JSON;

import micromall.util.JsonUtil;
/**
 * 
 * @ClassName:     User.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午11:51:49
 */
public class User implements Serializable {

	/**
	 * 
	 */
	private static final long serialVersionUID = -3051231310045144286L;

	private int userId;

	private String username;

	private String password;

	private int status;

	private Integer userTypeId;

	private String userTypeName;

	public int getUserId() {
		return userId;
	}

	public void setUserId(int userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public Integer getUserTypeId() {
		return userTypeId;
	}

	public void setUserTypeId(Integer userTypeId) {
		this.userTypeId = userTypeId;
	}

	public String getUserTypeName() {
		return userTypeName;
	}

	public void setUserTypeName(String userTypeName) {
		this.userTypeName = userTypeName;
	}

	public String toJsonString() {
		return JSON.toJSONString(this);
	}

	public String toJsonFilterString() {
		return JSON.toJSONString(this);
	}

	public void parse(String jsonString) {

		if (new JsonUtil().validate(jsonString)) {
			try {
				User temp = JSON.parseObject(jsonString, this.getClass());
				this.setPassword(temp.getPassword());
				this.setStatus(temp.getStatus());
				this.setUserId(temp.getUserId());
				this.setUsername(temp.getUsername());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}

	}

}
