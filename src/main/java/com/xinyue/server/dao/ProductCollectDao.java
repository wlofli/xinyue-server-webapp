package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.manage.model.Collect;
import com.xinyue.manage.model.Product;
import com.xinyue.server.bean.CollectBean;
import com.xinyue.server.bean.ProductSearch;

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
	
	
	
	
	
	//2015-09-24
	/**
	 *  ywh 前台 产品页面 显示 分页
	 * @param psearch
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<Product> findProductPage(@Param("psearch")ProductSearch psearch , @Param("start")int start , @Param("pageSize")int pageSize);
	
	/**
	 *  ywh 前台 产品页面 显示 记录数
	 * @param psearch
	 * @return
	 */
	public int getProductCount(@Param("psearch")ProductSearch psearch);
}
