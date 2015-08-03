package com.xinyue.server.controller.member;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.xinyue.manage.beans.SearchReward;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.RewardOutLine;
import com.xinyue.manage.model.RewardReward;
import com.xinyue.manage.model.RewardWithdraw;
import com.xinyue.manage.service.RewardService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.model.Page;

/**
 * author lzc
 */
@Controller
@RequestMapping("reward")
public class RewardController {

	@Resource
	private RewardService rewardService;
	
	
	@RequestMapping("/reward/list")
	public String getRewardList(HttpSession session, Model model, 
			@RequestParam(defaultValue= "0")int index, @ModelAttribute("search")SearchReward searchReward ){

		Member member = (Member)session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
//System.out.println(member.getContactPhone());		
		RewardOutLine outline = rewardService.getOutLine(member.getId());
		
		List<RewardReward> reward = rewardService.getRewardList(member.getId(), index * GlobalConstant.PAGE_SIZE, 
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
	public String getWithdrawList(HttpSession session, Model model, 
			@RequestParam(defaultValue= "0")int index, @ModelAttribute("search")SearchReward searchReward ){
		Member member = (Member)session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		RewardOutLine outline = rewardService.getOutLine(member.getId());
		
		List<RewardWithdraw> withdraw = rewardService.getRewardWithdrawList(member.getId(), index * GlobalConstant.PAGE_SIZE, 
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
	public String withdraw(Model model, HttpSession session){

		Member member = (Member)session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		RewardOutLine outline = rewardService.getOutLine(member.getId());
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
	
	
	
}
