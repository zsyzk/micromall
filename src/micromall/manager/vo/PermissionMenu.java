package micromall.manager.vo;
/**
 * 
 * @ClassName:     PermissionMenu.java
 * @Description:   权限模块菜单类
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 下午2:42:02
 */
public class PermissionMenu {
	/**
	 * 权限菜单id
	 */
	private int perMenuId;
	/**
	 * 权限模块id
	 */
	private String perModelCode;
	/**
	 * 权限id
	 */
	private int perId;
	
	/**
	 * 权限菜单代码
	 */
	private String perMenuCode;
	public int getPerMenuId() {
		return perMenuId;
	}
	public void setPerMenuId(int perMenuId) {
		this.perMenuId = perMenuId;
	}
	public int getPerId() {
		return perId;
	}
	public void setPerId(int perId) {
		this.perId = perId;
	}
	public String getPerMenuCode() {
		return perMenuCode;
	}
	public void setPerMenuCode(String perMenuCode) {
		this.perMenuCode = perMenuCode;
	}
	public String getPerModelCode() {
		return perModelCode;
	}
	public void setPerModelCode(String perModelCode) {
		this.perModelCode = perModelCode;
	}
	
}
