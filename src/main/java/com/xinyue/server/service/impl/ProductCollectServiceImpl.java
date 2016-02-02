package com.xinyue.server.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.beans.SelectInfo;
import com.xinyue.manage.dao.CreditManagerDAO;
import com.xinyue.manage.dao.OrganizationDao;
import com.xinyue.manage.dao.ProductDao;
import com.xinyue.manage.dao.ProductTypeDao;
import com.xinyue.manage.model.Collect;
import com.xinyue.manage.model.CreditManager;
import com.xinyue.manage.model.CreditManagerInfo;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.ProductFile;
import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.util.GlobalConstant;
import com.xinyue.server.bean.CollectBean;
import com.xinyue.server.bean.ProductSearch;
import com.xinyue.server.dao.ProductCollectDao;
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


	
	@Resource
	private OrganizationDao ogao;
	@Override
	public List<SelectInfo> getOrgs() {
		// TODO Auto-generated method stub
		return ogao.getOrganizations();
	}
	
	@Resource
	private ProductTypeDao ptdao;
	@Override
	public List<ProductType> findByStatus() {
		// TODO Auto-generated method stub
		
		return ptdao.findProductTypeByList();
	}
	
	@Resource
	private ProductDao prodao;
	public List<ProductFile> findProductFileList(String pid){
		return prodao.findProductFileList(pid);
	}
	public Product findProductById(String pid){
		return prodao.findProductById(pid);
	}
	
	@Resource
	private CreditManagerDAO cdao;
	
	public List<CreditManagerInfo> findCreditByOrgid(String orgid){
		return cdao.findCreditByOrgid(orgid);
	}
	
	//2015-09-24
	public PageData<Product> findProductPageData(ProductSearch psearch){
		int currentPage = GlobalConstant.isNull(psearch.getTopage()) || "0".equals(psearch.getTopage())?1:Integer.valueOf(psearch.getTopage());
		int total = pdao.getProductCount(psearch);
		int start = (currentPage -1)*GlobalConstant.PAGE_SIZE;
		return new PageData<Product>(pdao.findProductPage(psearch , start , GlobalConstant.PAGE_SIZE), total, currentPage);
	}
}
