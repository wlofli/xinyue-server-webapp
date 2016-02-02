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
	
	
	public int getOrgCount(@Param("orgCollect") OrgCollectBean orgCollect);
	
	
	
	
	//22015-09-22
	/**
	 * 前台显示机构
	 * @param orgCollect
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<Organization> findOrgPage(@Param("orgCollect") OrgCollectBean orgCollect ,  @Param("start") int start , @Param("pageSize") int pageSize);
	
	
	/**
	 * ywh 前台机构详情  显示产品信息 按推荐排序
	 * @param orgid
	 * @return
	 */
	public List<Product> findProByBank(@Param("orgid")String orgid);
	
	
	/**
	 * ywh 前台机构详情  显示产品信息分页 按推荐排序
	 * @param orgid
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<Product> findPageProByBank(@Param("orgid")String orgid ,  @Param("start") int start , @Param("pageSize") int pageSize);
	
	/**
	 * ywh 前台机构详情  显示产品信息分页 统计记录数
	 * @param orgid
	 * @return
	 */
	public int getProByBankCount(@Param("orgid")String orgid);
	
	
	/**
	 * ywh 前台机构详情  显示成功案例信息 
	 * @param list
	 * @return
	 */
	public List<SuccessCase> findCaseByPro(@Param("list")List<Product> list);
	
	
	/**
	 * ywh 前台机构详情  显示成功案例分页信息 
	 * @param product
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<SuccessCase> findPageCaseByPro(@Param("list")List<Product> product ,  @Param("start") int start , @Param("pageSize") int pageSize);
	
	
	/**
	 * ywh 前台机构详情  显示成功案例分页总记录数
	 * @param product
	 * @return
	 */
	public int getCaseByProCount(@Param("list")List<Product> product);
	
	
	/**
	 * ywh 前台机构详情 显示贷款咨询分页
	 * @param orgid
	 * @param title
	 * @param start
	 * @param pageSize
	 * @return
	 */
	public List<Question> findPageAdvisory(@Param("orgid") String orgid , @Param("title") String title ,  @Param("start") int start , @Param("pageSize") int pageSize);
	
	
	/**
	 * ywh 前台机构详情 显示贷款咨询分页记录数
	 * @param orgid
	 * @param title
	 * @return
	 */
	public int getPageAdvisory(@Param("orgid") String orgid , @Param("title") String title);
	
	
	/**
	 * gg  first  org ywh
	 * @param pageSize
	 * @return
	 */
	public List<OrgCollect> findOrgList(int pageSize);
	
}
