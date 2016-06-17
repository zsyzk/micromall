/**
 * 
 */
package micromall.manager.vo;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;

import micromall.manager.constant.EResult;
import micromall.util.JsonUtil;
import micromall.util.ReturnUtil;
/**
 * 
 * @ClassName:     ReturnResultTwo.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-17 下午11:16:29
 */
public class ReturnResultTwo {

	/**
	 * 结果类型
	 */
	private int code;

	/**
	 * 说明
	 */
	private String msg;

	/**
	 * 数据
	 */
	private JSONArray data;

	/**
	 * 来源于客户端请求，返回结果时返回相同的数据
	 */
	private String client_mark;
	
	public String getClient_mark() {
		return client_mark;
	}

	public void setClient_mark(String client_mark) {
		this.client_mark = client_mark;
	}

	public int getCode() {
		return code;
	}

	public void setCode(int code) {
		this.code = code;
	}

	public String getMsg() {
		return msg;
	}

	public void setMsg(String msg) {
		this.msg = msg;
	}

	public JSONArray getData() {
		return data;
	}

	public void setData(JSONArray datas) {
		this.data = datas;
	}

	public String toJsonString() {
		return JSON.toJSONString(this);
	}

	public void parse(String jsonString) {
		if (new JsonUtil().validate(jsonString)) {
			try {
				ReturnResultTwo temp = JSON.parseObject(jsonString,
						this.getClass());
				this.setData(temp.getData());
				this.setMsg(temp.getMsg());
				this.setCode(temp.getCode());
			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	public static void main(String[] args) {
		ReturnResultTwo resultSuccess = new ReturnResultTwo();
		resultSuccess.setCode(EResult.SUCCESS.getValue());
		resultSuccess.setMsg("系统基本资料数据包更新成功");
		resultSuccess.setData(null);
		System.out.println("resultSuccess:" + resultSuccess.toJsonString());

		ReturnResultTwo resultFail = new ReturnResultTwo();
		resultFail.parse(ReturnUtil.getReturnFail("系统基本资料数据包更新失败"));
		System.out.println("resultFail:" + resultFail.toJsonString());

	}
}
