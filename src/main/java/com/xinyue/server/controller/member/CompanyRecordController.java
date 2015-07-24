package com.xinyue.server.controller.member;

import java.util.HashMap;
import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.BusinessInfos;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Applicant;
import com.xinyue.manage.model.Debt;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.RealEstate;
import com.xinyue.manage.service.CompanyInfoService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;

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
	@RequestMapping(value="/save/applicant",method=RequestMethod.POST)
	public @ResponseBody String saveApplicant(Applicant applicantInfo,HttpServletRequest request) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		boolean result = companyInfoService.saveApplicant(applicantInfo, member.getId(), member.getId());
		
		if (result) {
			return "true";
		}
		
		return "false";
	}
	
	@RequestMapping(value="/record/company")
	public String gotoCompany(Model model,HttpServletRequest request) {
		model.addAttribute("recordType", "company");
		
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
		
		switch (type) {
		case "p":
			if (result) {
				model.addAttribute("message", "保存成功");
				return "redirect:/member/record/company";
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		case "s":
			model.addAttribute("recordType", "business");
			if (result) {
				model.addAttribute("message", "保存成功");
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		case "n":
			if (result) {
				model.addAttribute("message", "保存成功");
				return "redirect:/member/record/estate";
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		default:
			break;
		}
		
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
		
		switch (type) {
		case "p":
			if (result) {
				model.addAttribute("message", "保存成功");
				return "redirect:/member/record/business";
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		case "s":
			if (result) {
				model.addAttribute("message", "保存成功");
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		case "n":
			if (result) {
				model.addAttribute("message", "保存成功");
				return "redirect:/member/record/debt";
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		default:
			break;
		}
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
		
		switch (type) {
		case "p":
			if (result) {
				model.addAttribute("message", "保存成功");
				return "redirect:/member/record/estate";
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		case "s":
			//抵质押物情况
			List<SelectInfo> collateralTypeList = selectService.findSelectByType(GlobalConstant.COMPANY_COLLATERAL_TYPE);
			model.addAttribute("collateralTypeList", collateralTypeList);
			if (result) {
				model.addAttribute("message", "保存成功");
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		case "n":
			if (result) {
				model.addAttribute("message", "保存成功");
				return "redirect:/member/record/document";
			}else {
				model.addAttribute("message", "保存失败");
			}
			break;
		default:
			break;
		}
		model.addAttribute("debtInfo", debtInfo);
		model.addAttribute("recordType", "debt");
		
		return "screens/member/member_record";
	}
}
