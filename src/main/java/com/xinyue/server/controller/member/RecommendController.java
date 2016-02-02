package com.xinyue.server.controller.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.EmailBean;
import com.xinyue.manage.beans.Recommend;
import com.xinyue.manage.beans.RecommendCredit;
import com.xinyue.manage.beans.RecommendMember;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.service.CommonService;
import com.xinyue.manage.service.MemberService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.manage.util.MailSender;
import com.xinyue.server.bean.RecommendInfo;
import com.xinyue.server.service.RecommendService;

/**
 *  *  CommonService 2015-10-20 ywh 移走
 * @author wenhai.you
 * @2015年7月24日
 * @下午1:16:37
 */
@Controller
@RequestMapping("/member/recommendctr")
public class RecommendController {

	@Resource
	private RecommendService rbiz;
	
	@Autowired
	private MemberService mbiz;
	
	@Resource
	private CommonService cbiz;
	
	@RequestMapping("/show")
	public String show(Model model , HttpServletRequest req){
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		String code = member.getInvitationCode();
		model.addAttribute("member", rbiz.getRecommendMember(code));
		model.addAttribute("credit", rbiz.getRecommendCredit(code));
		model.addAttribute("code", code);
		return "screens/member/recommend";
	}
	
	
	
	@RequestMapping("emailHtml")
	@ResponseBody
	public String emailHtml(RecommendMember member, HttpServletRequest request){
		boolean re = new EmailBean().sendHtmlMail(member.getOrdinaryEmail(), "邀请注册", member.getOrdinaryLink(), request);
		if(re){
			
			return GlobalConstant.RET_SUCCESS;
		}else {
			return GlobalConstant.RET_FAIL;
		}
		
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
	public String findMember(Model model , HttpServletRequest req , Recommend reinfo){
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		reinfo.setMemberid(member.getId());
		model.addAttribute("pageMember", mbiz.findRecommendMember(reinfo));
		model.addAttribute("reinfo", reinfo);
		return "screens/member/recmember";
	}
	
	@RequestMapping("/findCredit")
	public String findCredit(Model model , HttpServletRequest req , Recommend reinfo){
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		reinfo.setMemberid(member.getId());
		model.addAttribute("pageCredit", mbiz.findRecommendCredit(reinfo));
		model.addAttribute("reinfo", reinfo);
		return "screens/member/reccredit";
	}
	
	@RequestMapping("/createCode")
	@ResponseBody
	public String createCode(@RequestBody String url){
		try {
			String codeimg = rbiz.createCode(url);
			if(GlobalConstant.isNull(codeimg)){
				return "fail";
			}
			return codeimg;
		} catch (Exception e) {
			// TODO: handle exception
			return "fail";
		}
	}
}
