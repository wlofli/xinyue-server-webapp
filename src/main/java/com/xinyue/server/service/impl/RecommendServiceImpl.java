package com.xinyue.server.service.impl;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.been.RecommendCredit;
import com.xinyue.server.been.RecommendInfo;
import com.xinyue.server.been.RecommendMember;
import com.xinyue.server.dao.RecommendDao;
import com.xinyue.server.model.Presenter;
import com.xinyue.server.service.RecommendService;

/**
 * 
 * @author wenhai.you
 * @2015年7月24日
 * @下午1:14:42
 */
@Service
public class RecommendServiceImpl implements RecommendService {

	@Resource
	private RecommendDao rdao;
	
	@Override
	public RecommendMember getRecommendMember(String code) {
		// TODO Auto-generated method stub
		return rdao.getRecommendMember(code);
	}

	@Override
	public RecommendCredit getRecommendCredit(String code) {
		// TODO Auto-generated method stub
		return rdao.getRecommendCredit(code);
	}
	
	@Override
	public PageData<Presenter> findRecommendMember(RecommendInfo info) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(info.getTopage()) || "0".equals(info.getTopage())?1:Integer.valueOf(info.getTopage());
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		return new PageData<Presenter>(rdao.findRecommendMember(info.getMemberid(), info.getRank(), start, GlobalConstant.PAGE_SIZE), rdao.getMemberCount(info.getMemberid()), currentPage);
	}

	@Override
	public PageData<Presenter> findRecommendCredit(RecommendInfo info) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(info.getTopage()) || "0".equals(info.getTopage())?1:Integer.valueOf(info.getTopage());
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		return new PageData<Presenter>(rdao.findRecommendMember(info.getMemberid(), info.getRank(), start, GlobalConstant.PAGE_SIZE), rdao.getMemberCount(info.getMemberid()), currentPage);
	}
}
