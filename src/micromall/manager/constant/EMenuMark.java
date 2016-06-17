/**      
* CCharacter.java Create on 2016-6-13     
*      
* Copyright (c) 2016-6-13 by zsyzk      
*      
* @author zhangsy     
* @version 1.0 
*     
*/ 
package micromall.manager.constant;

/**
 * 
 * @ClassName:     EMenuMark.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:57:56
 */
public enum EMenuMark {
	
	USER(2, "User",CSpringURL.JSP_USER, "userId", EDBDataStatus.ACTIVITY.getValue()), 	
	USER_TYPE(31,"UserType", CSpringURL.JSP_USER_TYPE,"userTypeId",EDBDataStatus.ACTIVITY.getValue()), 
	SYSTEM_CONFIG(32,"SystemConfig", CSpringURL.JSP_SYSTEM_CONFIG), 
		ERROR(34, "Error", null);

	private int value;
	private int status;
	private String className;
	private String path;
	private String sortName;

	public int getStatus() {
		return status;
	}

	public void setStatus(int status) {
		this.status = status;
	}

	public String getSortName() {
		return sortName;
	}

	public void setSortName(String sortName) {
		this.sortName = sortName;
	}

	public int getValue() {
		return value;
	}

	public void setValue(int value) {
		this.value = value;

	}

	private EMenuMark(int value) {
		this.value = value;
	}

	private EMenuMark(int value, String className) {
		this.value = value;
		this.className = className;
	}

	private EMenuMark(int value, String className, String path) {
		this.value = value;
		this.className = className;
		this.setPath(path);
	}

	private EMenuMark(int value, String className, String path, String sortName) {
		this.value = value;
		this.className = className;
		this.sortName = sortName;
		this.setPath(path);
	}

	private EMenuMark(int value, String className, String path,
			String sortName, int status) {
		this.value = value;
		this.className = className;
		this.sortName = sortName;
		this.setPath(path);
		this.setStatus(status);
	}

	public String getClassName() {
		return className;
	}

	public void setClassName(String className) {
		this.className = className;
	}

	public static String getClassNameByValue(int value) {
		for (EMenuMark m : values()) {
			if (m.getValue() == value) {
				return m.getClassName();
			}
		}
		return null;
	}

	public static String getPathByValue(int value) {
		for (EMenuMark m : values()) {
			if (m.getValue() == value) {
				return m.getPath();
			}
		}
		return null;
	}

	public static String getSortNameByValue(int value) {
		for (EMenuMark m : values()) {
			if (m.getValue() == value) {
				return m.getSortName();
			}
		}
		return null;
	}

	public static int getStautsByValue(int value) {
		for (EMenuMark m : values()) {
			if (m.getValue() == value) {
				return m.getStatus();
			}
		}
		return -1;
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

}
