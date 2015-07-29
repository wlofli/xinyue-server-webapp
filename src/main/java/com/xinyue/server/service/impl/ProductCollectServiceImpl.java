package com.xinyue.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.been.CollectBean;
import com.xinyue.server.dao.ProductCollectDao;
import com.xinyue.server.model.Collect;
import com.xinyue.server.service.ProductCollectService;

/**
 * 
 * @author wenhai.you
 * @2015年7月21日
 * @下午1:45:25
 */
@Service
public class ProductCollectServiceImpl implements ProductCollectService {

	@Resource
	private ProductCollectDao pdao; 
	
	@Override
	public PageData<Collect> findPageData(CollectBean cbean) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(cbean.getTopage()) || "0".equals(cbean.getTopage())?1:Integer.valueOf(cbean.getTopage());
		int total = pdao.getProTotal(cbean);
		int start = (currentPage -1)*5;
		return new PageData<Collect>(pdao.findPage(start, 5, cbean) , total , currentPage , 5);
	}


	@Override
	public boolean delProCollect(List<Integer> id) {
		// TODO Auto-generated method stub
		int s = pdao.delProCollect(id);
		if(s == 1){
			return true;
		}
		return false;
	}

	@Override
	public Collect showDetail(int id) {
		// TODO Auto-generated method stub
		return pdao.showDetail(id);
	}

}
