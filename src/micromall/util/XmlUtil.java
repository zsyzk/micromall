package micromall.util;

import java.io.InputStream;

import org.dom4j.Document;
import org.dom4j.DocumentException;
import org.dom4j.io.SAXReader;
/**
 * 
 * @ClassName:     XmlUtil.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:19:20
 */
public class XmlUtil {
	private static XmlUtil xmlUtil;
	
	private XmlUtil(){
		
	}
	
	public static XmlUtil getInstance(){
		if(null == xmlUtil){
			xmlUtil = new XmlUtil();
		}
		return xmlUtil;
	}
	/**
	 * 根据文件名获取解析xml文件
	 * 获取document
	 *
	 *	
	 * @param fileName
	 * @return
	 */
	public Document getDocument(String fileName){
		Document document = null;
		try {
			 InputStream is=this.getClass().getResourceAsStream("/"+ fileName);   
			//String rootPath = this.getClass().getResource("/resource").getPath();
			SAXReader reader = new SAXReader();
			document = reader.read(is);
		}catch (DocumentException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		return document;
	}
	
/*	public String getFile(String fileName){
		StringBuffer sb = new StringBuffer("");
		 InputStream is=this.getClass().getResourceAsStream("/"+ fileName);   
		 try {
			InputStreamReader reader = new InputStreamReader(is,"utf-8");
			BufferedReader br=new BufferedReader(reader);
			String s = "";
			while((s=br.readLine())!= null){
				sb.append(s);
			}
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		 return sb.toString();
	}*/
	
	public String getProjectPath() {
		 java.net.URL url = this.getClass().getProtectionDomain().getCodeSource().getLocation();
		 String filePath = null;
		 try {
		 filePath = java.net.URLDecoder.decode(url.getPath(), "utf-8");
		 } catch (Exception e) {
		 e.printStackTrace();
		 }
		 if (filePath.endsWith(".jar")){
			 filePath = filePath.substring(0, filePath.lastIndexOf("/") + 1);
		 }
			 
		 java.io.File file = new java.io.File(filePath);
		 filePath = file.getAbsolutePath();
		 return filePath;
	}
}
