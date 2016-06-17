package micromall.manager.control.springmvc;

import java.util.HashSet;
import java.util.Iterator;
import java.util.List;
import java.util.Set;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.serializer.SerializerFeature;

import micromall.manager.jsonfilter.MenuJsonFilter;
import micromall.manager.jsonfilter.ModelJsonFilter;
import micromall.manager.servcie.IMenuService;
import micromall.manager.servcie.IModelService;
import micromall.util.AssertUtil;
import micromall.util.PermissionUtil;
import micromall.manager.vo.Menu;
import micromall.manager.vo.Model;
/**
 * 
 * @ClassName:     HomeController.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:05:39
 */
@Controller
@RequestMapping("/home")
public class HomeController {

	@Resource(name = "ModelServiceImpl")
	private IModelService modelServiceImpl;

	@Resource(name = "MenuServiceImpl")
	private IMenuService menuServiceImpl;

	@RequestMapping("/preloadMain.shtm")
	public String preloadMain(HttpServletRequest request,
			HttpServletResponse response) {
		request.setAttribute("name", "xiaoming");
		return "/system/main";
	}

	@RequestMapping("/preloadTop.shtm")
	public String preloadTop(HttpServletRequest request,
			HttpServletResponse response) {
		//List<Integer> ids = PermissionUtil.getInstance().getModelPermission();
		//List<Model> models = modelServiceImpl.getPerAll(ids);
		//List<Model> models = modelServiceImpl.getAll();
		List<String> codes =  PermissionUtil.getInstance().accessModel(request);
		List<Model> models = modelServiceImpl.getPerAll(codes);
		if(AssertUtil.isNotNull(models)){
			String modelStr = JSON.toJSONString(models, new ModelJsonFilter(),
								SerializerFeature.DisableCircularReferenceDetect);
			request.setAttribute("models", modelStr);
		}
		return "/root/top";
	}

	@RequestMapping("/preloadLeft.shtm")
	public String preloadLeft(HttpServletRequest request,
			HttpServletResponse response) {
		String returnValue = "";
		String modelId = request.getParameter("modelId");
		String modelCode = request.getParameter("modelCode");
		if (AssertUtil.isNull(modelId) || AssertUtil.isNull(modelCode)) {
			return "/root/left";
		}
		int id = Integer.parseInt(request.getParameter("modelId"));
		if (AssertUtil.isNull(id)) {

		} else {
			//List<Menu> result = menuServiceImpl.getMenuByModelId(id);
			List<String> perMenus = PermissionUtil.getInstance().accessMenu(request,modelCode);
			
			//List<Integer> pmenus = PermissionUtil.getInstance().getMenuPermission(id);
			List<Menu> result = menuServiceImpl.getPerMenuByModelId(id,perMenus);
			for(Menu m : result){
				Set<Menu> childMenu = m.getFmenuChild();
				Set<Menu> dropMenu = new HashSet<Menu>();
				for(Iterator<Menu> i = childMenu.iterator();i.hasNext();){
					Menu u = i.next();
					boolean hasPermission = false;
					String code = u.getPerCode();
					for(String mi : perMenus){
						if(code.equals(mi)){
							hasPermission = true;
							break;
						}
					}
					if(!hasPermission){
						dropMenu.add(u);
					}
				}
				childMenu.removeAll(dropMenu);
			}
			returnValue = JSON.toJSONString(result,new MenuJsonFilter());
			System.out.println(returnValue);
			request.setAttribute("menu", returnValue);
		}
		return "/root/left";
	}

}