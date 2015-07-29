package com.xinyue.server.dao;

import java.util.List;

import org.apache.ibatis.annotations.Param;

import com.xinyue.manage.model.Member;
import com.xinyue.server.model.FileInfo;

/**
 * 
 * @author wenhai.you
 * @2015年7月16日
 * @下午4:18:50
 */
public interface CommonMemberDao {

	public Member getBasicMember(@Param("id") String id);
	
	public int saveMember(Member member);
	
	public String inspectPwd(@Param("id") String id);
	
	public int updatePwd(@Param("id") String id , @Param("password") String password);
	
	public String findTel(@Param("id") String id);
	
	public int updateTel(@Param("id") String id , @Param("contactPhone") String contactPhone);
	
	public List<FileInfo> showDoc(@Param("start") int start  , @Param("pageSize") int pageSize);
	
	public int getDoc();
}
