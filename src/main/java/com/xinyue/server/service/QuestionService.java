package com.xinyue.server.service;

import java.util.List;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.Question;
import com.xinyue.server.bean.QuestionBean;

/**
 * 
 * @author wenhai.you
 * @2015年7月29日
 * @下午6:29:20
 */
public interface QuestionService {

	public PageData<QuestionBean> findPage(String memberid , String topage);
	
	public PageData<Question> findPage(QuestionBean qbean);
	
	public List<Question> findPopular();
	
	public List<ShowAnswer> findDetailByQuestId(String questid);
	
	public List<Question> findRelevantByTypeId(String typeid);
	
	public boolean addAnswer(Answer answer);
	
	public int getManagerCount();
	
	public boolean addQuestion(Question question);
}
