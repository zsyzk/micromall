package micromall.manager.vo;

import java.util.HashSet;
import java.util.Set;
/**
 * 
 * @ClassName:     Menu.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 下午2:34:18
 */
public class Menu {

	private int id;
	/**
	 * 菜单名称
	 */
	private String fname;
	/**
	 * 权限代码
	 */
	private String perCode;
	/**
	 * 子菜单
	 */
	private Set<Menu> fmenuChild = new HashSet<Menu>();
	/**
	 * 父菜单
	 */
	private Menu fparent;
	/**
	 * 模块
	 */
	private Model fmodel;

	/**
	 * 状态
	 */
	private int fstatus;

	/**
	 * 排序值
	 */
	private int sort;

	/**
	 * 菜单url
	 */
	private String furl;
	
	/**
	 * 菜单标识
	 */
	private String mark;

	public String getMark() {
		return mark;
	}

	public void setMark(String mark) {
		this.mark = mark;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getFname() {
		return fname;
	}

	public void setFname(String fname) {
		this.fname = fname;
	}

	public Model getFmodel() {
		return fmodel;
	}

	public void setFmodel(Model fmodel) {
		this.fmodel = fmodel;
	}

	public Set<Menu> getFmenuChild() {
		return fmenuChild;
	}

	public void setFmenuChild(Set<Menu> fmenuChild) {
		this.fmenuChild = fmenuChild;
	}

	public Menu getFparent() {
		return fparent;
	}

	public void setFparent(Menu fparent) {
		this.fparent = fparent;
	}

	public String getFurl() {
		return furl;
	}

	public void setFurl(String furl) {
		this.furl = furl;
	}

	public int getSort() {
		return sort;
	}

	public void setSort(int sort) {
		this.sort = sort;
	}

	public int getFstatus() {
		return fstatus;
	}

	public void setFstatus(int fstatus) {
		this.fstatus = fstatus;
	}

	public String getPerCode() {
		return perCode;
	}

	public void setPerCode(String perCode) {
		this.perCode = perCode;
	}

}