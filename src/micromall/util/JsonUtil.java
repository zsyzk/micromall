/**
 * 
 */
package micromall.util;

import java.text.CharacterIterator;
import java.text.StringCharacterIterator;
import java.util.HashMap;
import java.util.Iterator;
import java.util.Map;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.alibaba.fastjson.serializer.PropertyFilter;
import com.alibaba.fastjson.serializer.SerializerFeature;
/**
 * 
 * @ClassName:     JsonUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:17:52
 */
public class JsonUtil {

	private CharacterIterator it;
	private char c;
	private int col;

	private static JsonUtil jsonUtil;

	public static JsonUtil getInstance() {

		return AssertUtil.isNotNull(jsonUtil) ? jsonUtil
				: (jsonUtil = new JsonUtil());
	}

	public JsonUtil() {

	}

	public boolean validate(String input) {
		input = input.trim();
		boolean ret = valid(input);
		return ret;
	}

	private boolean valid(String input) {
		if ("".equals(input))
			return true;

		boolean ret = true;
		it = new StringCharacterIterator(input);
		c = it.first();
		col = 1;
		if (!value()) {
			ret = error("value", 1);
		} else {
			skipWhiteSpace();
			if (c != CharacterIterator.DONE) {
				ret = error("end", col);
			}
		}

		return ret;
	}

	private boolean value() {
		return literal("true") || literal("false") || literal("null")
				|| string() || number() || object() || array();
	}

	private boolean literal(String text) {
		CharacterIterator ci = new StringCharacterIterator(text);
		char t = ci.first();
		if (c != t)
			return false;

		int start = col;
		boolean ret = true;
		for (t = ci.next(); t != CharacterIterator.DONE; t = ci.next()) {
			if (t != nextCharacter()) {
				ret = false;
				break;
			}
		}
		nextCharacter();
		if (!ret)
			error("literal " + text, start);
		return ret;
	}

	private boolean array() {
		return aggregate('[', ']', false);
	}

	private boolean object() {
		return aggregate('{', '}', true);
	}

	private boolean aggregate(char entryCharacter, char exitCharacter,
			boolean prefix) {
		if (c != entryCharacter)
			return false;
		nextCharacter();
		skipWhiteSpace();
		if (c == exitCharacter) {
			nextCharacter();
			return true;
		}

		for (;;) {
			if (prefix) {
				int start = col;
				if (!string())
					return error("string", start);
				skipWhiteSpace();
				if (c != ':')
					return error("colon", col);
				nextCharacter();
				skipWhiteSpace();
			}
			if (value()) {
				skipWhiteSpace();
				if (c == ',') {
					nextCharacter();
				} else if (c == exitCharacter) {
					break;
				} else {
					return error("comma or " + exitCharacter, col);
				}
			} else {
				return error("value", col);
			}
			skipWhiteSpace();
		}

		nextCharacter();
		return true;
	}

	private boolean number() {
		if (!Character.isDigit(c) && c != '-')
			return false;
		int start = col;
		if (c == '-')
			nextCharacter();
		if (c == '0') {
			nextCharacter();
		} else if (Character.isDigit(c)) {
			while (Character.isDigit(c))
				nextCharacter();
		} else {
			return error("number", start);
		}
		if (c == '.') {
			nextCharacter();
			if (Character.isDigit(c)) {
				while (Character.isDigit(c))
					nextCharacter();
			} else {
				return error("number", start);
			}
		}
		if (c == 'e' || c == 'E') {
			nextCharacter();
			if (c == '+' || c == '-') {
				nextCharacter();
			}
			if (Character.isDigit(c)) {
				while (Character.isDigit(c))
					nextCharacter();
			} else {
				return error("number", start);
			}
		}
		return true;
	}

	private boolean string() {
		if (c != '"')
			return false;

		int start = col;
		boolean escaped = false;
		for (nextCharacter(); c != CharacterIterator.DONE; nextCharacter()) {
			if (!escaped && c == '\\') {
				escaped = true;
			} else if (escaped) {
				if (!escape()) {
					return false;
				}
				escaped = false;
			} else if (c == '"') {
				nextCharacter();
				return true;
			}
		}
		return error("quoted string", start);
	}

	private boolean escape() {
		int start = col - 1;
		if (" \\\"/bfnrtu".indexOf(c) < 0) {
			return error(
					"escape sequence  \\\",\\\\,\\/,\\b,\\f,\\n,\\r,\\t  or  \\uxxxx ",
					start);
		}
		if (c == 'u') {
			if (!ishex(nextCharacter()) || !ishex(nextCharacter())
					|| !ishex(nextCharacter()) || !ishex(nextCharacter())) {
				return error("unicode escape sequence  \\uxxxx ", start);
			}
		}
		return true;
	}

	private boolean ishex(char d) {
		return "0123456789abcdefABCDEF".indexOf(c) >= 0;
	}

	private char nextCharacter() {
		c = it.next();
		++col;
		return c;
	}

	private void skipWhiteSpace() {
		while (Character.isWhitespace(c)) {
			nextCharacter();
		}
	}

	private boolean error(String type, int col) {
		System.out.printf("type: %s, col: %s%s", type, col,
				System.getProperty("line.separator"));
		return false;
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:转JSON String
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public String toJsonString(Object object) {
		try {
			return JSON.toJSONString(object);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:转JSON String
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public String toJsonString(Object object, PropertyFilter fileFilter) {
		try {
			return JSON.toJSONString(object, fileFilter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String toJsonStringByArray(Object object) {
		try {
			return JSONArray.toJSONString(object);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public String toJsonStringByArray(Object object, PropertyFilter filter) {
		try {
			return JSONArray.toJSONString(object, filter);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:转JSON List
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public String toJsonList(Object object) {
		try {
			return JSONArray.toJSONString(object);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:转JSON String
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public String toJsonStringSerializerFeature(Object object) {
		try {
			return JSON.toJSONString(object,
					SerializerFeature.DisableCircularReferenceDetect);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 转JSON OBJ
	 * 
	 * @param jsonString
	 * @return
	 */
	public JSONObject toJsonObj(String jsonString) {
		try {
			return JSON.parseObject(jsonString);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Map<String, Integer> toMapInteger(String jsonStr) {
		try {
			Map<String, Integer> value = new HashMap<String, Integer>();

			JSONObject jsonMap = JSONObject.parseObject(jsonStr);

			Iterator<String> it = jsonMap.keySet().iterator();

			while (it.hasNext()) {

				String key = (String) it.next();

				value.put(key, jsonMap.getInteger(key));

			}
			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public Map<String, String> toMapString(String jsonStr) {
		try {
			Map<String, String> value = new HashMap<String, String>();

			JSONObject jsonMap = JSONObject.parseObject(jsonStr);

			Iterator<String> it = jsonMap.keySet().iterator();

			while (it.hasNext()) {
				String key = (String) it.next();
				value.put(key, jsonMap.getString(key));
			}

			return value;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:获取指定JSON串中的String类型的JSON属性
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public String getJSONAttributeByString(String jsonString, String attribute) {

		try {
			JSONObject tempJson = JSONObject.parseObject(jsonString);

			return tempJson.getString(attribute);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	/**
	 * 
	 * 
	 * User: dang.yin(Seven)
	 * 
	 * Remark:获取指定JSON串中的Integer类型的JSON属性
	 * 
	 * Param:
	 * 
	 * Return:
	 * 
	 */
	public int getJSONAttributeByInteger(String jsonString, String attribute) {

		try {
			JSONObject tempJson = JSONObject.parseObject(jsonString);

			return tempJson.getInteger(attribute);
		} catch (Exception e) {
			e.printStackTrace();
			return -1;
		}
	}

	public String EscapeDel(String jsonStr) {
		if (AssertUtil.isNull(jsonStr)) {
			return jsonStr;
		}
		return jsonStr.replaceAll("\\", "");

		// 转义符号的处理后期再重点解决，先用替换。
		// StringBuilder result = new StringBuilder();
		//
		// for (int i = 0; i < jsonStr.length(); i++) {
		// char c = jsonStr.charAt(i);
		// switch (c) {
		// case '\"':
		// result.append(c);
		// break;
		// default:
		// break;
		// }
		// }

		// return result.toString();

	}

	public JSONArray toJsonArray(String par) {
		try {
			return JSONArray.parseArray(par);
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}

	public static void main(String[] args) {
		// String jsonStr = "{\"remark\":\"系统操作成功\",\"result\":1}";
		String jsonStr = "{\"yhbm\":\"yh003\"}";
		System.out.println(jsonStr);

		System.out.println(new JsonUtil().EscapeDel(jsonStr));
	}
}
