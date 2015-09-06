package com.xinyue.server.service;

import java.util.List;

import javax.annotation.Resource;

import org.apache.ibatis.annotations.Param;

import com.xinyue.manage.beans.PageData;
import com.xinyue.manage.dao.ProductTypeDao;
import com.xinyue.manage.model.Organization;
import com.xinyue.manage.model.OrganizationType;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.ProductType;
import com.xinyue.manage.model.Question;
import com.xinyue.manage.model.SuccessCase;
import com.xinyue.server.bean.OrgCollectBean;
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
	
	public PageData<Organization> findOrgPage(OrgCollectBean orgCollect);
	
	public Organization findOrgById(String orgid);
	
	public List<Product> findProByBank(String orgid);
	
	public List<SuccessCase> findCaseByPro(List<Product> product);
	
	public PageData<Product> findPageProByBank(String orgid , String topage);
	
	public PageData<SuccessCase> findPageCaseByPro(String orgid , String topage);
	
	public PageData<Question> findPageAdvisory(String orgnum ,String title , String topage);
	
	
	public List<ProductType> findByStatus();
	
	public List<OrganizationType> findOrgTypes();
}
