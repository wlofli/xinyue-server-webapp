package com.xinyue.server.service;

import java.util.List;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.AnswerType;
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
	
	/**
	 * ywh gg 显示问题分类 
	 * @return
	 */
	public List<AnswerType> findQuestType();
	
	
	/**获取回答数量最多的问答
	 * add by lzc     date: 2015年12月4日
	 * @param index
	 * @param pageSize
	 * @return
	 */
	public List<Question> getQuestionHot(int index, int pageSize);
}
