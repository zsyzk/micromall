/**
 * 
 */
package micromall.util;

import java.util.Random;
/**
 * 
 * @ClassName:     EncryptCodeUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:17:22
 */
public class EncryptCodeUtil {

	/**
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public static void main(String[] args) {
		// TODO Auto-generated method stub
		String result = getEncryptCode();
		System.out.println(result);
		byte[] bytes = conversionByte(result);
		for (byte b : bytes) {
			System.out.print(b + ",");
		}
	}

	public static String getEncryptCode() {
		StringBuilder encryptCode = new StringBuilder();
		Random random = new Random();
		for (int i = 0; i < 16; i++) {
			encryptCode.append(random.nextInt(99) + ",");
		}

		return encryptCode.toString().substring(0, encryptCode.length() - 1);
	}

	public static byte[] conversionByte(String encryptCode) {
		if (AssertUtil.isNull(encryptCode)) {
			return null;
		}

		String[] temps = encryptCode.split(",");

		byte[] data = new byte[temps.length];

		for (int i = 0; i < temps.length; i++) {
			data[i] = (byte) Integer.parseInt(temps[i]);
		}
		return data;
	}
}
