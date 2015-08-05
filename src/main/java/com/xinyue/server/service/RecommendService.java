package com.xinyue.server.service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.server.bean.RecommendCredit;
import com.xinyue.server.bean.RecommendInfo;
import com.xinyue.server.bean.RecommendMember;
import com.xinyue.server.model.Presenter;

/**
 * 
 * @author wenhai.you
 * @2015年7月24日
 * @下午1:13:36
 */
public interface RecommendService {

	public RecommendMember getRecommendMember(String code);
	
	public RecommendCredit getRecommendCredit(String code);
	
	public PageData<Presenter> findRecommendMember(RecommendInfo info);
	
	public PageData<Presenter> findRecommendCredit(RecommendInfo info);
}
