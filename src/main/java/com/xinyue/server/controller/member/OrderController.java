package com.xinyue.server.controller.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.UUID;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import net.sf.json.JSONObject;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.InitBinder;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.authe.AutheManage;
import com.xinyue.manage.beans.SearchOrder;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Applicant;
import com.xinyue.manage.model.Business;
import com.xinyue.manage.model.CompanyBase;
import com.xinyue.manage.model.Control;
import com.xinyue.manage.model.Debt;
import com.xinyue.manage.model.Document;
import com.xinyue.manage.model.Hold;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.Order;
import com.xinyue.manage.model.RealEstate;
import com.xinyue.manage.service.CompanyInfoService;
import com.xinyue.manage.service.MemberService;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.model.Page;

/**
 * author lzc
 * 2015年7月16日下午2:37:33
 */
@Controller
@RequestMapping("order")
public class OrderController {
	
	
	@Resource 
	private OrderService orderService;
	
	@Resource 
	private MemberService memberService;
	
	@Resource
	private CompanyInfoService companyInfoService;
	
	
	@Resource
	private SelectService selectService;
	
	@InitBinder("debt")
	public void DebtBind(WebDataBinder binder){
		binder.setFieldDefaultPrefix("debt.");
	}
	
	@InitBinder("realEstate")
	public void RealEstateBind(WebDataBinder binder){
		binder.setFieldDefaultPrefix("realEstate.");
	}
	
	@InitBinder("")
	
	

	@RequestMapping("list")
	public String getList(Model	model , int index, @ModelAttribute("order")SearchOrder searchOrder,HttpSession session){
System.out.println("list");
System.out.println(index);
		Member member = (Member)session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		List<Order> orderList = orderService.getListByMemberId(member.getId(), searchOrder, GlobalConstant.PAGE_SIZE , index);
		model.addAttribute("search", orderService.getStatus(GlobalConstant.ORDER_INIT));
		model.addAttribute("list", orderList);
		
		
		//分页
		Page page = new Page();
		int countAll = orderService.getCountByMemberId(member.getId(), searchOrder);
		page.setTotalNum(countAll);
		page.setPageNo(index);
		page.setPageSize(GlobalConstant.PAGE_SIZE);
		model.addAttribute("page", page);
		
		return "screens/order/orderList";
	}
	
	@RequestMapping("graph")
	public String getGraphList(Model model , int index, @ModelAttribute("order")SearchOrder searchOrder,HttpSession session){
System.out.println("graph");
//System.out.println(index);
		Member member = (Member)session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		List<Order> orderList = orderService.getListByMemberId(member.getId(), searchOrder, GlobalConstant.PAGE_SIZE , index);
		model.addAttribute("search", orderService.getStatus(GlobalConstant.ORDER_INIT));
		model.addAttribute("list", orderList);
		
		//分页
		Page page = new Page();
		int countAll = orderService.getCountByMemberId(member.getId(), searchOrder);
		page.setTotalNum(countAll);
		page.setPageNo(index);
		page.setPageSize(GlobalConstant.PAGE_SIZE);
		model.addAttribute("page", page);
				
		return "screens/order/orderGraphList";
	}
	
	
	@RequestMapping("getorder")
	public @ResponseBody String getOrder(HttpSession session, int index){
		JSONObject jsonObject = new JSONObject();
		Member member = (Member)session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		List<Order> orderList = orderService.getListByMemberId(member.getId(), new SearchOrder(), GlobalConstant.PAGE_SIZE_ONE, index);
		if(orderList != null && orderList.size() >0){
			jsonObject.accumulate("order", orderList.get(0));
			jsonObject.accumulate("result", GlobalConstant.RET_SUCCESS);
		}else {
			jsonObject.accumulate("result", GlobalConstant.RET_FAIL);
		}
System.out.println("getorder");
System.out.println(jsonObject.get("order"));
		return jsonObject.toString();
	}
	
	
	@RequestMapping("delete")
	public @ResponseBody String deleteOrder(@ModelAttribute("list")List<String> idList, HttpServletRequest request){
		try {
			orderService.deleteOrderList(idList, AutheManage.getUsername(request));
		} catch (Exception e) {
			// TODO: handle exception
			return GlobalConstant.RET_FAIL;
		}
		return GlobalConstant.RET_SUCCESS;
	}
	
	
	@RequestMapping("detail/applicant")
	public String getApplicant(Model model, String id,
			//undone ->status
			@RequestParam(required=false)String status, 
			HttpServletRequest request){
		Order order  = orderService.getOrderInfo(id);
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		model.addAttribute("order", order);
		
		//第一页申请人信息
		Applicant applicant = new Applicant();
System.out.println("applicantsave  = " + order.getApplicantSave());
		// 可接受最高利率下拉表内容
		List<SelectInfo> maxRateList = selectService
				.findSelectByType(GlobalConstant.COMPANY_MAX_RATE_TYPE);
		model.addAttribute("maxRateList", maxRateList);
		// 还款方式下拉表内容
		List<SelectInfo> repayList = selectService
				.findSelectByType(GlobalConstant.COMPANY_REPAY_TYPE);
		model.addAttribute("repayList", repayList);
		// 主要担保方式
		List<SelectInfo> guaranteeList = selectService
				.findSelectByType(GlobalConstant.COMPANY_GUARANTEE_TYPE);
		model.addAttribute("guaranteeList", guaranteeList);
		// 省
		List<SelectInfo> provinceList = selectService.findProvince();
		model.addAttribute("provinceList", provinceList);
		
		if(order.getApplicantSave() == 0){
			//企业相关信息id获取
			HashMap<String, String> companyDetail = 
					companyInfoService.getDetailIdByMemberId(member.getId());
			if (companyDetail != null && companyDetail.containsKey("applicant_id") && !companyDetail.get("applicant_id").equals("")) {
				applicant = companyInfoService.getApplicantInfoById(companyDetail.get("applicant_id"));
			}
		}else {
			applicant = companyInfoService.getApplicantInfoById(order.getApplicantInfo());
		}
		model.addAttribute("applicationInfo", applicant);
System.out.println(applicant);
System.out.println(applicant.getInterestRate());		
		model.addAttribute("recordType", "applicant");
		
		return "screens/order/Applicant";
	}
	
	@RequestMapping("save/applicant")
	@ResponseBody
	public String addOrUpdateApplicant(Applicant applicant,
			@RequestParam(value="orderId") String orderId, HttpServletRequest request){
System.out.println(orderId);
		Order order  = orderService.getOrderInfo(orderId);
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		try {
			if(order.getApplicantInfo() != null && order .getApplicantInfo() != ""){
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				applicant.setId(uuid);
				orderService.addOrUpdateApplicant(applicant, orderId, member.getId(),0);
				
			}else {
				applicant.setId(order.getApplicantInfo());
				orderService.addOrUpdateApplicant(applicant, orderId, member.getId(),1);
			}
			return GlobalConstant.RET_SUCCESS;
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
			return GlobalConstant.RET_FAIL;
		}
	}
	
	
	
	@RequestMapping("detail/companybase")
	public String getCompanyBase(Model model, String id, String status){
		Order order  = orderService.getOrder(id);
		model.addAttribute("order", order);
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(order.getMemberId());
		
		//第二页企业基本信息
		CompanyBase companyBase;//公司基本信息
		List<Hold> holdList = null;//公司控股信息
		Control control = null;//公司治理信息
System.out.println("companysave = " + order.getCompanySave());		
		if(order.getCompanySave() == 0){
			 companyBase  = companyInfoService.getCompanyBaseInfoById(companyDetail.get("license_id"));
			 //undone->member控股信息 ->公司治理信息
		}else {
			 companyBase  = companyInfoService.getCompanyBaseInfoById(order.getCompanyInfo());
			 holdList = companyInfoService.getHoldInfoByOrderId(order.getId());
		}
System.out.println(order.getMemberId());
System.out.println(companyBase);
System.out.println(companyBase.getControlInfo());
		if(companyBase.getControlInfo() != null){
			control = companyInfoService.getControlInfoById(companyBase.getControlInfo());
		}
		if(holdList == null){
			holdList = new ArrayList<Hold>();
			holdList.add(new Hold());
		}
		model.addAttribute("holdList", holdList);
		model.addAttribute("companyInfo", companyBase);
		model.addAttribute("controlinfo", control);
		
		
		return "screens/order/orderCompanyBase";
	}
	
	@RequestMapping("detail/business")
	public String getBusiness(Model model, String id, String status){
		
		Order order  = orderService.getOrder(id);
		model.addAttribute("order", order);
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(order.getMemberId());
		//第三页基本经营信息
System.out.println("businesssave = " + order.getBusinessSave());
		List<Business> businessList = null;//基本经营信息
		if(order.getBusinessSave() == 0){
			businessList = companyInfoService.getBusinessInfoById(order.getMemberId());
		}else {
			businessList = companyInfoService.getBusinessInfoById(order.getId());
		}
		model.addAttribute("businessList", businessList);
		
		
		return "screens/order/orderBusiness";
	}
	
	@RequestMapping("detail/debt")
	public String getDebt(Model model, String id, String status){
		Order order  = orderService.getOrder(id);
		model.addAttribute("order", order);
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(order.getMemberId());
		
//第四页抵押与负债
System.out.println("debtsave = " + order.getDebtSave());
		RealEstate realEstate = new RealEstate();//抵押物
		Debt debt = new Debt();//负债
		if(order.getDebtSave() == 0){
			realEstate = companyInfoService.getRealEstateInfoById(companyDetail.get("estate_id"));
			debt = companyInfoService.getDebtInfoById(companyDetail.get("debt_id"));
		}else {
			realEstate = companyInfoService.getRealEstateInfoById(order.getRealEstate());
			debt = companyInfoService.getDebtInfoById(order.getDebtInfo());
		}
		model.addAttribute("estateInfo", realEstate);
		model.addAttribute("debtInfo", debt);
		
		
		return "screens/order/orderDebt";
	}
	
	
	@RequestMapping("save/debt")
	@ResponseBody
	public String saveDebt(Debt debt, RealEstate realEstate){
System.out.println(debt);
System.out.println(debt.getRate());
System.out.println(realEstate);
		return GlobalConstant.RET_SUCCESS;
	}
	
	@RequestMapping("detail/updata")
	public String getUpData(Model model, String id, String status){
		Order order  = orderService.getOrder(id);
		model.addAttribute("order", order);
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(order.getMemberId());
		
		//第五页上传资料信息
		//上传资料信息
		//undone
		List<Document> documentList = new ArrayList<Document>();
		documentList = orderService.getDocumentInfoById(order.getId());
		model.addAttribute("documentList", documentList);
		
		return "screens/order/orderUpData";
	}
	
	
	
	
	
	
	
	

}
