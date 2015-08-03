package com.xinyue.server.service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.server.model.Question;

/**
 * 
 * @author wenhai.you
 * @2015年7月29日
 * @下午6:29:20
 */
public interface QuestionService {

	public PageData<Question> findPage(String memberid , String topage);
}
