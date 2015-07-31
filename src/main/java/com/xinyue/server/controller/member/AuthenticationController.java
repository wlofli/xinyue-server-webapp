package com.xinyue.server.controller.member;

import java.text.SimpleDateFormat;
import java.util.Date;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.model.Authentication;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.service.AuthenticationService;
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.service.CommonService;

/**
 * 实名认证
 * @author MK)茅
 * @version v1.0
 * @date 创建时间：2015年7月18日
 */
@Controller
@RequestMapping("/member")
public class AuthenticationController {

	@Resource
	private CommonService commonService;
	
	@Resource
	private AuthenticationService authenticationService;
	
	protected static String SHOWPATH = CommonFunction.getValue("down.path");
	
	@RequestMapping(value="/authentication/page")
	public String gotoAuthentication(Model model,HttpServletRequest request) {
		
		String retPath = "";
		
		Authentication authentication = null;
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		authentication = authenticationService.findByMemberId(member.getId());
		
		if (authentication == null) {
			authentication = new Authentication();
			authentication.setContactSex(3);
			retPath = "screens/member/member_auth";
		}else {
			int status = Integer.parseInt(authentication.getAuthenticationStatus());
			switch (status) {
			case 0:
				retPath = "screens/member/auth_wait";
				break;
			case 1:
				retPath = "screens/member/auth_detail";
				model.addAttribute("imgPath", SHOWPATH);
				break;
			case 2:
				retPath = "screens/member/auth_fail";
				break;
			default:
				break;
			}
		}
		
		model.addAttribute("authInfo", authentication);
//		model.addAttribute("message", "show");
		
		return retPath;
	}
	
	@RequestMapping(value="/auth/file/add")
	public @ResponseBody String addFile(String suffix,HttpServletRequest request) {
		
		SimpleDateFormat df = new SimpleDateFormat("YYYY_MM_dd");
		//路径
		String imagePath = "authentication/temp/"+df.format(new Date())+"/";
		
		//保存图片
		String result = commonService.saveFile(request,suffix,imagePath);
		
		return result;
	}
	
	/**
	 * 实名认证保存
	 * @param request
	 * @param model
	 * @param authInfo
	 * @return
	 */
	@RequestMapping(value="/auth/submit",method=RequestMethod.POST)
	public String saveAuthentication(HttpServletRequest request, Model model,Authentication authInfo) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		SimpleDateFormat df = new SimpleDateFormat("YYYY_MM_dd");
		//路径
		String imgPath = "authentication/"+df.format(new Date())+"/";
		
		boolean result = authenticationService.saveMemberAuth(authInfo,imgPath,member.getId());
		
		model.addAttribute("authInfo", authInfo);
		model.addAttribute("imgPath", SHOWPATH);
		if (result) {
			model.addAttribute("message", "true");
		}else {
			model.addAttribute("message", "false");
		}
		return "screens/member/member_auth";
		
	}
	
	@RequestMapping("/auth/wait")
	public String gotoWait() {
		
		return "screens/member/auth_wait";
	}
	
	@RequestMapping(value="/authentication/modify")
	public String modifyAuth(Model model,HttpServletRequest request) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		Authentication authentication = authenticationService.findByMemberId(member.getId());
		
		authentication.setAuthenticationStatus("0");
		
		boolean result = authenticationService.updateAuthenticationStatusByCode(authentication, member.getId());
		
		if (result) {
			model.addAttribute("authInfo", authentication);
			model.addAttribute("imgPath", SHOWPATH);
		}
		
		return "screens/member/member_auth";
	}
	
	
}
