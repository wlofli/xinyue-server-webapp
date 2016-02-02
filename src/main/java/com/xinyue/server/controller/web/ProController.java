package com.xinyue.server.controller.web;

import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Advertising;
import com.xinyue.manage.model.CreditManagerInfo;
import com.xinyue.manage.model.FastProductApplicant;
import com.xinyue.manage.model.FastProductCompany;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.NewInfo;
import com.xinyue.manage.model.Order;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.model.Select;
import com.xinyue.manage.service.AdvertisingService;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.service.MemberService;
import com.xinyue.manage.service.NewService;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.service.ProductService;
import com.xinyue.manage.service.ProductTypeService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.manage.util.SericalNumber;
import com.xinyue.server.bean.ProductSearch;
import com.xinyue.server.service.CommonMemberService;
import com.xinyue.server.service.ProductCollectService;

/**
 * 
 * @author wenhai.you
 * @2015年8月27日
 * @下午3:40:36
 */
/**
 * lzc 15-12-07 checkMobile  添加返回用户未登录标志
 *
 */
@Controller
@RequestMapping("/product")
public class ProController {

	@Resource
	private CityService cityService;
	
	@Resource
	private ProductCollectService pbiz;
	@Resource 
	private MemberService memberService;
	@Resource 
	private OrderService orderService;
	@Resource
	private ProductService productService;
	@Resource
	private SelectService selectService;
	@Resource
	private ProductTypeService productTypeService;
	@Resource
	private CommonMemberService cbiz;
	@Resource
	private NewService newService;
	@Resource
	private AdvertisingService advertisingService;
	
	@RequestMapping("/show")
	public String show(HttpServletRequest req , Model model , ProductSearch psearch){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "product");
		//查询条件
		model.addAttribute("psearch", psearch);
		//省
		List<SelectInfo> provinces = cityService.getAllProvince();
		model.addAttribute("provinces", provinces);
		//机构
		model.addAttribute("org", pbiz.getOrgs());
		//产品类型
		model.addAttribute("producttype", pbiz.findByStatus());
		//产品
		model.addAttribute("propage", pbiz.findProductPageData(psearch));
		//电话号码
		Member member = (Member) req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		if(!GlobalConstant.isNull(member)){
			model.addAttribute("phone", true);
		}
		model.addAttribute("showpath", pbiz.SHOW_PATH);
		initFastApplicant(model);
		return "screens/pro/product";
	}
	
	
	@RequestMapping("/detail")
	public String detail(HttpServletRequest req , String proid , Model model){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "product");
		//申请材料
		model.addAttribute("fileList", pbiz.findProductFileList(proid));
		//产品信息
		Product pro = pbiz.findProductById(proid);
		model.addAttribute("pro", pro);
		
		//信贷经理信息
		if(GlobalConstant.isNull(pro) || GlobalConstant.isNull(pro.getOrgid())){
			model.addAttribute("credit", new CreditManagerInfo());
		}else{
			model.addAttribute("credit", pbiz.findCreditByOrgid(pro.getOrgid()));
		}
		
		//电话号码
		Member member = (Member) req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		if(!GlobalConstant.isNull(member)){
			model.addAttribute("phone", true);
		}
		model.addAttribute("showpath", pbiz.SHOW_PATH);
		
		initFastApplicant(model);
		detailRight(model);
		return "screens/pro/detail";
	}
	
	
	
	@ResponseBody
	@RequestMapping(value="addOrder" , method=RequestMethod.POST)
	public String addOrder(HttpServletRequest req , @RequestParam(required = false)String manageId, String productId, String memberId){
		String uuid = UUID.randomUUID().toString().replaceAll("-", "");
		Member member = null;
		if(GlobalConstant.isNull(memberId)){
			member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
			memberId = member.getId();
			member = memberService.editMember(memberId);
		}else{
			member = memberService.editMember(memberId);
		}
		
		Order order = new Order();
		order.setId(uuid);
		order.setCreatedId(memberId);
		order.setModifiedId(memberId);
		order.setMemberId(memberId);
		order.setCreditManagerId(manageId);
		order.setCode(SericalNumber.getInstance().generaterNextNumber());
		order.setProductInfo(productId);
		order.setApplicatPerson(member.getContactName());
		order.setLinkPhone(member.getContactPhone());
		Product product = productService.getProductById(productId);
		order.setBank(product.getOrg().getId());
		try {
			orderService.addOrder(order);
		} catch (Exception e) {
			// TODO: handle exception
			return GlobalConstant.RET_FAIL;
		}
		return uuid;
	}
	
	
	@RequestMapping(value = "/checkMobile" , method=RequestMethod.POST)
	@ResponseBody
	public String checkMobile(String mobile, Model model , HttpServletRequest req){
		Member member = cbiz.getMemberByPhone(mobile);
//		add by lzc 添加返回用户未登录标志
//		Member m = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
//		end
		if(GlobalConstant.isNull(member)){
			return "fail";
		}else{
//			add by lzc
//			if(m == null)
//				return "register";
//			end
			return member.getId();
		}
		
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
		model.addAttribute("showPath", pbiz.SHOW_PATH);
	}
	
}
