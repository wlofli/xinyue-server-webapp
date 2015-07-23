package com.xinyue.server.controller.member;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.xinyue.authe.AutheManage;
import com.xinyue.manage.beans.PageInfo;
import com.xinyue.manage.beans.SearchOrder;
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
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.manage.util.GlobalConstant;

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

	@RequestMapping("list")
	public String getList(Model	model , int index, @ModelAttribute("order")SearchOrder searchOrder,HttpSession session){
		
System.out.println("list");
System.out.println(index);
		String string = (String)session.getAttribute("id");
		
		
		List<Order> orderList = orderService.getListByMemberId(string, searchOrder, GlobalConstant.PAGE_SIZE , index);
		model.addAttribute("search", orderService.getStatus(GlobalConstant.ORDER_INIT));
		model.addAttribute("list", orderList);
		
		PageInfo pageInfo = new PageInfo();
		CommonFunction cf = new CommonFunction();
		
		// 分页传值
		int countAll = orderService.getCountByMemberId(string, searchOrder);

		pageInfo = cf.pageList(countAll, index + 1);
		model.addAttribute("page", pageInfo);
		
		
		return "screens/order/orderList";
	}
	
	@RequestMapping("graph")
	public String getGraphList(Model model , int index, @ModelAttribute("order")SearchOrder searchOrder,HttpSession session){
System.out.println("graph");
//System.out.println(index);
		String string = (String)session.getAttribute("id");
		List<Order> orderList = orderService.getListByMemberId(string, searchOrder, GlobalConstant.PAGE_SIZE , index);
		model.addAttribute("search", orderService.getStatus(GlobalConstant.ORDER_INIT));
		model.addAttribute("list", orderList);
		
		PageInfo pageInfo = new PageInfo();
		CommonFunction cf = new CommonFunction();
		
		// 分页传值
		int countAll = orderService.getCountByMemberId(string, searchOrder);

		pageInfo = cf.pageList(countAll, index + 1);
		model.addAttribute("page", pageInfo);
				
		return "screens/order/orderGraphList";
	}
	
	
	
	
	@RequestMapping("detail/applicant")
	public String getDetail(Model model, String id, String status){
		Order order  = orderService.getOrder(id);
		model.addAttribute("order", order);
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(order.getMemberId());
		
		//第一页申请人信息
		Applicant applicant;
System.out.println("applicantsave  = " + order.getApplicantSave());
		if(order.getApplicantSave() == 0){
			applicant = companyInfoService.getApplicantInfoById(order.getMemberId());
		}else {
			applicant = companyInfoService.getApplicantInfoById(order.getApplicantInfo());
		}
		model.addAttribute("applicationInfo", applicant);
		
		return "screens/order/orderApplicant";
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
	
	

}
