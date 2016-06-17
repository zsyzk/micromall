/**
 * 
 */
package micromall.manager.vo;

import java.io.Serializable;

import com.alibaba.fastjson.JSON;

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
 * RCSfile: 系统运营数据
 * 
 * Revision: 1.0
 * 
 * Date: 2014年10月14日
 * 
 * Author: dang.yin(Seven)
 * 
 * Log:
 * 
 * 
 */
public class SystemData implements Serializable, Cloneable {

	/**
	 * 
	 */
	private static final long serialVersionUID = 3155786274570610268L;

	public String toJsonString() {
		return JSON.toJSONString(this);
	}

	public static void main(String[] args) {
	}
}
