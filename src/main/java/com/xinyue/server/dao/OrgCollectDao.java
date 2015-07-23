package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.server.been.OrgCollectBean;
import com.xinyue.server.model.OrgCollect;

/**
 * 
 * @author wenhai.you
 * @2015年7月22日
 * @下午3:30:50
 */
public interface OrgCollectDao {

	public List<OrgCollect> findPage(@Param("orgCollect")OrgCollectBean orgCollect, @Param("start") int start , @Param("pageSize") int pageSize);
	
	public int getOrgTotal(@Param("orgCollect")OrgCollectBean orgCollect);
	
	public int delOrgCollect(@Param("list")List<Integer> list);
	
	public OrgCollect showDetail(@Param("id")int id);
}
