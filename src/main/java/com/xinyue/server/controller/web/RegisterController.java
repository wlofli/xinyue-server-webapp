package com.xinyue.server.controller.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.model.Member;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.service.LoginService;
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
	
	@Resource
	private LoginService loginService;
	
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
	@ResponseBody
	public boolean checkEmail(String email) {
		
		boolean result = registerService.checkEmail(email);
		return result;
	}
	
	
	//modified by lzc
	//添加session,返回类型为@responsebody
	@RequestMapping(value="/register/submit",method=RequestMethod.POST)
	@ResponseBody
	public String registerSubmit(Member registerInfo, HttpServletRequest request) {
		
		boolean result = registerService.saveMember(registerInfo);
		
		if (result) {
			result = loginService.updateLoginTime(registerInfo);
			
			Member member = loginService.getMemberInfo(registerInfo);
			
			request.getSession().setAttribute(GlobalConstant.SESSION_MEMBER_INFO, member);
			return GlobalConstant.RET_SUCCESS;
		}
		return GlobalConstant.RET_FAIL;
	}
}
