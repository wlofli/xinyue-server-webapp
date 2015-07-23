package com.xinyue.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.been.OrgCollectBean;
import com.xinyue.server.dao.OrgCollectDao;
import com.xinyue.server.model.OrgCollect;
import com.xinyue.server.service.OrgCollectService;

/**
 * 
 * @author wenhai.you
 * @2015年7月22日
 * @下午4:04:27
 */
@Service
public class OrgCollectServiceImpl implements OrgCollectService {

	@Resource
	private OrgCollectDao odao;
	
	@Override
	public PageData<OrgCollect> findPage(OrgCollectBean orgCollect) {
		// TODO Auto-generated method stub
		int currentPage = GlobalConstant.isNull(orgCollect.getTopage()) || "0".equals(orgCollect.getTopage())?1:Integer.valueOf(orgCollect.getTopage());
		int total = odao.getOrgTotal(orgCollect);
		int start = (currentPage - 1)*GlobalConstant.PAGE_SIZE;
		return new PageData<OrgCollect>(odao.findPage(orgCollect, start, GlobalConstant.PAGE_SIZE), total, currentPage);
	}


	@Override
	public boolean delOrgCollect(List<Integer> list) {
		// TODO Auto-generated method stub
		int s = odao.delOrgCollect(list);
		if(s == 1){
			return true;
		}
		return false;
	}

	@Override
	public OrgCollect showDetail(int id) {
		// TODO Auto-generated method stub
		return odao.showDetail(id);
	}

}
