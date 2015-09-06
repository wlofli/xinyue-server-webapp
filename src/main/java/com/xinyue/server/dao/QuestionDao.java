package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.Question;
import com.xinyue.server.bean.QuestionBean;

/**
 * 
 * @author wenhai.you
 * @2015年7月29日
 * @下午6:10:31
 */
public interface QuestionDao {

	public List<QuestionBean> findPage(@Param("memberid") String memberid ,@Param("start") int start ,@Param("pageSize") int pageSize);
	
	public int getQuestionCount(@Param("memberid") String memberid);
	
	
	public List<Question> findPageQuestion(@Param("name") String name ,@Param("title") String title ,@Param("start") int start ,@Param("pageSize") int pageSize);
	public int getQuestCount(@Param("name") String name ,@Param("title") String title );
	
	public List<Question> findPopular();
	
	
	public List<ShowAnswer> findDetailByQuestId(@Param("questid") String questid);
	
	public List<Question> findRelevantByTypeId(@Param("typeid") String typeid ,@Param("start") int start ,@Param("pageSize") int pageSize);
	
	public int addAnswer(Answer answer);
	
	public int getManagerCount();
	
	public int addQuestion(Question question);
	
}
