package com.xinyue.server.service;

import java.util.List;

import com.xinyue.manage.beans.PageData;
import com.xinyue.server.bean.CollectBean;
import com.xinyue.server.model.Collect;

/**
 * 
 * @author wenhai.you
 * @2015年7月21日
 * @下午1:38:05
 */
public interface ProductCollectService {

	public PageData<Collect> findPageData(CollectBean cbean);
		
	public boolean delProCollect(List<Integer> id);

	public Collect showDetail(int id);
}
