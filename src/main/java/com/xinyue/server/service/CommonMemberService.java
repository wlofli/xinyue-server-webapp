package com.xinyue.server.service;



import com.xinyue.manage.model.Member;

/**
 * 
 * @author wenhai.you
 * @2015年7月16日
 * @下午4:21:18
 */

public interface CommonMemberService {

	public Member getBasicMember(String id);
	
	public boolean saveMember(Member member);
	
	public boolean inspectPwd(String id , String password);
	
	public boolean updatePwd(String id , String password);
	
	public String findTel(String id);
	
	public boolean updateTel(String id , String contactPhone);
}
