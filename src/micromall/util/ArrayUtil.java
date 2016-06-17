/**
 * 
 */
package micromall.util;
/**
 * 
 * @ClassName:     ArrayUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:15:36
 */
public class ArrayUtil {
	private static ArrayUtil arrayUtil;

	public static ArrayUtil getInstance() {
		return AssertUtil.isNotNull(arrayUtil) ? arrayUtil
				: (arrayUtil = new ArrayUtil());
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:String[]转int[]
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public int[] toIntArray(String[] strs) {
		if (AssertUtil.isNull(strs)) {
			return null;
		}
		int[] temp = new int[strs.length];
		for (int i = 0; i < strs.length; i++) {
			temp[i] = Integer.parseInt(strs[i]);
		}
		return temp;
	}

}
