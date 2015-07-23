package com.xinyue.server.controller.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import com.xinyue.manage.beans.PageInfo;
import com.xinyue.manage.beans.SearchOrder;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.service.MemberService;
import com.xinyue.manage.service.OrderService;
import com.xinyue.manage.service.ProductService;
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.manage.util.GlobalConstant;

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
	
	
	//可以删除
	@RequestMapping({"/","/index","index.jsp","index.html"})
	public ModelAndView welcome(HttpSession session,int index) {
System.out.println("welcome");
		ModelAndView mv = new ModelAndView("screens/member/member_index");
		//测试用
		String id = "62aa452a34234048b548ff862e91a968";
		Member member = memberService.editMember(id);
//System.out.println(member);
//System.out.println(member.getContactName());
		session.setAttribute("user", member);
		mv.addObject("product", productService.getListByRecommend(GlobalConstant.PRODUCT_RECOMMEND_ON));
	
		mv.addObject("order", orderService.getListByMemberId(id, new SearchOrder(), GlobalConstant.PAGE_SIZE, 0));
		
		PageInfo pageInfo = new PageInfo();
		CommonFunction cf = new CommonFunction();
		// 分页传值
		int countAll = orderService.getCountByMemberId(id, new SearchOrder());

		pageInfo = cf.pageList(countAll, index + 1);
		mv.addObject("page", pageInfo);
		
		return mv;
	}

}
