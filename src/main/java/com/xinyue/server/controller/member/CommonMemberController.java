package com.xinyue.server.controller.member;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.apache.commons.httpclient.HttpMethod;
import org.springframework.http.HttpRequest;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.service.CityService;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.manage.util.SecurityUtils;
import com.xinyue.server.been.PwdInfo;
import com.xinyue.server.service.CommonMemberService;
import com.xinyue.server.service.CommonService;

/**
 * 
 * @author wenhai.you
 * @2015年7月16日
 * @下午4:26:04
 */
@Controller
@RequestMapping("/member/commonctr")
public class CommonMemberController {

	@Resource
	private CommonMemberService cbiz;
	
	@Resource
	private SelectService sbiz;
	
	@Resource
	private CommonService cmbiz;
	
	@Resource
	private CityService csbiz;
	
	@RequestMapping("/show")
	public String show(Model model , HttpServletRequest req){
		Member m = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		Member member = cbiz.getBasicMember(m.getId());
		System.out.println(member);
		model.addAttribute("member", member);
		List<SelectInfo> province = sbiz.findProvince();
		model.addAttribute("province", province);
		return "screens/member/member";
	}
	
	@RequestMapping(value = "/save" , method = RequestMethod.POST)
	@ResponseBody
	public String save(Member member , HttpServletRequest req){
		boolean b = cbiz.saveMember(member);
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/showpwd")
	public String showpwd(Model model){
		model.addAttribute("pwdinfo", new PwdInfo());
		return "screens/member/upwd";
	}
	
	@RequestMapping("/chkpwd")
	@ResponseBody
	public boolean chkPwd(Model model , String password , HttpServletRequest req){
		Member m = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		return cbiz.inspectPwd(m.getId(), password);
	}
	
	@RequestMapping(value = "/updatepwd" , method = RequestMethod.POST)
	@ResponseBody
	public String updatepwd(Model model , @RequestBody String password, HttpServletRequest req){
		Member m = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		boolean b = cbiz.updatePwd(m.getId(), password);
		if(b){
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("/showtel")
	public String showtel(Model model , HttpServletRequest req){
		Member m = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		PwdInfo member = new PwdInfo();
		member.setConfirmPhone(cbiz.findTel(m.getId()));
		model.addAttribute("member", member);
		return "screens/member/verify";
	}
	
	@RequestMapping("/tel")
	@ResponseBody
	public String tel(@RequestBody String tel , HttpServletRequest req){
		String code = SecurityUtils.randomStr(4);
		boolean result = cmbiz.sendCode(tel , code);
		if(result){
			req.getSession().setAttribute(GlobalConstant.SESSION_COMMON_CODE, code);
			return "success";
		}
		return "fail";
	}
	
	@RequestMapping("/updatetel")
	@ResponseBody
	public String updatetel(PwdInfo member , HttpServletRequest req){
		
		Object code = req.getSession().getAttribute(GlobalConstant.SESSION_COMMON_CODE);
		Member m = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		if(member.getCode().equalsIgnoreCase(code.toString())){
			boolean b = cbiz.updateTel(m.getId(), member.getContactPhone());
			if(b){
				return "success";
			}
		}
		return "fail";
	}
}
