package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.manage.model.Organization;
import com.xinyue.manage.model.Product;
import com.xinyue.manage.model.Question;
import com.xinyue.manage.model.SuccessCase;
import com.xinyue.server.bean.OrgCollectBean;
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
	
	public List<Organization> findOrgPage(@Param("orgCollect") OrgCollectBean orgCollect ,  @Param("start") int start , @Param("pageSize") int pageSize);
	public int getOrgCount(@Param("orgCollect") OrgCollectBean orgCollect);
	
	public Organization findOrgById(@Param("orgid")String orgid);
	
	public List<Product> findProByBank(@Param("orgid")String orgid);
	
	public List<SuccessCase> findCaseByPro(@Param("list")List<Product> list);
	
	
	public List<Product> findPageProByBank(@Param("orgid")String orgid ,  @Param("start") int start , @Param("pageSize") int pageSize);
	public int getProByBankCount(@Param("orgid")String orgid);
	
	
	public List<SuccessCase> findPageCaseByPro(@Param("list")List<Product> product ,  @Param("start") int start , @Param("pageSize") int pageSize);
	public int getCaseByProCount(@Param("list")List<Product> product);
	
	public List<Question> findPageAdvisory(@Param("orgNum") String num , @Param("title") String title ,  @Param("start") int start , @Param("pageSize") int pageSize);
	public int getPageAdvisory(@Param("orgNum") String num , @Param("title") String title);
}
