package com.xinyue.server.controller.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.model.Member;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.been.EmailBean;
import com.xinyue.server.been.RecommendCredit;
import com.xinyue.server.been.RecommendInfo;
import com.xinyue.server.been.RecommendMember;
import com.xinyue.server.service.CommonService;
import com.xinyue.server.service.RecommendService;

/**
 * 
 * @author wenhai.you
 * @2015年7月24日
 * @下午1:16:37
 */
@Controller
@RequestMapping("/member/recommendctr")
public class RecommendController {

	@Resource
	private RecommendService rbiz;
	
	@Resource
	private CommonService cbiz;
	
	@RequestMapping("/show")
	public String show(Model model , HttpServletRequest req){
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		String code = member.getInvitationCode();
		model.addAttribute("member", rbiz.getRecommendMember("2015"));
		model.addAttribute("credit", rbiz.getRecommendCredit("2015"));
		model.addAttribute("code", code);
		return "screens/member/recommend";
	}
	

	@RequestMapping("/emailMember")
	@ResponseBody
	public String emailMember(RecommendMember member, HttpServletRequest req){
		
		boolean result = new EmailBean().sendMail(member.getOrdinaryEmail(), "网站登录地址", member.getOrdinaryLink());
		if(result){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/emailCredit")
	@ResponseBody
	public String emailCredit(RecommendCredit credit, HttpServletRequest req){
		
		boolean result = new EmailBean().sendMail(credit.getCreditEmail(), "网站登录地址", credit.getCreditLink());
		if(result){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/telMember")
	@ResponseBody
	public String telMember(RecommendMember member, HttpServletRequest req){
		
		boolean result = cbiz.sendCode(member.getOrdinaryTel(),member.getOrdinaryLink());
		if(result){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/telCredit")
	@ResponseBody
	public String telCredit(RecommendCredit credit, HttpServletRequest req){
		
		boolean result = cbiz.sendCode(credit.getCreditTel() , credit.getCreditLink());
		if(result){
			return "success";
		}else{
			return "fail";
		}
	}
	
	@RequestMapping("/findMember")
	public String findMember(Model model , HttpServletRequest req , RecommendInfo reinfo){
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		reinfo.setMemberid(member.getMemberid());
		model.addAttribute("pageMember", rbiz.findRecommendMember(reinfo));
		model.addAttribute("reinfo", reinfo);
		return "screens/member/recmember";
	}
	
	@RequestMapping("/findCredit")
	public String findCredit(Model model , HttpServletRequest req , RecommendInfo reinfo){
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		reinfo.setMemberid(member.getMemberid());
		model.addAttribute("pageCredit", rbiz.findRecommendCredit(reinfo));
		model.addAttribute("reinfo", reinfo);
		return "screens/member/recmember";
	}
}
