package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.server.model.Question;

/**
 * 
 * @author wenhai.you
 * @2015年7月29日
 * @下午6:10:31
 */
public interface QuestionDao {

	public List<Question> findPage(@Param("memberid") String memberid ,@Param("start") int start ,@Param("pageSize") int pageSize);
	
	public int getQuestionCount(@Param("memberid") String memberid);
}
