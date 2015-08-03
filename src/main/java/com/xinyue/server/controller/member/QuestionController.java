package com.xinyue.server.controller.member;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.model.Question;
import com.xinyue.server.service.QuestionService;

/**
 * 
 * @author wenhai.you
 * @2015年7月29日
 * @下午6:33:57
 */
@Controller
@RequestMapping("/member/questionctr")
public class QuestionController {
	
	@Resource
	private QuestionService qbiz;

	@RequestMapping("/show")
	public String show(Model model , HttpServletRequest req){
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		//PageData<Question> pdata = qbiz.findPage(member.getId(), req.getParameter("topage"));
		PageData<Question> pdata = qbiz.findPage("00022b625df943ab934299050c5d6f43", req.getParameter("topage"));
		model.addAttribute("questpage", pdata);
		return "screens/quest/question";
	}
}
