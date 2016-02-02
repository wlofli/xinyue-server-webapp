package com.xinyue.server.controller.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SearchCreditManager;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Advertising;
import com.xinyue.manage.model.City;
import com.xinyue.manage.model.CreditManagerInfo;
import com.xinyue.manage.model.FastProductApplicant;
import com.xinyue.manage.model.FastProductCompany;
import com.xinyue.manage.model.NewInfo;
import com.xinyue.manage.model.OrganizationType;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.model.Select;
import com.xinyue.manage.model.SuccessCase;
import com.xinyue.manage.service.AdvertisingService;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.service.CreditManagerService;
import com.xinyue.manage.service.NewService;
import com.xinyue.manage.service.OrganizationTypeService;
import com.xinyue.manage.service.ProductService;
import com.xinyue.manage.service.ProductTypeService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.service.SuccessCaseService;
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.ProductSearch;

/**
 * 信贷经理
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年8月12日
 */
@Controller
public class CreditManagerController {

	@Resource
	private OrganizationTypeService organizationTypeService;
	
	@Resource
	private CityService cityService;
	
	@Resource
	private ProductTypeService productTypeService;
	
	@Resource
	private ProductService productService;
	
	@Resource
	private CreditManagerService creditManagerService;
	
	@Resource
	private SuccessCaseService successCaseService;
	
	@Resource
	private AdvertisingService advertisingService;
	
	@Resource
	private SelectService selectService;
	
	@Resource
	private NewService newService;
	
	//图片路径
	private static String SHOW_PATH = CommonFunction.getValue("down.path");
	
	/**
	 * 信贷经理列表初始化
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/manager")
	public String managerListInit(HttpServletRequest request,Model model){
		
		//搜索
		SearchCreditManager search = new SearchCreditManager();
		model.addAttribute("creditManagerSearch",search);
		
		//信贷经理详细
		PageData<CreditManagerInfo> pageData = this.searchCreditManager(search);
		model.addAttribute("cmInfo", pageData.getData());
		model.addAttribute("pageData", pageData);
		//信贷经理数量
		model.addAttribute("managerCount", pageData.getTotal());
		
		initCondition(model);
		
		initFastApplicant(model);
		
		return "screens/credit/credit_list";
	}
	
	/**
	 * 信贷经理详情
	 * @param request
	 * @param model
	 * @param managerId
	 * @return
	 */
	@RequestMapping(value="/manager/detail")
	public String managerDetail(HttpServletRequest request,Model model,String managerId) {
		
		// 导航栏选中
		model.addAttribute(GlobalConstant.INDEX_TYPE, "manager");
				
		//详细信息
		CreditManagerInfo creditManagerInfo = creditManagerService.findCreditManagerInfoById(managerId);
		model.addAttribute("managerDetail", creditManagerInfo);
		
		//产品(等产品模块)
		List<Product> products = productService.getProductsByManagerId(managerId,1);
		int count = productService.getProductsCountByManagerId(managerId);
		PageData<Product> pageDataProduct = new PageData<>(products, count, 1);
		model.addAttribute("pageDataProduct", pageDataProduct);
		model.addAttribute("products", products);
		
		//成功案例
		List<SuccessCase> cases = successCaseService.findSuccessCasesByManagerId(managerId);
		model.addAttribute("detailInfo", cases);
		
		detailRight(model);
		
		initFastApplicant(model);
		
		// 图片路径
		model.addAttribute("showPath", SHOW_PATH + "/moko/images/");
		
		return "screens/credit/credit_detail";
	}
	
	/**
	 * 信贷经理列表检索
	 * @param creditManagerSearch
	 * @param type 0:全检索;1:条件检索
	 * @return
	 */
	@RequestMapping(value="/manager/search",method=RequestMethod.POST)
	public String getManagerList(SearchCreditManager creditManagerSearch,int type,HttpServletRequest request,Model model) {
		if (type==0) {
			creditManagerSearch = new SearchCreditManager();
		}
		
		//内容检索
		PageData<CreditManagerInfo> pageData = searchCreditManager(creditManagerSearch);
		model.addAttribute("pageData", pageData);
		model.addAttribute("managerCount", pageData.getTotal());
		model.addAttribute("cmInfo", pageData.getData());
		
		model.addAttribute("creditManagerSearch", creditManagerSearch);
		
		//右边快捷检索
		initFastApplicant(model);
		
		//检索条件初始化
		initCondition(model);
		
		return "screens/credit/credit_list";
	}
	
	/**
	 * 信贷经理详情产品
	 * @param page
	 * @return
	 */
	@RequestMapping(value="/manager/product",method=RequestMethod.POST)
	public String searchProducts(HttpServletRequest request,Model model,String managerId,int page) {
		
		// 导航栏选中
		model.addAttribute(GlobalConstant.INDEX_TYPE, "manager");
		// 详细信息
		CreditManagerInfo creditManagerInfo = creditManagerService
				.findCreditManagerInfoById(managerId);
		model.addAttribute("managerDetail", creditManagerInfo);

		// 产品(等产品模块)
		List<Product> products = productService.getProductsByManagerId(
				managerId, page);
		int count = productService.getProductsCountByManagerId(managerId);
		PageData<Product> pageDataProduct = new PageData<>(products, count, page);
		model.addAttribute("pageDataProduct", pageDataProduct);
		model.addAttribute("products", products);

		// 成功案例
		List<SuccessCase> cases = successCaseService
				.findSuccessCasesByManagerId(managerId);
		model.addAttribute("detailInfo", cases);

		detailRight(model);

		initFastApplicant(model);
		
		// 图片路径
		model.addAttribute("showPath", SHOW_PATH);
		
		return "screens/credit/credit_detail";
	}
	
	/**
	 * 条件检索信贷经理列表
	 * @param cmSearch
	 * @param orderType
	 * @param isAuth
	 * @return
	 */
	private PageData<CreditManagerInfo> searchCreditManager(SearchCreditManager cmSearch) {
		
		PageData<CreditManagerInfo> pageData = null;
		
		List<CreditManagerInfo> results = null;
		
		//条数
		int AllCount = creditManagerService.getCmanagersCountByConditions(cmSearch);
		
		//内容
		results = creditManagerService.findCmanagersByConditions(cmSearch);
		
		pageData = new PageData<>(results, AllCount, cmSearch.getJumpPage());
		
		return pageData;
	}
	
	/**
	 * 右边共通
	 * @param model
	 */
	private void detailRight(Model model){
		//搜索产品
		List<ProductType> productTypes = productTypeService.findProductTypeList();
		model.addAttribute("productTypes", productTypes);
		ProductSearch ps = new ProductSearch();
		model.addAttribute("psInfo", ps);
		
		//额度
		List<SelectInfo> amounts = selectService.findSelectByType(GlobalConstant.LOAN_AMOUNT);
		model.addAttribute("amounts", amounts);
		
		//贷款期限
		List<SelectInfo> loanPeriods = selectService.findSelectByType(GlobalConstant.LOAN_PERIOD);
		model.addAttribute("loanPeriods", loanPeriods);
		
		//热门资讯
		List<NewInfo> newList = newService.getNewInfoListByTime(null, 0, GlobalConstant.PAGE_SIZE);
		model.addAttribute("newlist", newList);
		
		//广告
		Advertising advertising = advertisingService.findAdByType(3);
		model.addAttribute("advert", advertising);
		model.addAttribute("showPath", SHOW_PATH);
	}
	
	/**
	 * 初始化询问
	 * @param model
	 */
	public void initFastApplicant(Model model) {
		
		model.addAttribute("applicantFast", new FastProductApplicant());
		model.addAttribute("companyFast", new FastProductCompany());
		
		//职业
		List<SelectInfo> professions = selectService.findSelectByType(GlobalConstant.PROFESSION_TYPE);
		model.addAttribute("professions", professions);
		
		//省
		List<SelectInfo> provinces = selectService.findProvince();
		model.addAttribute("provinces", provinces);
		
		//两年内信用
		List<SelectInfo> twoYearCredits = selectService.findSelectByType(GlobalConstant.COMPANY_CREDIT_TYPE);
		model.addAttribute("twoYearCredits", twoYearCredits);
		
		//名下房产类型
		List<SelectInfo> houseTypes = selectService.findSelectByType(GlobalConstant.HOUSE_TYPE);
		model.addAttribute("houseTypes", houseTypes);
		
		//证件类型
		List<SelectInfo> parpersTypes = selectService.findSelectByType(GlobalConstant.COMPANY_IDCARD_TYPE);
		model.addAttribute("parpersTypes", parpersTypes);
		
		//企业性质
		List<SelectInfo> companyTypes = selectService.findSelectByType(GlobalConstant.COMPANY_TYPE);
		model.addAttribute("companyTypes", companyTypes);
		
		//所属行业
		List<Select> industries = selectService.getIndustryList();
		model.addAttribute("industries", industries);
	}
	
	/**
	 * 检索条件初始化
	 * @param model
	 */
	private void initCondition(Model model) {
		// 导航栏选中
		model.addAttribute(GlobalConstant.INDEX_TYPE, "manager");

		// 机构类型
		List<OrganizationType> organizationTypes = organizationTypeService
				.findTypes();
		model.addAttribute("organizationTypes", organizationTypes);

		// 服务地区
		List<City> cities = cityService.findServerZones();
		model.addAttribute("cities", cities);

		// 擅长业务
		List<ProductType> goodBusinesses = productTypeService
				.findProductTypeList();
		model.addAttribute("goodBusinesses", goodBusinesses);

		// 图片路径
		model.addAttribute("showPath", SHOW_PATH);
	}
}
