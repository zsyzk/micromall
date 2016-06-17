/**
 * 
 */
package micromall.manager.vo;

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
 * RCSfile:
 * 
 * Revision: 1.0
 * 
 * Date: 2015年1月24日
 * 
 * Author: dang.yin(Seven)
 * 
 * Log:
 * 
 * 
 */
public class BusinessVO {

	/**
	 * 业务对象唯一ID
	 */
	private int objId;

	/**
	 * 业务对应名称，如无则默认为填写：无 采用 PropertiesUtil 类获取:
	 * PropertiesUtil.getInstance().getValue( EConfigFile.CHINESE.getValue(),
	 * CText.NO);
	 */
	private String objName;

	/**
	 * 业务对象描述，如无则默认为填写：无 采用 PropertiesUtil 类获取:
	 * PropertiesUtil.getInstance().getValue( EConfigFile.CHINESE.getValue(),
	 * CText.NO);
	 */
	private String objDesc;

	public int getObjId() {
		return objId;
	}

	public void setObjId(int objId) {
		this.objId = objId;
	}

	public String getObjName() {
		return objName;
	}

	public void setObjName(String objName) {
		this.objName = objName;
	}

	public String getObjDesc() {
		return objDesc;
	}

	public void setObjDesc(String objDesc) {
		this.objDesc = objDesc;
	}

}
