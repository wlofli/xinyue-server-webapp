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
import com.xinyue.manage.model.SubStation;
import com.xinyue.manage.model.SuccessCase;
import com.xinyue.manage.util.CommonFunction;
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
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	public List<ProductType> findByStatus();
	
	public List<OrganizationType> findOrgTypes();
	
	//2015-09-22以后 
	/**
	 * ywh 获取所有城市分站信息
	 * @return
	 */
	public List<SubStation> findAllStation();
	//显示图片路径
	public final static String SHOW_PATH = CommonFunction.getValue("down.path")+"moko/images/";
	
	/**
	 * ywh 前台 根据机构id显示机构详情
	 * @param orgid
	 * @return
	 */
	public Organization findOrgById(String orgid);
	
	/**
	 * ywh 前台 机构显示 详情 产品信息
	 * @param orgid
	 * @return
	 */
	public List<Product> findProByBank(String orgid);
	
	
	/**
	 * ywh 前台 机构显示 详情 成功案例信息
	 * @param product
	 * @return
	 */
	public List<SuccessCase> findCaseByPro(List<Product> product);
	
	
	/**
	 * ywh 前台机构显示详情 产品分页信息
	 * @param orgid
	 * @param topage
	 * @return
	 */
	public PageData<Product> findPageProByBank(String orgid , String topage);
	
	
	/**
	 * ywh 前台机构显示详情 成功案例分页信息
	 * @param orgid
	 * @param topage
	 * @return
	 */
	public PageData<SuccessCase> findPageCaseByPro(String orgid , String topage);
	
	
	/**
	 * ywh 前台机构详情 显示贷款咨询分页
	 * @param orgid
	 * @param title
	 * @param topage
	 * @return
	 */
	public PageData<Question> findPageAdvisory(String orgid ,String title , String topage);
	
	
	/**
	 * gg first org ywh
	 * @return
	 */
	public List<OrgCollect> findOrgList();
}
