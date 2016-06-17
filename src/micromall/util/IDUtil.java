/**
 * 
 */
package micromall.util;

import java.util.Random;
import java.util.UUID;
/**
 * 
 * @ClassName:     IDUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:17:42
 */
public class IDUtil {

	/**
	 * 
	 * Author:yind(Hunter)
	 * 
	 * Date:Apr 23, 2014
	 * 
	 * RCSMethod:
	 * 
	 */
	public static void main(String[] args) {
		System.out.println(TwoDimensionCodeToNumber("P150112-000001"));
		System.out.println(TwoDimensionCodeToNumber("P150112-000002"));
		System.out.println(TwoDimensionCodeToNumber("P150112-000003"));
		System.out.println(TwoDimensionCodeToNumber("P150112-000004"));
		System.out.println(getOrderID());
		System.out.println(getID());
		System.out.println(getID());
		System.out.println(getID());
		System.out.println(getID());
	}

	public static String getID() {
		return UUID.randomUUID().toString();
	}

	public static String TwoDimensionCodeToNumber(String twoDimensionCode) {
		if (AssertUtil.isNull(twoDimensionCode)
				|| twoDimensionCode.length() != 14) {
			return null;
		}
		
		String temp = twoDimensionCode.substring(1, twoDimensionCode.length());
		return temp.substring(0, temp.indexOf("-")) + temp.substring(temp.indexOf("-")+2, temp.length());
	}

	public static String getOrderID() {
		StringBuilder orderNum = new StringBuilder();
		orderNum.append(System.currentTimeMillis());
		int max = 99999999;
		int min = 10000000;
		Random random = new Random();
		int s = random.nextInt(max) % (max - min + 1) + min;
		orderNum.append("-" + s);
		return orderNum.toString();
	}
}
