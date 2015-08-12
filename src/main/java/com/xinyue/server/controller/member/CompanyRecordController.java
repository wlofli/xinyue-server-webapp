package com.xinyue.server.controller.member;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.alibaba.fastjson.JSON;
import com.alibaba.fastjson.TypeReference;
import com.xinyue.manage.beans.BusinessInfos;
import com.xinyue.manage.beans.HoldInfos;
import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Applicant;
import com.xinyue.manage.model.CompanyBase;
import com.xinyue.manage.model.Control;
import com.xinyue.manage.model.Debt;
import com.xinyue.manage.model.Document;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.Rating;
import com.xinyue.manage.model.RealEstate;
import com.xinyue.manage.service.CompanyInfoService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.service.CommonService;

/**
 * 企业档案
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月21日
 */
@Controller
@RequestMapping("/member")
public class CompanyRecordController {

	@Resource
	private CompanyInfoService companyInfoService;
	
	@Resource
	private SelectService selectService;
	
	@Resource
	private CommonService commonService;
	
	/**
	 * 申请人信息
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/record/applicant")
	public String gotoApplicant(Model model,HttpServletRequest request) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
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
		
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
		
		Applicant applicant = new Applicant();
		if (companyDetail != null && companyDetail.containsKey("applicant_id") && !companyDetail.get("applicant_id").equals("")) {
			applicant = companyInfoService.getApplicantInfoById(companyDetail.get("applicant_id"));
		}
		model.addAttribute("applicationInfo", applicant);
		model.addAttribute("recordType", "applicant");
		
		return "screens/member/member_record";
	}
	
	/**
	 * 申请人信息保存
	 * @param applicantInfo
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/applicant/save",method=RequestMethod.POST)
	public String saveApplicant(Applicant applicantInfo,HttpServletRequest request,Model model,String type) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		boolean result = companyInfoService.saveApplicant(applicantInfo, member.getId(), member.getId());
		
		if (result) {
			model.addAttribute("message", "申请人信息保存成功");
			//跳转设置
			redirectParameter(type, model);
		}else {
			model.addAttribute("message", "申请人信息保存失败");
			model.addAttribute("type", "n");
		}
		
		model.addAttribute("recordType", "applicant");
		model.addAttribute("applicantInfo", applicantInfo);
		
		return "screens/member/member_record";
	}

	/**
	 * 经营信息
	 * @param model
	 * @param request
	 * @return
	 */
	@RequestMapping("/record/business")
	public String gotoBusiness(Model model,HttpServletRequest request) {
		model.addAttribute("recordType", "business");
		
		BusinessInfos businessInfos = new BusinessInfos();
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
		
		if (companyDetail != null && companyDetail.containsKey("member_id") && !companyDetail.get("member_id").equals("")) {
			businessInfos = companyInfoService.editBusinessInfoById(companyDetail.get("member_id"));
		}else{
			businessInfos = companyInfoService.initBusinessInfo();
		}
		model.addAttribute("businessInfos", businessInfos);
		
		return "screens/member/member_record";
	}
	
	/**
	 * 基本经营信息保存
	 * @param request
	 * @param model
	 * @param type
	 * @param businessInfos
	 * @return
	 */
	@RequestMapping(value="/business/save",method=RequestMethod.POST)
	public String saveBusiness(HttpServletRequest request,Model model,String type,BusinessInfos businessInfos) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		boolean result = false;
		result = companyInfoService.saveBusiness(businessInfos,member.getId(),member.getId());
		
		if (result) {
			model.addAttribute("message", "基本经营信息保存成功");
			//跳转设置
			redirectParameter(type, model);
		}else {
			model.addAttribute("message", "基本经营信息保存失败");
			model.addAttribute("type", "n");
		}
		
		model.addAttribute("recordType", "business");
		
		return "screens/member/member_record";
	}
	
	/**
	 * 抵押物信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping(value="/record/estate")
	public String gotoEstate(HttpServletRequest request,Model model) {
		model.addAttribute("recordType", "estate");
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
		RealEstate realEstate = new RealEstate();
		if (companyDetail.containsKey("estate_id") && !companyDetail.get("estate_id").equals("")) {
			realEstate = companyInfoService.editRealEstateInfoById(companyDetail.get("estate_id"));
		}
		model.addAttribute("estateInfo", realEstate);
		return "screens/member/member_record";
	}
	
	/**
	 * 资产保存
	 * @param request
	 * @param model
	 * @param type
	 * @param estateInfo
	 * @return
	 */
	@RequestMapping(value="/estate/save",method=RequestMethod.POST)
	public String saveEstate(HttpServletRequest request,Model model,String type,RealEstate estateInfo) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		boolean result = false;
		result = companyInfoService.saveEstate(estateInfo, member.getId(), member.getId());
		
		if (result) {
			model.addAttribute("message", "保存成功");
		}else {
			model.addAttribute("message", "保存失败");
			type = "n";
		}
		//跳转设置
		redirectParameter(type, model);
		
		model.addAttribute("estateInfo", estateInfo);
		model.addAttribute("recordType", "estate");
		return "screens/member/member_record";
	}
	
	/**
	 * 负债信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("/record/debt")
	public String gotoDebt(HttpServletRequest request,Model model) {
		model.addAttribute("recordType", "debt");
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		//抵质押物情况
		List<SelectInfo> collateralTypeList = selectService.findSelectByType(GlobalConstant.COMPANY_COLLATERAL_TYPE);
		model.addAttribute("collateralTypeList", collateralTypeList);
		
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
		Debt debt = new Debt();
		debt.setIsBig("0");
		if (companyDetail.containsKey("debt_id") && !companyDetail.get("debt_id").equals("")) {
			debt = companyInfoService.editDebtInfoById(companyDetail.get("debt_id"));
		}
		
		model.addAttribute("debtInfo", debt);
		
		return "screens/member/member_record";
	}
	
	/**
	 * 负债保存
	 * @param request
	 * @param model
	 * @param type
	 * @param debtInfo
	 * @return
	 */
	@RequestMapping(value="/debt/save",method=RequestMethod.POST)
	public String saveDebt(HttpServletRequest request,Model model,String type,Debt debtInfo) {
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		boolean result = false;
		result = companyInfoService.saveDebt(debtInfo, member.getId(), member.getId());
		
		//抵质押物情况
		List<SelectInfo> collateralTypeList = selectService.findSelectByType(GlobalConstant.COMPANY_COLLATERAL_TYPE);
		model.addAttribute("collateralTypeList", collateralTypeList);
		if (result) {
			model.addAttribute("message", "保存成功");
		}else {
			model.addAttribute("message", "保存失败");
			type="n";
		}
		//跳转设置
		redirectParameter(type, model);
		
		model.addAttribute("debtInfo", debtInfo);
		model.addAttribute("recordType", "debt");
		
		return "screens/member/member_record";
	}
	
	/**
	 * 企业基本信息
	 * @param request
	 * @param model
	 * @return
	 */
	@RequestMapping("record/company")
	public String gotoCompany(HttpServletRequest request,Model model) {
		model.addAttribute("recordType", "company");
		
		reLoadCompany(model,request);
		
		return "screens/member/member_record";
	}
	
	/**
	 * 企业基本信息保存
	 * @param request
	 * @param model
	 * @param type
	 * @param companyInfo
	 * @return
	 */
	@RequestMapping(value="/company/save",method=RequestMethod.POST)
	public String saveCompany(HttpServletRequest request,Model model,String type,CompanyBase companyInfo) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		boolean result = false;
		result = companyInfoService.saveCompanyBase(companyInfo, member.getId(), member.getId());
		
		if (result) {
			model.addAttribute("message", "企业基本信息保存成功");
		}else {
			model.addAttribute("message", "企业基本信息保存失败");
		}
		
		reLoadCompany(model,request);
		model.addAttribute("recordType", "company");
		model.addAttribute("tab", "1");
		
		return "screens/member/member_record";
	}
	
	/**
	 * 控股信息保存
	 * @param request
	 * @param model
	 * @param type
	 * @param holdInfos
	 * @return
	 */
	@RequestMapping(value="/hold/save",method=RequestMethod.POST)
	public String saveHold(HttpServletRequest request,Model model,String type,HoldInfos holdInfos) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		boolean result = false;
		result = companyInfoService.saveHolds(holdInfos, member.getId());
		if (result) {
			model.addAttribute("message", "控股信息保存成功");
		}else {
			model.addAttribute("message", "控股信息保存失败");
		}
		
		reLoadCompany(model,request);
		model.addAttribute("recordType", "company");
		model.addAttribute("tab", "2");
		return "screens/member/member_record";
	}
	
	/**
	 * 公司治理保存
	 * @param request
	 * @param model
	 * @param type
	 * @param controlinfo
	 * @return
	 */
	@RequestMapping(value="/control/save",method=RequestMethod.POST)
	public String saveControl(HttpServletRequest request,Model model,String type,Control controlinfo) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		boolean result = companyInfoService.saveControl(controlinfo,member.getId(),member.getId());
		

		if (result) {
			model.addAttribute("message", "治理信息保存成功");
		}else {
			model.addAttribute("message", "治理信息保存失败");
			type="n";
		}
		//跳转设置
		redirectParameter(type, model);
		
		reLoadCompany(model,request);
		model.addAttribute("recordType", "company");
		model.addAttribute("tab", "3");
		
		return "screens/member/member_record";
	}
	
	@RequestMapping("/record/rating")
	public String gotoRating(HttpServletRequest request,Model model) {
		model.addAttribute("recordType", "rating");
		
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		//企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
		Rating rating = new Rating();
		if (companyDetail.containsKey("rating_id") && !companyDetail.get("rating_id").equals("")) {
			rating = companyInfoService.editRating(companyDetail.get("rating_id"));
		}
		model.addAttribute("ratingInfo", rating);
		
		return "screens/member/member_record";
	}
	
	@RequestMapping(value="/record/document")
	public String gotoDocument(HttpServletRequest request,Model model) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		List<Document> documents = companyInfoService.getDocumentInfoById(member.getId(),0);
		int total = companyInfoService.getDocumentCount();
		PageData<Document> pageData = new PageData<>(documents, total, 1);
		model.addAttribute("documents", documents);
		model.addAttribute("pageData", pageData);
		
		model.addAttribute("recordType", "document");
		return "screens/member/member_record";
	}
	
	/**
	 * 上传文件
	 * @param suffix
	 * @param fileId
	 * @param typeId
	 * @param request
	 * @return
	 */
	@RequestMapping("/document/file/add")
	public @ResponseBody String upLoadDoc(String suffix,String fileId,String typeId,HttpServletRequest request) {
		
		String retStr = "";
		
		SimpleDateFormat df = new SimpleDateFormat("YYYY_MM_dd");
		//路径
		String filePath = "record/document/"+df.format(new Date())+"/";
		
		//保存文件
		String result = commonService.saveFile(request,suffix,filePath);
		
		if (!result.equals("fail")) {
			List<Map<String, Object>> jsonData = JSON.parseObject(result,new TypeReference<List<Map<String,Object>>>(){});
			jsonData.get(0).get("name");
			
			Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
			
			String ret = companyInfoService.updateDocument(jsonData.get(0).get("name").toString(),fileId,typeId,member.getId());
			
			if (!ret.equals("")) {
				retStr = ret;
			}else {
				retStr = "fail";
			}
		}
		
		return retStr;
	}
	
	@RequestMapping(value="document/page")
	public String changePage(HttpServletRequest request,Model model,int topage) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		List<Document> documents = companyInfoService.getDocumentInfoById(member.getId(),(topage-1)*10);
		int total = companyInfoService.getDocumentCount();
		PageData<Document> pageData = new PageData<>(documents, total, topage);
		model.addAttribute("documents", documents);
		model.addAttribute("pageData", pageData);
		
		model.addAttribute("recordType", "document");
		return "screens/member/member_record";
	}
	
	/**
	 * 下拉表
	 * @param model
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
	
	private void reLoadCompany(Model model,HttpServletRequest request){
		
		getPulldown(model);
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		// 企业相关信息id获取
		HashMap<String, String> companyDetail = companyInfoService.getDetailIdByMemberId(member.getId());
		// 企业基本信息
		CompanyBase companyBase = new CompanyBase();
		companyBase.setYearCheck("0");
		if (companyDetail.containsKey("license_id") && !companyDetail.get("license_id").equals("")) {
			companyBase = companyInfoService.editCompanyBaseInfoById(companyDetail.get("license_id"));
		}
		model.addAttribute("companyInfo", companyBase);
		
		//控股信息
		HoldInfos holdInfos = new HoldInfos();
		if (companyDetail.containsKey("member_id") && !companyDetail.get("member_id").equals("")) {
			holdInfos = companyInfoService.editHoldInfoById(companyDetail.get("member_id"));
		}
		model.addAttribute("holdInfos", holdInfos);
		
		// 公司治理信息
		Control control = new Control();
		if (companyBase != null && !companyBase.getControlInfo().equals("")) {
			control = companyInfoService.editControlInfoById(companyBase.getControlInfo());
		}
		model.addAttribute("controlinfo", control);
	}
	
	private void redirectParameter(String type,Model model){
		switch (type) {
		case "p":
			model.addAttribute("type", "p");
			break;
		case "s":
			model.addAttribute("type", "p");
			break;
		case "n":
			model.addAttribute("type", "n");
			break;
		default:
			model.addAttribute("type", "p");
			break;
		}
	}
}
