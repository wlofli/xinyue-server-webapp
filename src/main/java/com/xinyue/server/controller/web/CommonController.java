package com.xinyue.server.controller.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.service.CommonService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.manage.util.SecurityUtils;

/** *  CommonService 2015-10-20 ywh 移走
 * 共通方法
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月16日
 */
@Controller
public class CommonController {
	
	@Resource
	private CityService cityService;
	
	@Resource
	private CommonService commonService;
	
	private Logger log = Logger.getLogger(CommonController.class);
	
	@RequestMapping(value="/send/tel/code",method=RequestMethod.POST)
	public @ResponseBody String sendCode(String phone,HttpServletRequest request) {
		
		String code = SecurityUtils.randomStr(4);
		
//		boolean result = commonService.sendCode(phone,code);
		//测试用
		boolean result = true;
		
		if (result) {
			log.info("验证码发送成功---手机号："+phone+"；验证码："+code);
			request.getSession().setAttribute(GlobalConstant.SESSION_CHECK_CODE, code);
			return "true";
		}else {
			log.info("验证码发送失败!!!---手机号："+phone+"；验证码："+code);
			return "false";
		}
		
	}

	@RequestMapping(value={"/get/cities","/get/zones"})
	public @ResponseBody List<SelectInfo> getCitiesOrZones(String id,String type) {
		
		if (type.equals(GlobalConstant.TYPE_CITY)) {
			List<SelectInfo> cities = cityService.getCitiesByProvinceId(id);
			
			return cities;
		}else if (type.equals(GlobalConstant.TYPE_ZONE)) {
			List<SelectInfo> zones = cityService.getZonesByCityId(id);
			
			return zones;
		}
		return null;
	}
	
	@RequestMapping(value="/common/check/code",method=RequestMethod.POST)
	public @ResponseBody boolean checkCode(String checkCode,HttpServletRequest request) {
		try {
			String sessionCode = request.getSession().getAttribute(GlobalConstant.SESSION_CHECK_CODE).toString();
			if (checkCode.toLowerCase().equals(sessionCode.toLowerCase())) {
				return true;
			}
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		return false;
	}
	
	@RequestMapping(value="/common/check/bl",method=RequestMethod.POST)
	public @ResponseBody boolean checkBl(String bl) {
		
		try {
			String temp = bl.substring(0, 6);
			
			return cityService.findZoneByCode(temp);
		} catch (Exception e) {
			log.error(e.getMessage());
		}
		
		return false;
	}
	
	/**
	 * 
	 * add by lzc
	 * date: 2015年7月17日
	 * @param param
	 * @param session
	 * @return
	 */
	@RequestMapping("member/list")
	public String getContent(@RequestParam("param")String param,HttpSession session){
				session.setAttribute("nav", param);
				switch (param) {
				case "graph":
					return "redirect:/member/order/graph?index=0";
				case "orderlist" :
					return "redirect:/member/order/list?index=0";
				case "basic":
					return "redirect:/member/commonctr/show";
				case "updatepwd":
					return "redirect:/member/commonctr/showpwd";
				case "tel":
					return "redirect:/member/commonctr/showtel";
				case "down":
					return "redirect:/member/docctr/show";
				case "products":
					return "redirect:/member/procollectctr/show";
				case "orgs":
					return "redirect:/member/orgcollectctr/show";
				case "recommend":
					return "redirect:/member/recommendctr/show";
				case "member":
					return "redirect:/member/recommendctr/findMember";
				case "credit":
					return "redirect:/member/recommendctr/findCredit";
				case "questiontree":
					return "redirect:/member/questionctr/show";
				case "main" :
					return "redirect:/member/home/index?index=0";
				case "companyrecord" :
					return "redirect:/member/record/applicant";
				case "authentication" :
					return "redirect:/member/authentication/page";
				case "reward":
					return "redirect:/member/reward/reward/list";
				case "withdraw":
					return "redirect:/member/reward/withdraw/list";
				case "appwithdraw":
					return "redirect:/member/reward/withdraw";
				case "bind":
					return "redirect:/member/reward/bind";
				default:
					break;
				}
				return "";
			}
}
