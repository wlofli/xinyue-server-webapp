package com.xinyue.server.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.dao.QuestionDao;
import com.xinyue.server.model.Question;
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
	
	@Override
	public PageData<Question> findPage(String memberid, String topage) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(topage) || "0".equals(topage)?1:Integer.valueOf(topage);
		int start = (currentPage-1)*GlobalConstant.PAGE_SIZE;
		return new PageData<Question>(qdao.findPage(memberid, start, GlobalConstant.PAGE_SIZE), qdao.getQuestionCount(memberid), currentPage);
	}

}
