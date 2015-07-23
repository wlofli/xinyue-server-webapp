package com.xinyue.server.controller.web;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.xinyue.manage.model.Member;
import com.xinyue.manage.service.CityService;
import com.xinyue.server.service.RegisterService;

/**
 * 注册
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月16日
 */
@Controller
public class RegisterController {

	@Resource
	private RegisterService registerService;
	
	@Resource
	private CityService cityService;
	
	private Logger log = Logger.getLogger(RegisterController.class);
	
	@RequestMapping(value="/register/member")
	public String gotoRegister(Model model) {
		
		model.addAttribute("provinces", cityService.getAllProvince());
		
		model.addAttribute("registerInfo", new Member());
		
		return "screens/register";
	}
	
//	@RequestMapping(value="/register/check/code",method=RequestMethod.POST)
//	public @ResponseBody boolean checkCode(String checkCode,HttpServletRequest request) {
//		
//		try {
//			String sessionCode = request.getSession().getAttribute(GlobalConstant.SESSION_CHECK_CODE).toString();
//			
//			if (checkCode.toLowerCase().equals(sessionCode.toLowerCase())) {
//				return true;
//			}
//		} catch (Exception e) {
//			log.error(e.getMessage());
//		}
//		return false;
//	}
	
	@RequestMapping(value="/register/check/email",method=RequestMethod.POST)
	public boolean checkEmail(String email) {
		
		boolean result = registerService.checkEmail(email);
		
		return result;
	}
	
	@RequestMapping(value="/register/submit",method=RequestMethod.POST)
	public String registerSubmit(Member registerInfo) {
		
		boolean result = registerService.saveMember(registerInfo);
		
		if (result) {
			return "demo";
		}
		return "demo";
	}
}
