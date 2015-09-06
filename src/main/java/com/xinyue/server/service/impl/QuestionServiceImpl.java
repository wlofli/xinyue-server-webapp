package com.xinyue.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.apache.log4j.Logger;
import org.springframework.stereotype.Service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.Question;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.QuestionBean;
import com.xinyue.server.dao.QuestionDao;
import com.xinyue.server.service.QuestionService;

/**
 * 
 * @author wenhai.you
 * @2015年7月29日
 * @下午6:30:09
 */
@Service
public class QuestionServiceImpl implements QuestionService {

	@Resource
	private QuestionDao qdao;
	private Logger logger = Logger.getLogger(QuestionServiceImpl.class);

	@Override
	public PageData<QuestionBean> findPage(String memberid, String topage) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(topage) || "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage-1)*GlobalConstant.PAGE_SIZE;
		return new PageData<QuestionBean>(qdao.findPage(memberid, start, GlobalConstant.PAGE_SIZE), qdao.getQuestionCount(memberid), currentPage);
	}

	@Override
	public PageData<Question> findPage(QuestionBean qbean) {
		// TODO Auto-generated method stub
		String topage = qbean.getTopage();
		int currentPage = GlobalConstant.isNull(topage) || "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage-1)*GlobalConstant.PAGE_SIZE;
		return new PageData<Question>(
				qdao.findPageQuestion(qbean.getQuestype(), qbean.getTitle(), start, GlobalConstant.PAGE_SIZE), 
				qdao.getQuestCount(qbean.getQuestype(), qbean.getTitle()), 
				currentPage);
	}
	
	public List<Question> findPopular(){
		return qdao.findPopular();
	}
	
	@Override
	public List<ShowAnswer> findDetailByQuestId(String questid) {
		// TODO Auto-generated method stub
		return qdao.findDetailByQuestId(questid);
	}
	
	@Override
	public List<Question> findRelevantByTypeId(String typeid) {
		// TODO Auto-generated method stub
		return qdao.findRelevantByTypeId(typeid, 0, 10);
	}
	
	@Override
	public boolean addAnswer(Answer answer) {
		// TODO Auto-generated method stub
		try {
			if("0".equals(answer.getCreateid()) || "".equals(answer.getCreateid())){
				answer.setType("n");
				answer.setCreateid("0");
			}
			qdao.addAnswer(answer);
			logger.info("添加问题回答成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			logger.error("添加问题回答失败" , e);
			return false;
		}
	}
	
	@Override
	public int getManagerCount() {
		// TODO Auto-generated method stub
		return qdao.getManagerCount();
	}
	
	@Override
	public boolean addQuestion(Question question) {
		// TODO Auto-generated method stub
		try {
			System.out.println("0".equals(question.getCreateid()));
			System.out.println("".equals(question.getCreateid()));
			if("0".equals(question.getCreateid()) || GlobalConstant.isNull(question.getCreateid())){
				question.setQuestionerType("n");
				question.setCreateid("0");
			}else{
				question.setQuestionerType("m");
			}
			qdao.addQuestion(question);
			logger.info("添加提交问题成功");
			return true;
		} catch (Exception e) {
			// TODO: handle exception
			return false;
		}
	}
}
