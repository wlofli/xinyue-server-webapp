package com.xinyue.server.controller.member;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;

import com.xinyue.manage.beans.SearchReward;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.OutLine;
import com.xinyue.manage.model.Reward;
import com.xinyue.manage.model.WithdrawMoney;
import com.xinyue.manage.service.RewardService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.model.Page;
import com.xinyue.server.service.CommonMemberService;

/**
 * author lzc
 */
@Controller
@RequestMapping("reward")
@SessionAttributes(value=GlobalConstant.SESSION_MEMBER_INFO)
public class RewardController {

	@Resource
	private RewardService rewardService;
	
	@Resource
	private CommonMemberService commonMemberService;
	
	
	@RequestMapping("/reward/list")
	public String getRewardList(@ModelAttribute(GlobalConstant.SESSION_MEMBER_INFO) Member member ,HttpSession session, Model model, 
			@RequestParam(defaultValue= "0")int index, @ModelAttribute("search")SearchReward searchReward ){
System.out.println(member.getId());
		OutLine outline = rewardService.getOutLine(member.getId());
System.out.println(outline);
		List<Reward> reward = rewardService.getRewardList(member.getId(), index * GlobalConstant.PAGE_SIZE, 
				GlobalConstant.PAGE_SIZE,searchReward);
		
		//分页
		Page page = new Page();
		int countAll = rewardService.countRewardList(member.getId(), searchReward);
		page.setTotalNum(countAll);
		page.setPageNo(index);
		page.setPageSize(GlobalConstant.PAGE_SIZE);
		model.addAttribute("page", page);
		
		model.addAttribute("member", member);
		model.addAttribute("rewardList", reward);
		model.addAttribute("outline", outline);
		return "screens/reward/rewardList";
	}
	
	
	@RequestMapping("/withdraw/list")
	public String getWithdrawList(HttpSession session, Model model, @ModelAttribute(GlobalConstant.SESSION_MEMBER_INFO) Member member ,
			@RequestParam(defaultValue= "0")int index, @ModelAttribute("search")SearchReward searchReward ){
		OutLine outline = rewardService.getOutLine(member.getId());
		
		List<WithdrawMoney> withdraw = rewardService.getRewardWithdrawList(member.getId(), index * GlobalConstant.PAGE_SIZE, 
				GlobalConstant.PAGE_SIZE, searchReward);
		//分页
		Page page = new Page();
		int countAll = rewardService.countRewardWithdraw(member.getId(), searchReward);
		page.setTotalNum(countAll);
		page.setPageNo(index);
		page.setPageSize(GlobalConstant.PAGE_SIZE);
		model.addAttribute("page", page);
		model.addAttribute("withdrawList", withdraw);
		model.addAttribute("outline", outline);
		
		return "screens/reward/withdrawList";
	}
	
	
	@RequestMapping("withdraw")
	public String withdraw(@ModelAttribute(GlobalConstant.SESSION_MEMBER_INFO) Member member ,Model model, HttpSession session){
		OutLine outline = rewardService.getOutLine(member.getId());
		model.addAttribute("outline", outline);
		
		return "screens/reward/withdraw";
	}
	
	
	@RequestMapping("addwithdraw")
	public String addWithdraw(Model model, HttpSession session, float withdrawPrice){
System.out.println("withdrawPrice = " + withdrawPrice);
		return "screens/reward/withdraw2";
	}
	
	
	@RequestMapping("bind")
	public String bind(Model model, HttpSession session){
		return "screens/reward/bind";
	}
	
	@RequestMapping("addbind")
	public String addBind(Model model, HttpSession session,String type){
		if (type.equals("alipay")) {
			return "screens/reward/bindAlipay";
		}else if(type.equals("bank")) {
			return "screens/reward/bindBank";
		}else {
			return "";
		}
	}
	
	@RequestMapping("bindalipay")
	public String BindAlipay(String account, @ModelAttribute(GlobalConstant.SESSION_MEMBER_INFO)Member member,
			Model model){
		String memberphone = commonMemberService.findTel(member.getId());
		StringBuffer phone = new StringBuffer(memberphone);
		phone.replace(3, 7, "***");
System.out.println(phone);
		model.addAttribute("phone", phone);
		return "screens/reward/bindAlipay2";
	}
	
	
	@RequestMapping("bindalipay2")
	public String BindAlipay2(HttpSession session, String authcode){
		Member m = (Member) session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		String code = (String) session.getAttribute(GlobalConstant.SESSION_BIND_ALIPAY_CODE);
		if(code.equals(authcode)){
//			undone->做一些操作
			
		}else {
			//绑定失败返回界面
		}
		
		
		return "screens/reward/bindAlipay3";
	}
	
	@RequestMapping("bindbank")
	public String BindBank(){
		return "screens/reward/bindBank2";
	}
	
	@RequestMapping("bindbank2")
	public String BindBank2(HttpSession session, String authcode){
		Member m = (Member) session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		String code = (String) session.getAttribute(GlobalConstant.SESSION_BIND_BANK_CODE);
		return "screens/reward/bindBank3";
	}
	
	
	
	
}
