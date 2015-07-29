package com.xinyue.server.controller.web;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.authe.util.ImageAuthcode;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.service.LoginService;



/**
 * 前台登录
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月15日
 */
@Controller
public class LoginController {

	private Logger log = Logger.getLogger(LoginController.class);
	
	@Resource
	private LoginService loginService;
	
	/**
	 * 验证码取得
	 * @param request
	 * @param response
	 */
	@RequestMapping("/imgauthcode")
	public void ImageAuthcode(HttpServletRequest request,HttpServletResponse response){
		try{
			ImageAuthcode.authCode(request, response);
		}
		catch(Exception e){
			log.error("验证码图片错误："+e.getMessage());
		}
	}
	
	/**
	 * 普通会员登录
	 * @param request
	 * @param model
	 * @param loginInfo
	 * @return
	 */
	@RequestMapping(value="/login/submit",method=RequestMethod.POST)
	public String login(HttpServletRequest request,Model model,Member loginInfo) {
		
		boolean result = loginService.login(loginInfo);
		
		if (result) {
			//更新登录时间
			result = loginService.updateLoginTime(loginInfo);
			
			Member member = loginService.getMemberInfo(loginInfo);
			
			request.getSession().setAttribute(GlobalConstant.SESSION_MEMBER_INFO, member);
			
			return "screens/member/member_index";
			
		}else {
			model.addAttribute("message", "用户名或者密码不正确！");
			Member member = new Member();
			member.setLoginName(loginInfo.getLoginName());
			model.addAttribute("loginInfo", member);
			return "screens/login";
		}
		
	}
	
	/**
	 * 登录验证码验证
	 * @param checkCode
	 * @param request
	 * @return
	 */
	@RequestMapping(value="/login/check/code",method=RequestMethod.POST)
	public @ResponseBody boolean checkCode(String checkCode,HttpServletRequest request) {
return true;		
//		String sessionCode = request.getSession().getAttribute("randcode").toString();
//		
//		if (checkCode.toLowerCase().equals(sessionCode.toLowerCase())) {
//			return true;
//		}else {
//			return false;
//		}
		
	}
	
	@RequestMapping(value="/login/check/phone",method=RequestMethod.POST)
	public @ResponseBody boolean checkPhone(String phone) {
		
		boolean ret = false;
		
		ret = loginService.findMemberByPhone(phone);
		
		return ret;
	}
	
	@RequestMapping(value="/login/member")
	public String gotoLogin(Model model,HttpServletRequest request) {
		request.getSession().setAttribute(GlobalConstant.SESSION_MEMBER_INFO, null);
		model.addAttribute("loginInfo", new Member());
		
		return "screens/login";
	}
	
	@RequestMapping("/login/find/p")
	public String gotoFindPsw(Model model,HttpServletRequest request) {
		
		String retPath = "";
		model.addAttribute("pswInfo", new Member());
		retPath = "screens/psw/find_psw";
		return retPath;
	}
	
	@RequestMapping(value="/login/find/psw",method=RequestMethod.POST)
	public String findPsw(Model model,HttpServletRequest request,int step,Member member) {
		String retPath = "";
		
		switch (step) {
		case 1:
			model.addAttribute("pswInfo", member);
			retPath = "screens/psw/find_psw_1";
			break;
		case 2:
			model.addAttribute("pswInfo", member);
			retPath = "screens/psw/find_psw_2";
			break;
		case 3:
			boolean result = loginService.updatePsw(member);
			if (result) {
				retPath = "screens/psw/find_psw_3";
			}else {
				retPath = "screens/psw/find_psw_2";
				model.addAttribute("pswInfo", member);
				model.addAttribute("message", "更新失败");
			}
			break;
		default:
			model.addAttribute("pswInfo", new Member());
			retPath = "screens/psw/find_psw";
			break;
		}
		
		return retPath;
	}
}
