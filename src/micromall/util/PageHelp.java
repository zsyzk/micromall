/**
 * 
 */
package micromall.util;

import micromall.manager.constant.CClass;
import micromall.manager.constant.CSystem;
import micromall.manager.constant.ESystemConfig;
import micromall.manager.servcie.ISystemConfigService;
import micromall.manager.vo.PageVO;
/**
 * 
 * @ClassName:     PageHelp.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:18:17
 */
public class PageHelp {

	private static PageHelp pageHelp;

	private static PageVO defalutPageVo;


	public ISystemConfigService getSystemConfigService() {
		return (ISystemConfigService) SpringContextUtil.getApplicationContext().getBean(CClass.SystemConfigServiceImpl);
	}

	public static PageHelp getInstance() {
		return AssertUtil.isNotNull(pageHelp) ? pageHelp
				: (pageHelp = new PageHelp());
	}

	private int getPageSize() {
		String temp = getSystemConfigService().getSystemConfigByFlag(
				ESystemConfig.PAGE_NUMBER.getValue());
		return AssertUtil.isNotNull(temp) ? Integer.parseInt(temp)
				: CSystem.DEFAULT_PAGE_SIZE;
	}

	public PageVO getPage(int page, int count) {

		if (-1 == count || -1 == page) {
			return null;
		}

		PageVO vo = new PageVO();

		vo.setDispayNum(7);

		vo.setPage(page);

		// 从配置文件中获取数据
		vo.setPageSize(getPageSize());

		vo.setSumPage(count % vo.getPageSize() == 0 ? count / vo.getPageSize()
				: (count / vo.getPageSize()) + 1);

		if (page > vo.getSumPage()) {
			vo.setPage(page -= 1);
		}

		if (0 == count) {
			vo.setPage(0);
		}
		return vo;
	}

	public PageVO getDefaultPage() {
		if (AssertUtil.isNotNull(defalutPageVo)) {
			return defalutPageVo;
		}
		defalutPageVo = new PageVO();
		defalutPageVo.setDispayNum(7);
		defalutPageVo.setPage(1);
		defalutPageVo.setPageSize(CSystem.DEFAULT_PAGE_SIZE);
		defalutPageVo.setSumPage(1);
		return defalutPageVo;
	}
}
