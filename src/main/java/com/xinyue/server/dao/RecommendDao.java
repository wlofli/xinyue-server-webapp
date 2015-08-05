package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.server.bean.RecommendCredit;
import com.xinyue.server.bean.RecommendMember;
import com.xinyue.server.model.Presenter;

/**
 * 
 * @author wenhai.you
 * @2015年7月24日
 * @下午1:11:23
 */
public interface RecommendDao {

	public RecommendMember getRecommendMember(@Param("code") String code);
	
	public RecommendCredit getRecommendCredit(@Param("code") String code);
	
    public List<Presenter> findRecommendMember(@Param("memberid")String memberid , @Param("rank") String rank , @Param("start") int start , @Param("pageSize")int pageSize);
    
    public int getMemberCount(@Param("memberid")String memberid);
    
    public List<Presenter> findRecommendCredit(@Param("memberid")String memberid , @Param("rank") String rank , @Param("start") int start , @Param("pageSize")int pageSize);
    
    public int getCreditCount(@Param("memberid")String memberid);
}
