package micromall.manager.constant;
/**
 * @ClassName:     CSpringURL.java
 * @Description:   TODO(用一句话描述该文件做什么) 
 * 
 * @author         zhangsy
 * @version        V1.0  
 * @Date           2016-6-13 上午9:52:36 
 */
public class CSpringURL {
	
	/**
	 * 基本数据版本查询
	 */
	public static final String VERSION_GET = "/version.shtm";

	/**
	 * 基本数据查询
	 */
	public static final String DATA_GET = "/data.shtm";

	/**
	 * 根据班次查询座位
	 */
	public static final String ZW_GET = "/zw.shtm";

	/**
	 * 根据日期查询所有班次的座位
	 */
	public static final String ZWS_GET = "/zws.shtm";

	/**
	 * 车票购买
	 */
	public static final String CHEPIAO_GOUMAI = "/cpgm.shtm";

	/**
	 * 车票查询
	 */
	public static final String CHEPIAO_GET = "/cpcx.shtm";

	/**
	 * 车票删除
	 */
	public static final String CHEPIAO_DEL = "/cpsc.shtm";

	/**
	 * 用户自动注册
	 */
	public static final String USER_AUTO_ZC = "/zc.shtm";

	/**
	 * 用户自动注册
	 */
	public static final String USER_LOGIN = "/login.shtm";

	/**
	 * 退出登录
	 */
	public static final String EXIT_LOGIN = "/exitLogin.shtm";

	/**
	 * 使用条款保存
	 */
	public static final String TERMS_SAVE = "/terms_save.shtm";
	/**
	 * WEB售票资料保存
	 */
	public static final String WEBSPZL_SAVE = "/spzl_save.shtm";
	/**
	 * WEB售票资料Id
	 */
	public static final String WEBSPZL_GETBYID = "/spzl_getById.shtm";
	/**
	 * WEB售票资料编辑
	 */
	public static final String WEBSPZL_UPDATE = "/spzl_update.shtm";
	/**
	 * WEB售票资料删除
	 */
	public static final String WEBSPZL_DELETE = "/spzl_delete.shtm";
	/**
	 * WEB售票资料发布
	 */
	public static final String WEBSPZL_PUBLIC = "/spzl_public.shtm";
	/**
	 * 使用条款查询
	 */
	public static final String TERMS_GET = "/terms_get.shtm";

	/**
	 * 使用条款编辑
	 */
	public static final String TERMS_getById = "/terms_getById.shtm";
	/**
	 * 使用条款删除
	 */
	public static final String TERMS_DELETE = "/terms_delete.shtm";

	/**
	 * 使用条款发布
	 */
	public static final String TERMS_PUBLIC = "/terms_public.shtm";

	/**
	 * 用户信息查询
	 */
	public static final String USER_GET = "/user_get.shtm";
	/**
	 * 用户信息新增
	 */
	public static final String USER_SAVE = "/user_save.shtm";
	/**
	 * 用户Id查询
	 */
	public static final String USER_getById = "/user_getById.shtm";
	/**
	 * 用户删除
	 */
	public static final String USER_DELETE = "/user_delete.shtm";
	/**
	 * 预加载
	 */
	public static final String DISPATCHER = "/dispatcher.shtm";

	/**
	 * 加载分页的数据
	 */
	public static final String PAGE_LOAD = "/load_page_data.shtm";

	/**
	 * 加载分页的结构，如多少页
	 */
	public static final String PAGE_LOAD_HELP = "/load_page_help.shtm";

	/**
	 * 加密译文
	 */
	public static final String MW = "/mw.shtm";

	/**
	 * 保存常用线路
	 */
	public static final String CYXL_SAVE = "/save_cyxl.shtm";

	/**
	 * 查询常用线路
	 */
	public static final String CYXL_GET = "/get_cyxl.shtm";
	/**
	 * 查询使用条款
	 */
	public static final String SYTK_GET = "/sytk.shtm";

	/**
	 * 站点周边设施列表查询
	 */
	public static final String ZD_ZBSS_LIST_GET = "/get_zbsslist.shtm";
	/**
	 * 站点周边设施查询
	 */
	public static final String ZD_ZBSS_GET = "/get_zbss.shtm";
	/**
	 * ERROR
	 */
	public static final String ERROR = "pages/system/error.html";

	/**
	 * 班次Id查询
	 */
	public static final String BANCI_getById = "/banci_getById.shtm";

	/**
	 * 站点Id查询
	 */
	public static final String ZHANDIAN_getById = "/zhandian_getById.shtm";

	/**
	 * 站点基本Id查询
	 */
	public static final String ZHANDIANBASE_getById = "/zhandianbase_getById.shtm";

	/**
	 * 线路Id查询
	 */
	public static final String XIANLU_getById = "/xianlu_getById.shtm";

	/**
	 * 线路保存
	 */
	public static final String XIANLU_update = "/xianlu_update.shtm";

	/**
	 * 地区修改
	 */
	public static final String DIQU_EDIT = "/diqu_edit.shtm";

	/**
	 * 站点保存
	 */
	public static final String ZHANDIAN_update = "/zhandian_update.shtm";

	/**
	 * 站点基本保存
	 */
	public static final String ZHANDIANBASE_update = "/zhandianbase_update.shtm";

	/**
	 * 班次保存
	 */
	public static final String BANCI_update = "/banci_update.shtm";

	/**
	 * 使用条款
	 */
	public static final String JSP_TERMS = "pages/appmgr/terms.jsp";
	
	/**
	 * web售票基本资料
	 */
	public static final String JSP_WEB_SHOUPIAO = "pages/appmgr/webspzl.jsp";
	
	/**
	 * 用户基本资料管理
	 */
	public static final String JSP_USER = "pages/user/user.jsp";
	/**
	 * 周边设施资料管理
	 */
	public static final String JSP_ZBSS = "pages/appmgr/zbss.jsp";
	/**
	 * 周边设施类别管理
	 */
	public static final String JSP_ZBSSTYPE = "pages/appmgr/zbsstype.jsp";

	/**
	 * APP版本
	 */
	public static final String JSP_APPVERSION = "pages/appmgr/appversion.jsp";
	/**
	 * 地区
	 */
	public static final String JSP_DIQU = "pages/basedatamgr/diqu.jsp";
	/**
	 * 地区线路
	 */
	public static final String JSP_XIANLU = "pages/basedatamgr/xianlu.jsp";
	/**
	 * 地区线路站点
	 */
	public static final String JSP_ZHANDIAN = "pages/basedatamgr/zhandian.jsp";
	/**
	 * 地区线路站点班次
	 */
	public static final String JSP_BANCI = "pages/basedatamgr/banci.jsp";
	/**
	 * 地区站点基本数据
	 */
	public static final String JSP_BASEZD = "pages/basedatamgr/zhandian_base.jsp";
	/**
	 * 节假日
	 */
	public static final String JSP_JJR = "pages/basedatamgr/jjr.jsp";
	/**
	 * 座位图
	 */
	public static final String JSP_ZWT = "pages/basedatamgr/zwt.jsp";
	/**
	 * 所有订单管理
	 */
	public static final String JSP_ORDER_ALL = "pages/order/order_all.jsp";
	/**
	 * 有效订单管理
	 */
	public static final String JSP_ORDER_ACTIVITY = "pages/order/order_activity.jsp";
	/**
	 * 历史订单管理
	 */
	public static final String JSP_ORDER_HISTORY = "pages/order/order_history.jsp";

	public static final String JSP_LOGIN = "pages/root/login.jsp";
	/**
	 * 所有车票
	 */
	public static final String JSP_CHEPIAO_ALL = "pages/order/chepiao_all.jsp";
	public static final String JSP_CHEPIAO_DFK = "pages/order/chepiao_dfk.jsp";
	public static final String JSP_CHEPIAO_DCC = "pages/order/chepiao_dcc.jsp";
	public static final String JSP_CHEPIAO_GQ = "pages/order/chepiao_gq.jsp";
	public static final String JSP_CHEPIAO_YCC = "pages/order/chepiao_ycc.jsp";
	public static final String JSP_CHEPIAO_HISTORY = "pages/order/chepiao_history.jsp";
	/**
	 * 获取周边设施类别
	 */
	public static final String ZBSSTYPE_List_Get = "/zbsstype_list_get.shtm";
	/**
	 * 周边设施类别信息新增
	 */
	public static final String ZBSSTYPE_SAVE = "/zbsstype_save.shtm";
	/**
	 * 周边设施类别Id查询
	 */
	public static final String ZBSSTYPE_getById = "/zbsstype_getById.shtm";
	/**
	 * 周边设施类别删除
	 */
	public static final String ZBSSTYPE_DELETE = "/zbsstype_delete.shtm";
	/**
	 * 获取周边设施
	 */
	public static final String ZBSS_List_Get = "/zbss_list_get.shtm";
	/**
	 * 周边设施信息新增
	 */
	public static final String ZBSS_SAVE = "/zbss_save.shtm";
	/**
	 * 周边设施Id查询
	 */
	public static final String ZBSS_getById = "/zbss_getById.shtm";
	/**
	 * 周边设施删除
	 */
	public static final String ZBSS_DELETE = "/zbss_delete.shtm";
	/**
	 * 获取站点的id和名称
	 */
	public static final String ZD_GETLISTWITHIDANDNAME = "/zb_getListWithIdAndName.shtm";

	/**
	 * 客户渠道管理
	 */
	public static final String JSP_KFQD = "pages/appmgr/kfqd.jsp";
	/**
	 * 常用线路管理
	 */
	public static final String JSP_CYXL = "pages/appmgr/cyxl.jsp";
	/**
	 * 获取客户渠道
	 */
	public static final String KFQD_List_Get = "/kfqd_list_get.shtm";
	/**
	 * 客户渠道信息新增
	 */
	public static final String KFQD_SAVE = "/kfqd_save.shtm";
	/**
	 * 客户渠道Id查询
	 */
	public static final String KFQD_getById = "/kfqd_getById.shtm";
	/**
	 * 客户渠道删除
	 */
	public static final String KFQD_DELETE = "/kfqd_delete.shtm";

	/**
	 * 站点周边设施展示管理
	 */
	public static final String JSP_ZDZBSSZS = "pages/appmgr/zbsswzgl.jsp";

	/**
	 * 根据站点获取关联的周边设施
	 */
	public static final String ZBSS_getByZdId = "/zbss_getByZdId.shtm";
	public static final String JSP_CHECK_CP_ALL = "pages/chepiao/ck_cp_all.jsp";
	public static final String JSP_CHECK_CP_APP = "pages/chepiao/ck_cp_app.jsp";
	public static final String JSP_CHECK_CP_WEB = "pages/chepiao/ck_cp_web.jsp";
	public static final String JSP_CHECK_CP_ZD = "pages/chepiao/ck_cp_zd.jsp";

	/**
	 * 地区位置管理
	 */
	public static final String JSP_DQWZGL = "pages/basedatamgr/dqwzgl.jsp";

	/**
	 * 地区位置坐标更新
	 */
	public static final String DQWZGL_SAVE = "/dqwzgl_save.shtm";

	/**
	 * 
	 */
	public static final String JSP_SYSTEM_CONFIG = "pages/system/system_config.jsp";

	/**
	 * 用户类别管理
	 */
	public static final String JSP_USER_TYPE = "pages/user/userType.jsp";

	/**
	 * 车票转让记录页面
	 */
	public static final String JSP_CHEPIAO_TRANSFER = "pages/chepiao/ticket_transfer.jsp";

	/**
	 * 用户类别列表
	 */
	public static final String USER_TYPE_List_Get = "/userType_list_get.shtm";
	/**
	 * 用户类别新增
	 */
	public static final String USER_TYPE_SAVE = "/userType_save.shtm";
	/**
	 * 用户类别Id查询
	 */
	public static final String USER_TYPE_getById = "/userType_getById.shtm";
	/**
	 * 用户类别删除
	 */
	public static final String USER_TYPE_DELETE = "/userType_delete.shtm";

	/**
	 * 用户类别保存权限
	 */
	public static final String USER_TYPE_SAVEPERMISSION = "/userType_savePermission.shtm";

	/**
	 * 用户类别获取权限
	 */
	public static final String USER_TYPE_GETPERMISSION = "/userType_getPermission.shtm";

	public static final String USER_TYPE_INITPERTREE = "/userType_initPerTree.shtm";

	/**
	 * 站点位置管理
	 */
	public static final String JSP_ZDWZGL = "pages/basedatamgr/zdwzgl.jsp";

	/**
	 * 站点位置更新
	 */
	public static final String ZDWZ_SAVE = "/zdwz_save.shtm";

	/**
	 * 获取地区
	 */
	public static final String DQ_List_Get = "/dq_list_get.shtm";

	/**
	 * 地区ID查询
	 */
	public static final String DQ_GET_BY_ID = "/dq_get_by_id.shtm";

	/**
	 * 根据地区获取站点
	 */
	public static final String ZD_LIST_GET_BY_DQ_ID = "/zd_list_getByDiQuId.shtm";

	/**
	 * APP版本列表
	 */
	public static final String APPVERSION_LIST_GET = "/appversion_list_get.shtm";
	/**
	 * APP版本新增
	 */
	public static final String APPVERSION_SAVE = "/appversion_save.shtm";
	/**
	 * APP版本Id查询
	 */
	public static final String APPVERSION_getById = "/appversion_getById.shtm";
	/**
	 * APP版本删除
	 */
	public static final String APPVERSION_DELETE = "/appversion_delete.shtm";
	/**
	 * APP版本更新
	 */
	public static final String APPVERSION_UPDATE = "/appversion_update.shtm";

	/**
	 * 系统参数修改
	 */
	public static final String SYSTEMCONFIG_UPDATE = "/systemconfig_update.shtm";

	/**
	 * 系统参数查看
	 */
	public static final String SYSTEMCONFIG_GET_BY_ID = "/systemconfig_get_by_id.shtm";

	/**
	 * 系统参数默认值
	 */
	public static final String SYSTEMCONFIG_DEFAULT = "/systemconfig_default.shtm";

	/**
	 * 地区站点位置关联
	 */
	public static final String JSP_DQ_ZD_GL = "pages/basedatamgr/dqzdwzgl.jsp";
	
	/**
	 * 修改密码	
	 */
	public static final String MODIFY_PWD = "/modify_pwd.shtm";

}
