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
	
	@RequestMapping(value="/authentication/page")
	public String gotoAuthentication(Model model) {
		
		Authentication authentication = new Authentication();
		authentication.setContactSex(3);
		model.addAttribute("authInfo", authentication);
		
		return "screens/member/member_auth";
	}
	
	@RequestMapping(value="/auth/file/add")
	public @ResponseBody String addFile(String suffix,HttpServletRequest request) {
		
		SimpleDateFormat df = new SimpleDateFormat("YYYY_MM_dd");
		//路径
		String imagePath = "authentication/temp/"+df.format(new Date())+"/";
		
		//保存图片
		String result = commonService.saveImage(request,suffix,imagePath);
		
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
	public String name(HttpServletRequest request, Model model,Authentication authInfo) {
		
		Member member = (Member) request.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		SimpleDateFormat df = new SimpleDateFormat("YYYY_MM_dd");
		//路径
		String imgPath = "authentication/"+df.format(new Date())+"/";
		
		boolean result = authenticationService.saveMemberAuth(authInfo,imgPath,member.getLoginName());
		
		if (result) {
			return "screens/member/member_auth";
		}else {
			return "screens/member/member_auth";
		}
		
	}
}
