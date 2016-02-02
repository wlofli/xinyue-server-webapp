package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.manage.beans.ShowAnswer;
import com.xinyue.manage.model.Answer;
import com.xinyue.manage.model.AnswerType;
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
	
	
	public int addAnswer(Answer answer);
	
	public int getManagerCount();
	
	public int addQuestion(Question question);
	//2015-10-13
	/**
	 * ywh gg 显示
	 * @param name
	 * @param title
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<Question> findPageQuestion(@Param("name") String name ,@Param("title") String title ,@Param("start") int start ,@Param("pageSize") int pageSize);
	
	/**
	 * ywh gg 显示 总记录数
	 * @param name
	 * @param title
	 * @return
	 */
	public int getQuestCount(@Param("name") String name ,@Param("title") String title );
	
	/**
	 * ywh gg 热门问答
	 * @return
	 */
	public List<Question> findPopular();
	
	
	/**
	 * ywh gg 点击标题显示详情
	 * @param questid
	 * @return
	 */
	public List<ShowAnswer> findDetailByQuestId(@Param("questid") String questid);
	
	
	
	/**
	 * ywh gg 相关问题
	 * @param typeid
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<Question> findRelevantByTypeId(@Param("typeid") String typeid ,@Param("start") int start ,@Param("pageSize") int pageSize);
	
	
	/**
	 * ywh gg 显示问题分类 
	 * @return
	 */
	public List<AnswerType> findQuestType();
	
	
	/**获取回答数量最多的问答
	 * add by lzc     date: 2015年12月7日
	 * @param index
	 * @param pageSize
	 * @return
	 */
	public List<Question> getQuestionHot(@Param("pageNo")int pageNo, @Param("pageSize")int pageSize);
}
