/**
 * 
 */
package micromall.util;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;

import micromall.manager.constant.CConditionField;
import micromall.manager.constant.COrderByField;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.EDBDataStatus;
import micromall.manager.constant.EMenuMark;
import micromall.manager.servcie.IBaseService;
import micromall.manager.vo.PageVO;
/**
 * 
 * @ClassName:     AssertUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:15:44
 */
@SuppressWarnings("rawtypes")
public class AssertUtil {

	/**
	 * 
	 * 
	 * Author:Hunter
	 * 
	 * Date:Apr 17, 2014
	 * 
	 * RCSMethod:判断Obj是否为非空
	 * 
	 */
	public static boolean isNotNull(Object target) {
		return !isNull(target);
	}

	/**
	 * 
	 * @param target
	 * @return 判断Obj是否为空
	 */
	public static boolean isNull(Object target) {
		boolean isNull = false;
		if (null == target) {
			isNull = true;
		}
		if (!isNull) {
			// String
			if (target instanceof String) {
				String temp = target.toString().trim();
				if ("".equals(temp) || "null".equals(temp)
						|| "undefined".equals(temp)) {
					isNull = true;
				}
			}
			// StringBuffer
			if (target instanceof StringBuffer) {
				String temp = target.toString().trim();
				if ("".equals(temp) || "null".equals(temp)
						|| "undefined".equals(temp)) {
					isNull = true;
				}
			}
			// List
			else if (target instanceof List) {
				List temp = (List) target;
				if (0 == temp.size()) {
					isNull = true;
				}
			}
			// Map
			else if (target instanceof Map) {
				Map temp = (Map) target;
				if (0 == temp.size()) {
					isNull = true;
				}
			}
			// Array
			else if (target.getClass().isArray()) {
				Object[] temp = (Object[]) target;
				if (0 == temp.length) {
					isNull = true;
				}
			}
		}
		return isNull;
	}

	/**
	 * 字符串增加内容
	 * 
	 * 
	 * @param target
	 * @param content
	 * @return
	 */
	public static StringBuffer append(StringBuffer target, String content) {
		
		boolean exist = false;
		if(isNotNull(target)){
			String[] exs = target.toString().split(",");
			for(String e : exs){
				if(e.equals(content)){
					exist = true;
					break;
				}
			}
		}
			if(!exist){
				if (isNotNull(target)) {
					target.append("," + content);
				} else {
					target.append(content);
				}
			}
		
		return target;
	}

	/**
	 * 判断对象是否存在， 如果存在返回自己， 如果不存在 返回not
	 * 
	 * 
	 * @param target
	 * @param not
	 * @return
	 */
	public static Object exsitOrNot(Object target, Object not) {
		if (isNotNull(target)) {
			return target;
		}
		return not;
	}

	public static String getConstantField(Class consClass,String consFieldName){
		String result = "";
		try {
			consFieldName = consFieldName.toUpperCase();
			result = consClass.getField(consFieldName).get(consClass).toString();
		} catch (NoSuchFieldException e) {
			System.out.println("当前没有设置排序属性");
		} catch (SecurityException e) {
			
			e.printStackTrace();
		} catch (IllegalArgumentException e) {
			
			e.printStackTrace();
		} catch (IllegalAccessException e) {
			
			e.printStackTrace();
		}
		return result;
	}

	
	/**
	 * 拼凑sql的搜索查询
	 */
	public static String productSearchString(JSONObject json){
		StringBuffer sql = new StringBuffer("");
		if(AssertUtil.isNotNull(json)){
			for(String key :json.keySet()){
				if(AssertUtil.isNotNull(json.getString(key))){
					Object value = json.getString(key);
					if(value instanceof String){
						sql.append(" and "+key+"='"+value+"' ");
					}else if(value instanceof Integer){
						sql.append(" and "+key+"="+value+" ");
					}
				}
			}
		}
		return sql.toString();
	}
	
	public static String outputPageData(HttpServletRequest request , int mark,int page,IBaseService baseService ){
		
		
		JSONObject jsonObj = new JSONObject();
		
		String className = EMenuMark.getClassNameByValue(mark);
		
		String where = "";
		
		
		String conditionField = mark+"_CONDITION";
		
		String condition = getConstantField(CConditionField.class,conditionField);
		
		
		if(AssertUtil.isNotNull(condition)){
			where = productSearchString(JsonUtil.getInstance().toJsonObj(condition));
		}
		
		int status= getStatusByMark(mark);
		
		if(-1 == page){
			request.getSession().setAttribute(
					"data",
					baseService.getAll(className,where,status));
		}else{
			PageVO vo = getPage(
					page,
					baseService.getCount(
							EDBDataStatus.NO, className));
			
			request.getSession().setAttribute("pageVo", vo);

			String field = className.toUpperCase()+"_ORDERBY";
			
			String orderBy = getConstantField(COrderByField.class,field);
			
			request.getSession().setAttribute(
					"data",
					baseService.getAllByPage(className, vo,where,orderBy,status));
					
		}
		
		String path = EMenuMark.getPathByValue(mark);
		jsonObj.put(CSystem.URL, path);
		return jsonObj.toJSONString();
		
	}
	
	private static int getStatusByMark(int mark) {
		
		/*if(mark == EMenuMark.ORDER_ACTIVITY.getValue()){
			 return EChePiaoOrderType.ACTIVITY.getValue();
		}else if(mark == EMenuMark.CHEPIAO_HISTORY.getValue()){
			return EChePiaoOrderType.HISTORY.getValue();
		}*/
		
		return -1;
	}

	private static PageVO getPage(int page, int count) {

		if (-1 == count || -1 == page) {
			return null;
		}

		PageVO vo = new PageVO();
		vo.setDispayNum(7);
		vo.setPage(page);
		vo.setPageSize(10);
		vo.setSumPage(count % vo.getPageSize() == 0 ? count / vo.getPageSize()
				: (count / vo.getPageSize()) + 1);
		return vo;
	}
	
	public static void main(String[] args) {
		// String tmp = "null"; //--true
		// String[] tmp = {}; //--true
		// String tmp = null; //--true
		// List tmp = new ArrayList(); //--true
		// tmp.add("hello"); //--false
		Map tmp = new HashMap(); // --true
		System.out.println(isNull(tmp));
		
		
	}
}
