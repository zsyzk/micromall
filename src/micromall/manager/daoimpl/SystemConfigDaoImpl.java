package micromall.manager.daoimpl;

import java.util.List;

import micromall.manager.constant.ESQLChar;
import micromall.manager.dao.ISystemConfigDao;
import micromall.util.AssertUtil;
import micromall.manager.vo.SystemConfig;
/**
 * 
 * @ClassName:     SystemConfigDaoImpl.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午10:08:23
 */
@SuppressWarnings("unchecked")
public class SystemConfigDaoImpl extends BaseDaoByHibernate<SystemConfig>
		implements ISystemConfigDao {

	public SystemConfig selDetailedByID(int id) {

		StringBuilder hql = new StringBuilder(
				" SELECT T FROM SystemConfig T WHERE T.id=" + id);
		return (SystemConfig) getSession().createQuery(hql.toString())
				.uniqueResult();
	}

	@Override
	public String getSystemConfigByFlag(String flag) throws Exception {

		List<SystemConfig> results = getSession().createQuery(
				" SELECT T FROM SystemConfig T WHERE T.flag='?'".replace(
						ESQLChar.ONE.getValue(), flag)).list();

		return AssertUtil.isNotNull(results) ? results.get(0).getValue() : null;
	}
}
