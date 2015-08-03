package com.xinyue.server.controller.web;

import javax.annotation.Resource;

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
	
//	private Logger log = Logger.getLogger(RegisterController.class);
	
	@RequestMapping(value="/register/member")
	public String gotoRegister(Model model,String invitationCode) {
		
		model.addAttribute("provinces", cityService.getAllProvince());
		
		Member member = new Member();
		member.setInvited(invitationCode);
		
		model.addAttribute("registerInfo", member);
		
		return "screens/register";
	}
	
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
