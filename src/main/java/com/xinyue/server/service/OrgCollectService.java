package com.xinyue.server.service;

import java.util.List;

import com.xinyue.manage.beans.PageData;
import com.xinyue.server.been.OrgCollectBean;
import com.xinyue.server.model.OrgCollect;

/**
 * 
 * @author wenhai.you
 * @2015年7月22日
 * @下午3:39:39
 */
public interface OrgCollectService {

	public PageData<OrgCollect> findPage(OrgCollectBean orgCollect);
	
	public boolean delOrgCollect(List<Integer> list);
	
	public OrgCollect showDetail(int id);
}
