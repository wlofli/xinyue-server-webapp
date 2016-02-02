package com.xinyue.server.controller.member;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.xinyue.manage.beans.PageInfo;
import com.xinyue.manage.beans.Recommend;
import com.xinyue.manage.beans.RecommendCredit;
import com.xinyue.manage.beans.RecommendMember;
import com.xinyue.manage.beans.SearchOrder;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.Order;
import com.xinyue.manage.service.MemberService;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.service.ProductService;
import com.xinyue.manage.service.RewardService;
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.service.RecommendService;

/**
 * author lzc
 * 2015年7月15日下午2:04:30
 */
@Controller
@RequestMapping("member/home")
public class HomeController {
	
	@Resource
	private OrderService orderService;
	
	@Resource
	private MemberService memberService;
	
	@Resource
	private ProductService productService;
	
	@Resource
	private RecommendService recommendService;
	
	@Resource
	private RewardService rewardService;
	
	

	@RequestMapping({"/","/index","index.jsp","index.html"})
	public ModelAndView welcome(HttpSession session, @RequestParam(defaultValue="0")int index) {
		ModelAndView mv = new ModelAndView("screens/member/member_index");
		Member member = (Member) session.getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		
		String code = member.getInvitationCode();
		mv.addObject("product", productService.getListByRecommend(GlobalConstant.PRODUCT_RECOMMEND_ON));
		List<Order> list = orderService.getListByMemberId(member.getId(), new SearchOrder(), GlobalConstant.PAGE_SIZE, 0);
		Order order = null;
		if(list.size() > 0){
			order = list.get(0);
		}
	    mv.addObject("user", member);
	   
		mv.addObject("order",order);
		
		PageInfo pageInfo = new PageInfo();
		CommonFunction cf = new CommonFunction();
		// 分页传值
		int countAll = orderService.getCountByMemberId(member.getId(), new SearchOrder());
		
		mv.addObject("orderNum", countAll);
		
		RecommendMember recommendMember = recommendService.getRecommendMember(code);
		RecommendCredit recommendCredit = recommendService.getRecommendCredit(code);
		
		int recommendNum = 0;
		if(recommendMember != null && !recommendMember.getOrdinaryNum().isEmpty()){
			recommendNum += Integer.parseInt(recommendMember.getOrdinaryNum());
		}
		if(recommendCredit != null && !recommendCredit.getCreditNum().isEmpty()){
			recommendNum += Integer.parseInt(recommendCredit.getCreditNum());
		}
		int reward = rewardService.countRewardList(member.getId(), null);
		
		mv.addObject("recommendNum", recommendNum);
		mv.addObject("reward", reward);

		pageInfo = cf.pageList(countAll, index + 1);
		mv.addObject("page", pageInfo);
		
		
		mv.addObject("propath", ProductService.SHOW_PATH);
		
		return mv;
	}

}
