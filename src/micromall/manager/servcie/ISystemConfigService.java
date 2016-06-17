package micromall.manager.servcie;

import micromall.manager.vo.SystemConfig;
/**
 * 
 * @ClassName:     ISystemConfigService.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:13:43
 */
public interface ISystemConfigService extends IBaseService<SystemConfig> {

	public String saveOrUpdateSystemConfig(String par);
	
	/**
	 * 根据Id查询系统参数信息
	 * @param par
	 * @return
	 */
	public String getSystemConfigById(String par);
	
	
	public String saveSystemConfigDefault(String par);
	
	public String getSystemConfigByFlag(String flag);
}
