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
 * RCSfile: 自定义结果数据载体
 * 
 * Revision: 1.0
 * 
 * Date: 2015年1月29日
 * 
 * Author: dang.yin(Seven)
 * 
 * Log:
 * 
 * 
 */
public class Result {

	public Result(String returnValue){
		super();
		this.returnValue = returnValue;
	}
	
	public Result(String returnValue, BusinessVO businessVO) {
		super();
		this.returnValue = returnValue;
		this.businessVO = businessVO;
	}
	
	public Result(){
		super();
	}
	

	/**
	 * 业务返回值
	 */
	private String returnValue;

	/**
	 * 记录日志的业务载体
	 */
	private BusinessVO businessVO;

	public String getReturnValue() {
		return returnValue;
	}

	public void setReturnValue(String returnValue) {
		this.returnValue = returnValue;
	}

	public BusinessVO getBusinessVO() {
		return businessVO;
	}

	public void setBusinessVO(BusinessVO businessVO) {
		this.businessVO = businessVO;
	}

}
