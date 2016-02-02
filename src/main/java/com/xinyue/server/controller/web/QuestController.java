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
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "question");
		//显示信息
		PageData<Question> pagequest = qbiz.findPage(qbean); 
		model.addAttribute("pagequest", pagequest);
		//热门问答
		model.addAttribute("questlist", qbiz.findPopular());
		//查询条件
		model.addAttribute("qbean", qbean);
		//分类
		model.addAttribute("questtype", qbiz.findQuestType());
		return "screens/quest/questlist";
	}
	
	
	@RequestMapping("/detail")
	public String detail(String questid , QuestionBean qbean, Model model , HttpServletRequest req){
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "question");
		//热门回答
		model.addAttribute("questlist", qbiz.findPopular());
		
		List<ShowAnswer> questdetail = qbiz.findDetailByQuestId(questid);
		
		//相关问题
		ShowAnswer one = questdetail.get(0);
		String typeid = one.getTypeid();
		model.addAttribute("relevant", qbiz.findRelevantByTypeId(typeid));
		//推荐和其它回答
		
		if("1".equals(one.getRecommend())){
			model.addAttribute("recommendquest", one);
			questdetail.remove(0);
			model.addAttribute("questdetail", questdetail);
		}else{
			model.addAttribute("recommendquest", one);
			model.addAttribute("questdetail", questdetail);
		}
		
		
		//查询
		model.addAttribute("qbean", qbean);
		//回答者
		Member member = (Member)req.getSession().getAttribute(GlobalConstant.SESSION_MEMBER_INFO);
		if(GlobalConstant.isNull(member)){
			model.addAttribute("answer", new Answer());
		}else{
			model.addAttribute("answer", new Answer(member.getId()));
		}
		//分类
		model.addAttribute("questtype", qbiz.findQuestType());
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
		//显示头部位置 
		model.addAttribute(GlobalConstant.INDEX_TYPE, "question");
		qmodel.setOrgid(orgid);
		List<SelectInfo> province = sbiz.findProvince();
		model.addAttribute("province", province);
		model.addAttribute("manager", qbiz.getManagerCount());
		model.addAttribute("qmodel", qmodel);
		model.addAttribute("qbean", new QuestionBean());
		
		//分类
		model.addAttribute("questtype", qbiz.findQuestType());
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
