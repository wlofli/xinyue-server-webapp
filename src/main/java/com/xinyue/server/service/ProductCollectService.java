package com.xinyue.server.service;

import java.util.List;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.model.Collect;
import com.xinyue.manage.model.CreditManager;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.ProductFile;
import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.util.CommonFunction;
import com.xinyue.server.bean.CollectBean;
import com.xinyue.server.bean.ProductSearch;

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
	
	public PageData<Product> findProductPageData(ProductSearch psearch);
	
	public List<SelectInfo> getOrgs();
	
	public List<ProductType> findByStatus();
	
	public List<ProductFile> findProductFileList(String pid);
	public Product findProductById(String pid);
	public List<CreditManager> findCreditByOrgid(String orgid);
	
	public final static String SHOW_PATH = CommonFunction.getValue("down.path");
}
