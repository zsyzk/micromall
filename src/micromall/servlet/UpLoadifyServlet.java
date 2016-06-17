package micromall.servlet;

import java.io.File;
import java.io.IOException;
import java.text.DecimalFormat;
import java.util.Calendar;
import java.util.List;
import java.util.Random;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
/**
 * 
 * @ClassName:     UpLoadifyServlet.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:15:17
 */
public class UpLoadifyServlet extends HttpServlet {
	/**
	 * 文件上传
	 */
	private static final long serialVersionUID = 2384326745121073713L;

	@Override
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("-------------------UpLoadify-doGet");
		System.out.println("-------------------QueryString::::"
				+ request.getQueryString());
		doPost(request, response);
	}

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		System.out.println("-------------------UpLoadify-doPost");
		System.out.println("-------------------QueryString::::"
				+ request.getQueryString());
		if (request.getParameter("folder") == null
				|| request.getParameter("folder") == "") {
			System.out
					.println("-------------------request.getParameter('folder')::::"
							+ request.getParameter("folder") + " then return");
			return;
		}
		response.setContentType("text/html");
		response.setCharacterEncoding("UTF-8");
		String path = this.getServletContext().getRealPath("/");
		String fileD = request.getParameter("folder");
		String sourcePath = path + "upload/zbss/";
		path = path + "upload/" + fileD + "/";
		System.out.println("-------------------UpLoadify-path::::" + path);
		File folder = new File(path);
		File sourceFolder = new File(sourcePath);
		if (!folder.exists()) {
			// 文件夹不存在则创建
			System.out.println("-------------------UpLoadify::::" + "创建文件夹"
					+ fileD);
			folder.mkdirs();
		}
		if (!sourceFolder.exists()) {
			// 文件夹不存在则创建
			System.out.println("-------------------UpLoadify::::"
					+ "创建文件夹source");
			sourceFolder.mkdirs();
		}
		ServletFileUpload sfu = new ServletFileUpload(new DiskFileItemFactory());
		sfu.setHeaderEncoding("UTF-8");
		try {
			List<?> fileList = sfu.parseRequest(request);
			String sourceName = "";
			String extName = "";
			String name = "";
			String sfileName = "";
			for (int i = 0; i < fileList.size(); i++) {
				System.out.println("-------------------UpLoadify fileList[" + i
						+ "]::::" + fileList.get(i));
				FileItem fi = (FileItem) fileList.get(i);
				if (!fi.isFormField()) {
					sourceName = fi.getName();
					System.out.println("-------------------UpLoadify name::::"
							+ sourceName);
					if (sourceName == null || "".equals(sourceName.trim())) {
						continue;
					}
					if (sourceName.lastIndexOf(".") >= 0) {
						// 扩展名
						name = sourceName.substring(0,
								sourceName.lastIndexOf("."));
						extName = sourceName.substring(sourceName
								.lastIndexOf("."));
						System.out
								.println("-------------------UpLoadify extName::::"
										+ extName);
					}
					// 文件名规则 前缀 + 时间 + 两位随机数 + 文件分类(标识图片尺寸) + 扩展名
					Calendar ca = Calendar.getInstance();
					DecimalFormat df = new DecimalFormat();
					df.setMinimumIntegerDigits(2);
					String st = "zxy";
					if (st != null && st.length() > 6) {
						st = st.substring(0, 6);
					}
					String dateTime = ca.get(Calendar.YEAR) + ""
							+ df.format(ca.get(Calendar.MONTH)) + ""
							+ df.format(ca.get(Calendar.DATE)) + ""
							+ df.format(ca.get(Calendar.HOUR)) + ""
							+ df.format(ca.get(Calendar.MINUTE)) + ""
							+ df.format(ca.get(Calendar.SECOND));
					Random rand = new Random();
					int rand_num = rand.nextInt(89) + 10;
					String fileName = st + "_" + dateTime + "_" + rand_num
							+ extName;
					sfileName = name + "_" + dateTime + "_" + rand_num
							+ extName;
					File saveSourceFile = new File(sourcePath + sfileName);
					fi.write(saveSourceFile);
					System.out
							.println("-------------------UpLoadify fileSourceName::::"
									+ sourceName);
					System.out
							.println("-------------------UpLoadify fileName::::"
									+ fileName);
				}
			}
			response.getWriter().println(sfileName);
		} catch (FileUploadException e) {
			response.getWriter().println("0");
			e.printStackTrace();
		} catch (Exception e) {
			response.getWriter().println("0");
			e.printStackTrace();
		}
	}
}
