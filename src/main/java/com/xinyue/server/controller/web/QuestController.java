package com.xinyue.server.controller.web;

import java.util.List;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.Member;
import com.xinyue.manage.model.Question;
import com.xinyue.manage.service.SelectService;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.QuestionBean;
import com.xinyue.server.service.QuestionService;

/**
 * 
 * @author wenhai.you
 * @2015年8月20日
 * @下午6:31:26
 */
@Controller
@RequestMapping("/quest")
public class QuestController {

	@Resource
	private QuestionService qbiz;
	@Resource
	private SelectService sbiz;
	
	@RequestMapping("/show")
	public String show(Model model , QuestionBean qbean){
		PageData<Question> pagequest = qbiz.findPage(qbean); 
		model.addAttribute("questlist", qbiz.findPopular());
		model.addAttribute("qbean", qbean);
		model.addAttribute("pagequest", pagequest);
		return "screens/quest/questlist";
	}
	
	
	@RequestMapping("/detail")
	public String detail(String questid , QuestionBean qbean, Model model , HttpServletRequest req){
		model.addAttribute("questlist", qbiz.findPopular());
		List<ShowAnswer> questdetail = qbiz.findDetailByQuestId(questid);
		String typeid = questdetail.get(0).getTypeid();
		model.addAttribute("relevant", qbiz.findRelevantByTypeId(typeid));
		if(questdetail.size()>0){
			model.addAttribute("recommendquest", questdetail.get(0));
			questdetail.remove(0);
			model.addAttribute("questdetail", questdetail);
		}else{
			model.addAttribute("recommendquest", null);
			model.addAttribute("questdetail", null);
		}
		
		
		model.addAttribute("qbean", qbean);
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		if(GlobalConstant.isNull(member)){
			model.addAttribute("answer", new Answer());
		}else{
			model.addAttribute("answer", new Answer(member.getId()));
		}
		
		return "screens/quest/questdetail";
	}
	
	@RequestMapping("/addAnswer")
	@ResponseBody
	public String answer(Answer answer){
		boolean b = qbiz.addAnswer(answer);
		if(b){
			return "success";
		}else{
			return "fail";
		}
		
	}
	
	@RequestMapping("/ask")
	public String ask(Model model , String orgid , Question qmodel){
		
		qmodel.setOrgid(orgid);
		List<SelectInfo> province = sbiz.findProvince();
		model.addAttribute("province", province);
		model.addAttribute("manager", qbiz.getManagerCount());
		model.addAttribute("qmodel", qmodel);
		model.addAttribute("qbean", new QuestionBean());
		return "screens/quest/ask";
	}
	
	
	@RequestMapping("/addQuest")
	@ResponseBody
	public String question(Question qmodel , HttpServletRequest req){
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		if(!GlobalConstant.isNull(member)){
			qmodel.setCreateid(member.getId());
		}
		boolean b = qbiz.addQuestion(qmodel);
		
		if(b){
			return "success";
		}else{
			return "fail";
		}
	}
	
	
}
