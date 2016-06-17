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
 * @ClassName:     EIdName.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:59:49
 */
public enum EIdName {
	SystemParam("sys_param_id")
	,User("userId")
	,PROMOTIONSRULES("id")
	,IntegralRules("ruleId")
	,Integral("inteId")
	,IntegralRecord("inteRecordId")
	,LOG_ID("logId")
	,MEMBER_ID("memberId")
	,MEMBER_MERGER_LOG_ID("memberMergerLogId")
	,GIFT_ID("giftId")
	,GrftInventory_Id("grftInventoryId")
	,GrftInventoryWarn_Id("id")
	,GrftExChangeLog_Id("giftExchangeLogId")
	,GIFTADDRESS_ID("addrId")
	,PROMOTIONSRECORD("id")
	,PromotionsUseRecord_ID("promotionsUseRecordId")
	,SystemEmail_Id("id")
	;
	private String IdName;

	private EIdName(String IdName) {
		this.setIdName(IdName);
	}

	public String getIdName() {
		return IdName;
	}

	public void setIdName(String idName) {
		IdName = idName;
	}

}
