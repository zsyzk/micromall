package micromall.util;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.io.OutputStream;
import java.io.OutputStreamWriter;
import java.net.HttpURLConnection;
import java.net.MalformedURLException;
import java.net.URL;
import java.net.URLConnection;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Random;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.http.HttpEntity;
import org.apache.http.HttpResponse;
import org.apache.http.client.entity.UrlEncodedFormEntity;
import org.apache.http.client.methods.HttpPost;
import org.apache.http.impl.client.DefaultHttpClient;
import org.apache.http.message.BasicNameValuePair;

import com.alibaba.fastjson.JSON;

import micromall.manager.constant.CSystem;
/**
 * 
 * @ClassName:     CommUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:16:44
 */
@SuppressWarnings("resource")
public class CommUtil {

	/**
	 * 检查字符串是否为空或null
	 * 
	 * @param str
	 * @return
	 */
	public static boolean isNotNull(String str) {
		if (str == null) {
			return false;
		}
		if ("".equals(str)) {
			return false;
		}
		return true;
	}

	/**
	 * object转换为String
	 * 
	 * @param object
	 * @return
	 */
	public static String objToString(Object object) {
		if (object == null) {
			return "";
		} else {
			return String.valueOf(object);
		}
	}

	public static String httpConnSend(String urlStr, String content,
			String requestMethod) {
		try {
			URL url = new URL(urlStr);
			HttpURLConnection httpURLConnection = (HttpURLConnection) url
					.openConnection();
			httpURLConnection.setRequestProperty("Content-Type",
					"application/xml;charset=UTF-8");// application/json
			// text/plain;
			// charset=utf-8
			// application/xml;charset=UTF-8
			httpURLConnection.setDoOutput(true);
			httpURLConnection.setDoInput(true);
			httpURLConnection.setRequestMethod(requestMethod);
			httpURLConnection.setConnectTimeout(60000);
			httpURLConnection.setReadTimeout(60000);
			httpURLConnection.connect();
			BufferedWriter out = new BufferedWriter(new OutputStreamWriter(
					httpURLConnection.getOutputStream(), "utf-8"));
			out.write(content);
			out.flush();
			out.close();
			StringBuffer result = new StringBuffer();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					httpURLConnection.getInputStream(), "utf-8"));
			while (true) {
				String line = in.readLine();
				if (line == null) {
					break;
				} else {
					result.append(line);
				}
			}
			System.out
					.println("========================================result:"
							+ result.toString());
			return result.toString();
		} catch (Exception e) {
			return null;
		}

	}

	/**
	 * 用SHA-1算法加密字符串并返回16进制串
	 * 
	 * @param strSrc
	 * @return
	 */
	public static String Encrypt(String strSrc) {
		MessageDigest md = null;
		String strDes = null;
		byte[] bt = strSrc.getBytes();
		try {
			md = MessageDigest.getInstance("SHA-1");
			md.update(bt);
			strDes = bytes2Hex(md.digest());
		} catch (NoSuchAlgorithmException e) {
			System.out.println("错误");
			return null;
		}
		return strDes;
	}

	public static String bytes2Hex(byte[] bts) {
		String des = "";
		String tmp = null;
		for (int i = 0; i < bts.length; i++) {
			tmp = (Integer.toHexString(bts[i] & 0xFF));
			if (tmp.length() == 1) {
				des += "0";
			}
			des += tmp;
		}
		return des;
	}

	/**
	 * 下载图片并保存到本地
	 * 
	 * @param strUrl
	 *            下载地址
	 * @param path
	 *            本地路径
	 */
	public static void downImagByUrl(String strUrl, String path) {
		URL url = null;
		try {
			url = new URL(strUrl);
		} catch (MalformedURLException e2) {
			e2.printStackTrace();
			return;
		}
		InputStream is = null;
		try {
			is = url.openStream();
		} catch (IOException e1) {
			e1.printStackTrace();
			return;
		}
		OutputStream os = null;
		try {
			os = new FileOutputStream(path);
			int bytesRead = 0;
			byte[] buffer = new byte[8192];
			while ((bytesRead = is.read(buffer, 0, 8192)) != -1) {
				os.write(buffer, 0, bytesRead);
			}
		} catch (FileNotFoundException e) {
			e.printStackTrace();
			return;
		} catch (IOException e) {
			e.printStackTrace();
			return;
		}
	}

	/**
	 * 验证手机号码正确性
	 * 
	 * @param phoneNumber
	 *            手机号码
	 * @return
	 */
	public static boolean isPhoneNumberValid(String phoneNumber) {
		boolean isValid = false;

		String expression = "^1[3,5,8][0,1,2,3,4,5,6,7,8,9][0-9]{8}$";

		CharSequence inputStr = phoneNumber;

		Pattern pattern = Pattern.compile(expression);

		Matcher matcher = pattern.matcher(inputStr);

		if (matcher.matches()) {
			isValid = true;
		}
		return isValid;
	}

	public static String sendGet(String url, String param) {
		String result = "";
		try {
			String urlName = url + "?" + param;//
			URL U = new URL(urlName);
			URLConnection connection = U.openConnection();
			connection.connect();

			BufferedReader in = new BufferedReader(new InputStreamReader(
					connection.getInputStream()));
			String line;
			while ((line = in.readLine()) != null) {
				result += line;
			}
			in.close();
		} catch (Exception e) {
			System.out.println("没有结果！" + e);
		}
		return result;
	}

	public static String sendPost(String url, String param) {
		String result = "";
		try {
			URL httpurl = new URL(url);
			HttpURLConnection httpConn = (HttpURLConnection) httpurl
					.openConnection();
			httpConn.setDoOutput(true);
			httpConn.setDoInput(true);
			httpConn.setRequestMethod("POST");
			httpConn.setRequestProperty("content-type",
					"application/x-www-form-urlencoded");
			BufferedWriter out = new BufferedWriter(new OutputStreamWriter(
					httpConn.getOutputStream(), "utf-8"));
			out.write(param);
			out.flush();
			BufferedReader in = new BufferedReader(new InputStreamReader(
					httpConn.getInputStream(), "utf-8"));
			String line;
			while ((line = in.readLine()) != null) {
				result += line + "\r\n";
			}
			in.close();
		} catch (Exception e) {
			System.out.println("没有查询到结果！" + e);
		}
		return result;
	}

	/**
	 * 调用接口
	 * 
	 * @param httpUrl
	 * @param content
	 * @return
	 */
	public static String callPushNoteInterface(String httpUrl, String content) {
		List<BasicNameValuePair> paramPairs = new ArrayList<BasicNameValuePair>();
		BasicNameValuePair message = new BasicNameValuePair(CSystem.PAR, content);
		paramPairs.add(message);
		StringBuffer sb = new StringBuffer();
		try {
			UrlEncodedFormEntity entity = new UrlEncodedFormEntity(paramPairs,
					"utf-8");
			HttpPost post = new HttpPost(httpUrl);
			post.setEntity(entity);
			DefaultHttpClient client = new DefaultHttpClient();
			HttpResponse res = client.execute(post);
			HttpEntity resEntity = res.getEntity();
			InputStreamReader reader = new InputStreamReader(
					resEntity.getContent(), "utf-8");
			char[] buff = new char[1024];
			int length = 0;
			while ((length = reader.read(buff)) != -1) {
				sb.append(new String(buff, 0, length));
			}
			client.getConnectionManager().shutdown();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return sb.toString();
	}

	/**
	 * 产生随机字符串
	 * 
	 * @param num
	 *            随机出几个字符
	 * @return
	 */
	public static String GenCode(int num) {
		String str = "123456789ABCDEFGHIJKLMNPQRSTUVWXYZ";
		String code = "";
		Random rd = new Random();
		int i;
		for (i = 0; i < num; i++) {
			int next = rd.nextInt(str.length());
			code += str.substring(next, next + 1);
		}
		return code;
	}

	public static void main(String[] args) {
		Map<String, String> pars = new HashMap<String, String>();
		pars.put("kfbm", "yhb");
		String par = JSON.toJSONString(pars);

		String result = callPushNoteInterface(
				"http://localhost:8080/eticket.service/version.shtm", par);
		System.out.println("result:" + result);
	}
}
