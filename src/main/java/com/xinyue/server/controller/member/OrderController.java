package com.xinyue.server.controller.member;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
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

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.xinyue.authe.AutheManage;
import com.xinyue.manage.beans.BusinessInfos;
import com.xinyue.manage.beans.HoldInfos;
import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SearchOrder;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Applicant;
import com.xinyue.manage.model.CompanyBase;
import com.xinyue.manage.model.Control;
import com.xinyue.manage.model.Debt;
import com.xinyue.manage.model.Document;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.Order;
import com.xinyue.manage.model.RealEstate;
import com.xinyue.manage.service.CompanyInfoService;
import com.xinyue.manage.service.MemberService;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.model.Page;
import com.xinyue.server.service.CommonService;

/**
 * author lzc
 * 2015年7月16日下午2:37:33
 */
@Controller
@RequestMapping("/order")
public class OrderController {
	@Resource 
	private OrderService orderService;
	
	@Resource 
	private MemberService memberService;
	
	@Resource
	private CompanyInfoService companyInfoService;
	
	@Resource
	private CommonService commonService;
	
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
	
	@InitBinder("companyInfo")
	public void CompanyBind(WebDataBinder binder){
		binder.setFieldDefaultPrefix("companyInfo.");
	}
	
	@InitBinder("control")
	public void ControlBind(WebDataBinder binder){
		binder.setFieldDefaultPrefix("control.");
	}
	
	@InitBinder("hold")
	public void HoldBind(WebDataBinder binder){
		binder.setFieldDefaultPrefix("hold.");
	}
	
	

	@RequestMapping("list")
	public String getList(Model	model , int index, @ModelAttribute("order")SearchOrder searchOrder,HttpSession session){
//System.out.println("list");
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
	
	
	
	@RequestMapping("detail")
	public String getDetail(Model model, String id){
		Order order = orderService.getOrderInfo(id);
		model.addAttribute("order", order);
		return "screens/order/checkOrder";
	}
	
	@RequestMapping("detail/evaluate")
	public String turnEvaluate(Model model, String id){
		Order order = orderService.getOrderInfo(id);
		model.addAttribute("order", order);
		return "screens/order/evaluate";
	}
	
	@RequestMapping("save/evaluate")
	@ResponseBody
	public String saveEvaluate(Order order, HttpSession session){
		Member member = (Member) session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		try {
			orderService.updateOrderEvaluate(order, member.getId());
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
		
		//两年内信用
		List<SelectInfo> creditList = selectService
				.findSelectByType(GlobalConstant.COMPANY_CREDIT_TYPE);
		model.addAttribute("creditList", creditList);
		
		//申贷用途
		List<SelectInfo> creditPurposeList = selectService
				.findSelectByType(GlobalConstant.COMPANY_CREDIT_PURPOSE);
		model.addAttribute("purposeList", creditPurposeList);

		
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
		model.addAttribute("recordType", "applicant");
		
		return "screens/order/Applicant";
	}
	
	@RequestMapping("save/applicant")
	@ResponseBody
	public String addOrUpdateApplicant(Applicant applicant,
			@RequestParam(value="orderId") String orderId, HttpServletRequest request){
//System.out.println(orderId);
		Order order  = orderService.getOrderInfo(orderId);
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		try {
			if(order.getApplicantSave() == 0){
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				applicant.setId(uuid);
				orderService.addOrUpdateApplicant(applicant, orderId, member.getId(),0);
				
			}else {
//				applicant.setId(order.getApplicantInfo());
System.out.println(applicant.getId());
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
	public String getCompanyBase(Model model, String id, String status, HttpServletRequest request){
		Order order  = orderService.getOrderInfo(id);
		model.addAttribute("order", order);
		getPulldown(model);
System.out.println("companysave = " + order.getCompanySave());	
		//第二页企业基本信息
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		// 企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
		// 企业基本信息
		CompanyBase companyBase = new CompanyBase();
		companyBase.setYearCheck("0");
		//控股信息
		HoldInfos holdInfos = new HoldInfos();
		// 公司治理信息
		Control control = new Control();
		
	
		if(order.getCompanySave() == 0){
			if (companyDetail.containsKey("license_id") && !companyDetail.get("license_id").equals("")) {
					companyBase = companyInfoService.editCompanyBaseInfoById(companyDetail.get("license_id"));
			}
			if (companyDetail.containsKey("member_id") && !companyDetail.get("member_id").equals("")) {
				holdInfos = companyInfoService.editHoldInfoById(companyDetail.get("member_id"));
			}
			if (companyBase != null && !companyBase.getControlInfo().equals("")) {
				control = companyInfoService.editControlInfoById(companyBase.getControlInfo());
			}
		}else {
			 companyBase  = companyInfoService.editCompanyBaseInfoById(order.getLicenseInfo());
			 holdInfos = companyInfoService.getHoldInfoByOrderId(order.getId());
			 control = companyInfoService.editControlInfoById(order.getControlInfo());
System.out.println(holdInfos.getIds()[0]);
System.out.println(holdInfos.getIds()[1]);
		}
		
//System.out.println("holdInfos= "+ holdInfos);
		model.addAttribute("hold", holdInfos);
		model.addAttribute("companyInfo", companyBase);
		model.addAttribute("control", control);
		model.addAttribute("recordType", "companybase");
		
		
		return "screens/order/Company";
	}
	
	
	@RequestMapping("save/company")
	@ResponseBody
	public String addOrUpdateCompany(@RequestParam(value="orderId") String orderId, 
			@ModelAttribute("companyInfo")CompanyBase companyBase, @ModelAttribute("hold")HoldInfos hold, 
			@ModelAttribute("control")Control control, HttpServletRequest request){
//System.out.println(orderId);
			Order order = orderService.getOrderInfo(orderId);
//System.out.println(companyBase.getLegalPerson());
//System.out.println(companyBase.getPaperNumber());
//System.out.println("================================");
//System.out.println("companysave = " + order.getCompanySave());
//System.out.println(hold);
//System.out.println(hold.getMarriages()[0]);
//System.out.println(hold.getEducations()[0]);
//System.out.println("===================================");
//System.out.println(control.getIndustry());
//System.out.println(control.getPeopleNumber());
//System.out.println("companyinspection = " + companyBase);
			Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);	
		try {
			if(order.getCompanySave() == 0){
				String[]  idList = new String[2];
				for (int j = 0; j < hold.getIds().length; j++) {
					String id = UUID.randomUUID().toString().replaceAll("-", "");
					idList[j] = id;
				}
				hold.setIds(idList);
				String companyId = UUID.randomUUID().toString().replaceAll("-", "");
				String controlId = UUID.randomUUID().toString().replaceAll("-", "");
				companyBase.setId(companyId);
				companyBase.setControlInfo(controlId);
				control.setId(controlId);
System.out.println(1);
				orderService.addOrUpdateCompany(companyBase, hold, control, orderId, member.getId(), 0);
			}else {
				orderService.addOrUpdateCompany(companyBase, hold, control, orderId, member.getId(), 1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return GlobalConstant.RET_FAIL;
		}
		
			
		return GlobalConstant.RET_SUCCESS;
	}
	
	@RequestMapping("detail/business")
	public String getBusiness(Model model, String id, String status, HttpServletRequest request){
		//第三页基本经营信息
		Order order  = orderService.getOrderInfo(id);
		model.addAttribute("order", order);
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
System.out.println("businesssave = " + order.getBusinessSave());
		BusinessInfos businessInfos = new BusinessInfos();
		if(order.getBusinessSave() == 0){
			if (companyDetail != null && companyDetail.containsKey("member_id") && !companyDetail.get("member_id").equals("")) {
				businessInfos = companyInfoService.editBusinessInfoById(companyDetail.get("member_id"));
			}else{
				businessInfos = companyInfoService.initBusinessInfo();
			}
		}else {
			businessInfos = companyInfoService.editBusinessInfoById(order.getId());
		}
		model.addAttribute("businessInfos", businessInfos);
		model.addAttribute("recordType", "business");
		
		
		return "screens/order/Business";
	}
	
	@RequestMapping("save/business")
	@ResponseBody
	public String  addOrUpdateBusiness(BusinessInfos businessInfos, @RequestParam(value="orderId") String orderId,
			HttpServletRequest request, Model model){

		Order order  = orderService.getOrderInfo(orderId);
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
System.out.println("debtsave = " + order.getBusinessSave());
		try {
			if(order.getBusinessSave() == 0){
				String[]  idList = new String[3];
				for (int j = 0; j < businessInfos.getIds().length; j++) {
					String id = UUID.randomUUID().toString().replaceAll("-", "");
					idList[j] = id;
				}

//System.out.println(businessInfos.getIds().length);
//for (int i = 0; i < idList.length; i++) {
//System.out.println(idList[i]);	
//}
				businessInfos.setIds(idList);
				orderService.addOrUpdateBusiness(businessInfos, orderId, member.getId(), 0);
			}else {
				orderService.addOrUpdateBusiness(businessInfos, orderId, member.getId(), 1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return GlobalConstant.RET_FAIL;
		}
		return GlobalConstant.RET_SUCCESS;
	}
	
	@RequestMapping("detail/debt")
	public String getDebt(Model model, String id, String status, HttpServletRequest request){
		Order order  = orderService.getOrderInfo(id);
		model.addAttribute("order", order);
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
//第四页抵押与负债
System.out.println("debtsave = " + order.getDebtSave());
//System.out.println("orderid = " + order.getId());
//System.out.println("debtinfo = " + order.getDebtInfo());
		RealEstate realEstate = new RealEstate();//抵押物
		Debt debt = new Debt();//负债
		//抵质押物情况
		List<SelectInfo> collateralTypeList = selectService.findSelectByType(GlobalConstant.COMPANY_COLLATERAL_TYPE);
		model.addAttribute("collateralTypeList", collateralTypeList);
		
		
		if(order.getDebtSave() == 0){
			//企业相关信息id获取
			HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
			if (companyDetail.containsKey("debt_id") && !companyDetail.get("debt_id").equals("")) {
				debt = companyInfoService.editDebtInfoById(companyDetail.get("debt_id"));
			}
			if (companyDetail.containsKey("estate_id") && !companyDetail.get("estate_id").equals("")) {
				realEstate = companyInfoService.editRealEstateInfoById(companyDetail.get("estate_id"));
			}
		}else {
			realEstate = companyInfoService.getRealEstateInfoById(order.getRealEstate());
			debt = companyInfoService.editDebtInfoById(order.getDebtInfo());
//System.out.println(debt);
//System.out.println(realEstate);
		}

		model.addAttribute("realEstate", realEstate);
		model.addAttribute("debt", debt);
		model.addAttribute("recordType", "debt");
		
		
		return "screens/order/Debt";
	}
	
	
	@RequestMapping("save/debt")
	@ResponseBody
	public String addOrUpdateDebt(Debt debt, RealEstate realEstate,@RequestParam(value="orderId") String orderId, HttpServletRequest request){
System.out.println("save/debt");
		Order order  = orderService.getOrderInfo(orderId);
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
System.out.println(order.getDebtSave());

		try {
			if(order.getDebtSave() == 0){
				String uuid = UUID.randomUUID().toString().replaceAll("-", "");
				debt.setId(uuid);
				String uuid2 = UUID.randomUUID().toString().replaceAll("-", "");
				realEstate.setId(uuid2);
				orderService.addOrUpdateDebt(debt, realEstate, orderId, member.getId(), 0);
			}else{
//				debt.setId(order.getDebtInfo());
//				realEstate.setId(order.getRealEstate());
				orderService.addOrUpdateDebt(debt, realEstate, orderId, member.getId(), 1);
			}
		} catch (Exception e) {
			// TODO: handle exception
			return GlobalConstant.RET_FAIL;
		}
		return GlobalConstant.RET_SUCCESS;
	}
	
	@RequestMapping("detail/document")
	public String getDocument(Model model, String id, HttpServletRequest request){
		Order order  = orderService.getOrderInfo(id);
		model.addAttribute("order", order);
//System.out.println("document_save = " + order.getDocumentSave());
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		//第五页上传资料信息
		int total = 0;
		List<Document> documents = new ArrayList<Document>();
		if(order.getDocumentSave() == 0){
			documents = companyInfoService.getDocumentInfoById(member.getId(),0);
			total = companyInfoService.getDocumentCount();
			try {
				orderService.addDocumentList(documents, id, member.getId());
			} catch (Exception e) {
				// TODO: handle exception
				System.out.println("error!!!");
				e.printStackTrace();
			}
		}else {
			documents = orderService.getDocumentList(id,0);
//for(Document document : documents){
//	System.out.println(document.getDocumentId());
//}
			total = orderService.getDocumentCount(id);
		}
//System.out.println(total);
		PageData<Document> pageData = new PageData<>(documents, total, 1);
		model.addAttribute("documents", documents);
		model.addAttribute("pageData", pageData);
		model.addAttribute("recordType", "document");
		return "screens/order/Document";
	}
	
	@RequestMapping("/save/file/add")
	@ResponseBody
	public String upLoadDoc(String suffix,String fileId,String typeId, 
			@RequestParam(value="orderId") String orderId, HttpServletRequest request){
System.out.println("fileId = " + fileId);
		SimpleDateFormat df = new SimpleDateFormat("YYYY_MM_dd");
		//路径
		String filePath = "record/document/"+df.format(new Date())+"/";
		//保存文件
		String result = commonService.saveFile(request,suffix,filePath);
System.out.println("result = " + result);
		String documentId = UUID.randomUUID().toString().replaceAll("-", "");
		if(fileId.equals("")){
			fileId = null;
		}
		try {
			if (!result.equals("fail")) {
				List<Map<String, Object>> jsonData = JSON.parseObject(result,new TypeReference<List<Map<String,Object>>>(){});
				jsonData.get(0).get("name");
				Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
				orderService.addOrUpdateDocument(jsonData.get(0).get("name").toString(),member.getId(),
						typeId, documentId, orderId, fileId);
			}
//				companyInfoService.updateDocument(jsonData.get(0).get("name").toString(),fileId,typeId,member.getId());
		} catch (Exception e) {
		// TODO: handle exception
		return GlobalConstant.RET_FAIL;
		}
System.out.println("return = " + documentId);
		return documentId;
	}
	
	@RequestMapping("detail/document/changepage")
	public String changePage(HttpServletRequest request,Model model,int topage,String id) {
		Order order  = orderService.getOrderInfo(id);
		model.addAttribute("order", order);
System.out.println("document_save = " + order.getDocumentSave());
		//第五页上传资料信息
		List<Document>	documents = orderService.getDocumentList(id,(topage-1)*10);
		int	total = orderService.getDocumentCount(id);
		PageData<Document> pageData = new PageData<>(documents, total, topage);
		model.addAttribute("documents", documents);
		model.addAttribute("pageData", pageData);
		model.addAttribute("recordType", "document");
		return "screens/order/Document";
	}
	
	
	/**
	 * add by lzc     date: 2015年7月28日
	 * copy from ->companyRecoreController.getpulldown
	 * no change!                    
	 */
	private void getPulldown(Model model) {
		// 证件类型
		List<SelectInfo> idTypeList = selectService
				.findSelectByType(GlobalConstant.COMPANY_IDCARD_TYPE);
		model.addAttribute("idTypeList", idTypeList);

		// 资本类型
		List<SelectInfo> capitalList = selectService
				.findSelectByType(GlobalConstant.COMPANY_CAPITAL_TYPE);
		model.addAttribute("capitalList", capitalList);
		// 企业性质
		List<SelectInfo> companyNatureList = selectService
				.findSelectByType(GlobalConstant.COMPANY_TYPE);
		model.addAttribute("companyNatureList", companyNatureList);
		// 省
		List<SelectInfo> provinceList = selectService.findProvince();
		model.addAttribute("provinceList", provinceList);
		// 工商登记类型
		List<SelectInfo> businessRegList = selectService
				.findSelectByType(GlobalConstant.COMPANY_BUSINESS_TYPE);
		model.addAttribute("businessRegList", businessRegList);
		// 机构类型
		List<SelectInfo> agencyTypeList = selectService
				.findSelectByType(GlobalConstant.COMPANY_AGENCY_TYPE);
		model.addAttribute("agencyTypeList", agencyTypeList);
		
		// 控股方式
		List<SelectInfo> holdTypeList = selectService
				.findSelectByType(GlobalConstant.COMPANY_HOLD_TYPE);
		model.addAttribute("holdTypeList", holdTypeList);

		// 学历
		List<SelectInfo> educationTypeList = selectService
				.findSelectByType(GlobalConstant.COMPANY_EDUCATION_TYPE);
		model.addAttribute("educationTypeList", educationTypeList);

		// 婚姻情况
		List<SelectInfo> marriageTypeList = selectService
				.findSelectByType(GlobalConstant.COMPANY_MARRIAGE_TYPE);
		model.addAttribute("marriageTypeList", marriageTypeList);
		
		//行业
		List<SelectInfo> industry = companyInfoService.getIndustryList();
		model.addAttribute("industry", industry);
		
		// 产品销售区域
		List<SelectInfo> businessAreaList = selectService
				.findSelectByType(GlobalConstant.COMPANY_BUSINESS_AREA);
		model.addAttribute("businessAreaList", businessAreaList);
		
		// 审计意见类型
		List<SelectInfo> auditTypeList = selectService
				.findSelectByType(GlobalConstant.COMPANY_AUDIT_TYPE);
		model.addAttribute("auditTypeList", auditTypeList);
	}
	
	
	
	
	
	

}
