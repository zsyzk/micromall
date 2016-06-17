package micromall.manager.vo;

import java.util.HashSet;
import java.util.Set;

/**
 * 
 * @ClassName:     Model.java
 * @Description:   模块VO
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 下午2:31:21
 */
public class Model {

	private int id;
	/**
	 * 模块名称
	 */
	private String fname;
	/**
	 * 模块是否显示，0：表示不显示; 1：表示显示
	 */
	private int fstatus;
	/**
	 * 模块关联的图片地址
	 */
	private String furl;
	
	/**
	 * 权限代码
	 */
	private String perCode;

	/**
	 * 模块关联的菜单
	 */
	private Set<Menu> fmenu = new HashSet<Menu>();

	/**
	 * 描述
	 */
	private String fdescribe;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public Set<Menu> getFmenu() {
		return fmenu;
	}

	public void setFmenu(Set<Menu> fmenu) {
		this.fmenu = fmenu;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public int getFstatus() {
		return fstatus;
	}

	public void setFstatus(int fstatus) {
		this.fstatus = fstatus;
	}

	public String getFdescribe() {
		return fdescribe;
	}

	public void setFdescribe(String fdescribe) {
		this.fdescribe = fdescribe;
	}

	public String getFurl() {
		return furl;
	}

	public void setFurl(String furl) {
		this.furl = furl;
	}

	public String getPerCode() {
		return perCode;
	}

	public void setPerCode(String perCode) {
		this.perCode = perCode;
	}

}
