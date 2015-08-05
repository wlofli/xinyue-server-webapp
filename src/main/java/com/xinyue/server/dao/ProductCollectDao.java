package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.server.bean.CollectBean;
import com.xinyue.server.model.Collect;

/**
 * 
 * @author wenhai.you
 * @2015年7月21日
 * @下午1:31:14
 */
public interface ProductCollectDao {

	public List<Collect> findPage(@Param("start")int start , @Param("pageSize") int pageSize ,@Param("collectBean") CollectBean cbean);
	
	public int getProTotal(@Param("collectBean") CollectBean cbean);
	
	public int delProCollect(@Param("list")List<Integer> list);
	
	public Collect showDetail(@Param("id")int id);
}
